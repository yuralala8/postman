class ChangeAddressOnUsers < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :address, :city
  end
end
