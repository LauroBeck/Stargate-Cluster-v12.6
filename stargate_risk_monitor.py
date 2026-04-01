import psycopg2

def fetch_recent_telemetry():
    """Calculates Portfolio Risk based on Stargate Audit Logs."""
    try:
        conn = psycopg2.connect(dbname="stargate_audit", host="localhost")
        cur = conn.cursor()
        
        # Pull the last 10 unique tickers and their confidence
        cur.execute("""
            SELECT ticker, last_price, prediction, confidence 
            FROM volatility_logs 
            ORDER BY ts DESC LIMIT 10
        """)
        rows = cur.fetchall()
        
        print("\n\033[1;34m═══ STARGATE RISK REPORT | v12.6 ENGINE ═══\033[0m")
        print(f"{'TICKER':<20} | {'PRICE':<10} | {'CONFIDENCE':<10} | {'RISK'}")
        print("─" * 60)
        
        for ticker, price, pred, conf in rows:
            # Simple Architect's heuristic for risk
            risk_level = "HIGH" if conf < 90 else "LOW"
            color = "\033[1;31m" if risk_level == "HIGH" else "\033[1;32m"
            print(f"{ticker:<20} | {price:<10} | {conf:<10}% | {color}{risk_level}\033[0m")
            
        cur.close()
        conn.close()
    except Exception as e:
        print(f"Risk Monitor Error: {e}")

if __name__ == "__main__":
    fetch_recent_telemetry()
