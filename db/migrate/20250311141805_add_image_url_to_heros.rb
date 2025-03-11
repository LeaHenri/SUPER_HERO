class AddImageUrlToHeros < ActiveRecord::Migration[7.1]
  def change
    add_column :heros, :image_url, :string
  end
end
