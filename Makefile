JEKYLL_VERSION = 3.5
DOCKER_EXEC = docker run --rm --volume="${PWD}:/srv/jekyll" -it jekyll/minimal:${JEKYLL_VERSION}

build:
	$(DOCKER_EXEC) jekyll build

build-watch:
	$(DOCKER_EXEC) jekyll build --watch

serve:
	$(DOCKER_EXEC) jekyll serve -w

.PHONY: build build-watch serve
