class AddDateToActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :activities, :date, :date, null: false
  end
end
