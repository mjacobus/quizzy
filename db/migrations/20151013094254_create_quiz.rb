Hanami::Model.migration do
  change do
    create_table :quizzes do
      primary_key :id
      column :title, String, null: false
      column :description, :text,  null: false
      column :private, :boolean,  default: true, null: false
      column :created_at, :datetime
      column :updated_at, :datetime
    end
  end
end
