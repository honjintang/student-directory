def input_students
  puts "Please enter the name, birth country, and height of your student"
  puts
#create an empty array
  students = []
#get the first name
  puts "Name: "
  name = gets.chomp
  puts "Birth country:"
  birth_country = gets.chomp
  puts "Height (M):"
  height = gets.chomp
#while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november, birth_country: birth_country, height: height}
    puts "Now we have #{students.count} students"

    puts "Type 'DONE' if you have finished adding students to the directory, or press 'enter' if you would like to continue adding students"

    next_student = gets.chomp

    if next_student == 'DONE'
      break
    else
     puts "Name: "
    name = gets.chomp
    puts "Country of birth: "
    birth_country = gets.chomp
    puts "Height (M): "
    height = gets.chomp
    end
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
    puts "#{index + 1}. #{student[:name]}, #{student[:cohort]} cohort, born in #{student[:birth_country].capitalize}, #{student[:height]}M tall."
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
