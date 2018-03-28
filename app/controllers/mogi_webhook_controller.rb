class MogiWebhookController < ApplicationController
  protect_from_forgery with: :null_session

  def callback
    #GPSLogger Android App
    code = params[:annotation].blank? ? 'Location Update' : params[:annotation]
    MogiTrack.create(android_id: params[:android_id], serial: params[:key], annotation: code, altitude: params[:altitude], speed: params[:speed], accuracy: params[:accuracy], latitude: params[:latitude], longitude: params[:longitude], time_id: DateTime.parse(params[:time_id]), retrieved: false)

    head :ok
  end

  private

  def location_params
    params.permit(:android_id, :annotation, :altitude, :speed, :accuracy, :latitude, :longitude, :time_id)
  end
end
