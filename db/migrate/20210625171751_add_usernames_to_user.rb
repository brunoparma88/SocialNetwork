class AddUsernamesToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name, default: ''
      t.string :last_name, default: ''
    end
  end
end
