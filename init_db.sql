-- Stargate-Cluster v12.6 | Database Initialization
-- Target: PostgreSQL

DROP TABLE IF EXISTS volatility_logs;

CREATE TABLE volatility_logs (
    id SERIAL PRIMARY KEY,
    ticker VARCHAR(20) NOT NULL,
    last_price NUMERIC(15, 4),
    prediction VARCHAR(50),
    confidence NUMERIC(5, 2),
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for high-performance C++/SIMD queries
CREATE INDEX idx_volatility_ts ON volatility_logs (ts DESC);

-- Sample Data (Optional)
INSERT INTO volatility_logs (ticker, last_price, prediction, confidence) VALUES 
('IBM US Equity', 237.25, 'EXPANDING_SKEW', 96.4),
('TSLA US Equity', 168.30, 'HIGH_GAMMA', 97.8),
('BTCUSD Curncy', 67201.50, 'MOMENTUM_LONG', 89.9);
