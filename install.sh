git clone https://github.com/senchpimy/dotfiles
mv dotfiles/.zshrc .
mv dotfiles/.starship.toml .
curl -sS https://starship.rs/install.sh | sh
source .zshrc
