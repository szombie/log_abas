class CreateDailyReports < ActiveRecord::Migration
  def change
    create_table :daily_reports do |t|
      t.date :fecha
      t.integer :invoice_id

      t.timestamps
    end
  end
end
