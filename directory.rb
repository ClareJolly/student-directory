# lets put all the students into an array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  puts "Enter a letter to show only those matching students"
  initial = gets.chomp
  puts "Enter the max length of their name"
  max_length = gets.chomp
  students.each_with_index do |student,index|
    if student[:name][0].downcase == initial.downcase && student[:name].length <= max_length.to_i
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? do
    #add the student has to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of input_students
  students
end
# nothing happens until we call the methods.
students = input_students
print_header
print(students)
print_footer(students)
