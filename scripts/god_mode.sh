#!/bin/bash
# Usage: ./god_mode.sh <TARGET_ADDRESS>
TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Please provide a target address."
  exit 1
fi

echo "🚀 LAUNCHING 10 PARALLEL ATTACKERS on $TARGET..."

for i in {1..10}; do
  (while true; do 
    cast send --rpc-url http://127.0.0.1:8545 $TARGET "attack()" --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 > /dev/null 2>&1
  done) &
done

echo "🔥 GOD MODE ACTIVE. Run 'killall cast' to stop."
