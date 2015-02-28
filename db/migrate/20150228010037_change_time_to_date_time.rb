class ChangeTimeToDateTime < ActiveRecord::Migration
  def change
    change_column :activities, :time, :datetime
  end
end
