class AddRateToDogs < ActiveRecord::Migration[5.0]
  def change
    add_column :dogs, :rate, :integer
  end
end
