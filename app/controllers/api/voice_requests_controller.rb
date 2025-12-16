class Api::VoiceRequestsController < ApplicationController

  def create
    vg = VoiceGeneration.new(params[:text], status: 'pending')
    if vg.save
      GenerateVoiceJob(vg.id)
      render json: { id: vr.id, status: vr.status }
    else
      render json: { errors: vg.errors.full_messages }
    end
  end


  def index
    
  end
end
