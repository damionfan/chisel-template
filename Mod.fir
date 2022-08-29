circuit Mod :
  module Mod :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip input1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<56>}, flip input2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<28>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<28>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[arithmetic.scala 19:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[arithmetic.scala 20:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[arithmetic.scala 21:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[arithmetic.scala 22:30]
    node _io_input1_ready_T = eq(busy, UInt<1>("h0")) @[arithmetic.scala 24:24]
    io.input1.ready <= _io_input1_ready_T @[arithmetic.scala 24:21]
    node _io_input2_ready_T = eq(busy, UInt<1>("h0")) @[arithmetic.scala 25:24]
    io.input2.ready <= _io_input2_ready_T @[arithmetic.scala 25:21]
    io.output.valid <= resultValid @[arithmetic.scala 26:21]
    io.output.bits is invalid @[arithmetic.scala 27:20]
    when busy : @[arithmetic.scala 29:17]
      node _io_output_bits_T = rem(x, y) @[arithmetic.scala 30:28]
      io.output.bits <= _io_output_bits_T @[arithmetic.scala 30:24]
      resultValid <= UInt<1>("h1") @[arithmetic.scala 31:21]
      node _T = and(io.output.ready, resultValid) @[arithmetic.scala 33:30]
      when _T : @[arithmetic.scala 33:49]
        busy <= UInt<1>("h0") @[arithmetic.scala 34:18]
        resultValid <= UInt<1>("h0") @[arithmetic.scala 35:25]
    else :
      node _T_1 = and(io.input1.valid, io.input2.valid) @[arithmetic.scala 38:30]
      when _T_1 : @[arithmetic.scala 38:51]
        io.input1.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        io.input2.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= io.input1.bits @[arithmetic.scala 42:15]
        y <= io.input2.bits @[arithmetic.scala 43:15]
        busy <= UInt<1>("h1") @[arithmetic.scala 45:18]

