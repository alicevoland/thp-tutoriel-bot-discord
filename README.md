# Création d'un bot discord

## Présentation

Mini-tutoriel sur la création d'un bot sur Discord avec la [gem discordrb](https://github.com/discordrb/discordrb). La première partie de ce tutoriel est largement inspiré de [cet article sur Medium](https://medium.com/@goodatsports/how-to-make-a-simple-discord-bot-in-ruby-to-annoy-your-friends-f5d0438daa70).


## Ping! Pong! bot

### 1. Création du bot

Ca se passe ici : [https://discordapp.com/developers](https://discordapp.com/developers) (utiliser le QR avec l'app sur le téléphone, ou bien entrer les login / password). Il faut ensuite créer une application en lui donnant un nom, puis un bot et lui donner un nom.

<img src="screenshots/creer_un_bot.jpg" width="500">

Une fois le bot créé il faut lui permettre de rejoindre un serveur (où vous devez être administrateur). Pour cela il faut utiliser l'onglet OAuth2, cocher la case "bot" puis les permissions souhaités pour le bot. Cela créé un lien à copier et ouvrir dans le navigateur pour ajouter notre bot à un serveur.

<p>
<img src="screenshots/autoriser_un_bot.jpg" width="500">
<img src="screenshots/ajouter_un_bot_au_serveur.jpg" width="150">
</p>

Normalement Discord notifie d'un petit message confirmant que le bot a bien rejoint le serveur.

### 2. Utiliser la gem discordrb

La première étape est de récupérer nos clés de l'API pour les mettre dans un joli `.env` qu'on ajoute tout de suite au `.gitignore`. Le client id est à récupérer sur l'onglet "General Information", il apparait en clair. Le bot token est à récupérer sur l'onglet "Bot", il faut cliquer pour le révéler.

```
DISCORD_CLIENT_ID = <copier ici le client id - un numéro entier>
DISCORD_BOT_TOKEN = "<copier ici le token - chaîne de caractères>"
```

Voilà tout est prêt pour utiliser notre bot. Notre première application va simplement lire tous les messages envoyés directement au bot, et chaque fois qu'on lui envoie "Ping!" il va répondre "Pong!".

```ruby
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
```
