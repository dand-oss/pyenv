#!/usr/bin/env bash

# fail on error
set -e
set -o pipefail

# install packages
declare -ar pippkgs=(
    # b3
    'region-profiler'
    'docopt'
    'twine'
    'python-gitlab'
    'pyartifactory'

    # building ports
    'wheel'  # bdist_wheel
    'pypandoc' # docs
    'cython<3.0' # cpp
    'pybind11' # cpp

    # ports that need other ports
    # pandas needs numpy...
    # pip latest 'prerelease' trick
    'numpy>=0.0.0.dev'
    'scipy'  # scikit-learn needs

    # dev
    'pyyaml'
    'dataclassy'
    'docker'
    'dockerpty'
    'mashuhelpa'
    'typer'
    'networkx'
    'pygraphviz'  # built this
    'datetime'

    # building asi
    'pypreprocessor' # cpp build
    'pyrsistent' # generate
    'freeze_attributes'
    'pandas' # pickle
    'sklearn' # pickle
    'sqlalchemy<1.4'  # 1.4 missing clsregistry
    'graphql-core'

    # run tao2 prod
    'aldjemy'
    'alembic'
    'ariadne'
    'bjoern'
    'cachetools'
    'configparser'
    'dateparser'
    'deal'
    'deepdiff'
    'Django==3.1.5'
    'django-computedfields'
    'django-cors-headers'
    'firebirdsqla'
    'itsdangerous'
    'kaleido'
    'msgpack'
    'plotly'
    'psycopg2cffi'
    'py2graphql'
    'pycryptodome'
    'pyeasyga'
    'pyjwt'
    'pypika'
    'pyrsistent'
    'region_profiler'
    'requests'
    'returns'
    'rdp'
    'rpyc'
    'sismic'
    'sqlalchemy-cockroachdb'
    'timeout_decorator'
    'whitenoise'
    'XlsxWriter'
    'similaritymeasures'
    'tqdm'  # TODO: move to dev_list after fix ga_model_calibration import
    'pandas'
    'sklearn'

    # dev
    'docopt'
    'vmprof'
    'vmprof-flamegraph'
    'flake8'
    'pep8'
    'pycodestyle'
    'pylint'
    'pytest'
    'pytest-regressions'
    'pytest-xdist'
    'pytypes'
    'ipdb'
    'pyeasyga'
    'argon2-cffi'  # notebook dep
    'notebook'
    'matplotlib<3.4'  # seaborn dep - 3.4.x wheel fails to build
    'seaborn'

    # pypy
)

# crank on the packages
pip install --pre ${pippkgs[@]}

# setup of for precommit
# ${ASI}/bin/intstall-pre-commit
