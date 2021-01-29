class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.time :duration, null: false
      t.references :users, foreign_key: true

      t.timestamps
    end

    add_reference :activities, :missions, foreign_key: :true
  end
end
