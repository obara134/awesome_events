class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :name,        null:false
      t.string :place,       null:false
      t.datetime :start_at,  null:false
      t.datetime :end_at,    null:false
      t.text :introduction,  null:false

      t.timestamps
    end
  end
end
