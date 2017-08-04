class CreateUseranswers < ActiveRecord::Migration[5.1]
  def change
    create_table :useranswers do |t|
      t.integer :user_id, index: true
      t.integer :answer_id, index: true

      t.string :remark

      t.timestamps
    end
  end
end
