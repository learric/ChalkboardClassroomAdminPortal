class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id
      t.string :name_first
      t.string :name_last
      t.string :email
      t.string :favorite_team
      t.integer :game_wins, default: 0
      t.integer :game_losses, default: 0

      t.timestamps null: false
    end
  end
end
