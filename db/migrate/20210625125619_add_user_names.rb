# frozen_string_literal: true

class AddUserNames < ActiveRecord::Migration[5.0]
  def change
    change_table :users, bulk: true do |t|
      t.column :first_name, :string, default: ''
      t.column :last_name, :string, default: ''
    end
  end
end
