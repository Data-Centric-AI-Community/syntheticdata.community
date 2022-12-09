
.PHONY: help start install

help:	# The following lines will print the available commands when entering just 'make'
ifeq ($(UNAME), Linux)
	@grep -P '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
else
	@awk -F ':.*###' '$$0 ~ FS {printf "%15s%s\n", $$1 ":", $$2}' \
		$(MAKEFILE_LIST) | grep -v '@awk'
endif

start:		### Start Server
	bundle exec jekyll serve

start-dev:  ### Start Server Dev
	bundle exec jekyll serve --open-url --livereload

install:	### Install ruby dependencies
	bundle install
	npm install -g sass
	npm install -g node-sass

build:		### Build necessary files
	sass ./sass/main.scss > ./css/main.css

watch:		### Watch sass
	node-sass --watch ./sass/main.scss ./css/main.css