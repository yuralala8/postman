class CreatePlaydates < ActiveRecord::Migration[5.1]
  def change
    create_table :playdates do |t|
    	t.integer :match_id
    	t.string :location
    	t.datetime :date 
      	t.timestamps
    end
  end
end
