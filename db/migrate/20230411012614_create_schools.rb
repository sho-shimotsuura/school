class CreateSchools < ActiveRecord::Migration[6.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :prefecture
      t.string :city
      t.string :phone
      t.text :overview
      t.text :image

      t.timestamps
    end
  end
end
