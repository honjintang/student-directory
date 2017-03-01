def interactive_menu
  students = []
  loop do
  #1. Print the menu and ask user what to do
  puts "Please choose an option from the menu:"
  puts
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  #2. Read the input and save it to variable
  selection = gets.chomp
  #3. Do what the user has asked
  case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant. Please try again."
    end
  end
end

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


interactive_menu
