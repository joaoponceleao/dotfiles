# PATHS
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/opt/X11/bin:/usr/texbin:$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.nodebrew/current/bin:/usr/local/opt/go/libexec/bin:$HOME/.go/bin"
export PATH="/usr/local/opt/ruby/bin:$PATH"
# export PATH="/usr/local/opt/gdal2/bin:$PATH"
# export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH" # issues with conda getenv and pyenv
export PATH="/Library/TeX/texbin:$PATH"
# export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PRO_BASE="$HOME/Dev"

# GRASS
export GRASS_VER="7.4"
export GRASSMAC="/Applications/GRASS-7.4.4.app"
export GISBASE="$GRASSMAC/Contents/Resources"

# export PYTHONPATH="${PYTHONPATH}:$GISBASE/etc/python/"
# export PYTHONPATH="$GISBASE/etc/python/"
export LD_LIBRARY_PATH="/usr/local/lib:$GISBASE/lib"
export GISBASE_USER="$HOME/Library/GRASS/$GRASS_VER"
export GISBASE_SYSTEM="/Library/GRASS/$GRASS_VER"
export GRASS_ADDON_ETC="$GISBASE_USER/Modules/etc:$GISBASE_SYSTEM/Modules/etc"
export GDAL_DATA="/usr/local/opt/gdal/share/gdal"
# export GDAL_DATA_GRASS="$GISBASE/share/gdal"
# export GDAL_DATA="$GDAL_DATA_BREW:$GDAL_DATA_GRASS"
# export GDAL_DATA="$GDAL_DATA_GRASS"
export GRASS_PYTHON="$GISBASE/bin/python"
export GRASS_PYTHONWX="$GISBASE/bin/pythonw"
export GIS_LOCK=$$
export GISRC="$HOME/.grass7"
export GRASSBIN="$GISBASE/bin/grass74"

# EXTRA PATHS
export GOPATH="$HOME/.go"
export MANPATH="/usr/local/{man,Cellar}:/usr/local/share/man:/usr/share/man:/usr/X11/share/man:$MANPATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/opt/findutils/libexec/gnuman:$MANPATH"
export INFOPATH="/usr/local/share/info:/usr/share/info:$INFOPATH"
export GEOS_CONFIG="/usr/local/opt/geos/bin/geos-config"
export GDAL_DRIVER_PATH="/usr/local/lib/gdalplugins"
export OSG_LIBRARY_PATH="/usr/local/lib/osgPlugins-3.5.5"

# export PGHOST=localhost  # Postgres - use localhost by default
export PROJECT_HOME="$HOME/Dev"  # Virtualenv & Virtualenvwrapper
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_BREWFILE=~/.brewfile

# Env Vars
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export ARCHFLAGS="-arch x86_64"
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export TERM="xterm-256color"
export GREP_OPTIONS="--color=auto"
export BROWSER="open"

export BYOBU_PREFIX=/usr/local
# export BERKELEYDB_DIR=$(brew --cellar)/berkeley-db/6.2.23
# export YES_I_HAVE_THE_RIGHT_TO_USE_THIS_BERKELEY_DB_VERSION=yes
export ARCHFLAGS="-arch x86_64"
export PYTHON_CONFIGURE_OPTS="--enable-shared"
export PYENV_ROOT="$HOME/.pyenv"
GTK_THEME="Adwaita:dark"

# Dev Vars
export MACHINE="local"
export DJANGO_SETTINGS_MODULE="settings.dev" # can be 'dev', 'test', 'stage', 'production'
export NODE_ENV="development" # can 'development', 'production', 'staging'
export DJANGO_PORT="8000"
export API_ROOT="/apiv1/"

source "$HOME/.env_keys"
