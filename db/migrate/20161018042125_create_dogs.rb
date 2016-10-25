class CreateDogs < ActiveRecord::Migration[5.0]
  def change
    create_table :dogs do |t|
      t.string :image
      t.string :name
      t.integer :weight
      t.integer :height
      t.integer :avg_life_expectancy
      t.string :origin
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
