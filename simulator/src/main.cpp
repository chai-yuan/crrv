#include "CommandLineParser.hpp"
#include "Difftest.hpp"
#include "NpcSimulator.hpp"
#include "SimulatorState.hpp"
#include "verilated.h"

/*
 *  ██╗   ██╗███████╗██╗   ██╗██╗  ██╗     ██████╗██╗   ██╗██████╗
 *  ╚██╗ ██╔╝██╔════╝╚██╗ ██╔╝╚██╗██╔╝    ██╔════╝██║   ██║██╔══██╗
 *   ╚████╔╝ ███████╗ ╚████╔╝  ╚███╔╝     ██║     ██║   ██║██████╔╝
 *    ╚██╔╝  ╚════██║  ╚██╔╝   ██╔██╗     ██║     ██║   ██║██╔═══╝
 *     ██║   ███████║   ██║   ██╔╝ ██╗    ╚██████╗╚██████╔╝██║
 *     ╚═╝   ╚══════╝   ╚═╝   ╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝
 *
 */

int main(int argc, char *argv[]) {
    Verilated::commandArgs(argc, argv);
    parseArguments(argc, argv);

    npcSimulatorInit();
    npcReset();

    initMemoryFromFile(globalConfig.inputFile);

    difftestInit(globalConfig.difftestFile, simulator.mem, sizeof(simulator.mem));

    while (true) {
        npcStepInst();
        if (simulator.isHalted)
            break;
        difftestStep();
        if ((simulator.instCount >= globalConfig.step) || (simulator.cycleCount >= globalConfig.cycle))
            break;
    }

    npcSimulatorExit();
    printSimulatorStats();
    return simulator.haltTrapVal;
}
