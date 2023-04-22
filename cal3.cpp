#include <iostream>
#include <ctime>

// Add the version number
#define CAL3_VERSION "1.0.0"

int main() {
    // Call the check_version.sh script
    system("./check_version.sh");

    // Existing code
    time_t rawtime;
    struct tm * timeinfo;
    char buffer[80];

    time (&rawtime);
    timeinfo = localtime(&rawtime);

    strftime(buffer, sizeof(buffer),"%Y-%m-%d %H:%M:%S", timeinfo);
    std::string str(buffer);

    std::cout << "Current local time: " << str << std::endl;

    return 0;
}

