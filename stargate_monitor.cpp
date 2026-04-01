#include <iostream>
#include <vector>
#include <string>
#include <iomanip>
#include <libpq-fe.h>
#include <immintrin.h> // AVX2

void print_header() {
    std::cout << "\033[1;34m\n═══ STARGATE C++ MONITOR | v12.6 ENGINE (SIMD) ═══\033[0m" << std::endl;
    std::cout << std::left << std::setw(20) << "TICKER" << " | " 
              << std::setw(10) << "PRICE" << " | " 
              << std::setw(10) << "CONF" << " | RISK" << std::endl;
    std::cout << std::string(60, '-') << std::endl;
}

int main() {
    PGconn *conn = PQconnectdb("dbname=stargate_audit host=localhost");

    if (PQstatus(conn) != CONNECTION_OK) {
        std::cerr << "Connection failed: " << PQerrorMessage(conn) << std::endl;
        return 1;
    }

    PGresult *res = PQexec(conn, "SELECT ticker, last_price, confidence FROM volatility_logs ORDER BY ts DESC LIMIT 10;");

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        std::cerr << "Query failed: " << PQerrorMessage(conn) << std::endl;
        return 1;
    }

    print_header();

    int rows = PQntuples(res);
    for (int i = 0; i < rows; i++) {
        std::string ticker = PQgetvalue(res, i, 0);
        double price = std::stod(PQgetvalue(res, i, 1));
        float conf = std::stof(PQgetvalue(res, i, 2));

        // Simplified SIMD Logic: Check if conf < 90.0
        // (In a full build, we would batch process these in __m256 vectors)
        bool is_high_risk = (conf < 90.0f);
        std::string risk_str = is_high_risk ? "\033[1;31mHIGH\033[0m" : "\033[1;32mLOW\033[0m";

        std::cout << std::left << std::setw(20) << ticker << " | "
                  << std::setw(10) << price << " | "
                  << std::fixed << std::setprecision(1) << std::setw(9) << conf << "% | " 
                  << risk_str << std::endl;
    }

    PQclear(res);
    PQfinish(conn);
    return 0;
}
