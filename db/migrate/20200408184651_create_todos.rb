class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.belongs_to :list, index: true
      t.belongs_to :status, index: true

      t.timestamps
    end
  end
end
