.PHONY: all get clean analyze test build-runner watch format lint run run-linux run-chrome help install-hooks check

all: clean get build-runner analyze test

## pub get
get: ## Run flutter pub get
	flutter pub get

clean: ## Clean the project
	flutter clean

analyze: ## Run static analysis
	flutter analyze

test: ## Run unit and widget tests
	flutter test

build-runner: ## Run build_runner for code generation
	dart run build_runner build --delete-conflicting-outputs

watch: ## Watch build_runner for code generation
	dart run build_runner watch --delete-conflicting-outputs

format: ## Format code
	dart format .

lint: analyze ## Run linter and check formatting
	dart format . --set-exit-if-changed

run: ## Run the app (defaults to your current device)
	flutter run

run-linux: ## Run the app on Linux
	flutter run -d linux

run-chrome: ## Run the app on Chrome
	flutter run -d chrome

build-android: build-apk build-aab ## Build all Android artifacts (APK & AAB)

build-apk: ## Build Android Release APK
	flutter build apk --release

build-aab: ## Build Android Release App Bundle (AAB)
	flutter build appbundle --release

build-windows: ## Build Windows Release
	flutter build windows --release

install-hooks: ## Install pre-commit hooks
	chmod +x scripts/setup-hooks.sh
	./scripts/setup-hooks.sh

check: install-hooks ## Run all local security & quality checks
	@echo "🛡️  Running Pre-commit checks manually..."
	@./.git/hooks/pre-commit

help: ## Display this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
