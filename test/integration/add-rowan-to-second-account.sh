#!/bin/bash

amount=$1

set -x

BASEDIR=$(pwd)
PASSWORD=$(yq r network-definition.yml "(*==$MONIKER).password")
ADDR=$(yq r network-definition.yml "(*==$MONIKER).address")

yes $PASSWORD | sifnodecli tx send $ADDR $(yes $PASSWORD | sifnodecli keys show user1 -a) "${amount}rowan" -y

