class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.datetime :start_time
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
