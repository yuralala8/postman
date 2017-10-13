class CreateSwipes < ActiveRecord::Migration[5.1]
  def change
    create_table :swipes do |t|
    	t.integer :swiper_id
    	t.integer :swipee_id
      	t.timestamps
    end
  end
end
