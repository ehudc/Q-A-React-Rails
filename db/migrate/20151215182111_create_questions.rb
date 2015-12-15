class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.text :content
      t.datetime :date

      t.timestamps null: false
    end
  end
end
