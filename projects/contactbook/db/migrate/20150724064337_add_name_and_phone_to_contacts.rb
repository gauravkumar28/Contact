class AddNameAndPhoneToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :phone, :integer
  end
end
