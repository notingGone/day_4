=begin
A gym has hired you to solve a problem.
Most of their clients are fairly new to weightlifting
and don't know what to put on the barbell for a particular weight.
The weights they have made available are in
45, 35, 25, 15, 10 and 5 lbs. increments.
Build them a Ruby application that will tell them,
for a given weight, what plates to put on each side of the bar.
Bear in mind that the bar itself weighs 45 lbs.

For example, if they want to load 225 lbs. on the bar,
they will need to put two 45 lbs. plates on each side of the bar.
45x4 = 180 lbs. Plus 45 lbs. for the barbell itself equals a total of 225 lbs.

Hint: You don't really need to create Objects for this one, so you get a break
from that. But you will need to create methods!
=end

def input_weight(minimum)
  weight = 0
  while weight < minimum
    puts 'Enter the total weight in pounds you would like to lift:'
    puts '(45lbs or greater)'
    weight = gets.chomp.to_i
  end
  return weight
end

############  ADD CHECK FOR NOT ALLOWING ODD NUMBERS OF PLATES #################
def calculate_plates(plates, weight, barbell)
  remainder = weight - barbell
  plates.each_key do |plate|
    combo_weight = remainder / plate
    plates[plate] = combo_weight.even? ? combo_weight : combo_weight - 1
    remainder -= (plate * plates[plate])
  end
  return plates, remainder
end

def print_weights(hash)
  hash.each_pair do |plate, qty|
    puts "#{qty} of the #{plate} pound plates"
  end
end

bar_weight = 45
weights = { 45 => nil, 35 => nil, 25 => nil, 15 => nil, 10 => nil, 5 => nil }
puts 'Welcome to this barlbell-load/plates calculator.'
total_weight = input_weight(bar_weight)
weights, left_over = calculate_plates(weights, total_weight, bar_weight)
puts "To lift #{total_weight} pounds using a #{bar_weight} pound barbell, you need to load:"
print_weights(weights)
puts "on the bar with #{left_over} pounds left to account for." if left_over > 0
