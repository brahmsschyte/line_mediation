class LineEventsController < ApplicationController
  before_action :set_line_bot
  after_action  :set_retrieved_flag, only: [:index]

  def index
    if @line_bot.nil?
      head :bad_request
    else
      @line_events = LineEvent.where(retrieved: false, line_bot_id: @line_bot.id)
    end
    respond_to do |format|
      format.json
    end
  end

  private

  def set_line_bot
    @line_bot = LineBot.find_by(api_key: params[:api_key])
  end

  def set_retrieved_flag
    @line_events.update_all(retrieved: true)
  end
end
# response = Unirest.get "https://rocky-lines-82288.herokuapp.com/api/v1/line_events?api_key=1CkqSBeausotQQPAuV12NABB", headers:{ "Accept" => "application/json" }