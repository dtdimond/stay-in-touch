class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_name
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
