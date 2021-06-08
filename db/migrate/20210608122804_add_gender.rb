# frozen_string_literal: true

class AddGender < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.integer :gender
    end
  end
end
