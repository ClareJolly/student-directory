# lets put all the students into an array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]
def print_header
  puts "The students of Villains Academy".center(40)
  puts "-------------".center(40)
end

def print(students)
  puts "Enter a letter to show only those matching students"
  initial = gets.chomp
  puts "Enter the max length of their name"
  max_length = gets.chomp
  cohorts_mapper = students.map { |c| c[:cohort] }.uniq
  cohorts_mapper.each do |cohort_to_list|
    puts "Cohort: #{cohort_to_list}"
    matchingstudents = 0
    students.each_with_index do |student,index|
      if student[:cohort] == cohort_to_list
        if student[:name][0].downcase == initial.downcase && student[:name].length <= max_length.to_i
          puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort.  Hobbies are #{student[:hobbies]} and they are from #{student[:country]})".center(40)
          matchingstudents += 1
        end
      end

    end
    if matchingstudents == 0
      puts "None matching in this cohort"
    end
  end
end

def print_footer(names)
  plural = ""
  plural = "s" if names.count > 1
  puts "Overall, we have #{names.count} great student#{plural}"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  cohorts = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  plural = ""
  # get the student details
  name = gets.chomp
  if !name.empty?
    puts "cohort?"
    cohort = gets.chomp
    if cohort.empty? || !cohorts.include?(cohort.downcase)
      cohort = "November"
    end
    puts "hobbies?"
    hobbies = gets.chomp
    puts "country of birth?"
    country = gets.chomp
  end
  # while the name is not empty, repeat this code
  until name.empty? do
    #add the student has to the array
    # students << {name: name, cohort: cohort, hobbies: hobbies, country: country}
    students << {:name => name, :cohort => cohort.to_sym, :hobbies => hobbies, :country => country}
    plural = "s" if students.count > 1
    puts "Now we have #{students.count} student#{plural}".center(40)
    # get another name from the user
    puts "name?"
    name = gets.chomp
      if !name.empty?
        puts "cohort?"
        cohort = gets.chomp
        if cohort.empty?
          cohort = "November"
        end
        puts "hobbies?"
        hobbies = gets.chomp
        puts "country of birth?"
        country = gets.chomp
      end
  end
  # return the array of input_students
  students
end

def interactive_menu
  # 1. print the menu and ask the user what to do
  # 2. read the input and save it into a variable
  # 3. do what the user has asked
  # 4. repear from step 1
end

# nothing happens until we call the methods.
students = input_students
if students.count > 0
  print_header
  print(students)
  print_footer(students)
else
  puts "No Students :-("
end
