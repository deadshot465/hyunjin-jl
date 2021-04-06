using Discord
using DotEnv

DotEnv.config()
token = ENV["TOKEN"]
prefix = ENV["PREFIX"]

client = Client(token; prefix=prefix)

function handler(c::Client, e::MessageCreate)
    if e.message.content == prefix * "about"
        embed = Embed(
            missing, missing,
            "Hyunjin Choi in the Land of Cute Bois.\nHyunjin Choi is from Camp Buddy: Scoutmasters' Season by [BLits Games](https://www.blitsgames.com/).\nHyunjin was made and developed by: \n**Arch#0226**, **Tetsuki Syu#1250**\nWritten with: \n[Julia](https://julialang.org/) and [Discord.jl](https://github.com/Xh4H/Discord.jl) library.",
            missing, missing, 0x43729F, 
            EmbedFooter("Hyunjin Bot: Release 0.2 | 2021-04-06", missing, missing),
            missing,
            EmbedThumbnail("https://cdn.discordapp.com/attachments/811517007446671391/828962181915476008/743164.png", missing, missing, missing),
            missing, missing,
            EmbedAuthor("Hyunjin from Camp Buddy: Scoutmasters' Season", missing, "https://images-ext-2.discordapp.net/external/rOMIWJyMHkRZ76A-26UoPThECFQEIlmVtZph1p24KCI/https/cdn.discordapp.com/emojis/593518771554091011.png", missing),
            missing
        )
        create_message(c, e.message.channel_id; embed=embed)
    end

    if e.message.content == prefix * "ping"
        create_message(c, e.message.channel_id; content="Pong!")
    end
end

add_handler!(client, MessageCreate, handler)
open(client)
wait(client)