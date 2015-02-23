class Monty
  def guess
    car = rand(1..3)
    guess = rand(1..3)

    doors = [1, 2, 3]
    doors.delete(guess)
    case
    when doors.include?(car)
      doors = car
    else
      doors = doors.sample
    end

    guess = doors
    guess == car
  end
end

stats = []
10000.times do
  stats << Monty.new.guess
end

puts stats.count(true)
