class AddPrecisionToIssues < ActiveRecord::Migration
  def change
    change_column :issues, :price, :decimal, :precision => 10, :scale => 2
  end
end
