class CreateStudents < ActiveRecord::Migration
  
  def change
    # Add code to create the table here
    # HINT: check out ActiveRecord::Migration.create_table
    create_table :students do |t|
    # column definitions go here
    # Use the AR migration guide for syntax reference
    t.column :first_name, :string
    t.column :last_name, :string
    t.column :gender, :string
    t.column :birthday, :date
    t.column :email, :string
    t.column :phone, :string
    t.timestamps null: false
    end
  end

end
