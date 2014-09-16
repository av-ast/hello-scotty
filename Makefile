all: build start

build:
	cabal build

start: stop
	PORT=5000 ./dist/build/hello-scotty/hello-scotty &

stop:
	for p in `pgrep hello` ; do kill -9 $$p ; done

.PHONY: build run stop
