class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.string :iso_639_1
      t.timestamps
    end

    add_reference :slides, :language, foreign_key: true
    rename_column :slides, :maltese_latin, :target_script
    rename_column :slides, :maltese_ipa, :target_ipa

    reversible do |dir|
      dir.up do
        language = Language.create name: 'Maltese', iso_639_1: 'mt'

        Slide.update_all language_id: language.id
      end
    end
  end
end
