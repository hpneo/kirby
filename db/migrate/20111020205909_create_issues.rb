class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.integer :series_id
      t.string :code
      t.date :release_date
      t.decimal :price

      t.timestamps
    end
  end
end
