### 1. DONE After we added the code to load the students from file, we ended up with adding the students to @students in two places. The lines in load_students() and input_students() are almost the same. This violates the DRY (Don't Repeat Yourself) principle. How can you extract them into a method to fix this problem?
### 2. DONE How could you make the program load students.csv by default if no file is given on startup? Which methods would you need to change?
### 3. DONE Continue refactoring the code. Which method is a bit too long? What method names are not clear enough? Anything else you'd change to make your code look more elegant? Why?
### 4. DONE Right now, when the user choses an option from our menu, theres no way of them knowing if the action was successful. Can you fix this and implement feedback messages for the user?
# 5. The filename we use to save and load data (menu items 3 and 4) is hardcoded. Make the script more flexible by asking for the filename if the user chooses these menu items.
### 6. DONE We are opening and closing the files manually. Read the documentation of the File class to find out how to use a code block (do...end) to access a file, so that we didn't have to close it explicitly (it will be closed automatically when the block finishes). Refactor the code to use a code block.
### 7. DONE We are de-facto using CSV format to store data. However, Ruby includes a library to work with the CSV files that we could use instead of working directly with the files. Refactor the code to use this library.
### 8. DONE Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.
require "csv.rb"
@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process_menu_selection(STDIN.gets.chomp)
  end
end

def print_menu
  puts "-------------"
  puts "STUDENT DIRECTORY: MAIN MENU"
  puts "-------------"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to csv"
  puts "4. Load the list from csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def process_menu_selection(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students
    when "9" then exit # this will cause the program to terminate
    else puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    write_to_array(name, cohort="november")
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
    # puts "Enter the filename you want to use"
    # filename = STDIN.gets.chomp
    filename = use_last_save("s")
    CSV.open(filename, "wb") do |csv|
      @students.each do |student|
        csv << [student[:name],student[:cohort]]
      end
    end
    puts "Details saved to #{filename}"
    record_last_save(filename)
end

def record_last_save(filename)
  #file = File.open("last_save", "w")
  file = File.open("last_save", "w") do |file|
    file.puts filename
  end
  #file.close
end

def read_last_save
  file = File.open("last_save", "r") do |file|
    file.readlines.each do |line|
      filename = line.chomp
      return filename
    end
  end
end

def choose_filename(action)
  case action
    when "l" then action = "load from"
    when "s" then action = "save to"
  end
  puts "Enter a filename to #{action} or press Return to use default"
  filename = gets.chomp
  filename = "students.csv" if filename == ""
  puts filename
  return filename
end

def use_last_save(action)
  if !read_last_save.nil?
    puts "Use #{read_last_save}? Y or N"
    use_last = STDIN.gets.chomp
    case use_last.downcase
    when "y" then filename = read_last_save
    when "n" then filename = choose_filename(action)
    else
      puts "I didn't understand so I will use the default"
      filename = choose_filename(action)
    end
    return filename
  end
end

def load_students
  filename = use_last_save("l") if filename.nil?
  CSV.foreach(filename) do |row|
    name, cohort = row
    write_to_array(name,cohort)
  end
  # puts "Details loaded from #{filename}" if !startup
end

def try_load_students
  if ARGV.first.nil?
    filename = use_last_save("l")
  else
    filename = ARGV.first
  end
  if File.exists?(filename) # if it exists
    # load_students(filename)
    load_students
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist"
    exit # quit the program
  end
end

def write_to_array(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
