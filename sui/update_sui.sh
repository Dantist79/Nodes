#!/bin/bash
echo "-----------------------------------------------------------------------------"
curl -s https://raw.githubusercontent.com/razumv/helpers/main/doubletop.sh | bash
echo "-----------------------------------------------------------------------------"

echo "-----------------------------------------------------------------------------"
echo "Выполняем обновление"
echo "-----------------------------------------------------------------------------"
sudo systemctl stop sui
cd $HOME/sui
git fetch upstream
git checkout -B devnet --track upstream/devnet
echo "-----------------------------------------------------------------------------"
echo "Устанавливаем обновление"
echo "-----------------------------------------------------------------------------"
cargo build --release -p sui-node
sudo mv ~/sui/target/release/sui-node /usr/local/bin/
sudo systemctl restart sui
echo "-----------------------------------------------------------------------------"
echo "Обновление завершено"
echo "-----------------------------------------------------------------------------"
