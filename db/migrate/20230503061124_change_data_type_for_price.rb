class ChangeDataTypeForPrice < ActiveRecord::Migration[7.0]
  def change
    Product.update_all(price: nil)
    change_column :products, :price, 'numeric USING CAST(price AS numeric)'
  end
end
