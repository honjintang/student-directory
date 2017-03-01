#Exercise 8.7
#In the input_students method the cohort value is hard-coded.
#How can you ask for both the name and the cohort?
#What if one of the values is empty? Can you supply a default value?
#The input will be given to you as a string? How will you convert it to a symbol?
#What if the user makes a typo?

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

def get_cohort
  cohort_months = %w[January February March April May June July August September October November December]
  puts "Please enter cohort or press enter twice to finish:"
  cohort = gets.chomp
    if cohort.empty?
      cohort = :unknown
    elsif !cohort_months.include?(cohort.capitalize)
      until cohort_months.include?(cohort.capitalize)
        puts "That is an invalid cohort month. Please enter the correct month:"
        cohort = gets.chomp
      end
    end
    cohort = cohort.to_sym
end

def input_students
  puts "Please enter student name:"
  students = []
  name = gets.chomp
  cohort = get_cohort

    while !name.empty? do
      puts "Are you sure '#{name}' is correct? Type 'yes' or 'no' to proceed."
      check = gets.chomp
        until check == 'yes'
          puts "Please enter the student name again:"
          name = gets.chomp
          puts "Are you sure '#{name}' is correct? Type 'yes' or 'no' to proceed."
          check = gets.chomp
        end
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"

      puts "Please enter another student name or press enter again to finish:"
      name = gets.chomp
      unless name.empty?
        cohort = get_cohort
      end
    end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
