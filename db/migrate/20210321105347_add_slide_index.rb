class AddSlideIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :slides,
      [:target_script, :target_ipa, :english_latin, :language_id],
      unique: true,
      name: 'slide_validation_index'
  end
end
