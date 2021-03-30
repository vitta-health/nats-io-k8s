#!/bin/sh

[ -z "$NKEYS_PATH" ] && {
    export NKEYS_PATH=$(pwd)/nsc/nkeys
}

[ -z "$NSC_HOME" ] && {
    export NSC_HOME=$(pwd)/nsc/accounts
}

if [ ! -f .nsc.env ]; then
  echo '
# NSC Environment Setup
export NKEYS_PATH=$(pwd)/nsc/nkeys
export NSC_HOME=$(pwd)/nsc/accounts
' > .nsc.env
fi

mkdir -p "$NKEYS_PATH"
mkdir -p "$NSC_HOME"
nsc add operator --name KO

# Create system account
nsc add account --name SYS
nsc add user    --name sys


# Create a user account
nsc add account --name USER
nsc add user    --name user

# Create account for STAN purposes.
nsc add account --name STAN
nsc add user    --name stan
