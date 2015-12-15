class AddViewsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :views, :integer
  end
end
