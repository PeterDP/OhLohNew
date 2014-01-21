class AddImageUrlToShoppingCartItems < ActiveRecord::Migration
  def change
    add_column :shopping_cart_items, :image_url, :string
  end
end
