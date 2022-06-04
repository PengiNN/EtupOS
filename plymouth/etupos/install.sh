#!/bin/bash
if [ `whoami` != 'root' ]; then
  echo "管理者権限で実行してください"
  exit
fi

sudo cp -r ./ /usr/share/plymouth/themes/
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/etupos/etupos.plymouth 10
echo "/usr/share/plymouth/themes/etupos/etupos.plymouthを選択してください"
sudo update-alternatives --config default.plymouth
sudo update-initramfs -u -k all
sudo update-grub
echo "処理は終了しました。再起動して下さい。"