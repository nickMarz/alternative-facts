class AddUserIdToFacts < ActiveRecord::Migration[5.0]
  def change
    add_column :facts, :user_id, :integer
  end
end
