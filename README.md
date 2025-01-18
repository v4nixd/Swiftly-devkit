<p align="center">
  <a href="https://github.com/v4nixd/Swiftly-devkit">
    <img src="https://cdn.swiftlycs2.net/swiftly-logo.png" alt="SwiftlyLogo" width="80" height="80">
  </a>

  <h3 align="center">[Swiftly] Developer kit ⚙️</h3>

  <p align="center">
    Developer kit plugin for Swiftly
    <br/>
  </p>
</p>

<p align="center">
  <img src="https://img.shields.io/github/downloads/v4nixd/Swiftly-devkit/total" alt="Downloads"> 
  <img src="https://img.shields.io/github/contributors/v4nixd/Swiftly-devkit?color=dark-green" alt="Contributors">
  <img src="https://img.shields.io/github/issues/v4nixd/Swiftly-devkit" alt="Issues">
  <img src="https://img.shields.io/github/license/DeadPoolCS2/v4nixd/Swiftly-devkit" alt="License">
</p>

---

### Installation 🛠️

1. Download the latest release
2. Create a new folder in `game/csgo/addons/swiftly/plugins/` called `Devkit`
3. Unzip the plugin into the `Devkit` folder you created

This is how it has to look
```
swiftly/
└── plugins/
    └── Devkit/
        ├── core.lua
        └── main.lua
```

### Configuring ⚙️

You can change the `chat_prefix` in `main.lua`

### Features ℹ️

`!reload <plugin_name>` - reloads switly plugin, the `plugin_name` has to match the plugin's folder name in `plugins` directory
`!load <plugin_name>` - loads swiftly plugin
`!unload <plugin_name>` - unloads swiftly plugin

> [!TIP]<br>
> `plugin_name` needs to match the plugin's folder name in `plugins` directory<br>

`!testing` - starts testing scenario, below is the list of commands that it executes
```
mp_restartgame 10
mp_warmuptime 999999999
mp_autoteambalance false
mp_disable_autokick <playerid>
mp_warmup_start
```
