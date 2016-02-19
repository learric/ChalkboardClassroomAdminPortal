class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :user, index: true
      t.string :classroom_name
      t.string :classroom_location
      t.text :classroom_description

      t.timestamps null: false
    end
  end
end
