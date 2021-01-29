class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.time :duration
      t.references :users, foreign_key: true
      
      t.timestamps
    end
  end
end
