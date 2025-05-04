#include "SimulatorState.hpp"
#include "cmath"

extern "C" void dpi_read(uint32_t raddr, uint32_t *rdata) {
    uint8_t *mem_base = 0x0;
    if (raddr >= 0x80000000) {
        mem_base = (uint8_t *)simulator.sram;
    } else if (raddr >= 0x30000000) {
        mem_base = (uint8_t *)simulator.flash;
    } else if (raddr >= 0x20000000) {
        mem_base = (uint8_t *)simulator.bram;
    }

    *rdata = *(uint32_t *)&mem_base[raddr & 0xfffffc];
}

extern "C" void dpi_write(uint32_t waddr, int wmask, uint32_t wdata) {
    uint8_t *mem_base = (uint8_t *)simulator.sram;
    if (waddr >= 0x80000000) {
        mem_base = (uint8_t *)simulator.sram;
    } else if (waddr >= 0x30000000) {
        mem_base = (uint8_t *)simulator.flash;
    } else if (waddr >= 0x20000000) {
        mem_base = (uint8_t *)simulator.bram;
    }

    waddr = waddr & 0xfffffc;
    for (int i = 0; i < 4; i++) {
        if (wmask & 1)
            mem_base[waddr] = wdata & 0xff;
        waddr += 1;
        wdata = wdata >> 8;
        wmask = wmask >> 1;
    }
}

extern "C" void dpi_debug_pc(uint32_t pc) {
    simulator.core.pc     = pc;
    simulator.isInstValid = true; // 提交一条指令
}
extern "C" void dpi_debug_regs(uint32_t idx, uint32_t regVal) { simulator.core.regs[idx] = regVal; }
extern "C" void dpi_ebreak(uint32_t ebreak, uint32_t halt_ret) {
    simulator.isHalted    = true;
    simulator.haltTrapVal = halt_ret;
}
