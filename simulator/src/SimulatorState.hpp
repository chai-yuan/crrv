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
    uint8_t        mem[8 * 1024 * 1024];

    uint32_t instCount;
    uint32_t cycleCount;
    bool     isInstValid;
    bool     isHalted;
    int      haltTrapVal;
};

extern SimulatorState simulator;

void initMemoryFromFile(std::string fileName);

void dumpCore();

void printSimulatorStats();

#endif
