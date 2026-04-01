import psycopg2
from datetime import datetime

# Global Watchlist Data
market_data = [
    ("IBM US Equity", 237.25, "EXPANDING_SKEW", 96.4),
    ("SPX Index", 6343.72, "NEUTRAL", 92.1),
    ("NDX Index", 20794.64, "MEAN_REVERSION", 88.5),
    ("LVMH FP Equity", 614.75, "VOL_SPIKE", 94.2),
    ("EURUSD Curncy", 1.0842, "TREND_FOLLOW", 91.0),
    ("TSLA US Equity", 168.30, "HIGH_GAMMA", 97.8),
    ("NVDA US Equity", 894.20, "STABLE", 95.3),
    ("BTCUSD Curncy", 67201.50, "MOMENTUM_LONG", 89.9),
    ("GLD US Equity", 215.40, "HEDGE_FLOW", 93.6),
    ("AAPL US Equity", 172.50, "EXPANDING_SKEW", 96.2)
]

try:
    conn = psycopg2.connect(dbname="stargate_audit", host="localhost")
    cur = conn.cursor()
    
    print(f"Injecting {len(market_data)} rows into Stargate-Audit...")
    
    for ticker, price, pred, conf in market_data:
        cur.execute(
            "INSERT INTO volatility_logs (ticker, last_price, prediction, confidence) VALUES (%s, %s, %s, %s)",
            (ticker, price, pred, conf)
        )
    
    conn.commit()
    cur.close()
    conn.close()
    print("Injection Successful. Monitor your terminal.")
except Exception as e:
    print(f"Failed to seed database: {e}")
