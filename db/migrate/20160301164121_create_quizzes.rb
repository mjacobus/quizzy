class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.boolean :private
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
