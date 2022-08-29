circuit Mul :
  module Mul :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip input1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<28>}, flip input2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<28>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<56>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[arithmetic.scala 63:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[arithmetic.scala 64:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[arithmetic.scala 65:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[arithmetic.scala 66:30]
    node _io_input1_ready_T = eq(busy, UInt<1>("h0")) @[arithmetic.scala 68:24]
    io.input1.ready <= _io_input1_ready_T @[arithmetic.scala 68:21]
    node _io_input2_ready_T = eq(busy, UInt<1>("h0")) @[arithmetic.scala 69:24]
    io.input2.ready <= _io_input2_ready_T @[arithmetic.scala 69:21]
    io.output.valid <= resultValid @[arithmetic.scala 70:21]
    io.output.bits is invalid @[arithmetic.scala 71:20]
    when busy : @[arithmetic.scala 73:17]
      node _io_output_bits_T = mul(x, y) @[arithmetic.scala 74:28]
      io.output.bits <= _io_output_bits_T @[arithmetic.scala 74:24]
      resultValid <= UInt<1>("h1") @[arithmetic.scala 75:21]
      node _T = and(io.output.ready, resultValid) @[arithmetic.scala 77:30]
      when _T : @[arithmetic.scala 77:49]
        busy <= UInt<1>("h0") @[arithmetic.scala 78:18]
        resultValid <= UInt<1>("h0") @[arithmetic.scala 79:25]
    else :
      node _T_1 = and(io.input1.valid, io.input2.valid) @[arithmetic.scala 82:30]
      when _T_1 : @[arithmetic.scala 82:51]
        io.input1.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        io.input2.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= io.input1.bits @[arithmetic.scala 86:15]
        y <= io.input2.bits @[arithmetic.scala 87:15]
        busy <= UInt<1>("h1") @[arithmetic.scala 89:18]

