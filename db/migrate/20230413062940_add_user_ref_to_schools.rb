class AddUserRefToSchools < ActiveRecord::Migration[6.1]
  def change
    add_reference :schools, :user, null: false, foreign_key: true
  end
end
