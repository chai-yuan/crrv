#include "NpcSimulator.hpp"
#include "../obj_dir/VVerilatorSoC.h"
#include "CommandLineParser.hpp"
#include "SimulatorState.hpp"
#include "verilated.h"
#include "verilated_vcd_c.h"

VVerilatorSoC     *simTop;
VerilatedContext *contextp;
VerilatedVcdC    *tfp;

static void traceInit() {
    tfp = new VerilatedVcdC();
    contextp->traceEverOn(true);
    simTop->trace(tfp, 16);
    tfp->open("obj_dir/trace.vcd");
}
static void dumpWave() {
    contextp->timeInc(1);
    tfp->dump(contextp->time());
}
static void traceExit() {
    dumpWave();
    tfp->close();
}

void npcSimulatorInit() {
    contextp = new VerilatedContext();
    simTop   = new VVerilatorSoC();
    if (globalConfig.trace_enable) {
        traceInit();
    }
}

void npcSimulatorExit() {
    if (globalConfig.trace_enable) {
        traceExit();
    }
}

void npcReset() {
    simTop->reset = 1;
    for (int i = 0; i < 48; i++) {
        simTop->clock = !simTop->clock;
        simTop->eval();
        if (globalConfig.trace_enable)
            dumpWave();
    }
    simTop->reset = 0;
}

void npcStepCycle() {
    simTop->clock = !simTop->clock;
    simTop->eval();
    if (globalConfig.trace_enable)
        dumpWave();
    simTop->clock = !simTop->clock;
    simTop->eval();
    if (globalConfig.trace_enable)
        dumpWave();

    simulator.cycleCount++;
}

void npcStepInst() {
    simulator.isInstValid = false;
    while (!simulator.isInstValid) { // 运行到下一条合法指令
        npcStepCycle();

        if ((simulator.instCount >= globalConfig.step) || (simulator.cycleCount >= globalConfig.cycle))
            break;
    }
    simulator.instCount++;
}
