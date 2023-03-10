def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def sort_by_letter(students)
  puts "Choose a letter by which to filter students"
  letter = gets.chomp
  letter_students = []

  students.each do |student|
    if student[:name].start_with?(letter.upcase)
      letter_students << student
    else
      next
    end
  end

  letter_students
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)

print(sort_by_letter(students))
