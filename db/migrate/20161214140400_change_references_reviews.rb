class ChangeReferencesReviews < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :reviews, :dogs
    remove_reference :reviews, :dog, index: true
    add_column :reviews, :targetable_id, :integer
    add_column :reviews, :targetable_type, :string
  end
end
