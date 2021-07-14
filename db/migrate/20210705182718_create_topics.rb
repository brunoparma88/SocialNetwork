class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :name, null: false, index: true, unique: true
      t.timestamps
    end
  end
end
