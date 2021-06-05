ZSH_DISABLE_COMPFIX=true
EDITOR=nvim

# PROMPT='%n@%m %3~%(!.#.$)%(?.. [%?]) '

fpath=( "$HOME/.zsh/functions" "${fpath[@]}" )

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude node_modules"
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="/usr/local/bin:$PATH"
export DOTNET_CLI_TELEMETRY_OPTOUT=1   # No dot.net telemetry
export HOMEBREW_NO_ANALYTIiCS=1        # MAC Homebrew no telemetry
export BAT_THEME="Sublime Snazzy"


## Default local development path
# ~/Development             - Global
# ~/Development/SDK         - SDK location
# ~/Development/Projects    - Source file and current src
DEVELOPMENT="$HOME/Development"
DEVELOPMENT_SDK="$DEVELOPMENT/SDK"
DEVELOPMENT_PROJECTS="$DEVELOPMENT/Projects"

if [ ! -d "$DEVELOPMENT"  ]; then
  mkdir -p "$DEVELOPMENT_SDK"
  mkdir -p "$DEVELOPMENT_PROJECTS"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH for go binaries
if [ -d "/usr/local/go" ] ; then
  PATH="/usr/local/go/bin:$PATH"
  GOROOT="/usr/local/go"
  GOPATH="$HOME/go"
fi

if [ -d "$HOME/go" ] ; then
  PATH="$HOME/go/bin:$PATH"
fi

# fnm
if [ -d "$HOME/.fnm" ] ; then
  PATH=$HOME/.fnm:$PATH
  eval "`fnm env`"
fi

# android studio & sdk
if [ -d "$DEVELOPMENT_SDK/android" ] ; then
  export ANDROID_HOME="$DEVELOPMENT_SDK/android"
  export ANDROID_SDK_ROOT="$DEVELOPMENT_SDK/android"
fi

if [ -d "$DEVELOPMENT/android-studio" ] ; then
  export JAVA_HOME="$DEVELOPMENT/android-studio/jre"
  PATH="$DEVELOPMENT/android-studio/bin:$PATH"
  PATH="$DEVELOPMENT/android-studio/jre/bin:$PATH"
fi

if [ -d "$HOME/.npm-global" ] ; then
  PATH=$HOME/.npm-global/bin:$PATH
fi

# flutter
if [ -d "$DEVELOPMENT_SDK/flutter" ] ; then
  PATH="$DEVELOPMENT_SDK/flutter/bin:$PATH"
  PATH="$DEVELOPMENT_SDK/flutter/bin/cache/dart-sdk/bin:$PATH"
fi

if [ -d "/opt/homebrew" ] ; then
  eval $(/usr/local/bin/brew shellenv)
fi
