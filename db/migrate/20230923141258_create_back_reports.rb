class CreateBackReports < ActiveRecord::Migration[7.0]
  def change
    create_table :back_reports do |t|
      t.float :study_hours,            null: false
      t.text :successes,               null: false
      t.text :improvements,            null: false
      t.text :learning_tips,           null: false
      t.references :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
