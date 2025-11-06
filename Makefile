.PHONY: help setup install lint lint-fix format-check format-fix prettier-check prettier-write typecheck build clean check-circular-deps checks dev serve

help:
	@echo "Available targets:"
	@echo "  setup              - Setup Git LFS (run after cloning the repo)"
	@echo "  install            - Install dependencies"
	@echo "  lint               - Run ESLint"
	@echo "  lint-fix           - Run ESLint with auto-fix"
	@echo "  format-check       - Check formatting with Prettier (src/**)"
	@echo "  format-fix         - Fix formatting with Prettier (src/**)"
	@echo "  prettier-check     - Check formatting with Prettier (supports FILES=...)"
	@echo "  prettier-write     - Fix formatting with Prettier (supports FILES=...)"
	@echo "  typecheck          - Run TypeScript type checking"
	@echo "  check-circular-deps - Check for circular dependencies"
	@echo "  build              - Build the project"
	@echo "  checks             - Run all checks (lint, format, typecheck, circular deps)"
	@echo "  dev                - Start development server"
	@echo "  serve              - Serve the built project"
	@echo "  clean              - Clean build artifacts"

# Setup Git LFS to pull large files (mp4, webm, svg)
# Run this after cloning the repository for the first time
setup:
	git lfs install
	git lfs pull
	git lfs checkout

install:
	npm ci

lint:
	npm run lint

lint-fix:
	npm run lint:fix

format-check:
	npm run format:check

format-fix:
	npm run format:fix

# Check formatting with Prettier (use FILES=path/to/file to specify targets)
# Example: make prettier-check FILES="src/components/**"
prettier-check:
	npx prettier --check $(if $(FILES),$(FILES),.)

# Fix formatting with Prettier (use FILES=path/to/file to specify targets)
# Example: make prettier-write FILES="src/components/**"
prettier-write:
	npx prettier --write $(if $(FILES),$(FILES),.)

typecheck:
	npm run typecheck

check-circular-deps:
	npx madge --circular . --extensions ts,js,jsx,tsx

build:
	npm run build

clean:
	npm run clear

checks: lint format-check typecheck check-circular-deps

dev:
	npm run dev

serve:
	npm run serve
