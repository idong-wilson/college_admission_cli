require_relative 'applicant'

class CollegeAdmission
  def initialize
    @applicants = []
  end

  def run
    puts "Welcome to the College Admission System!"
    loop do
      puts "What would you like to do?"
      puts "1. Submit an application"
      puts "2. View submitted applications"
      puts "3. Make admission decisions"
      puts "4. Exit"
      print "> "
      choice = gets.chomp.to_i

      case choice
      when 1
        submit_application
      when 2
        view_applications
      when 3
        make_admission_decisions
      when 4
        exit
      else
        puts "Invalid choice. Please try again."
      end
    end
  end

  def submit_application
    puts "Enter applicant's name:"
    name = gets.chomp
    puts "Enter applicant's age:"
    age = gets.chomp.to_i
    puts "Enter applicant's GPA:"
    gpa = gets.chomp.to_f

    applicant = Applicant.new(name, age, gpa)
    @applicants << applicant
    puts "Application submitted successfully!"
  end

  def view_applications
    if @applicants.empty?
      puts "No applications submitted yet."
    else
      puts "Listing all submitted applications:"
      @applicants.each do |applicant|
        puts "#{applicant.name} - Age: #{applicant.age}, GPA: #{applicant.gpa}, Admitted: #{applicant.admitted ? 'Yes' : 'No'}"
      end
    end
  end

  def make_admission_decisions
    if @applicants.empty?
      puts "No applications submitted yet."
    else
      puts "Making admission decisions..."
      @applicants.each do |applicant|
        if applicant.gpa >= 3.0 && applicant.age >= 18
          applicant.admitted = true
          puts "#{applicant.name} is admitted!"
        else
          puts "#{applicant.name} is not admitted."
        end
      end
    end
  end
end

# Run the CLI application
college_admission = CollegeAdmission.new
college_admission.run if __FILE__ == $PROGRAM_NAME
