# Stock Price Prediction using LSTM

Predicts future stock prices using Long Short-Term Memory (LSTM) deep learning. Built end-to-end from data collection to visualization.

## Overview

This project forecasts stock prices by training an LSTM neural network on historical market data. LSTMs are well-suited for time-series prediction because they can learn long-term patterns in sequential data.

## Tech Stack

- Python 3.x
- TensorFlow / Keras — LSTM model
- Pandas — data manipulation
- NumPy — numerical operations
- Matplotlib — visualization
- Scikit-learn — data preprocessing

## Project Structure

```
stock-price-prediction/
├── data/               # Raw and processed stock data
├── notebooks/          # Jupyter notebooks
│   └── stock_lstm.ipynb
├── model/              # Saved model weights
├── plots/              # Output charts
└── README.md
```

## How It Works

1. Fetch historical stock data (e.g. AAPL, RELIANCE)
2. Preprocess and normalize using MinMaxScaler
3. Create time-series sequences (lookback window = 60 days)
4. Train LSTM model on 80% of data
5. Predict on remaining 20% and plot results

## Results

The model successfully captures upward and downward price trends. Predicted vs actual prices are plotted for visual comparison.

## Setup

```bash
git clone https://github.com/vinay-madha/stock-price-prediction
cd stock-price-prediction
pip install -r requirements.txt
jupyter notebook notebooks/stock_lstm.ipynb
```

## Author

Madha Vinay · [LinkedIn](https://linkedin.com/in/vinay-madha-66b414318) · [GitHub](https://github.com/vinay-madha)
