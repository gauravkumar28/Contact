class AddIndexIdToContact < ActiveRecord::Migration
  def change
    add_index :contacts, :phone
  end
end
