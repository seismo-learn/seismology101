EXECUTE ?=
BUILD_CMD = jupyter-book build --site --strict --ci $(EXECUTE)

.PHONY: build html site build-execute clean

build html site:
	$(BUILD_CMD)

build-execute:
	jupyter-book build --site --strict --ci --execute

clean:
	jupyter-book clean --all -y
