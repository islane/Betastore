class AddVotesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :votes, :integer, default: 0
  end
end
