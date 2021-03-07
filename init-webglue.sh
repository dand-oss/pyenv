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
    'dynawheel'   # ours
    'freeze_attributes'   # ours
    # build sys
    'datetime'
    'pyrsistent'  # generate graphql
    'pypreprocessor' # ours, mod from pypi - fortran
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

if [ x"$(expr substr $(uname -s) 1 5)" = x'Linux' ]; then
    # linux - just use the python one
    python ${ASV_SCRIPTS}/install-venv-req.py install
else
    # windows

    # crank on the packages
    pip install --pre ${pippkgs[@]}
    if [ "${abits}" == '64' ] ; then
        pip install --pre ${pippkgs64[@]}
    fi

    # setup for precommit
    # ${ASI}/bin/intstall-pre-commit
fi

python -m install pip --upgrade
