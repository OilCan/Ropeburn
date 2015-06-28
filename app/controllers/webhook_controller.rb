class WebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def incoming
    payload = validate_payload!

    Rails.logger.ap payload

    render text: "Thank you, come again."
  end

  private

  def validate_payload!
    request.body.rewind
    payload_body = request.body.read
    verify_signature(payload_body)
    JSON.parse(payload_body)
  end

  def payload_secret
    @payload_secret ||= Rails.application.secrets.github_webhook_secret
  end

  def verify_signature(payload_body)
    signature = 'sha1=' + OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new('sha1'), payload_secret, payload_body)
    raise "Signatures didn't match!" unless Rack::Utils.secure_compare(signature, request.env['HTTP_X_HUB_SIGNATURE'])
  end
end
