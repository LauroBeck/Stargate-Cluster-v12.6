#include <iostream>
#include <libpq-fe.h>
#include <iomanip>
#include <string>

void render_alert(const std::string& pred) {
    if (pred.find("WAR") != std::string::npos || pred.find("GEOPOLITIC") != std::string::npos) {
        std::cout << "\033[1;31m [!] GEOPOLITICAL STRESS \033[0m";
    }
}

int main() {
    PGconn *conn = PQconnectdb("dbname=stargate_audit host=localhost");
    PGresult *res = PQexec(conn, "SELECT ticker, last_price, prediction, confidence FROM volatility_logs ORDER BY ts DESC LIMIT 5;");

    std::cout << "\n\033[1;35m═══ STARGATE v13.0 ALPHA | GEOPOLITICAL MONITOR ═══\033[0m\n" << std::endl;

    for (int i = 0; i < PQntuples(res); i++) {
        std::string ticker = PQgetvalue(res, i, 0);
        std::string pred = PQgetvalue(res, i, 2);
        float conf = std::stof(PQgetvalue(res, i, 3));

        std::cout << std::left << std::setw(15) << ticker << " | " 
                  << std::setw(10) << PQgetvalue(res, i, 1) << " | Conf: " << conf << "%";
        
        render_alert(pred);
        std::cout << std::endl;
    }

    PQclear(res);
    PQfinish(conn);
    return 0;
}
