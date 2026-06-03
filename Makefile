.PHONY: install dev test lint format clean

install:
	pip install -e .

dev:
	pip install -e .
	pip install -r requirements-dev.txt

test:
	pytest

lint:
	ruff check src tests

format:
	black src tests
	ruff check --fix src tests

clean:
	find . -type d -name "__pycache__" -prune -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -prune -exec rm -rf {} +
