all: build start

build:
	cabal build

start: stop
	PORT=5000 ./dist/build/hello-scotty/hello-scotty &

stop:
	pgrep hello-scotty
	for i in `pgrep hello-scotty`; do echo ">$i<"; kill -9 $i; done

.PHONY: build run stop
