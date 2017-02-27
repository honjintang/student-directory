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
#then print them
puts "The students of Villains Academy"
puts "--------------"
students.each do |student|
  puts student
end
#finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
