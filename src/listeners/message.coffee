module.exports = {
run: (client, msg) ->
  return if msg.webhookID or msg.author.bot
    
  if msg.content is @client.user.toString() or msg.guild and msg.content is msg.guild.me.toString()
      return msg.channel.send("Hi, my prefix is `#{client.prefix}`");
   
   return if not msg.content.startsWith(client.prefix)

   args = msg.content.slice(@prefix.length).trim().split(/ +/g)
   cmd = args.shift().toLowerCase()
   command = client.commands.get cmd

   if command.ownerOnly and msg.author.id isnt @client.config.owner
      return msg.channel.send("Sorry but that command is for the owner only.")

   if command.nsfw and not msg.channel.nsfw
      return msg.channel.send("That command can only be used in NSFW channels.")

   if command.guildOnly and not msg.guild
      return msg.channel.send("That command can only be used in a server.")

   if not command.enabled and msg.author.id isnt client.config.owner
      return msg.channel.send("That command has been disabled by the owner.")

   if command
      await command.run(client, args, message)

}