# List available recipes
default:
    @just --list

# Check if required tools are installed
[group('setup')]
check-env:
    @git --version || (echo "Git is required but not installed."; exit 1)
    @uv --version || (echo "uv is required but not installed."; exit 1)
    @pnpm --version || (echo "pnpm is required but not installed."; exit 1)
    @node --version || (echo "Node.js is required but not installed."; exit 1)
    @echo "All required tools are available."

# Install project dependencies
[group('install')]
install: check-env install-pre-commit install-tailwind

[group('install')]
install-pre-commit:
    @uvx pre-commit install --install-hooks

[group('install')]
install-tailwind:
    @pnpm install tailwindcss @tailwindcss/cli

# Update tools and dependencies
[group('update')]
update: update-pre-commit update-tailwind

[group('update')]
update-pre-commit:
    @uv run pre-commit autoupdate

[group('update')]
update-tailwind:
    @pnpm update tailwindcss @tailwindcss/cli

# Format code
[group('format')]
fmt:
    @echo "TODO"

# Lint code
[group('lint')]
lint:
    @echo "TODO"

# Start dev server
[group('dev')]
dev:
    @pnpx @tailwindcss/cli -i ./src/css/input.css -o ./src/css/output.css
    @uv run python -m http.server --directory ./src

[group('dev')]
tailwind-watch:
    @pnpx @tailwindcss/cli -i ./src/css/input.css -o ./src/css/output.css --watch

# Build production assets
[group('build')]
build:
    @echo "TODO"

# Deploy to github pages
[group('deploy')]
deploy:
    @echo "TODO"
