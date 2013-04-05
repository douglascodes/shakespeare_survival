class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :name
      t.string :subtitle
      t.text :description

      t.timestamps
    end
  end
end
