class UpdatePosteUrlName < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :post_url, :poster_url
  end
end
