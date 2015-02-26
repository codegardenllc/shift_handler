class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.references :organization, index: true
      t.boolean :admin

      t.timestamps
    end
  end
end
