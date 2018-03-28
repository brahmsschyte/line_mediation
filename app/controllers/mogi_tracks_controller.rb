class MogiTracksController < ApplicationController
  after_action :set_retrieved_flag, only: [:index]

  def index
    @mogi_tracks = MogiTrack.where(retrieved: false, serial: params[:api_key])

    respond_to do |format|
      format.json
    end
  end

  private

  def set_retrieved_flag
    @mogi_tracks.update_all(retrieved: true)
  end
end
# response = Unirest.get "https://rocky-lines-82288.herokuapp.com/api/v1/mogi_tracks?api_key=942bc5a", headers:{ "Accept" => "application/json" }