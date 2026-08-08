# Rcode Makefile
# Provides convenient commands for building, testing, and running Rcode

LUAJIT = luajit
SRC_DIR = src
MAIN_FILE = $(SRC_DIR)/rcode.lua

.PHONY: help run edit parse check manifest repl test clean

help:
	@echo "Rcode - The Ultimate IDE for LC-lang"
	@echo ""
	@echo "Available commands:"
	@echo "  make run FILE=file.lc    - Run an LC-lang file"
	@echo "  make edit FILE=file.lc   - Edit an LC-lang file"
	@echo "  make parse FILE=file.lc  - Parse and show AST"
	@echo "  make check FILE=file.lc  - Validate an LC-lang file"
	@echo "  make manifest FILE=file.lc - Generate manifest"
	@echo "  make repl               - Start interactive REPL"
	@echo "  make test               - Run test suite"
	@echo "  make clean              - Clean temporary files"
	@echo ""
	@echo "Examples:"
	@echo "  make run FILE=examples/hello_world.lc"
	@echo "  make edit FILE=examples/basics.lc"

run:
	$(LUAJIT) $(MAIN_FILE) run $(FILE)

edit:
	$(LUAJIT) $(MAIN_FILE) edit $(FILE)

parse:
	$(LUAJIT) $(MAIN_FILE) parse $(FILE)

check:
	$(LUAJIT) $(MAIN_FILE) check $(FILE)

manifest:
	$(LUAJIT) $(MAIN_FILE) manifest $(FILE)

repl:
	$(LUAJIT) $(MAIN_FILE) repl

test:
	$(LUAJIT) tests/test_rcode.lua

clean:
	rm -f rcode_config.lua
	rm -f *.tmp
	rm -f *.bak

# Default target
.PHONY: default
default: help
