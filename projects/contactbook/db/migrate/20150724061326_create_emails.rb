class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :email_url

      t.timestamps
    end
  end
end
