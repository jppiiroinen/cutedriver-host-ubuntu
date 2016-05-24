TEMPLATE = subdirs
SUBDIRS = helloworld-qml helloworld-widgets

QMAKE_EXTRA_TARGETS += check
check.depends = helloworld-qml helloworld-widgets
check.commands = ./run-tests

