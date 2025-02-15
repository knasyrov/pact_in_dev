class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :full_name

      t.integer :age
      t.string :email, null: false, default: ""

      t.string :nationality
      t.string :country
      t.string :gender
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
