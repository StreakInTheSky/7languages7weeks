num = rand(10) + 1
puts 'Pick a number from 1 - 10'
guess = gets.to_i
until guess == num
  puts "#{guess} is too low. Try again." if guess < num
  puts "#{guess} is too high. Try again." if guess > num
  guess = gets.to_i
end
puts "#{guess} is correct!"
