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
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end
def print(students)
  puts "Enter a letter to show only those matching students"
  initial = gets.chomp
  puts "Enter the max length of their name"
  max_length = gets.chomp
  students.each_with_index do |student,index|
    if student[:name][0].downcase == initial.downcase && student[:name].length <= max_length.to_i
      puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort.  Hobbies are #{student[:hobbies]} and they are from #{student[:country]})".center(40)
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
  # get the student details
  name = gets.chomp
  puts "cohort?"
  cohort = gets.chomp
  puts "hobbies?"
  hobbies = gets.chomp
  puts "country of birth?"
  country = gets.chomp
  # while the name is not empty, repeat this code
  until name.empty? do
    #add the student has to the array
    # students << {name: name, cohort: cohort, hobbies: hobbies, country: country}
    students << {:name => name, :cohort => cohort, :hobbies => hobbies, :country => country}
    puts "Now we have #{students.count} students".center(40)
    # get another name from the user
    puts "name?"
    name = gets.chomp
      if !name.empty?
        puts "cohort?"
        cohort = gets.chomp
        puts "hobbies?"
        hobbies = gets.chomp
        puts "country of birth?"
        country = gets.chomp
      end
  end
  # return the array of input_students
  students
end
# nothing happens until we call the methods.
students = input_students
print_header
print(students)
print_footer(students)
