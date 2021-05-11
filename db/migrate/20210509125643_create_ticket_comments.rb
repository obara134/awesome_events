class CreateTicketComments < ActiveRecord::Migration[5.2]
  def change
    create_table :ticket_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
