class CreateHandlings < ActiveRecord::Migration[6.1]
  def change
    create_table :handlings do |t|
      t.references :school, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
