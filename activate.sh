#!/usr/bin/env zsh
. ~/.vcpkg/vcpkg-init
vcpkg-shell activate
armlm activate -product KEMDK-COM0 -server https://mdk-preview.keil.arm.com

if [[ "${ZSH_EVAL_CONTEXT}" != *:file* ]]; then
    echo "Error: this script must be sourced. Run: source activate.sh"
    exit 1
fi

echo "NOTE: Use 'vcpkg-shell deactivate' to deactivate"
