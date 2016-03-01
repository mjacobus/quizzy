Hanami::Model.migration do
  change do
    create_table :users do
      primary_key :id
      column :name, String, null: false
      column :email, String, null: false
      column :provider, String, null: false
      column :uid, String, null: false
      column :created_at, :datetime
      column :updated_at, :datetime
      column :provider_data, :text
    end
  end
end
