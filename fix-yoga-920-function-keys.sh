#!/bin/bash
IDEAPAD_HACKS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IDEAPAD_HACKS_PATH=${IDEAPAD_HACKS_DIR}/ideapad-hacks.ko

sudo rmmod ideapad-hacks.ko

pushd ${IDEAPAD_HACKS_DIR}
echo "Fixing Yga 920 function keys"
echo "IDEAPAD_HACKS_PATH: ${IDEAPAD_HACKS_PATH}"
make clean
make

echo "IDEAPAD_HACKS_PATH: ${IDEAPAD_HACKS_PATH}"
sudo insmod ${IDEAPAD_HACKS_PATH}
device_path=$(find /sys -name fn_lock)
sudo echo 0 > ${device_path}

popd
