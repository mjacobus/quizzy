class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.text :provider_data
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :users, :email, unique: true
  end
end
