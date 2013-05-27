![atoum](http://downloads.atoum.org/images/logo.png)

## atoum installer [![Build Status](https://secure.travis-ci.org/atoum/atoum-installer.png)](http://travis-ci.org/atoum/atoum-installer)

### Install atoum
```shell
$ curl https://raw.github.com/atoum/atoum-installer/master/installer | php -- --phar
$ php mageekguy.atoum.phar -h

# Enjoy unit testing !
```

### Usage
```shell
$ ./installer --usage
$ curl https://raw.github.com/atoum/atoum-installer/master/installer | php -- --usage
> atoum installer
> The modern, simple and intuitive PHP 5.3+ unit testing framework.
--global        : Install atoum as a global command
--phar          : Install atoum as a PHAR archive
--source        : Install atoum from sources (default)
--check         : Only run system requirements check

Environment :
ATOUM_GIT_URL   : Git repository (default : git://github.com/atoum/atoum.git)
ATOUM_PATH      : Installation directory (default : /usr/share)
ATOUM_SYMLINK   : atoum bin symlink path (default: /usr/local/bin)

Examples :
$ curl https://raw.github.com/atoum/atoum-installer/master/installer | php -- --phar
$ curl https://raw.github.com/atoum/atoum-installer/master/installer | sudo php -- --global
$ curl https://raw.github.com/atoum/atoum-installer/master/installer | ATOUM_PATH=/home/me php
```

### Hacking

The atoum installer is a simple PHP script handling all the process.
As a PHP developper, you will be able to easily edit it.

The script is tested with Behat and you will need to install some deps to get the tools :

```shell
$ curl -s https://getcomposer.org/installer | php
$ php composer.phar install --dev
```

Once your environment is ready, you will be able to launch tests with a single command :

```shell
$ vendor/bin/behat

# Or to launch a specific feature :

$ vendor/bin/behat features/the.feature
```
