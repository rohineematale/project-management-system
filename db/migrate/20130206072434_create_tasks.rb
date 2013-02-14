class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :milestone_id
      t.integer :user_id
      t.datetime :start_datedate
      t.datetime :end_date
      t.string :status

      t.timestamps
    end
  end
end
