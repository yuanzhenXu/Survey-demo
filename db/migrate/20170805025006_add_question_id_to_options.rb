class AddQuestionIdToOptions < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :question_id, :integer, index: true
  end
end
