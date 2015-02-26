class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :employee, index: true
      t.references :activity_type, index: true
      t.text :notes
      t.time :time

      t.timestamps
    end
  end
end
