module.exports = {
    name: "ping"
    ownerOnly: false
    nsfw: false
    enabled: true
    run: (client, args, msg) -> 
     msg.channel.send("pong")
}