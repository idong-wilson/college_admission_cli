require 'minitest/autorun'
require_relative '../college_admission'

class CollegeAdmissionTest < Minitest::Test
  def setup
    @admission = CollegeAdmission.new
  end

  def test_add_applicant
    @admission.submit_application
    assert_equal 1, @admission.instance_variable_get(:@applicants).size
  end

  def test_view_applicants
    @admission.instance_variable_get(:@applicants) << Applicant.new("Sandra", 19, 3.5)
    assert_output(/Sandra - Age: 19, GPA: 3.5, Admitted: No/) { @admission.view_applications }
  end

  def test_make_admission_decisions
    @admission.instance_variable_get(:@applicants) << Applicant.new("Sandra", 19, 3.5)
    @admission.make_admission_decisions
    assert_equal "Yes", @admission.instance_variable_get(:@applicants).first.admitted ? "Yes" : "No"
  end
end
