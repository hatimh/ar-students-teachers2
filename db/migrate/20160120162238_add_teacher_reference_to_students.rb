class AddTeacherReferenceToStudents < ActiveRecord::Migration
  def change
    add_column :students, :teacher_id, :integer
    add_index :students, :teacher_id
  end
end
