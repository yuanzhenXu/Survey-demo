class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :option_id, index: true

      t.timestamps
    end
  end
end
