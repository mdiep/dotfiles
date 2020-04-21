#!/usr/bin/env bash

DOTFILES=$(cd $(dirname $0); pwd)

set -e

if [ $SHELL != "/bin/zsh" ]; then
    echo "Change to zsh"
    open -g open /System/Library/PreferencePanes/Accounts.prefPane
    read
fi

if ! defaults read -app Safari &> /dev/null; then
    echo "Give Terminal.app Full Disk Access in System Preferences"
    open -g /System/Library/PreferencePanes/Security.prefPane
    tput bel
    exit 1
fi

if ! brew help &> /dev/null; then
    echo "Install Homebrew"
    open -g https://brew.sh
    read
fi

# DEFAULT
echo "Setting defaults:"

## GLOBAL
echo "  Global:"
echo "    Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
echo "    Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
echo "    Enable full keyboard access for all controls"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
echo "    3 fingers to swipe between pages"
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false
echo "    4 fingers to Mission Control"
defaults write com.apple.AppleMultitouchTrackpad -int 1
echo "    Tap-to-click on the trackpad"
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

## FINDER
echo "  Finder:"
echo "    Show status bar"
defaults write com.apple.finder ShowStatusBar -bool true
echo "    Default to Column View"
defaults write com.apple.finder FXPreferredViewStyle -string clmv

## IA WRITER
echo "  iA Writer:"
echo "    Use .md as the default extension"
defaults write -app "iA Writer" "Document Path Extension" -string "md"
echo "    80 characters per line"
defaults write -app "iA Writer" "Editor Line Length Limit" -int 80

## MACVIM
echo "  MacVim:"
echo "    Check for updates automatically"
defaults write -app MacVim SUEnableAutomaticChecks -bool true

## NETNEWSWIRE
echo "  NetNewsWire:"
echo "    Check for updates automatically"
defaults write -app NetNewsWire SUEnableAutomaticChecks -bool true
echo "    Refresh every 10 minutes"
defaults write -app NetNewsWire refreshInterval -int 2
echo "    Open links in the background"
defaults write -app NetNewsWire openInBrowserInBackground -bool true

## SAFARI
echo "  Safari:"
echo "    Don't auto-fill credit cards"
defaults write -app Safari AutoFillCreditCardData -bool false
echo "    Don't auto-fill passwords"
defaults write -app Safari AutoFillPasswords -bool false
echo "    Don't allow push notifications"
defaults write -app Safari CanPromptForPushNotifications -bool false
echo "    Show the full URL in the address bar"
defaults write -app Safari ShowFullURLInSmartSearchField -bool true
echo "    Enable the Develop menu"
defaults write -app Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write -app Safari WebKitPreferences.developerExtrasEnabled -bool true
echo "    Search with DuckDuckGo"
defaults write -app Safari SearchProviderIdentifier -string com.duckduckgo
echo "    Show icons in tabs"
defaults write -app Safari ShowIconsInTabs -bool true
echo "    Show status bar"
defaults write -app Safari ShowOverlayStatusBar -bool true

## TERMINAL
echo "  Terminal:"
echo "    Close window if shell exits cleanly"
defaults write -app Terminal shellExitAction -int 1

## XCODE
echo "  Xcode:"
echo "    Don't show welcome window"
defaults write com.apple.dt.Xcode XCShowWelcomeWindow -bool false
echo "    Don't enclose selection in matching delimiters"
defaults write com.apple.dt.Xcode DVTTextAutoEncloseSelectionInDelimiters -bool false
echo "    Don't suggest completions while typing"
defaults write com.apple.dt.Xcode DVTTextAutoSuggestCompletions -bool false
echo "    Show code folding ribbon"
defaults write com.apple.dt.Xcode DVTTextShowFoldingSidebar -bool true
echo "    Show page guide at 100 characters"
defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 100
defaults write com.apple.dt.Xcode DVTTextShowPageGuide -bool true
echo "    Trim whitespace-only lines"
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool true
echo "    Use mdiep theme"
defaults write com.apple.dt.Xcode XCFontAndColorCurrentTheme -string "mdiep.xccolortheme"

# DOTFILES
echo "Installing dotfiles:"
echo "  .ghci"
ln -Ffs $DOTFILES/ghci ~/.ghci
echo "  .gitconfig"
ln -Ffs $DOTFILES/gitconfig ~/.gitconfig
echo "  .gitignore"
ln -Ffs $DOTFILES/gitignore ~/.gitignore
echo "  .vim"
ln -hFfs $DOTFILES/vim ~/.vim
echo "  .vimrc"
ln -Ffs $DOTFILES/vimrc ~/.vimrc
echo "  .zshenv"
ln -Ffs $DOTFILES/zshenv ~/.zshenv
echo "  .zshrc"
ln -Ffs $DOTFILES/zshrc ~/.zshrc

# XCODE
echo "Installing Xcode theme"
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
ln -Ffs $DOTFILES/xcode/mdiep.xccolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/mdiep.xccolortheme

# BIN
echo "Creating ~/bin:"
mkdir -p ~/bin
echo "  mvim"
ln -Ffs /Applications/MacVim.app/Contents/bin/mvim ~/bin/mvim

# HOMEBREW
echo "Installing Homebrew dependencies:"
echo "  ag"
brew install the_silver_searcher &>/dev/null
echo "  elm"
brew install elm &>/dev/null
echo "  elm-format"
brew install elm-format &>/dev/null
echo "  fzf"
brew install fzf &>/dev/null
echo "  node"
brew install node &>/dev/null
echo "  thefuck"
brew install thefuck &>/dev/null
echo "  tree"
brew install tree &>/dev/null

# TASKS
echo "Remaining Tasks:"
echo "  Install Operator font"
read

