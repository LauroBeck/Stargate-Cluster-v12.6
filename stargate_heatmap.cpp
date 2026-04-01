#include <iostream>
#include <vector>
#include <libpq-fe.h>
#include <iomanip>

void print_heatmap_row(const std::string& ticker, float conf) {
    std::string color;
    if (conf >= 95.0) color = "\033[48;5;28m";      // Deep Green BG
    else if (conf >= 90.0) color = "\033[48;5;214m"; // Orange BG
    else color = "\033[48;5;196m";                 // Bright Red BG

    std::cout << color << " " << std::left << std::setw(15) << ticker 
              << " [" << std::fixed << std::setprecision(1) << conf << "%] " 
              << "\033[0m  ";
}

int main() {
    PGconn *conn = PQconnectdb("dbname=stargate_audit host=localhost");
    PGresult *res = PQexec(conn, "SELECT ticker, confidence FROM volatility_logs ORDER BY confidence DESC;");

    std::cout << "\n\033[1m═══ STARGATE v12.6 | GLOBAL RISK HEATMAP ═══\033[0m\n" << std::endl;

    for (int i = 0; i < PQntuples(res); i++) {
        print_heatmap_row(PQgetvalue(res, i, 0), std::stof(PQgetvalue(res, i, 1)));
        if ((i + 1) % 2 == 0) std::cout << "\n\n"; // Grid layout
    }

    std::cout << "\033[0m" << std::endl;
    PQclear(res);
    PQfinish(conn);
    return 0;
}
