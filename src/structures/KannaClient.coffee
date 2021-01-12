{ Client, Collection } = require 'discord.js'
module.exports = class KannaClient extends Client
 @prefix = 'k!'
 @commands = new Collection()