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
    # build sys
    'datetime'
    'pyrsistent'  # generate graphql
)

declare -ar pipdirs=(
    'pypreprocessor'
    'dynawheel'
    'freeze_attributes'
)

# report the python
which python
python --version

if [ x"$(expr substr $(uname -s) 1 5)" = x'Linux' ]; then
    # linux - just use the python one
    python ${ASV_SCRIPTS}/install-venv-req.py py-default
else
    # windows

    # crank on the packages
    pip install --pre ${pippkgs[@]}

    # have to build some on windows
    for dir in "${pipdirs[@]}" ; do
        cd "${ASV}/ports/repo/${dir}"
        python setup.py install
    done

    # setup for precommit
    # ${ASI}/bin/intstall-pre-commit
fi
