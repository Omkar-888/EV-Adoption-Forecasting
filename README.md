# EV Adoption Forecasting

A machine learning project for forecasting electric vehicle adoption trends using historical data and advanced predictive modeling techniques.

## Features

- 📊 Data analysis and visualization of EV adoption patterns
- 🤖 Machine learning models for forecasting EV adoption
- 📈 Interactive Streamlit web application
- 📓 Jupyter notebook for exploratory data analysis
- 🔧 Automated environment setup with Makefile and batch scripts

## Quick Start

### Prerequisites

- Python 3.8 or higher
- Git

### Setup Options

#### Option 1: Using Makefile (Recommended for users with make installed)

```bash
# Set up the complete environment
make setup

# Run the Streamlit application
make run-app

# Start Jupyter notebook
make run-notebook

# View all available commands
make help
```

#### Option 2: Using Batch Script (Windows users without make)

```cmd
# Set up the complete environment
setup.bat setup

# Run the Streamlit application
setup.bat run-app

# Start Jupyter notebook
setup.bat run-notebook

# View all available commands
setup.bat help
```

#### Option 3: Manual Setup

```bash
# Create virtual environment
python -m venv ev-venv

# Activate virtual environment
# On Windows:
ev-venv\Scripts\activate
# On macOS/Linux:
source ev-venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Run the application
streamlit run app.py
```

## Project Structure

```
EV-Adoption-Forecasting/
│
├── app.py                              # Streamlit web application
├── EV__Adoption_Forecasting.ipynb     # Jupyter notebook for analysis
├── requirements.txt                    # Python dependencies
├── Makefile                           # Automated setup commands
├── setup.bat                          # Windows batch script for setup
│
├── Electric_Vehicle_Population_By_County.csv  # Raw dataset
├── preprocessed_ev_data.csv                   # Processed dataset
├── forecasting_ev_model.pkl                   # Trained ML model
│
├── ev-venv/                           # Virtual environment (created after setup)
├── ev-car-factory.jpg                # Project image assets
└── README.md                          # This file
```

## Available Make Commands

| Command             | Description                                             |
| ------------------- | ------------------------------------------------------- |
| `make setup`        | Create virtual environment and install all dependencies |
| `make install`      | Install/update dependencies                             |
| `make clean`        | Remove virtual environment                              |
| `make run-app`      | Run the Streamlit application                           |
| `make run-notebook` | Start Jupyter notebook server                           |
| `make test-env`     | Test if environment is working properly                 |
| `make freeze`       | Update requirements.txt with current packages           |
| `make activate`     | Show command to activate virtual environment            |
| `make status`       | Show environment status                                 |
| `make rebuild`      | Clean and recreate environment from scratch             |

## Usage

### Running the Web Application

After setup, run the Streamlit application:

```bash
make run-app
```

Or manually:

```bash
ev-venv\Scripts\activate
streamlit run app.py
```

### Jupyter Notebook Analysis

Start the Jupyter notebook server:

```bash
make run-notebook
```

Then open `EV__Adoption_Forecasting.ipynb` in your browser.

## Dependencies

The project uses the following main dependencies:

- **pandas** - Data manipulation and analysis
- **numpy** - Numerical computing
- **matplotlib** - Data visualization
- **seaborn** - Statistical data visualization
- **scikit-learn** - Machine learning library
- **streamlit** - Web application framework
- **jupyter** - Interactive notebook environment
- **joblib** - Model serialization

## Troubleshooting

### Environment Issues

Check environment status:

```bash
make status
```

Test environment:

```bash
make test-env
```

Rebuild environment from scratch:

```bash
make rebuild
```

### Common Issues

1. **Python not found**: Ensure Python 3.8+ is installed and in your PATH
2. **Make not found**: Use the `setup.bat` script instead on Windows
3. **Permission errors**: Run terminal as administrator on Windows
4. **Package conflicts**: Use `make rebuild` to recreate the environment

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
