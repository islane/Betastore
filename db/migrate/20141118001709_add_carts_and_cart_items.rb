class AddCartsAndCartItems < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to :user
      t.belongs_to :order
      t.timestamps
    end

    create_table :cart_products do |t|
      t.belongs_to :cart
      t.belongs_to :product
      t.integer :quantity, default: 1, null: false

      t.timestamps
    end
  end
end
