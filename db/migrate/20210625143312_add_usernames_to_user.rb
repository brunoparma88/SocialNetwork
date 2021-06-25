# frozen_string_literal: true

class AddUsernamesToUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name, :string, default: ''
      t.string :last_name, :string, default: ''
    end
  end
end
