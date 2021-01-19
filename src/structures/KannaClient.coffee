{ Client, Collection } = require 'discord.js'
{ join } = require 'path'
{ promises , readdirSync } = require 'fs'
{ readdir } = promises
module.exports = class KannaClient extends Client
       constructor: (opt) ->
         super opt
         @prefix = 'k!'
         @commands = new Collection()


        build: () ->
          @loadListener()
          @loadCommands()
          @login(process.env.token)

        loadCommands: ->
           categories = await readdir(join(__dirname, "..", "commands"));
           for category in categories 
             commands = await readdir(join(__dirname, "..", "commands", category));
             for commandFile in commands 
                command = require """../commands/#{category}/#{commandFile}""";
                command.category = category;
                this.commands.set(command.name, command);
            
        loadListener: ->
           Listeners = readdirSync "./lib/listeners";
           for events of Listeners
              listeners = require """../listeners/#{events}"""
              this.on listeners.name, (...args) -> listeners.run(this, ...args);
        
      
      
