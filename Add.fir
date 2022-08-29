circuit Add :
  module Add :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip input1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<28>}, flip input2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<28>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<28>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[arithmetic.scala 105:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[arithmetic.scala 106:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[arithmetic.scala 107:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[arithmetic.scala 108:30]
    node _io_input1_ready_T = eq(busy, UInt<1>("h0")) @[arithmetic.scala 110:24]
    io.input1.ready <= _io_input1_ready_T @[arithmetic.scala 110:21]
    node _io_input2_ready_T = eq(busy, UInt<1>("h0")) @[arithmetic.scala 111:24]
    io.input2.ready <= _io_input2_ready_T @[arithmetic.scala 111:21]
    io.output.valid <= resultValid @[arithmetic.scala 112:21]
    io.output.bits is invalid @[arithmetic.scala 113:20]
    when busy : @[arithmetic.scala 115:17]
      node _io_output_bits_T = add(x, y) @[arithmetic.scala 116:28]
      node _io_output_bits_T_1 = tail(_io_output_bits_T, 1) @[arithmetic.scala 116:28]
      io.output.bits <= _io_output_bits_T_1 @[arithmetic.scala 116:24]
      resultValid <= UInt<1>("h1") @[arithmetic.scala 117:21]
      node _T = and(io.output.ready, resultValid) @[arithmetic.scala 119:30]
      when _T : @[arithmetic.scala 119:49]
        busy <= UInt<1>("h0") @[arithmetic.scala 120:18]
        resultValid <= UInt<1>("h0") @[arithmetic.scala 121:25]
    else :
      node _T_1 = and(io.input1.valid, io.input2.valid) @[arithmetic.scala 124:30]
      when _T_1 : @[arithmetic.scala 124:51]
        io.input1.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        io.input2.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= io.input1.bits @[arithmetic.scala 128:15]
        y <= io.input2.bits @[arithmetic.scala 129:15]
        busy <= UInt<1>("h1") @[arithmetic.scala 131:18]

