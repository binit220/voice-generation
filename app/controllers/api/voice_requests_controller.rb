class Api::VoiceRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    vg = current_user.voice_generations.new(voice_generation_params)
    vg.status = "pending"

    if vg.save
      GenerateVoiceJob.perform_later(vg.id)
      render json: {
        id: vg.id,
        status: vg.status,
        audio_url: vg.audio_url,
        processing_time: vg.processing_time
      }, status: :ok

    else
      render json: {
        errors: vg.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def index
    render json: current_user.voice_generations.order(created_at: :desc)
  end

  def show
    vg = current_user.voice_generations.find(params[:id])
    render json: vg
  end

  private

  def voice_generation_params
    params.require(:voice_request).permit(:text)
  end

end
