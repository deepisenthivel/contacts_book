class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_id
      t.integer :mobile_no
      t.string :address

      t.timestamps
    end
  end
end
