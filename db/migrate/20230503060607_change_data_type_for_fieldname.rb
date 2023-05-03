class ChangeDataTypeForFieldname < ActiveRecord::Migration[7.0]
  def change
    Product.update_all(price: nil)
    change_column :products, :price, :integer, using: 'price::integer'
  end
end
