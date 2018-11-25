# Install the latest ruby

VERSION=$(rbenv install -l | grep -v - | tail -1 | sed 's/^ *//;s/ *$//')
rbenv install $VERSION --skip-existing
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
rbenv global $VERSION
rbenv versions
