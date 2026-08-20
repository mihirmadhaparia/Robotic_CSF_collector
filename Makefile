.PHONY: install test lint sim
install: ; pip install -e .[dev]
test:    ; pytest -q
lint:    ; ruff check src programs scripts tests
sim:     ; python scripts/run_sim.py
