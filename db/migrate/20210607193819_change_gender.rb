# frozen_string_literal: true

class ChangeGender < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.remove :gender
    end
  end
end
