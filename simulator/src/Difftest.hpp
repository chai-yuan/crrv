#ifndef DIFFTEST_HPP
#define DIFFTEST_HPP

#include "stdint.h"
#include "string"

enum mode { USER = 0x0, SUPERVISOR = 0x1, MACHINE = 0x3 };

struct DifftestRiscvCore {
    uint32_t  regs[32];
    uint32_t  pc;
    uint32_t  csrs[4096];
    enum mode mode;
};

void difftestInit(std::string fileName, const uint8_t *data, uint64_t data_size);

void difftestStep();

#endif
