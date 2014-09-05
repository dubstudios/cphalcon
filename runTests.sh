#!/bin/sh

ZEND_DONT_UNLOAD_MODULES=1 $(phpenv which php) ./unit-tests/ci/phpunit.php --debug -c unit-tests/phpunit.xml --testsuite=stable

if [ "$(php -r 'echo substr(PHP_VERSION, 0, 3);')" = "5.3" ];
then
   $(phpenv which php) codecept53.phar build
   ZEND_DONT_UNLOAD_MODULES=1 $(phpenv which php) codecept53.phar run
else
   $(phpenv which php) codecept.phar build
   ZEND_DONT_UNLOAD_MODULES=1 $(phpenv which php) codecept.phar run
fi