#include "SimulatorState.hpp"
#include "cmath"

extern "C" void dpi_sram_read(uint32_t raddr, uint32_t *rdata) {
    raddr  = raddr & 0xfffffc;
    *rdata = *(uint32_t *)&simulator.mem[raddr];
    //    printf("read at %x : %x\n", raddr, *rdata);
}

extern "C" void dpi_sram_write(uint32_t waddr, int wmask, uint32_t wdata) {
    waddr = waddr & 0xfffffc;
    //   printf("write : %x : %x , mask : %b\n", waddr, wdata, wmask);
    for (int i = 0; i < 4; i++) {
        if (wmask & 1)
            simulator.mem[waddr] = wdata & 0xff;

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
