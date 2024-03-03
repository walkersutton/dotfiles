# dotfiles and mac config

## [Homebrew](https://brew.sh/)

### Update Brewfile
`brew bundle dump --force`

## Mac config

### Remove Dock Animation and Delay
`defaults write com.apple.Dock autohide-delay -float 0 && killall Dock`
`defaults write com.apple.dock autohide-time-modifier -int 0 && killall Dock`

### SSH Keys

#### Verify GitHub commits by default
*[SSH signing is only available with git>=2.34](https://stackoverflow.com/a/74887438) => `brew install git`*

`git config --global commit.gpgsign true`
`git config --global gpg.format ssh`
`git config --global user.signingkey ~/.ssh/<>.pub`


[old?: configuration reference](https://www.atlassian.com/git/tutorials/dotfiles)
<!--
Look at @durdn's README and add setup instructions
https://bitbucket.org/durdn/cfg/src/master/
-->
