class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :name, null: false
      t.string :description
      t.time :duration, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_reference :activities, :mission, foreign_key: :true
  end
end
