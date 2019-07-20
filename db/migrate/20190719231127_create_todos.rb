class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.text :body
      t.references :category, unsigned: true, index: true, foreign_key: true, default: 1
      t.boolean :is_done, default: false
      t.timestamps
    end
  end
end
