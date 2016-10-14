class AddPageColumnToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :page, :string
  end
end
