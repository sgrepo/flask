.PHONY: clean-pyc ext-test test tox-test test-with-mem upload-docs docs audit

all: clean-pyc test

test:
	python run-tests.py

tox-test:
	tox

test-with-mem:
	RUN_FLASK_MEMORY_TESTS=1 python run-tests.py

audit:
	python setup.py audit

release:
	python scripts/make-release.py

ext-test:
	python tests/flaskext_test.py --browse

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

docs:
	$(MAKE) -C docs html
