class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :first_name 
      t.string :last_name 
      t.string :email
      t.boolean :agree_to_receive_info
       

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
