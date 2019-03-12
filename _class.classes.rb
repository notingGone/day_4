class Pet

    attr_accessor :animal, :name, :how_many_legs, :sound

    def initialize(animal, name, how_many_legs, sound)
        @animal = animal
        @name = name
        @how_many_legs = how_many_legs
        @sound = sound
    end

    def get_sound
        puts @sound
    end
end

pets_array = []
pets_array.push Pet.new("turtle-dragon", "bowser", 4, "roar")
pets_array.push Pet.new("dog", "fido", 4, "woof")
pets_array.push Pet.new("cat", "Gojira", 4, "meow")
pets_array.push Pet.new("snake", "Rocky Bal Boa", 0, "hiss")

single_pet = Pet.new("kangaroo", "Joey", 2, "boing")

# puts pets_array
puts single_pet


my_pet = Pet.new("cat", "Gojira", 4, "meow")
my_pet.get_sound

class Vehicle

    attr_accessor :make, :model, :color, :mpg, :max_speed, :odometer
    def initialize
        @make = make
        @model = model
        @color = color
        @mpg = mpg
        @max_speed = max_speed
        @odometer = odometer
    end

    def odometer_inc(num)
        @odometer += num
    end
end



class Product

    attr_accessor :name :product_type, :cost, :price, :quantity

    def initialize(name, product_type, cost, price, quantity)
        @name = name
        @type = product_type
        @cost = cost
        @price = price
        @quantity = quantity
    end

    def calc_profit_margin
     return @price - @cost
    end

    def quantity_received(how_many)
        @quantity += how_many
    end

    def quantity_sold(how_many)
        @quantity -= how_many
    end
end

def get_product_info
    #gets input from user, database, etc
end

i = 0
name, product_type, cost, price = get_prouct_info(i)
i += 1
first = Product.new(name, product_type, cost, price)

name, product_type, cost, price = get_prouct_info(i)
i += 1
second = Product.new(name, product_type, cost, price)

total_profit = first.calc_profit_margin + second.calc_profit_margin
