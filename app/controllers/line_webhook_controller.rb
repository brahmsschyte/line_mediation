class LineWebhookController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_line_bot

  def callback
    unless is_validate_signature
      head :bad_request
    end

    LineEvent.create(event: params["events"][0], retrieved: false, line_bot_id: @line_bot.id)

    head :ok
    respond_to do |format|
      format.json
    end
  end

  private

  def set_line_bot
    @line_bot = LineBot.find_by(api_key: params[:key])
  end

  def is_validate_signature
    signature = request.headers["X-LINE-Signature"]
    http_request_body = request.raw_post
    hash = OpenSSL::HMAC::digest(OpenSSL::Digest::SHA256.new, @line_bot.channel_secret, http_request_body)
    signature_answer = Base64.strict_encode64(hash)
    signature == signature_answer
  end
end