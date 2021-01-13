{ Client, Collection } = require 'discord.js'
{ join } = require 'path'
{ promises , readdirSync } = require 'fs'
{ readdir } = promises
module.exports = class KannaClient extends Client
       constructor: () ->
         super args
         @prefix = 'k!'
         @commands = new Collection()
         build: () ->
          @loadListener()
          @login(process.env.token)

         loadCommands: ->
           categories = await readdir(join(__dirname, "..", "commands"));
           for category of categories 
             commands = await readdir(join(__dirname, "..", "commands", category));
             for commandFile of commands 
                command = require """../commands/#{category}/#{commandFile}""";
                command.config.category = category;
                this.commands.set(command.config.name, command);
            
         loadListener: ->
           Listeners = readdirSync "./lib/listeners";
           for events in Listeners
              listeners = require """../listeners/#{events}"""
              return this.on(events.split('.')[0], (...args) => listeners.run(this, ...args));
        
      
      