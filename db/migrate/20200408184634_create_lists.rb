class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.belongs_to :user, index: true
      t.belongs_to :access, index: true

      t.timestamps
    end
  end
end
