// See README.md for license details.

package gcd

import chisel3._
import chisel3.util.Decoupled

class GcdInputBundle(val w: Int) extends Bundle {
  val value1 = UInt(w.W)
  val value2 = UInt(w.W)
}

class GcdOutputBundle(val w: Int) extends Bundle {
  val value1 = UInt(w.W)
  val value2 = UInt(w.W)
  val gcd    = UInt(w.W)
}

/**
  * Compute Gcd using subtraction method.
  * Subtracts the smaller from the larger until register y is zero.
  * value input register x is then the Gcd.
  * Unless first input is zero then the Gcd is y.
  * Can handle stalls on the producer or consumer side
  */
  //自带的类“Decoupled” 指的是在IO的电路信号中增加一个ready和valid信号。
  //Decoupled 即为接口包装一层valid 和 ready ，
  //decoupled 默认方向为输出，如果需要输入，可以加.flip, Decoupled 可以直接调用Bundle或者Bits，Bundle 内的端口也应该用bits定义

  //ready指的是：接收方是否满足接受状态
  //valid指的是：发送方是否满足发送状态，即数据准备好了。
  //bits指的是：IO Line 的电路位数。




  //"Filpped"函数指的是 可以把参数里所有的输入转输出，输出转输入

class DecoupledGcd(width: Int) extends Module {
  val input = IO(Flipped(Decoupled(new GcdInputBundle(width))))
  val output = IO(Decoupled(new GcdOutputBundle(width)))

  val xInitial    = Reg(UInt()) //保持状态
  val yInitial    = Reg(UInt())
  val x           = Reg(UInt())
  val y           = Reg(UInt())
  val busy        = RegInit(false.B) //初始化状态为false
  val resultValid = RegInit(false.B)

  input.ready := ! busy  //当该模块没有工作的时候，表明模块可以处理下一个输入数据。
  output.valid := resultValid
  output.bits := DontCare

  when(busy)  {
    when(x > y) {
      x := x - y
    }.otherwise {
      y := y - x
    }
    when(x === 0.U || y === 0.U) {
      when(x === 0.U) {
        output.bits.gcd := y
      }.otherwise {
        output.bits.gcd := x
      }

      output.bits.value1 := xInitial
      output.bits.value2 := yInitial
      resultValid := true.B

      when(output.ready && resultValid) {
        busy := false.B
        resultValid := false.B
      }
    }
  }.otherwise {
    when(input.valid) {
      val bundle = input.deq()
      x := bundle.value1
      y := bundle.value2
      xInitial := bundle.value1
      yInitial := bundle.value2
      busy := true.B
    }
  }
}
