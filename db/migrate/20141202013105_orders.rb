class Orders < ActiveRecord::Migration
  def change

    create_table :orders do |t|
      t.string :email
      t.references :cart

      t.timestamps
    end
    add_index :orders, :cart_id, :unique => true

    create_table :line_items do |t|
      t.references :order
      t.references :product

      t.string     :name
      t.decimal    :price
      t.integer    :quantity

      t.timestamps
    end

  end
end
