Client = require "./structures/KannaClient"
client = new Client()
dotenv = require "dotenv"
dotenv.config()
client.on('ready', => client.user.setActivity('Written In CoffeScript')
console.log(client.user.tag + ' is ready to go!') )
client.login(process.env.token)
