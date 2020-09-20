class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.string :english_latin
      t.string :maltese_ipa
      t.string :maltese_latin

      t.timestamps
    end
  end
end
