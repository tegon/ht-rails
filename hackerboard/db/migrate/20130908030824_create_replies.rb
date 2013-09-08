class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body, null: false
      t.references :user, null: false
      t.references :question, null: false

      t.timestamps
    end

    add_index :replies, :user_id
    add_index :replies, :question_id
  end
end