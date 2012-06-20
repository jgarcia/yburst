require 'spec_helper'

module Yburst
  describe MessageBuilder do
    let :message_builder do
      MessageBuilder.new 'api_key', 'api_secret', 'YBurst Messages'
    end

    describe "#build" do 
      it "returns a xml formatted string with api info, from, to and text" do
       expected_xml = %{
				<?xml version='1.0'?> 
				<request> 
				<version>0.3</version> 
			    <key>api_key</key> 
				<secret>api_secret</secret> 
				<method>messages.single</method> 
				<params> 
					<mobile>521115551234</mobile> 
					<message>Hello John</message> 
					<caller_id>YBurst Messages</caller_id> 
					<sendtime /> 
					<contact_list /> 
				</params> 
				</request>
       }
       message_builder.stub(:clean_number).and_return("521115551234")
       message = message_builder.build 'Hello John', '1115551234', '52'
      end
    end

    describe "#clean_number" do

      let :expected_number do 
        "521115551234"
      end

      it "concatenates country code with number" do
        message_builder.clean_number("1115551234", "52").should == expected_number
      end
      
      it 'removes dots, dashes, parenthesis and spaces in number' do 
        message_builder.clean_number('(111) 555.12-34', "52").should == expected_number
      end

      it 'removes leading zeros on country_code' do 
        message_builder.clean_number('1115551234', '052').should == expected_number
      end
    end
  end
end
