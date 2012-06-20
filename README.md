# Yburst

A wrapper for Burst SMS 

## Installation

Add this line to your application's Gemfile:

    gem 'yburst'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yburst

## Usage

Initialize Yburst

    sender = Yburst::SmsSender.new <API_KEY>, <API_SECRET>, <CALLER_ID>

Send a message

    sender.send_message "Hello Joe", "111-555-1234", "52"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
