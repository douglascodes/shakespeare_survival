class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.boolean :ever_married
      t.boolean :dies
      t.boolean :murderer
      t.boolean :ruler
      t.string :aka

      t.timestamps
    end
  end
end
