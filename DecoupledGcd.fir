circuit DecoupledGcd :
  module DecoupledGcd :
    input clock : Clock
    input reset : UInt<1>
    input input : { flip ready : UInt<1>, valid : UInt<1>, bits : { value1 : UInt<32>, value2 : UInt<32>}}
    output output : { flip ready : UInt<1>, valid : UInt<1>, bits : { value1 : UInt<32>, value2 : UInt<32>, gcd : UInt<32>}}

    reg xInitial : UInt, clock with :
      reset => (UInt<1>("h0"), xInitial) @[DecoupledGCD.scala 44:24]
    reg yInitial : UInt, clock with :
      reset => (UInt<1>("h0"), yInitial) @[DecoupledGCD.scala 45:24]
    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[DecoupledGCD.scala 46:24]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[DecoupledGCD.scala 47:24]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[DecoupledGCD.scala 48:28]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[DecoupledGCD.scala 49:28]
    node _input_ready_T = eq(busy, UInt<1>("h0")) @[DecoupledGCD.scala 51:18]
    input.ready <= _input_ready_T @[DecoupledGCD.scala 51:15]
    output.valid <= resultValid @[DecoupledGCD.scala 52:16]
    output.bits.gcd is invalid @[DecoupledGCD.scala 53:15]
    output.bits.value2 is invalid @[DecoupledGCD.scala 53:15]
    output.bits.value1 is invalid @[DecoupledGCD.scala 53:15]
    when busy : @[DecoupledGCD.scala 55:15]
      node _T = gt(x, y) @[DecoupledGCD.scala 56:12]
      when _T : @[DecoupledGCD.scala 56:17]
        node _x_T = sub(x, y) @[DecoupledGCD.scala 57:14]
        node _x_T_1 = tail(_x_T, 1) @[DecoupledGCD.scala 57:14]
        x <= _x_T_1 @[DecoupledGCD.scala 57:9]
      else :
        node _y_T = sub(y, x) @[DecoupledGCD.scala 59:14]
        node _y_T_1 = tail(_y_T, 1) @[DecoupledGCD.scala 59:14]
        y <= _y_T_1 @[DecoupledGCD.scala 59:9]
      node _T_1 = eq(x, UInt<1>("h0")) @[DecoupledGCD.scala 61:12]
      node _T_2 = eq(y, UInt<1>("h0")) @[DecoupledGCD.scala 61:25]
      node _T_3 = or(_T_1, _T_2) @[DecoupledGCD.scala 61:20]
      when _T_3 : @[DecoupledGCD.scala 61:34]
        node _T_4 = eq(x, UInt<1>("h0")) @[DecoupledGCD.scala 62:14]
        when _T_4 : @[DecoupledGCD.scala 62:23]
          output.bits.gcd <= y @[DecoupledGCD.scala 63:25]
        else :
          output.bits.gcd <= x @[DecoupledGCD.scala 65:25]
        output.bits.value1 <= xInitial @[DecoupledGCD.scala 68:26]
        output.bits.value2 <= yInitial @[DecoupledGCD.scala 69:26]
        resultValid <= UInt<1>("h1") @[DecoupledGCD.scala 70:19]
        node _T_5 = and(output.ready, resultValid) @[DecoupledGCD.scala 72:25]
        when _T_5 : @[DecoupledGCD.scala 72:41]
          busy <= UInt<1>("h0") @[DecoupledGCD.scala 73:14]
          resultValid <= UInt<1>("h0") @[DecoupledGCD.scala 74:21]
    else :
      when input.valid : @[DecoupledGCD.scala 78:23]
        input.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= input.bits.value1 @[DecoupledGCD.scala 80:9]
        y <= input.bits.value2 @[DecoupledGCD.scala 81:9]
        xInitial <= input.bits.value1 @[DecoupledGCD.scala 82:16]
        yInitial <= input.bits.value2 @[DecoupledGCD.scala 83:16]
        busy <= UInt<1>("h1") @[DecoupledGCD.scala 84:12]

