class CreateCommunications < ActiveRecord::Migration
  def change
    create_table :communications do |t|
      t.string :communication_type
      t.datetime :communication_time
      t.integer :user_id
      t.integer :contact_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
