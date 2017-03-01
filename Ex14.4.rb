#Continue refactoring code

@students = [] #an empty array accessible to all methods

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.chomp)
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp
  while !name.empty? do
    add_student_info(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu #put options into array
  puts "Please choose an option from the menu:"
  puts
  options = ["Input the students", "Show the students", "Save the list to students.csv", "Load the list from students.csv", "Exit"]
  options.each_with_index do |option, index|
    puts "#{index + 1}. #{option}"
  end
end


def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"; input_students #using semicolons instead of 'then'
  when "2"; show_students
  when "3"; save_students
    puts "students were saved from students.csv"
  when "4"; load_students
    puts "loaded students from students.csv"
  when "5"; exit
    else
      puts "I don't know what you meant. Please try again."
    end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    add_student_info(name, cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filname} doesn't exist."
    exit
  end
end

def add_student_info(name, cohort = :november)
    @students << {name: name, cohort: cohort}
end

try_load_students
interactive_menu
