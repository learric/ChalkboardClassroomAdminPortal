class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name_first
      t.string :name_last
      t.string :email
      t.string :favorite_team
      t.integer :game_wins
      t.integer :game_losses

      t.timestamps null: false
    end
  end
end
