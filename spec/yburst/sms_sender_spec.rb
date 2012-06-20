require 'spec_helper'

module Yburst
  describe SmsSender do
    describe "#initialize" do
      it "instantiate a new MessageBuilder" do
        MessageBuilder.should_receive :new
        SmsSender.new "api_key", "api_secret", "YBurst Messages"
      end
    end

    describe "#send_message" do
      before do
        @text = "Hello World"
        @number = "1115551234"
        @country_code = "52"

        @message_builder = stub("MessageBuilder")
        @message_builder.stub(:build).and_return("<XML Stuff here />")
        MessageBuilder.stub(:new).and_return(@message_builder)

        @sender = SmsSender.new "api_key", "api_secret", "YBurst Messages"
        SmsSender.stub(:post).and_return("queued")
      end

      it "creates the message" do
        @message_builder.should_receive(:build).with(@text, @number, @country_code)
        @sender.send_message @text, @number, @country_code
      end

      it "sends a request to the api" do
        SmsSender.should_receive(:post)
        @sender.send_message @text, @number, @country_code
      end
      
      it "verifies the response" do
        sent = @sender.send_message @text, @number, @country_code
        sent.should == true
      end
    end
  end
end
