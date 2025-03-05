#include <random>
#include <fstream>
#include <thread>

int main() {
    std::vector<std::ofstream*> files;
    for (int i = 0; i < 1000; i++) {
        for (int j = 0; j < 1000; j++) {
            std::ofstream* file;
            file = new std::ofstream(std::to_string(i) + std::to_string(j) + ".txt");
            files.push_back(file);
        }
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
    for (const auto file : files) {
        file->close();
    }
    return 0;
}