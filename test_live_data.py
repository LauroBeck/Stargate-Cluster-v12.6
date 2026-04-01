import bloomberg_mcp
import json

print("\033[94m--- TESTING BLOOMBERG LIVE CONNECTION ---\033[0m")
try:
    # This directly calls the tool logic we just registered
    result = bloomberg_mcp.get_market_levels()
    print(json.dumps(result, indent=4))
    print("\033[92mSuccess! Data retrieved.\033[0m")
except Exception as e:
    print(f"\033[91mConnection Error:\033[0m {e}")
    print("Ensure Bloomberg Terminal (bbcomm.exe) is logged in.")
