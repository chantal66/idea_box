class AddTitleToIdeas < ActiveRecord::Migration[5.1]
  def change
    add_column :ideas, :title, :string
  end
end
