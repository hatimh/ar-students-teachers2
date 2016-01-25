class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher
  validates :email, uniqueness: true
  validates :email, presence: true, email: true
  validates :age , numericality: {greater_than: 3}
  after_save :add_date, if: :teacher

  def add_date
    self.teacher.last_student_added_at = Date.today
    self.teacher.save
  end

  def name
    self.first_name + " " + self.last_name
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end
