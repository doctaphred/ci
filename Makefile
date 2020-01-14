# Default action: run pytest and flake8.
default: test lint

test: venv
	venv/bin/pytest

lint: venv
	venv/bin/flake8 *.py src tests

# Create a virtualenv with all requirements installed.
venv:
	python3 -m venv venv
	venv/bin/python --version
	venv/bin/python -m pip install pip==19.3.1
	venv/bin/python -m pip install -r requirements/dev.txt
	venv/bin/python -m pip install -e .

clean:
	-rm -r venv

pin-requirements: venv
	venv/bin/pip-compile requirements/dev.in
	venv/bin/pip-compile requirements/build.in
	venv/bin/pip-compile requirements/main.in
