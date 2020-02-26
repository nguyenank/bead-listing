class CreateBeads < ActiveRecord::Migration[5.2]
  def change
    create_table :beads do |t|
      t.string :brand
      t.string :color
      t.string :size
      t.string :shape

      t.timestamps
    end
  end
end
