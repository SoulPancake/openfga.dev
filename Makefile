.PHONY: help install lint lint-fix format-check format-fix typecheck build clean check-circular-deps checks dev serve

help:
	@echo "Available targets:"
	@echo "  install            - Install dependencies"
	@echo "  lint               - Run ESLint"
	@echo "  lint-fix           - Run ESLint with auto-fix"
	@echo "  format-check       - Check formatting with Prettier"
	@echo "  format-fix         - Fix formatting with Prettier"
	@echo "  typecheck          - Run TypeScript type checking"
	@echo "  check-circular-deps - Check for circular dependencies"
	@echo "  build              - Build the project"
	@echo "  checks             - Run all checks (lint, format, typecheck, circular deps)"
	@echo "  dev                - Start development server"
	@echo "  serve              - Serve the built project"
	@echo "  clean              - Clean build artifacts"

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
