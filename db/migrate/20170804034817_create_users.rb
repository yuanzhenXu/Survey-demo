class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :mobile
      t.string :password_digest
      t.string :name

      t.boolean :is_admin, default: false

      t.timestamps
    end
  end
end
