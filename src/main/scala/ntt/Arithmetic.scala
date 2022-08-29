package ntt 

import chisel3._
import chisel3.util.Decoupled
import chisel3.util._

import chisel3.stage.ChiselStage

// output = input1 % input2
class ModBundle() extends Bundle with HasCommonParameters{
    val input1 = Flipped(Decoupled(UInt((2*DataWidth).W))) ////op number
    val input2 = Flipped(Decoupled(UInt(DataWidth.W)))  // q
    val output = Decoupled(UInt(DataWidth.W))
}

class Mod extends Module{
    val io = IO(new ModBundle)

    val x           = Reg(UInt())
    val y           = Reg(UInt())
    val busy        = RegInit(false.B)
    val resultValid = RegInit(false.B)

    io.input1.ready := ! busy
    io.input2.ready := ! busy
    io.output.valid := resultValid
    io.output.bits := DontCare

    when(busy)  {
        io.output.bits := x%y
        resultValid := true.B 

        when(io.output.ready && resultValid)    {
            busy := false.B 
            resultValid := false.B 
        }
    }.otherwise {
        when(io.input1.valid && io.input2.valid)  {
            val bundle1 = io.input1.deq()
            val bundle2 = io.input2.deq()

            x := bundle1
            y := bundle2

            busy := true.B  
        }
    }

}

// output = input1 * input2
class MulBundle() extends Bundle with HasCommonParameters{
    val input1 = Flipped(Decoupled(UInt(DataWidth.W)))
    val input2 = Flipped(Decoupled(UInt(DataWidth.W)))
    val output = Decoupled(UInt((2*DataWidth).W))
}

class Mul extends Module{
    val io = IO(new MulBundle)

    val x           = Reg(UInt())
    val y           = Reg(UInt())
    val busy        = RegInit(false.B)
    val resultValid = RegInit(false.B)

    io.input1.ready := ! busy
    io.input2.ready := ! busy
    io.output.valid := resultValid
    io.output.bits := DontCare

    when(busy)  {
        io.output.bits := x*y
        resultValid := true.B 

        when(io.output.ready && resultValid)    {
            busy := false.B 
            resultValid := false.B 
        }
    }.otherwise {
        when(io.input1.valid && io.input2.valid)  {
            val bundle1 = io.input1.deq()
            val bundle2 = io.input2.deq()

            x := bundle1
            y := bundle2

            busy := true.B  
        }
    }

}

// output = input1 + input2
class AddBundle() extends Bundle with HasCommonParameters{
    val input1 = Flipped(Decoupled(UInt(DataWidth.W)))
    val input2 = Flipped(Decoupled(UInt(DataWidth.W)))
    val output = Decoupled(UInt((2*DataWidth).W))
}

class Add extends Module {
    val io = IO(new AddBundle)

    val x           = Reg(UInt())
    val y           = Reg(UInt())
    val busy        = RegInit(false.B)
    val resultValid = RegInit(false.B)

    io.input1.ready := ! busy
    io.input2.ready := ! busy
    io.output.valid := resultValid
    io.output.bits := DontCare

    when(busy)  {
        io.output.bits := x+y
        resultValid := true.B 

        when(io.output.ready && resultValid)    {
            busy := false.B 
            resultValid := false.B 
        }
    }.otherwise {
        when(io.input1.valid && io.input2.valid)  {
            val bundle1 = io.input1.deq()
            val bundle2 = io.input2.deq()

            x := bundle1
            y := bundle2

            busy := true.B  
        }
    }

}

// output = input1 - input2
class SubBundle() extends Bundle with HasCommonParameters{
    val input1 = Flipped(Decoupled(UInt(DataWidth.W)))
    val input2 = Flipped(Decoupled(UInt(DataWidth.W)))
    val output = Decoupled(UInt((DataWidth*2).W))
}

class Sub extends Module {
    val io = IO(new SubBundle)

    val x           = Reg(UInt())
    val y           = Reg(UInt())
    val busy        = RegInit(false.B)
    val resultValid = RegInit(false.B)

    io.input1.ready := ! busy
    io.input2.ready := ! busy
    io.output.valid := resultValid
    io.output.bits := DontCare

    when(busy)  {
        io.output.bits := x-y
        resultValid := true.B 

        when(io.output.ready && resultValid)    {
            busy := false.B 
            resultValid := false.B 
        }
    }.otherwise {
        when(io.input1.valid && io.input2.valid)  {
            val bundle1 = io.input1.deq()
            val bundle2 = io.input2.deq()

            x := bundle1
            y := bundle2

            busy := true.B  
        }
    }

}

//Contain Add Mul and Sub
class BasicArithIO() extends Bundle with HasCommonParameters {
    val q = Flipped(Decoupled(UInt(DataWidth.W)))
    val a = Flipped(Decoupled(UInt(DataWidth.W)))
    val b = Flipped(Decoupled(UInt(DataWidth.W)))

    val flag = Flipped(Decoupled(UInt(2.W)))

    val output = Decoupled(UInt(DataWidth.W))
}

class BasicArith extends Module with HasCommonParameters {
    val io = IO(new BasicArithIO)
    
    //
    val mod = Module(new Mod)
    val add = Module(new Add) 
    val sub = Module(new Sub)
    val mul = Module(new Mul)

    val SharedWire = Wire(Decoupled(UInt(DataWidth.W)))
    mod.io.input1 <> SharedWire

    mul.io.input1 <> io.a 
    mul.io.input2 <> io.b 

    add.io.input1 <> io.a 
    add.io.input2 <> io.b 

    sub.io.input1 <> io.a 
    sub.io.input2 <> io.b 

    mod.io.input2 <> io.q
    io.output <> mod.io.output
    
    val flag = io.flag.bits

    io.flag.ready := true.B
    io.output.valid := false.B
    io.output.bits := DontCare

    val mul_o=mul.io.output
    val add_o=add.io.output
    val sub_o=sub.io.output

    mul_o.ready := SharedWire.ready
    add_o.ready := SharedWire.ready
    sub_o.ready := SharedWire.ready

    when(flag===0.U){
            SharedWire.bits := mul_o.bits
            SharedWire.valid := mul_o.valid
    }.elsewhen(flag===1.U){
            SharedWire.bits := add_o.bits
            SharedWire.valid := add_o.valid
    }.otherwise{
            SharedWire.bits := sub_o.bits
            SharedWire.valid := sub_o.valid
    }




}

// object ModDriver extends App {
//   (new ChiselStage).emitVerilog(new Mod, args)
// }

// object MulDriver extends App {
//   (new ChiselStage).emitVerilog(new Mul, args)
// }

// object AddDriver extends App {
//   (new ChiselStage).emitVerilog(new Add, args)
// }

object BasicArithDriver extends App {
  (new ChiselStage).emitVerilog(new BasicArith, args)
}
