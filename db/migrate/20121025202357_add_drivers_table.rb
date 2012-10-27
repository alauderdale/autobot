class AddDriversTable < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :position
      t.string :phone
      
      t.timestamps
    end
  end
end
