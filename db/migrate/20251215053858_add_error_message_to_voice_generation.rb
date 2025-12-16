class AddErrorMessageToVoiceGeneration < ActiveRecord::Migration[7.1]
  def change
    add_column :voice_generations, :error_message, :text
  end
end
