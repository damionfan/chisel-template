package addmul

import chisel3._
import chisel3.util.Decoupled
// import chisel3.util.Flipped

import chisel3.stage.ChiselStage

class AddInputBudle(val w: Int) extends Bundle{
    val op1 = UInt(w.W)
    val op2 = UInt(w.W)
}

class AddOutputBudle(val w: Int) extends Bundle{
    val res = UInt(w.W)
}

class DecoupledAdder(width: Int) extends Module{
    val input = IO(Flipped(Decoupled(new AddInputBudle(width))))
    val output = IO(Decoupled(new AddOutputBudle(width)))

    val x           = Reg(UInt())
    val y           = Reg(UInt())
    val busy        = RegInit(false.B)
    val resultValid = RegInit(false.B)

    input.ready := ! busy  //当该模块没有工作的时候，表明模块可以处理下一个输入数据。
    output.valid := resultValid
    output.bits := DontCare

    when(busy)  {
        output.bits.res := x + y
        
        resultValid := true.B

        when(output.ready && resultValid) {
            busy := false.B
            resultValid := false.B
        }

    }.otherwise {
        when(input.valid) {
            val bundle = input.deq()
            x := bundle.op1
            y := bundle.op2 
            busy := true.B
        }
    }

}

object DecoupledAdder{
    def apply(ops: AddInputBudle, width: Int) = {
        val inst = Module(new DecoupledAdder(width)) 

        val flag        = RegInit(false.B)
        
        // inst.input.ready := flag 
        inst.input.valid := ! flag 
        inst.input.bits.op1 := ops.op1
        inst.input.bits.op2 := ops.op2

        inst.output.ready := flag 
        // inst.output.bits.res
        inst
    }
}

class MultiValueInputs(n: Int, width : Int) extends Bundle{
    val ops = Vec(n, new AddInputBudle(width))
}

class NValuesAdder(n: Int, width: Int) extends Module{
  val inputs = IO(Flipped(Decoupled(new MultiValueInputs(n, width))))
  val outputs = IO(Output(UInt(width.W)))

  inputs.ready := true.B
//   inputs.valid := false.B 
//   output.ready := flag 

//   val res1 = Vec.fill(n) {Module(new DecoupledAdder(width)).io}
//   val res1= (0 until n).map(id => new DecoupledAdder(width))
  val res1= DecoupledAdder(inputs.bits.ops(0), width)

  val res2 = DecoupledAdder(inputs.bits.ops(1), width)
 
  val result = Wire(new AddInputBudle(width))

  result.op1 := res1.output.bits.res
  result.op2 := res2.output.bits.res

  val res3 = DecoupledAdder(result, width)

  //val res3 = DecoupledAdder(res1.output.bits.res, res2.output.bits.res)

  outputs := res3.output.bits.res
}


object DecoupledAdderDriver extends App {
  (new ChiselStage).emitVerilog(new NValuesAdder(2, 32), args)
}




