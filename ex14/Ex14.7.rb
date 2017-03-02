#We are de-facto using CSV format to store data.
#However, Ruby includes a library to work with the CSV files that we could use instead of working directly with the files.
#Refactor the code to use this library.

require 'csv'

@students = []

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

def print_menu
  puts "Please choose an option from the menu:"
  puts
  options = ["Input the students", "Show the students", "Save students to students.csv", "Load students from students.csv", "Exit"]
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
  when "1"; input_students
  when "2"; show_students
  when "3"; save_students
    puts "#{@students.count} students were saved"
  when "4"; load_students
    puts "Loaded #{@students.count} students"
  when "5"; exit
    else
      puts "I don't know what you meant. Please try again."
    end
end

def save_students
  file = "students.csv"
  CSV.open(file, "a+") do |csv| #Read and write mode. The file pointer is at the end of the file if the file exists. If the file does not exist, it creates a new file for reading and writing.
  @students.each do |student|
    csv << [student[:name], student[:cohort]]
end
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |row|
    name, cohort = row
    @students << {name: name, cohort: cohort.to_sym}
  end
end

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def add_student_info(name, cohort = :november)
    @students << {name: name, cohort: cohort}
end

try_load_students
interactive_menu
