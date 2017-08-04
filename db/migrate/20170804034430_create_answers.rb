class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :name
      t.string :content

      t.integer :question_id, index: true

      t.timestamps
    end
  end
end
