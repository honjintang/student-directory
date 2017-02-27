#first we put the students into an array
students = ["Dr. Hannibal Lector",
            "Darth Vader",
            "Nurse Ratched",
            "Michael Corleone",
            "Alex Delarge",
            "The Wicked Witch of the West",
            "Terminator",
            "Freddie Krueger",
            "The Joker",
            "Joffrey Baratheon",
            "Norman Bates"
          ]

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
  puts "Overall, we have #{students.count} great students"
end

print_header
print(students)
print_footer(students)
