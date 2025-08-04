# EV Adoption Forecasting Project Makefile
# This Makefile helps you set up and manage the virtual environment for the project

# Variables
VENV_NAME = ev-venv
PYTHON = python
PIP = $(VENV_NAME)/Scripts/pip
PYTHON_VENV = $(VENV_NAME)/Scripts/python
STREAMLIT = $(VENV_NAME)/Scripts/streamlit
JUPYTER = $(VENV_NAME)/Scripts/jupyter

# Default target
.PHONY: help
help:
	@echo "EV Adoption Forecasting Project Setup"
	@echo "====================================="
	@echo ""
	@echo "Available commands:"
	@echo "  make setup          - Create virtual environment and install dependencies"
	@echo "  make install        - Install/update dependencies"
	@echo "  make clean          - Remove virtual environment"
	@echo "  make run-app        - Run the Streamlit application"
	@echo "  make run-notebook   - Start Jupyter notebook server"
	@echo "  make test-env       - Test if environment is working properly"
	@echo "  make freeze         - Update requirements.txt with current packages"
	@echo "  make activate       - Show command to activate virtual environment"
	@echo "  make status         - Show environment status"
	@echo ""

# Create virtual environment and install dependencies
.PHONY: setup
setup: create-venv install
	@echo "Setup complete! Environment '$(VENV_NAME)' is ready."
	@echo "To activate: $(VENV_NAME)\Scripts\activate"

# Create virtual environment
.PHONY: create-venv
create-venv:
	@echo "Creating virtual environment '$(VENV_NAME)'..."
	@if not exist "$(VENV_NAME)" ( \
		$(PYTHON) -m venv $(VENV_NAME) && \
		echo "Virtual environment created successfully." \
	) else ( \
		echo "Virtual environment '$(VENV_NAME)' already exists." \
	)

# Install dependencies
.PHONY: install
install: create-venv
	@echo "Installing dependencies..."
	@$(PIP) install --upgrade pip
	@$(PIP) install -r requirements.txt
	@echo "Dependencies installed successfully."

# Clean up virtual environment
.PHONY: clean
clean:
	@echo "Removing virtual environment '$(VENV_NAME)'..."
	@if exist "$(VENV_NAME)" ( \
		rmdir /s /q "$(VENV_NAME)" && \
		echo "Virtual environment removed successfully." \
	) else ( \
		echo "Virtual environment '$(VENV_NAME)' does not exist." \
	)

# Run Streamlit application
.PHONY: run-app
run-app:
	@echo "Starting Streamlit application..."
	@if exist "$(STREAMLIT)" ( \
		$(STREAMLIT) run app.py \
	) else ( \
		echo "Streamlit not found. Please run 'make install' first." \
	)

# Start Jupyter notebook
.PHONY: run-notebook
run-notebook:
	@echo "Starting Jupyter notebook server..."
	@if exist "$(JUPYTER)" ( \
		$(JUPYTER) notebook \
	) else ( \
		echo "Jupyter not found. Please run 'make install' first." \
	)

# Test environment
.PHONY: test-env
test-env:
	@echo "Testing virtual environment..."
	@if exist "$(PYTHON_VENV)" ( \
		echo "Python version:" && \
		$(PYTHON_VENV) --version && \
		echo "Installed packages:" && \
		$(PIP) list && \
		echo "Environment test completed successfully." \
	) else ( \
		echo "Virtual environment not found. Please run 'make setup' first." \
	)

# Update requirements.txt
.PHONY: freeze
freeze:
	@echo "Updating requirements.txt..."
	@if exist "$(PIP)" ( \
		$(PIP) freeze > requirements.txt && \
		echo "requirements.txt updated successfully." \
	) else ( \
		echo "Virtual environment not found. Please run 'make setup' first." \
	)

# Show activation command
.PHONY: activate
activate:
	@echo "To activate the virtual environment, run:"
	@echo "$(VENV_NAME)\Scripts\activate"

# Show environment status
.PHONY: status
status:
	@echo "Environment Status:"
	@echo "==================="
	@if exist "$(VENV_NAME)" ( \
		echo "Virtual environment: EXISTS" && \
		if exist "$(PYTHON_VENV)" ( \
			echo "Python executable: FOUND" && \
			echo "Python version: " && $(PYTHON_VENV) --version \
		) else ( \
			echo "Python executable: NOT FOUND" \
		) \
	) else ( \
		echo "Virtual environment: NOT FOUND" \
	)
	@if exist "requirements.txt" ( \
		echo "Requirements file: FOUND" \
	) else ( \
		echo "Requirements file: NOT FOUND" \
	)

# Reinstall everything from scratch
.PHONY: rebuild
rebuild: clean setup
	@echo "Environment rebuilt successfully."
