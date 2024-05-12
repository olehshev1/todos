class ModifyToUsers < ActiveRecord::Migration[5.2]
  change_table :users do |t|
    t.change :user_role, :boolean, default: true
  end
end
