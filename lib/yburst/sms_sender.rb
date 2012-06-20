module Yburst
  require "httparty"

  class SmsSender
    include HTTParty

    API_URL = "http://burstsms.com.au/api"

    def initialize api_key, api_secret, caller_id
      @message_builder = MessageBuilder.new api_key, api_secret, caller_id
    end

    def send_message text, number, country_code
      message = @message_builder.build(text, number, country_code)
      response = self.class.post API_URL, body: {request: message}
      response.body.include? "queued"
    end
  end
end
