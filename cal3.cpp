#include <iostream>
#include <iomanip>
#include <ctime>
#include <cstdlib>
#include <cstring>

using namespace std;

void print_calendar(int month, int year, bool highlight) {
    char cmd[256];
    snprintf(cmd, sizeof(cmd), "cal %s %d %d", highlight ? "-h" : "", month, year);
    system(cmd);
}

int main(int argc, char* argv[]) {
    time_t now = time(0);
    tm* ltm = localtime(&now);

    int current_month = ltm->tm_mon + 1;
    int current_year = ltm->tm_year + 1900;

    bool highlight = false;
    int month = current_month;
    int year = current_year;

    if (argc > 1) {
        for (int i = 1; i < argc; ++i) {
            if (strcmp(argv[i], "-h") == 0) {
                highlight = true;
            } else if (i + 1 < argc && sscanf(argv[i], "%2d", &month) == 1 && sscanf(argv[i + 1], "%4d", &year) == 1) {
                i++;
            } else {
                cerr << "Invalid arguments. Please use \"cal3 [-h] [MM YYYY]\"" << endl;
                return 1;
            }
        }
    }

    int prev_month = month - 1;
    int next_month = month + 1;
    int prev_year = year;
    int next_year = year;

    if (prev_month == 0) {
        prev_month = 12;
        prev_year--;
    }
    if (next_month == 13) {
        next_month = 1;
        next_year++;
    }

    print_calendar(prev_month, prev_year, highlight);
    print_calendar(month, year, highlight);
    print_calendar(next_month, next_year, highlight);

    return 0;
}

