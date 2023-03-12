def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  puts "Please enter the country of birth"
  country = gets.chomp
  puts "Please enter the height in cm"
  height = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november, country: country, height: height.to_i}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the next student"
    name = gets.chomp
    puts "Please enter their country of birth"
    country = gets.chomp
    puts "Please enter their height"
    height = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# rewrite method using while loop
def print(students)
  counter = 0
  while counter < students.length
    puts "#{counter + 1}, #{students[counter][:name]} (#{students[counter][:cohort]} cohort, from #{students[counter][:country]}, #{students[counter][:height]}cm tall)"
    counter += 1
  # students.each_with_index do |student, index|
  #   puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# only print students whose name begins with a specific letter
def sort_by_letter(students)
  puts "Choose a letter by which to filter students"
  letter = gets.chomp
  letter_students = []

  students.each do |student|
    if student[:name].start_with?(letter)
      letter_students << student
    end
  end

  letter_students
end

# only print students whose name is shorter than 12 characters
def short_names(students)
  short_names = []

  students.each do |student|
    if student[:name].length < 12
      short_names << student
    end
  end

 short_names
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

