class CreateVoiceGenerations < ActiveRecord::Migration[7.1]
  def change
    create_table :voice_generations do |t|
      t.text :text
      t.string :audio_url
      t.float :processing_time
      t.string :staus
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
