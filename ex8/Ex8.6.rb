def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
#create an empty array
  students = []
#get the first name
  name = gets.chomp
#while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
#return array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "--------------".center(50)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

def print_names_beginning_with_specific_letter(students, specific_letter)
    selected_students = students.select{|student| student[:name][0].downcase == specific_letter.downcase}
    puts
    puts "There are #{selected_students.count} students with names beginning with #{specific_letter}:".center(50)
    selected_students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_names_shorter_than_12_characters (students)
  less_than_12 = students.select{|student| student[:name].length < 12}
  puts
  puts "There are #{less_than_12.count} students with names that are shorter than 12 characters:".center(50)
  less_than_12.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
end

def print_students_using_while_loop(students)
  puts
  puts "Here are the student names again, using a while loop:".center(50)
  idx = 0
  while idx < students.length
    puts "#{idx + 1}. #{students[idx][:name]} (#{students[idx][:cohort]} cohort)".center(50)
    idx += 1
  end
end

students = input_students
print_header
print(students)
print_footer(students)
print_names_beginning_with_specific_letter(students, "s")
print_names_shorter_than_12_characters(students)
print_students_using_while_loop(students)
