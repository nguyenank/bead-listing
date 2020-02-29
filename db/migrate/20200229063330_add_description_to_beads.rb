class AddDescriptionToBeads < ActiveRecord::Migration[5.2]
  def change
    add_column :beads, :description, :text
  end
end
