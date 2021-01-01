class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.integer :student_id
      t.integer :slide_id

      t.timestamps
    end
  end
end
