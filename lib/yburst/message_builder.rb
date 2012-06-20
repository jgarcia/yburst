module Yburst
  class MessageBuilder

    def initialize api_key, api_secret, caller_id
      @api_key, @api_secret, @caller_id = api_key, api_secret, caller_id
    end

    def build text, number, country_code
      message = %{
				<?xml version='1.0'?> 
				<request> 
				<version>0.3</version> 
			    <key>#{@api_key}</key> 
				<secret>#{@api_secret}</secret> 
				<method>messages.single</method> 
				<params> 
					<mobile>#{clean_number(number, country_code)}</mobile> 
					<message>#{text}</message> 
					<caller_id>#{@caller_id}</caller_id> 
					<sendtime /> 
					<contact_list /> 
				</params> 
				</request>
      }
    end

    def clean_number number, country_code
      remove_leading_zero(country_code) + remove_special_chars(number) 
    end

    private

    def remove_special_chars text
      text.gsub(/[-  .()]/, "")
    end

    def remove_leading_zero text
      if text.start_with? "0" 
        text.slice(1, text.length)
      else
        text
      end
    end
  end
end
