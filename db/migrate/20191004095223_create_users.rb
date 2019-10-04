class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.date :date_of_birth
      t.string :gender

      t.timestamps
    end
  end
end
