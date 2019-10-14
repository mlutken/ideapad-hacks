#!/bin/bash
IDEAPAD_HACKS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IDEAPAD_HACKS_PATH=${IDEAPAD_HACKS_DIR}/ideapad-hacks.ko

sudo rm -rf .tmp_versions/
sudo rmmod ideapad-hacks.ko

pushd ${IDEAPAD_HACKS_DIR}
echo "Fixing Yga 920 function keys"
echo "IDEAPAD_HACKS_PATH: ${IDEAPAD_HACKS_PATH}"
sudo make clean
sudo make

echo "IDEAPAD_HACKS_PATH: ${IDEAPAD_HACKS_PATH}"
sudo insmod ${IDEAPAD_HACKS_PATH}
device_path=$(sudo find /sys -name fn_lock)
echo "device_path: ${device_path}"
sudo sh -c "echo '0' > ${device_path}"

popd


