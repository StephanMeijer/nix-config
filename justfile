# Nix home-manager configuration tasks

# List available recipes
default:
    @just --list

# Format all Nix files
fmt:
    nixfmt *.nix

# Check formatting without modifying
fmt-check:
    nixfmt --check *.nix

# Lint with statix (anti-pattern detection)
lint-statix:
    statix check .

# Lint with deadnix (unused code detection)
lint-deadnix:
    deadnix --fail *.nix

# Run all linters
lint: lint-statix lint-deadnix

# Scan for secrets
secrets:
    gitleaks detect --source . --verbose --no-git

# Apply home-manager configuration
switch:
    home-manager switch --flake .

# Run all checks (format + lint + secrets)
check: fmt-check lint secrets
