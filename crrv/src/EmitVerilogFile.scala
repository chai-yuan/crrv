package crrv

import chisel3._
import _root_.circt.stage.ChiselStage

class CRRV extends Module {
  val io = IO(new Bundle {
    val value1        = Input(UInt(16.W))
    val value2        = Input(UInt(16.W))
    val loadingValues = Input(Bool())
    val outputGCD     = Output(UInt(16.W))
    val outputValid   = Output(Bool())
  })

  val x = Reg(UInt())
  val y = Reg(UInt())

  when(x > y)(x := x - y)
    .otherwise(y := y - x)

  when(io.loadingValues) {
    x := io.value1
    y := io.value2
  }

  io.outputGCD := x
  io.outputValid := y === 0.U
}

object EmitVerilogFile extends App {
  ChiselStage.emitSystemVerilogFile(
    new CRRV,
    firtoolOpts = Array("-disable-all-randomization", "-strip-debug-info")
  )
}
