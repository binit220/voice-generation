class ChangeDataTypeForStatusInVoiceGeneration < ActiveRecord::Migration[7.1]
  def change
    rename_column :voice_generations, :staus, :status
    change_column :voice_generations, :status, :text
  end
end
