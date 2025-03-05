#include <random>
#include <fstream>
#include <thread>

int main() {
    std::vector<std::ofstream*> files;
    for (int i = 0; i < 1000; i++) {
        std::ofstream* file;
        file = new std::ofstream(std::to_string(i) + ".txt");
        std::this_thread::sleep_for(std::chrono::seconds(1));
        files.push_back(file);
    }
    for (const auto file : files) {
        file->close();
    }
    return 0;
}
