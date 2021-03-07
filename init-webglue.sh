#!/usr/bin/env bash

# fail on error
set -e
set -o pipefail

# install packages
declare -ar pippkgs=(
    # enough to run dev to build ports on windows
    'attrs'
    'networkx'
    'region-profiler'
    'typer'
    'wheel'  # bdist_wheel
    'typer'
    'python-gitlab'
    'python-on-whales'
    'pyyaml'
    'cryptography'  # twine
    'twine'
    'twine'
    'dynawheel'   # ours
    'freeze_attributes'   # ours
    # build sys
    'datetime'
    'pyrsistent'  # generate graphql
    'pcpp' # f2ctran
    'docopt' # pythonnet pGuru
    'numpy'  # boost!
)

# 64 bit only wheels
declare -ar pippkgs64=(
    'pandas'
    'scipy'
    'scikit-criteria'
)

# report the python
which python
python --version

# crank on the packages
apip install ${pippkgs[@]}
if [ "${abits}" == '64' ] ; then
    apip install ${pippkgs64[@]}
fi

# setup for precommit
# ${ASI}/bin/intstall-pre-commit

python -m pip install --upgrade pip
