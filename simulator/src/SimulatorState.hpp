#ifndef SIMULATOR_STATE_HPP
#define SIMULATOR_STATE_HPP

#include "stdint.h"
#include "string"

struct RiscvCoreState {
    uint32_t pc;
    uint32_t regs[32];
};

struct SimulatorState {
    RiscvCoreState core;
    uint8_t        flash[8 * 1024 * 1024];
    uint8_t        bram[8 * 1024 * 1024];
    uint8_t        sram[8 * 1024 * 1024];
    uint8_t        psram[8 * 1024 * 1024];

    uint32_t instCount;
    uint32_t cycleCount;
    bool     isInstValid;
    bool     isHalted;
    int      haltTrapVal;
};

extern SimulatorState simulator;

void initMemoryFromFile(std::string fileName);

void initFlashFromFile(std::string fileName);

void dumpCore();

void printSimulatorStats();

#endif
