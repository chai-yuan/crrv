#include "Difftest.hpp"
#include "SimulatorState.hpp"
#include "stdlib.h"
#include <dlfcn.h>

static DifftestRiscvCore *difftestCore;

struct DifftestRiscvCore *(*difftest_init)(const uint8_t *data, uint64_t data_size) = NULL;
void (*difftest_step)(void)                                                         = NULL;

void difftestInit(std::string fileName, const uint8_t *data, uint64_t data_size) {
    if (fileName == "")
        return;

    const char *name = fileName.c_str();

    void *handle = dlopen(name, RTLD_LAZY);
    if (!handle) {
        fprintf(stderr, "Error loading library: %s\n", dlerror());
        exit(1);
    }
    difftest_init =
        (struct DifftestRiscvCore * (*)(const uint8_t *, uint64_t)) dlsym(handle, "difftest_init");
    difftest_step = (void (*)(void))dlsym(handle, "difftest_step");

    if (!difftest_init || !difftest_step) {
        fprintf(stderr, "Error finding symbol: %s\n", dlerror());
        dlclose(handle);
        exit(0);
    }

    difftestCore = difftest_init(data, data_size);
}

const char *regs[] = {
    "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
    "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
    "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
    "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"};

void checkDiff() {
    int diff = 0;
    // 比较 regs 数组
    for (int i = 0; i < 32; i++) {
        if (difftestCore->regs[i] != simulator.core.regs[i]) {
            printf("ERROR: regs[%d] mismatch\n", i);
            printf("  difftest_core->regs[%d] = 0x%x\n", i, difftestCore->regs[i]);
            printf("  cpu->regs[%d] = 0x%x\n", i, simulator.core.regs[i]);
            diff = 1;
        }
    }
    // 比较 pc
    if (difftestCore->pc != simulator.core.pc) {
        printf("ERROR: pc mismatch\n");
        printf("  difftest_core->pc = 0x%x\n", difftestCore->pc);
        printf("  cpu->pc = 0x%x\n", simulator.core.pc);
        diff = 1;
    }
    if (diff == 1) {
        printf("pc : %x\n", difftestCore->pc);
        printf("mode : %x\n", difftestCore->mode);
        for (int i = 0; i < 32; i++) {
            printf("reg %d (%s): %x\n", i, regs[i], difftestCore->regs[i]);
        }
        simulator.isHalted = true;
    }
}

void difftestStep() {
    if (difftest_step == NULL)
        return;
    difftest_step();
    checkDiff();
}
