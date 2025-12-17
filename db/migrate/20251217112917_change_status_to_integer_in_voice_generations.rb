class ChangeStatusToIntegerInVoiceGenerations < ActiveRecord::Migration[7.1]
  def up
    remove_column :voice_generations, :status
    add_column :voice_generations, :status, :integer, default: 0, null: false
  end

  def down
    remove_column :voice_generations, :status
    add_column :voice_generations, :status, :text
  end
end
