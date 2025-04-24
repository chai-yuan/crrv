import chisel3._
import _root_.circt.stage.ChiselStage

import export._

object EmitVerilogFile extends App {
  ChiselStage.emitSystemVerilogFile(
    new SoCExporter,
    firtoolOpts = Array("-disable-all-randomization", "-strip-debug-info")
  )
}
