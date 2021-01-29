class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name
      t.string :description
      t.time :duration
      t.references :users, foreign_key: true

      t.timestamps
    end

    add_reference :activities, :missions, foreign_key: :true
  end
end
