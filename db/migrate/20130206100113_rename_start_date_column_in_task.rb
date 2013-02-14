class RenameStartDateColumnInTask < ActiveRecord::Migration
  def up
  	rename_column :tasks, :start_datedate, :start_date
  end

  def down
  	#rename_column :tasks, :start_datedate, :datetime 
  end
end
