def input_students(students)
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

def interactive_menu
  students = []
  loop do
    # print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # read the input and save it into a variable
    selection = gets.chomp
    # do what the user has asked
    case selection
      when "1"
        # input the students
        students = input_students(students)
      when "2"
        # show the students
        print_header
        print(students)
        print_footer(students)  
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu