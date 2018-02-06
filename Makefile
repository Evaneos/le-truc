JEKYLL_VERSION = 3.5
DOCKER_EXEC = docker run --rm --label=jekyll --volume="${PWD}:/srv/jekyll" -it -p 127.0.0.1:4000:4000 jekyll/minimal:${JEKYLL_VERSION}

build:
	$(DOCKER_EXEC) jekyll build

build-watch:
	$(DOCKER_EXEC) jekyll build --watch

serve:
	$(DOCKER_EXEC) jekyll serve -w

.PHONY: build build-watch serve
