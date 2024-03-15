class Applicant
  attr_accessor :name, :age, :gpa, :admitted

  def initialize(name, age, gpa)
    @name = name
    @age = age
    @gpa = gpa
    @admitted = false
  end
end
