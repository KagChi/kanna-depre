Client = require "./structures/KannaClient"
client = new Client()
dotenv = require "dotenv"
dotenv.config()
client.on 'ready', -> 
	console.log """#{client.user.username} Ready!"""
	client.user.setActivity 'With Coffee'
	
client.login(process.env.token)
