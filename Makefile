.PHONY: format
format:
	isort .
	black src/ test/

.PHONY: check-format
check-format:
	isort . --check-only --diff
	black src/ test/ --check --diff

.PHONY: lint
lint:
	flake8 src/ test/
	mypy

.PHONY: test
test:
	pytest

.PHONY: ci
ci:
	make check-format
	make lint
	make test
