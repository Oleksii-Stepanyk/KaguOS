#include <random>
#include <fstream>
#include <thread>

int main() {
    std::ofstream file("test.txt");
    for (int i = 0; i < 1000; i++) {
        file.write("0", 1);
        std::this_thread::sleep_for(std::chrono::seconds(1));
	file.flush();
    }
    file.close();
    return 0;
}