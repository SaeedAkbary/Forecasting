# Forecasting

Practical forecasting examples for electricity load and day-ahead price forecasting using statistical models, machine learning, and reusable time-series utilities.

This repository is designed as a learning and portfolio project. It compares classic statistical forecasting methods with machine-learning approaches and provides reusable helper code for feature engineering, evaluation, and plotting.

## Project Goals

- Build clear forecasting workflows from raw time-series data to model evaluation.
- Compare regression, SARIMA/statistical models, and machine-learning models.
- Use reproducible train/test splits suitable for time-series problems.
- Keep notebooks readable by moving repeated logic into Python modules.
- Provide a clean structure that can grow into a production-style forecasting package.

## Repository Structure

```text
Forecasting/
├── README.md
├── requirements.txt
├── pyproject.toml
├── LICENSE
├── data/
│   └── README.md
├── notebooks/
│   ├── 01_load_linear_regression.ipynb
│   ├── 02_load_sarima.ipynb
│   ├── 03_load_ml_models.ipynb
│   └── 04_day_ahead_price_forecasting.ipynb
├── src/
│   └── forecasting/
│       ├── __init__.py
│       ├── features.py
│       ├── metrics.py
│       ├── splits.py
│       └── plotting.py
├── tests/
│   ├── test_features.py
│   ├── test_metrics.py
│   └── test_splits.py
└── .github/
    └── workflows/
        └── python-ci.yml
```

## Forecasting Methods Covered

| Model family | Examples | Strengths | Limitations | Typical horizon |
|---|---|---|---|---|
| Regression | Linear Regression, Multiple Regression | Simple, interpretable baseline | Limited nonlinear behavior | Short to medium term |
| Statistical time series | ARIMA, SARIMA, Holt-Winters | Captures trend and seasonality | Requires careful diagnostics | Short term |
| Machine learning | Random Forest, XGBoost, LightGBM | Handles nonlinear features | Less interpretable, needs features | Short to medium term |
| Deep learning | LSTM, CNN-LSTM | Learns complex sequence patterns | Data- and compute-intensive | Minutes to days |
| Hybrid / ensemble | ARIMA + ML, model averaging | Combines strengths of models | More complex to maintain | Short to medium term |
| Probabilistic | Quantile Regression, Bayesian models | Provides uncertainty intervals | More advanced setup | All horizons |

## Installation

```bash
git clone https://github.com/SaeedAkbary/Forecasting.git
cd Forecasting
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

For local development:

```bash
pip install -e .
pip install -r requirements-dev.txt
```

## Usage

Start Jupyter:

```bash
jupyter notebook
```

Recommended notebook order:

1. `notebooks/01_load_linear_regression.ipynb`
2. `notebooks/02_load_sarima.ipynb`
3. `notebooks/03_load_ml_models.ipynb`
4. `notebooks/04_day_ahead_price_forecasting.ipynb`

Use the reusable package in notebooks:

```python
from forecasting.features import add_time_features, add_lag_features, add_rolling_features
from forecasting.metrics import regression_metrics
from forecasting.splits import temporal_train_test_split
```

## Evaluation

The project uses time-series-aware evaluation. Data should be split chronologically, not randomly, to avoid leakage.

Common metrics:

- MAE: Mean Absolute Error
- RMSE: Root Mean Squared Error
- MAPE: Mean Absolute Percentage Error
- sMAPE: Symmetric Mean Absolute Percentage Error

Example:

```python
metrics = regression_metrics(y_true, y_pred)
print(metrics)
```

## Data

Place datasets under `data/raw/`. Processed datasets and model outputs should not be committed to Git. See `data/README.md` for details.

## Results Template

Each notebook should end with a results table like this:

| Model | MAE | RMSE | MAPE | Notes |
|---|---:|---:|---:|---|
| Naive baseline | TBD | TBD | TBD | Previous period as forecast |
| Linear Regression | TBD | TBD | TBD | Interpretable baseline |
| SARIMA | TBD | TBD | TBD | Captures seasonality |
| LightGBM | TBD | TBD | TBD | Nonlinear ML model |

## Roadmap

- [ ] Move original notebooks into the `notebooks/` folder and rename them consistently.
- [ ] Add dataset source notes and data dictionary.
- [ ] Add a naive baseline model to every forecasting task.
- [ ] Add walk-forward validation.
- [ ] Add model comparison result tables.
- [ ] Add saved plots under `reports/figures/`.
- [ ] Add experiment tracking notes.
- [ ] Add probabilistic forecasting examples.

## Contributing

Contributions are welcome. Please open an issue or pull request with a clear description of the improvement.

## License

This project is released under the MIT License. See `LICENSE` for details.
