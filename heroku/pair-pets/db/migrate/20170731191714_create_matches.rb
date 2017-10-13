class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
    	t.integer :pet1_id
    	t.integer :pet2_id
      	t.timestamps
    end
  end
end
