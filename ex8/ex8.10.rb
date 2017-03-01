#Exercise 8.10
#We've been using the delete("\n")() method to get rid of the last return character.
#Find another method among those provided by the String class that could be used for the same purpose

def print(students)

  existing_cohorts = []

  students.each {|student|
    existing_cohorts << student[:cohort].to_s
  }

  sorted_by_cohort = students.sort_by { |student|
    student[:cohort]
  }

  existing_cohorts.uniq.map {|cohort|
    puts "Students in the #{cohort} cohort are:"
    sorted_by_cohort.each {|student|
      if student[:cohort] == cohort.to_sym
      puts "#{student[:name]}"
      end
    }
    puts ""
  }

end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{students.count == 1 ? '' : 's'}"
end

def get_cohort
  cohort_months = %w[January February March April May June July August September October November December]
  puts "Please enter cohort or press enter twice to finish:"
  cohort = gets.delete("\n")
    if cohort.empty?
      cohort = :unknown
    elsif !cohort_months.include?(cohort.capitalize)
      until cohort_months.include?(cohort.capitalize)
        puts "That is an invalid cohort month. Please enter the correct month:"
        cohort = gets..delete("\n")
      end
    end
    cohort = cohort.to_sym
end

def input_students
  puts "Please enter student name:"
  students = []
  name = gets.delete("\n")
  cohort = get_cohort

    while !name.empty? do
      puts "Are you sure '#{name}' is correct? Type 'yes' or 'no' to proceed."
      check = gets.delete("\n")
        until check == 'yes'
          puts "Please enter the student name again:"
          name = gets.delete("\n")
          puts "Are you sure '#{name}' is correct? Type 'yes' or 'no' to proceed."
          check = gets.delete("\n")
        end
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} student#{students.count == 1 ? '' : 's'}"

      puts "Please enter another student name or press enter again to finish:"
      name = gets.delete("\n")
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
