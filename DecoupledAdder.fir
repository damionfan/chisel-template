circuit DecoupledAdder :
  module DecoupledAdder :
    input clock : Clock
    input reset : UInt<1>
    input input : { flip ready : UInt<1>, valid : UInt<1>, bits : { op1 : UInt<32>, op2 : UInt<32>}}
    output output : { flip ready : UInt<1>, valid : UInt<1>, bits : { res : UInt<32>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[addmul.scala 23:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[addmul.scala 24:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 25:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 26:30]
    node _input_ready_T = eq(busy, UInt<1>("h0")) @[addmul.scala 28:20]
    input.ready <= _input_ready_T @[addmul.scala 28:17]
    output.valid <= resultValid @[addmul.scala 29:18]
    output.bits.res is invalid @[addmul.scala 30:17]
    when busy : @[addmul.scala 32:17]
      node _output_bits_res_T = add(x, y) @[addmul.scala 33:30]
      node _output_bits_res_T_1 = tail(_output_bits_res_T, 1) @[addmul.scala 33:30]
      output.bits.res <= _output_bits_res_T_1 @[addmul.scala 33:25]
      resultValid <= UInt<1>("h1") @[addmul.scala 35:21]
      node _T = and(output.ready, resultValid) @[addmul.scala 37:27]
      when _T : @[addmul.scala 37:43]
        busy <= UInt<1>("h0") @[addmul.scala 38:18]
        resultValid <= UInt<1>("h0") @[addmul.scala 39:25]
    else :
      when input.valid : @[addmul.scala 43:27]
        input.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= input.bits.op1 @[addmul.scala 45:15]
        y <= input.bits.op2 @[addmul.scala 46:15]
        busy <= UInt<1>("h1") @[addmul.scala 47:18]

