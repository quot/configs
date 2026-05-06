# config.nu
#
# Installed by:
# version = "0.110.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

#############
# Nu Config #
#############

$env.config.show_banner = false
$env.config.rm.always_trash = true

###########
# Aliases #
###########

alias docker = podman

# Keep macOS default 'open' command
# https://www.nushell.sh/book/configuration.html#macos-keeping-usr-bin-open-as-open
alias nu-open = open
alias open = ^open

###################
# Custom Commands #
###################

source ./scripts/commands.nu

##############
# Path Setup #
##############

# Homebrew setup
if ('/opt/homebrew' | path type) == 'dir' {
  $env.HOMEBREW_PREFIX = '/opt/homebrew'
  $env.HOMEBREW_CELLAR = '/opt/homebrew/Cellar'
  $env.HOMEBREW_REPOSITORY = '/opt/homebrew'
  $env.PATH = $env.PATH? | prepend [
    '/opt/homebrew/bin'
    '/opt/homebrew/sbin'
  ]
  $env.MANPATH = $env.MANPATH? | prepend '/opt/homebrew/share/man'
  $env.INFOPATH = $env.INFOPATH? | prepend '/opt/homebrew/share/info'
}

#############
# Env Setup #
#############

# Set Java environment variables with custom command.
# Use default Java version set in script.
setjava

#########
# Theme #
#########

# Prompt
$env.PROMPT_COMMAND = {$"(ansi black_bold)(ansi bg_light_blue)[($env.LOGNAME)](ansi reset)(ansi bg_light_gray)(ansi dark_gray) ($env.PWD | path dirname | path relative-to / | path split | each { |it| str substring 0..0 } | str join '/')/(ansi black)($env.PWD | path basename) (ansi reset)"}
$env.PROMPT_COMMAND_RIGHT = { date now | format date "%F %r" }

# Colors
$env.config.color_config.shape_pipe = 'black_bold'
$env.config.color_config.shape_external = 'black'
$env.config.color_config.datetime = 'green'
