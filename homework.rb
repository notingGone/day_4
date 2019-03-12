=begin

Help match up teams for the first round of a seed-based tournament.
In a seeded tournament, and during the first round, the top seed is
matched with the bottom seed, the 2nd highest team is matched with
the second lowest, etc.

Example:

Seeds
1. Wisconsin
2. Michigan
3. Michigan State
4. Indiana

Matchups:
(1) Wisconsin versus (4) Indiana,
(2) Michigan versus (3) Michigan State

Create the first round matches for a tournament using seeds.

Your program should include a menu,
where you can enter teams, and then seed them.

Example:

Welcome to My Tournament Generator. Enter a selection:
1. Enter teams
2. List teams
3. List matchups
0. Exit program

Your program should check for the following:

1. If an odd number of teams are entered,
the top-seeded team gets a bye (doesn't play)

Example:

Seeds
1. Wisconsin
2. Michigan
3. Michigan State
4. Indiana
5. Purdue

Matchups:
(1) Wisconsin has a bye
(2) Michigan versus (5) Purdue
(3) Michigan State versus (4) Indiana

Hints:
You should utilize Classes (probably just one).
Make sure you can do multiple match-ups
(that is, match up once, then come back and match-up again).
=end

# PROGRAM LOOP
def menu(current_round)
  system 'clear'
  puts '******************************************'
  puts '***** Tournament Generator Main Menu *****'
  puts '******************************************'
  puts 'Enter a selection:
  1. Add teams
  2. List teams
  3. Re-seed teams
  4. Re-enter teams
  5. List matches
  6. Exit'

  case gets.chomp.to_i
  when 1
    system 'clear'
    current_round.enter_teams('add')
  when 2
    system 'clear'
    current_round.teams
    puts 'Press [ENTER] to continue...'
    gets
  when 3
    current_round.seed_teams
  when 4
    current_round.enter_teams('new')
  when 5
    system 'clear'
    current_round.matches
    puts 'Press [ENTER] to continue...'
    gets
  when 6
    current_round.matches
    return
  else
    puts '***** Invalid Entry *****'
    puts '***** Press [ENTER] *****'
    gets
  end

  menu(current_round)
end # menu()

##########################

class Round

  def initialize
    @teams = []
  end

  ########################  ########################

  def enter_teams(option)
    system 'clear'

    if option == 'new' # SAFETY CHECK BEFORE OVERWRITING TEAMS ARRAY
      puts   '********************************************'
      puts   '* This will clear the current teams list. **'
      puts   '********************************************'
      answer = ''
      until answer == 'y' || answer == 'n'
        puts '* Are you sure you wish to continue? (Y/N) *'
        answer = gets.chomp.downcase
      end
      if answer == 'y'
        system 'clear'
        puts '***********************'
        puts '!!!!! TEAMS ERASED !!!!'
        @teams = []
      else return # BACK TO MAIN MENU
      end
    end # SAFETY CHECK

    teams # DISPLAY CURRENT TEAMS LIST FOR USER'S REFERENCE

    # THIS HEADING IS DISPLAYED FOR EVERY .enter_teams() CALL
    puts '***********************'
    puts '***** ENTER TEAMS *****'
    puts '***********************'
    puts 'Enter each team name then press [ENTER]'
    puts 'Press [ENTER] on a blank line to return to the Main Menu.'

    # DON'T ALLOW THE SAME TEAM TO BE ENTERED TWICE
    while (input = gets.chomp) != ''
      if @teams.include? input
        puts '*** Team is already listed - NOT ENTERED! ***'
      else
        @teams << input
      end # if
    end # whle
  end # .enter_teams()

  ########################  ########################

  def teams
    puts '***********************************'
    puts '***** Current Teams/Seed List *****'
    puts '***********************************'

    # A MESSAGE TO MAKE IT CLEAR THAT THERE ARE NO TEAMS YET
    if @teams.empty?
      puts
      puts '!!!!! LIST IS CURRENTLY EMPTY !!!!!'
      puts
    else
      @teams.each_with_index do |value, index|
        puts "#{index + 1}: #{value}"
      end
    end
  end # .teams()

  ########################  ########################

  def seed_teams

    seeded_array = []

    # CREATE AN ARRAY OF EMPTY STRINGS, ONE FOR EACH TEAM
    @teams.each do
      seeded_array << ''
    end

    # MAKE SURE THERE IS SOMETHING TO SEED
    if @teams.empty?
      puts 'You must enter teams before you can seed them'
      puts 'Press [ENTER] to return to the Main Menu'
      gets
      return
    end

    @teams.each do |team|
      until seeded_array.include? team
        seed_value = 0
        while seed_value <= 0 || seed_value > @teams.length
          puts "Enter a valid seed value for #{team}:"
          seed_value = gets.chomp.to_i
        end
        if seeded_array[seed_value - 1] == ''
          seeded_array[seed_value - 1] = team
        else
          puts "Seed value #{seed_value} is already assigned to #{seeded_array[seed_value - 1]}."
        end # if
      end # until
    end # .each do
    @teams = seeded_array
  end # .seed_teams()

  ########################  ########################

  def matches # WHERE THE MAGIC HAPPENS

    start_index = 0
    end_index = @teams.length - 1

    puts '***************************************'
    puts '***** TEAM MATCHES FOR THIS ROUND *****'
    puts '***************************************'
    # CHECK IF A BYE IS NEEDED AND HANDLE IT
    if @teams.length.odd? # bye?
      puts "#{@teams[start_index]} has a bye"
      start_index += 1
    end

    # THIS IS THE MATCHUP LOOP!
    until start_index > end_index
      puts "(#{start_index + 1})#{@teams[start_index]} vs (#{end_index + 1})#{@teams[end_index]}"
      start_index += 1
      end_index -= 1
    end # END MATCHUP LOOP
  end # .matches()
end # class Round

##############################
### START THE PROGRAM LOOP ###
##############################
menu(Round.new)
