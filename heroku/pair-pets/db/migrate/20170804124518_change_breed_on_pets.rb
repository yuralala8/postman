class ChangeBreedOnPets < ActiveRecord::Migration[5.1]
  def change
  	rename_column :pets, :breed, :breed_id
  	change_column :pets, :breed_id, 'integer USING CAST(breed_id AS integer)'
  end
end
