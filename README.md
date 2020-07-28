# Création d'un bot discord

## Présentation

Mini-tutoriel sur la création d'un bot sur Discord avec la [gem discordrb](https://github.com/discordrb/discordrb). La première partie de ce tutoriel est largement inspiré de [cet article sur Medium](https://medium.com/@goodatsports/how-to-make-a-simple-discord-bot-in-ruby-to-annoy-your-friends-f5d0438daa70).


## Ping! Pong! bot

### 1. Création du bot

Ca se passe ici : [https://discordapp.com/developers](https://discordapp.com/developers) (utiliser le QR avec l'app sur le téléphone, ou bien entrer les login / password). Il faut ensuite créer une application en lui donnant un nom, puis un bot et lui donner un nom.

<img src="screenshots/creer_un_bot.jpg" width="500">

Une fois le bot créé il faut lui permettre de rejoindre un serveur (où vous devez être administrateur). Pour cela il faut utiliser l'onglet OAuth2, cocher la case "bot" puis les permissions souhaités pour le bot. Cela créé un lien à copier et ouvrir dans le navigateur pour ajouter notre bot à un serveur.

<img src="screenshots/autoriser_un_bot.jpg" width="500">

<img src="screenshots/ajouter_un_bot_au_serveur.jpg" width="250">

### 2. Utiliser la gem discordrb

Ensuite on met tout ça dans un joli `.env` qu'on ajoute tout de suite au `.gitignore`
