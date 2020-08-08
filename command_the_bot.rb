# Bundler
require 'bundler'
Bundler.require

require 'discordrb'
require 'dotenv/load'

MEGABYTE = 1024 ** 2
ONE_HUNDRED_MEGABYTES = MEGABYTE * 100
logger = Logger.new("my_log.txt", 1, ONE_HUNDRED_MEGABYTES)

$:.unshift File.expand_path('lib', __dir__)

# Main method of the script
def perform
  logger.info("Started! #{event.user.username}")

  bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_BOT_TOKEN'], client_id: ENV['DISCORD_CLIENT_ID'], prefix: '$', advanced_functionality: true

  bot.send_message(737_655_830_031_237_232, 'Bonjour! <@693712651687297074> ', tts = false, embed = nil)

  bot.message(with_text: 'Hi') do |event|
    event.respond 'Hey!'
    logger.info("Said HEY to #{event.user.username}")
  end

  bot.command :hi do |event|
    "Hi #{event.user.username}"
    logger.info("Said Hi to #{event.user.username}")
  end

  at_exit { bot.stop }
  bot.run
end

# Only if the file is being executed directly, as a script
perform if __FILE__ == $0
