Build Homebrew Bottle for OFTR
==============================

This repository builds the Homebrew bottles for oftr.

Mac OS
------

To build the Homebrew bottle for Mac OS:

- Update the source url and sha256 values in the `oftr.rb` file. Commit and push the changes.

- Tag the homebrew-oftr repository, and let Travis-ci do the rest::

    git tag 0.x.y
    git push origin 0.x.y

- After Travis-ci deploys the bottle, update the `bottle do` section in `oftr.rb`. Commit and push the changes.
