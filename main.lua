local chat_prefix = "[Devkit]"

function checkPlayerid(playerid)
    if playerid == -1 then return end
end

function isPlayerValid(player)
    if not player then return end
end

function isPluginProvided(pluginTarget, playerid, action)
    if not pluginTarget then
        return ReplyToCommand(playerid, chat_prefix, "You need to specify a {GREEN}plugin{DEFAULT} to " .. action .. " -> {YELLOW}!" .. action .. " <plugin_name>{DEFAULT}")
    end
end

commands:Register("reload", function (playerid, args)
    local chat_prefix = "[Devkit]"

    checkPlayerid(playerid)
    local player = GetPlayer(playerid)
    isPlayerValid(player)

    local pluginTarget = args[1]
    isPluginProvided(pluginTarget, playerid, "reload")

    if GetPluginState(pluginTarget).Stopped then
        return ReplyToCommand(playerid, chat_prefix, "Plugin {RED}isn't loaded{DEFAULT}, please first load it -> !load <plugin_name>")
    end

    server:Execute("sw plugins reload " .. pluginTarget)

    SetTimeout(150, function ()
        pluginState = GetPluginState(pluginTarget) 

        if pluginState == PluginState_t.Started then
            return ReplyToCommand(playerid, chat_prefix, "Plugin {GREEN}successfully{DEFAULT} reloaded")
        else
            return ReplyToCommand(playerid, chat_prefix, "Plugin reloaded with {RED}error{DEFAULT}, {YELLOW}check console for details")
        end
    end)
end)

commands:Register("load", function (playerid, args, argc, silent, prefix)
    checkPlayerid(playerid)
    local player = GetPlayer(playerid)
    isPlayerValid(player)

    local pluginTarget = args[1]
    isPluginProvided(pluginTarget, playerid, "load")

    if GetPluginState(pluginTarget).Started then
        return ReplyToCommand(playerid, chat_prefix, "Plugin {RED}is already loaded{DEFAULT}, please first unload it -> !unload <plugin_name>")
    end

    server:Execute("sw plugins load " .. pluginTarget)

    SetTimeout(150, function ()
        local pluginState = GetPluginState(pluginTarget)

        if pluginState == PluginState_t.Started then
            return ReplyToCommand(playerid, chat_prefix, "Plugin {GREEN}successfully{DEFAULT} loaded")
        else
            return ReplyToCommand(playerid, chat_prefix, "Plugin loaded with {RED}error{DEFAULT}, {YELLOW}check console for details")
        end
    end)
end)

commands:Register("unload", function (playerid, args, argc, silent, prefix)
    checkPlayerid(playerid)
    local player = GetPlayer(playerid)
    isPlayerValid(player)

    local pluginTarget = args[1]
    isPluginProvided(pluginTarget, playerid, "unload")

    if GetPluginState(pluginTarget).Stopped then
        return ReplyToCommand(playerid, chat_prefix, "Plugin {RED}is already unloaded{DEFAULT}, please first load it -> !load <plugin_name>")
    end

    server:Execute("sw plugins unload " .. pluginTarget)

    SetTimeout(150, function ()
        local pluginState = GetPluginState(pluginTarget)

        if pluginState == PluginState_t.Stopped then
            return ReplyToCommand(playerid, chat_prefix, "Plugin {GREEN}successfully{DEFAULT} unloaded")
        else
            return ReplyToCommand(playerid, chat_prefix, "Plugin unloaded with {RED}error{DEFAULT}, {YELLOW}check console for details")
        end
    end)
end)

commands:Register("testing", function (playerid, args, argc, silent, prefix)
    checkPlayerid(playerid)
    local player = GetPlayer(playerid)
    isPlayerValid(player)

    print(chat_prefix .. " Testing enabled")

    server:Execute("mp_restartgame 10")
    server:Execute("mp_warmuptime 999999999")
    server:Execute("mp_autoteambalance false")
    server:Execute("mp_disable_autokick " .. playerid)
    server:Execute("mp_warmup_start")

    return ReplyToCommand(playerid, chat_prefix, "Testing scenario enabled")
end)