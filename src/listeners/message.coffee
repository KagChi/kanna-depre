module.exports = {
name: 'message'
run: (client, msg) ->
  return if msg.webhookID or msg.author.bot
    
  if msg.content is client.user.toString() or msg.guild and msg.content is msg.guild.me.toString()
      return msg.channel.send("Hi, my prefix is `#{client.prefix}`");
   
   return if not msg.content.startsWith(client.prefix)

   args = msg.content.slice(client.prefix.length).trim().split(/ +/g)
   cmd = args.shift().toLowerCase()
   command = client.commands.get cmd

   
   if command
      await command.run(client, args, msg)

}