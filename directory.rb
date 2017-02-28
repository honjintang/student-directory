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
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def print_names_beginning_with_specific_letter(students, specific_letter)
    selected_students = students.select{|student| student[:name][0].downcase == specific_letter.downcase}
    puts
    puts "There are #{selected_students.count} students with names beginning with #{specific_letter}:"
    selected_students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_names_shorter_than_12_characters (students)
  less_than_12 = students.select{|student| student[:name].length < 12}
  puts
  puts "There are #{less_than_12.count} students with names that are shorter than 12 characters:"
  less_than_12.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

students = input_students
print_header
print(students)
print_footer(students)
print_names_beginning_with_specific_letter(students, "s")
print_names_shorter_than_12_characters(students)
