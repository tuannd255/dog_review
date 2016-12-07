class ChangeColumnDogs < ActiveRecord::Migration[5.0]
  def change
    change_column :dogs, :rate, :integer, default: 0
  end
end
