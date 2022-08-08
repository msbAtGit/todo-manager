class Users < ActiveRecord::Migration[6.1]
  def self.up
    create_table :users do |t|
      t.column :email, :string, :limit => 255, :null => false
      t.column :name, :string
      t.column :password, :string
      t.column :created_at, :timestamp
    end
  end

  def self.down
    drop_table :users
  end


end
