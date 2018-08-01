class CreateProfessionals < ActiveRecord::Migration[5.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :email
      t.string :language
      t.string :description
      t.string :professional_history
      t.string :key_words

      t.timestamps
    end
  end
end
