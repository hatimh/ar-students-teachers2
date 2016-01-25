class Teacher < ActiveRecord::Base
  # implement your Teacher model here
   validates :email, uniqueness: true
   has_many :students
   validate :check_hire_date, if: :hire_date
   validate :check_retire_date
   after_save :remove_students, if: :retirement_date

  def check_hire_date
    unless hire_date < Date.today
      record.errors[:hire_date] << 'Hire date cannot be in future'
    end
  end

  def check_retire_date
    if retirement_date  && hire_date && retirement_date > hire_date
      record.errors[:retirement_date] << 'Retirement date cannot be earlier then hire date.'
    end
  end

  def remove_students
    students.each do |student|
      student.teacher_id = nil 
      student.save
    end  
  end

end
