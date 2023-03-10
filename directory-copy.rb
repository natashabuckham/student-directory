def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []
  #alternative to .chomp method to get rid of \n
  name = gets.delete("\n")

  while !name.empty? do
    puts "Please enter the cohort month"
    cohort = gets.chomp
    if cohort.empty?
      cohort = "unknown"
    end
    months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "unknown"]
    until months.include?(cohort)
      puts "You might have a typo, please re-enter the cohort month in all lowercase"
      cohort = gets.chomp
    end
    cohort = cohort.to_sym
    
    puts "Please enter their country of birth"
    country = gets.chomp
    if country.empty?
      country = "unknown"
    end

    puts "Please enter their height"
    height = gets.chomp
    if height.empty?
      height = "unknown"
    end

    students << {name: name, cohort: cohort, country: country, height: height}
    puts students.length == 1 ? "Now we have 1 student" : "Now we have #{students.count} students"
    puts "Please enter the name of the next student"

    name = gets.chomp
    # if name.empty?
    #   next
    # end
  end
  
  puts students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# rewrite method using while loop
def print(students)
  if students == nil
    puts "There are no students"
  else
    counter = 0
    while counter < students.length
      puts "#{counter + 1}. #{students[counter][:name]}".ljust(30) + "(#{students[counter][:cohort]} cohort, from #{students[counter][:country]}, #{students[counter][:height]}cm tall)"
      counter += 1
    # students.each_with_index do |student, index|
    #   puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

# print by cohorts
def print_by_cohort(students)
  cohorts = []
  students.each do |student| 
    if cohorts.include?(student[:cohort])
      next
    end
    cohorts.push(student[:cohort])
  end

  cohorts.each do |cohort|
    puts "#{cohort} cohort"
    students.each do |student|
      if student[:cohort] != cohort
        next
      end
      puts "#{student[:name]}"
    end
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
  if students == nil
    puts ""
  else
    puts student.length == 1 ? "Overall we have 1 great student" : "Overall we have #{students.count} great students"
  end
end 

students = input_students

print_header
print(students)
print_footer(students)

