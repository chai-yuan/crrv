#include "SimulatorState.hpp"
#include "stdio.h"
#include <fstream>

SimulatorState simulator = {
    .core = {.pc = 0, .regs = {0}},
    .mem  = {0},

    .instCount   = 0,
    .cycleCount  = 0,
    .isInstValid = false,
    .isHalted    = false,
    .haltTrapVal = 1,
};

void dumpCore() {
    printf("PC: 0x%08x\n", simulator.core.pc);

    printf("Registers:\n");
    for (int i = 0; i < 32; i += 4) {
        printf("  x%02x: 0x%08x  x%02x: 0x%08x  x%02x: 0x%08x  x%02x: 0x%08x\n", i,
               simulator.core.regs[i], i + 1, simulator.core.regs[i + 1], i + 2,
               simulator.core.regs[i + 2], i + 3, simulator.core.regs[i + 3]);
    }
}

void initMemoryFromFile(std::string fileName) {
    std::ifstream file(fileName, std::ios::binary);
    if (!file.is_open()) {
        throw std::runtime_error("Failed to open file: " + fileName);
    }

    file.seekg(0, std::ios::end);
    std::streampos fileSize = file.tellg();
    file.seekg(0, std::ios::beg);

    if (fileSize > sizeof(simulator.mem)) {
        throw std::runtime_error("File size exceeds available memory");
    }

    file.read(reinterpret_cast<char *>(simulator.mem), fileSize);

    file.close();
}

void printSimulatorStats() {
    printf("=== Simulation Statistics ===\n");
    printf("Instructions Executed: %u\n", simulator.instCount);
    printf("Cycles Executed: %u\n", simulator.cycleCount);
    printf("Halt Trap Value: %d\n", simulator.haltTrapVal);
    printf("=============================\n");
}
