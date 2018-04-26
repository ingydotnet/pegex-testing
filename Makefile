export PATH := node_modules/.bin:$(PATH)

repos := pegex-js pegex-pm
prereqs := $(repos) node_modules

default:
	@echo 'Try `make test`'

.PHONY: test
test: $(prereqs)
	./test.sh tests

$(repos):
	git clone --depth=1 -b testml-wip git@github.com:ingydotnet/$@

node_modules:
	mkdir -p $@
	npm install coffeescript

clean:
	rm -fr $(prereqs)
	rm package-lock.json
