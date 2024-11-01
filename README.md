# 简介

**Wezterm** 终端模拟器配置，目前只适配了 windows，还没用过其他系统，不知道在其他系统上效果是啥样的。
在 Windows 系统中，需要将配置文件放置在 `C:\Users\you_user_name\.config` 目录下。

# 快捷键

具体快捷键详见 `config/mappings.lua`。

# 背景

将背景图片放在 `bg` 目录下，然后在 **Wezterm** 中使用 `ctrl + a + b` 进行背景图片选择。

# 其他

因为我的 **Wezterm** 一般用于 **wsl**，如果不想使用 **wsl** 就需要将 `config/window.lua` 中的 `window_config.default_domain = "WSL:Arch"` 注释掉。
具体相关配置可以参考官网：https://wezfurlong.org/wezterm/config/lua/config/index.html
