# Bundler
require 'bundler'
Bundler.require

require 'discordrb'
require 'dotenv/load'

$:.unshift File.expand_path('lib', __dir__)

# Main method of the script
def perform
  bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_BOT_TOKEN'], client_id: ENV['DISCORD_CLIENT_ID'], prefix: '$', advanced_functionality: true
  at_exit { bot.stop }
  bot.run :async

  # All servers and channels bot has access to
  puts 'Liste des serveurs du bot :'
  bot.servers.each do |id, server|
    puts "SERVER id=#{id} -> #{server}"
    puts '--'
    puts 'Liste des serveurs du bot :'
    server.channels.each do |channel|
      puts "CHANNEL: #{channel.inspect}"
    end
  end
  puts '--'

  # All users bot share a server with
  puts 'Liste des utilisateurs que le bot peut contacter :'
  bot.users.each do |id, user|
    puts "USER id=#{id} -> #{user.inspect}"
  end
  puts '--'

  # Answer the command '$hi'
  bot.command :hi do |event|
    event.respond "Hi #{event.user.username}"
    puts "Said Hi to #{event.user.username}"
  end

  bot.join
end

# Only if the file is being executed directly, as a script
perform if __FILE__ == $0
