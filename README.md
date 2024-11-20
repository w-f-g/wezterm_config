# 简介

**Wezterm** 终端模拟器配置，目前只适配了 windows，还没用过其他系统，不知道在其他系统上效果是啥样的。
在 Windows 系统中，需要将配置文件放置在 `C:\Users\you_username\.config` 目录下。

# 快捷键

具体快捷键详见 `config/mappings.lua`。

# 背景

将背景图片放在 `bg` 目录下，然后在 **Wezterm** 中使用 `ctrl + a + b` 进行背景图片选择。

# 其他

因为我的 **Wezterm** 一般用于 **wsl**，如果不想使用 **wsl** 就需要将 `config/window.lua` 中的 `window_config.default_domain = "WSL:Arch"` 注释掉。
具体相关配置可以参考官网：https://wezfurlong.org/wezterm/config/lua/config/index.html

# 使用 starship 美化 cmd 终端

1. 安装[clink](https://chrisant996.github.io/clink/clink.html)
2. 安装[starship](https://github.com/starship/starship/releases/latest)
3. 将 `./starship.lua` 文件移动到 `%LocalAppData%\clink\starship.lua`，将 **you_username** 改成你自己的用户名

**clink** 在每次启动的时候都会打印版本信息，在终端输入 `clink set clink.logo none` 就可以关闭它。
