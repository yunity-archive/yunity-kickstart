class CreateSharers < ActiveRecord::Migration[5.0]
  def change
    create_table :sharers do |t|
      t.string :name
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
