class MbpTracksController < ApplicationController
  after_action :set_retrieved_flag, only: [:index]

  def index
    @tracks = MonitaTruckTrack.where(retrieved: false)

    respond_to do |format|
      format.json
    end
  end

  private

  def set_retrieved_flag
    @tracks.update_all(retrieved: true)
  end
end
