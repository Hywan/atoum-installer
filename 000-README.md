## atoum installer

### Usage
```shell
$ ./installer --usage
$ curl https://raw.github.com/gist/3934569/installer | php -- --usage
> atoum installer
> The modern, simple and intuitive PHP 5.3+ unit testing framework.
--global        : Install atoum as a global command
--phar          : Install atoum as a PHAR archive
--source        : Install atoum from sources (default)
--check         : Only run system requirements check

Environment :
ATOUM_GIT_URL   : Git repository (default : git://github.com/mageekguy/atoum.git)
ATOUM_PATH      : Installation directory (default : /usr/share)
ATOUM_SYMLINK   : atoum bin symlink path (default: /usr/local/bin)

Examples :
$ curl https://raw.github.com/gist/3934569/installer | php -- --phar
$ curl https://raw.github.com/gist/3934569/installer | sudo php -- --global
$ curl https://raw.github.com/gist/3934569/installer | ATOUM_PATH=/home/me php
```

### Example output
```shell
$ sudo ./installer --global
> atoum installer
> The modern, simple and intuitive PHP 5.3+ unit testing framework.
>> Checking requirements...
>>> Actual PHP version is 5.4.6-1ubuntu1
>>> XDebug extension is enabled
>>> XDebug version is 2.2.1
>>> You have required permissions
>> Installing sources...
>>> cd /usr/share/atoum && git pull origin master
From git://github.com/mageekguy/atoum
 * branch            master     -> FETCH_HEAD
Already up-to-date.
>>> ln -s /usr/share/atoum/bin/atoum /usr/local/bin/atoum
>> atoum sources path : /usr/share/atoum
>> atoum bin path : /usr/share/atoum/bin/atoum -> /usr/local/bin/atoum
>> atoum was successfully installed. Enjoy!

$ sudo ./installer --global --phar
> atoum installer
> The modern, simple and intuitive PHP 5.3+ unit testing framework.
>> Checking requirements...
>>> Actual PHP version is 5.4.6-1ubuntu1
>>> XDebug extension is enabled
>>> XDebug version is 2.2.1
>>> You have required permissions
>> Installing PHAR...
>>> ln -s /usr/share/atoum/atoum /usr/local/bin/atoum
>> atoum PHAR path : /usr/share/atoum/mageekguy.atoum.phar
>> atoum bin path : /usr/share/atoum/atoum -> /usr/local/bin/atoum
>> atoum was successfully installed. Enjoy!
```