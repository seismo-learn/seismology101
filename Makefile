EXECUTE ?=
BUILD_CMD = jupyter-book build --site --strict --ci $(EXECUTE)

.PHONY: build html site clean

build html site:
	$(BUILD_CMD)

clean:
	jupyter-book clean --all -y
