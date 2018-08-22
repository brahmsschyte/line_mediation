class MbpWebhookController < ApplicationController
  protect_from_forgery with: :null_session

  def callback
    #GPSLogger Android App
    code = params[:annotation].blank? ? 'Location Update' : params[:annotation]
    MonitaTruckTrack.create(
      time_id: DateTime.parse(params[:time_id]),
      latitude: params[:latitude],
      longitude: params[:longitude],
      altitude: params[:altitude],
      speed: params[:speed],
      accuracy: params[:accuracy],
      annotation: code,
      tracking_id: params[:key],
      retrieved: false
    )

    head :ok
  end

  private

  def location_params
    params.permit(:annotation, :altitude, :speed, :accuracy, :latitude, :longitude, :time_id)
  end
end
