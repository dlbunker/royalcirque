class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :middle_initial
      t.text :biography 
    	t.binary :picture, :limit => 2.megabytes

      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end
end
