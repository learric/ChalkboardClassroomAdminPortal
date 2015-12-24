class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.belongs_to :user, index: true
      t.string :name_prefix
      t.string :name_first
      t.string :name_last
      t.string :school_name
      t.string :school_location
      t.string :school_city
      t.string :school_state
      t.string :classroom_name
      t.string :classroom_location
      t.text :classroom_description

      t.timestamps null: false
    end
  end
end
