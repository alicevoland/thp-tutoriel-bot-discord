# Bundler
require 'bundler'
Bundler.require

require 'discordrb'
require 'dotenv/load'

$:.unshift File.expand_path('lib', __dir__)

# Main method of the script
def perform
  bot = Discordrb::Bot.new token: ENV['DISCORD_BOT_TOKEN'], client_id: ENV['DISCORD_CLIENT_ID']

  bot.message(with_text: 'Ping!') do |event|
    event.respond 'Pong!'
  end

  bot.run
end

# Only if the file is being executed directly, as a script
perform if __FILE__ == $0
