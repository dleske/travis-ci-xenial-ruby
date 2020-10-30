# Travis CI image for testing one Puppet module

Replicate the Travis CI experience, because that experience takes bloody ages
and I have no idea what I'm doing.

> **Note** and note well.  This is for reference only, I have made no effort
> to make any of this generic or portable.

This follows, more or less, the sequence of commands in a failed CI run.
Instead of cloning inside the image, however, I'm cloning outside and then
using that as the work directory, so I can tweak and test.

1. Clone the git repository
    ```
    $ git clone --depth=50 --branch=testing https://github.com/dleske/puppet-etckeeper.git build
    ```
2. Start the container
    ```
    $ docker run -it -u travis -v $PWD/build:/home/travis/build -w /home/travis/build dleskecc/travis
    ```
3. In the container, issue some commands from the Travis run:
    ```
    $ rvm use 2.4.3 --install --binary --fuzzy
    ...
    $ export PUPPET_GEM_VERSION="~> 5.5.0"
    $ export BUNDLE_GEMFILE=$PWD/Gemfile
    $ bundle install --without development --path=${BUNDLE_PATH:-vendor/bundle}
    ...
    ```
4. Now run the test:
    ```
    $ bundle exec rake test 2>&1 | tee test.log-$(date +%s)
    ```
