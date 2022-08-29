circuit NValuesAdder :
  module DecoupledAdder :
    input clock : Clock
    input reset : Reset
    input input : { flip ready : UInt<1>, valid : UInt<1>, bits : { op1 : UInt<32>, op2 : UInt<32>}}
    output output : { flip ready : UInt<1>, valid : UInt<1>, bits : { res : UInt<32>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[addmul.scala 22:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[addmul.scala 23:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 24:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 25:30]
    node _input_ready_T = eq(busy, UInt<1>("h0")) @[addmul.scala 27:20]
    input.ready <= _input_ready_T @[addmul.scala 27:17]
    output.valid <= resultValid @[addmul.scala 28:18]
    output.bits.res is invalid @[addmul.scala 29:17]
    when busy : @[addmul.scala 31:17]
      node _output_bits_res_T = add(x, y) @[addmul.scala 32:30]
      node _output_bits_res_T_1 = tail(_output_bits_res_T, 1) @[addmul.scala 32:30]
      output.bits.res <= _output_bits_res_T_1 @[addmul.scala 32:25]
      resultValid <= UInt<1>("h1") @[addmul.scala 34:21]
      node _T = and(output.ready, resultValid) @[addmul.scala 36:27]
      when _T : @[addmul.scala 36:43]
        busy <= UInt<1>("h0") @[addmul.scala 37:18]
        resultValid <= UInt<1>("h0") @[addmul.scala 38:25]
    else :
      when input.valid : @[addmul.scala 42:27]
        input.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= input.bits.op1 @[addmul.scala 44:15]
        y <= input.bits.op2 @[addmul.scala 45:15]
        busy <= UInt<1>("h1") @[addmul.scala 46:18]

  module DecoupledAdder_1 :
    input clock : Clock
    input reset : Reset
    input input : { flip ready : UInt<1>, valid : UInt<1>, bits : { op1 : UInt<32>, op2 : UInt<32>}}
    output output : { flip ready : UInt<1>, valid : UInt<1>, bits : { res : UInt<32>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[addmul.scala 22:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[addmul.scala 23:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 24:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 25:30]
    node _input_ready_T = eq(busy, UInt<1>("h0")) @[addmul.scala 27:20]
    input.ready <= _input_ready_T @[addmul.scala 27:17]
    output.valid <= resultValid @[addmul.scala 28:18]
    output.bits.res is invalid @[addmul.scala 29:17]
    when busy : @[addmul.scala 31:17]
      node _output_bits_res_T = add(x, y) @[addmul.scala 32:30]
      node _output_bits_res_T_1 = tail(_output_bits_res_T, 1) @[addmul.scala 32:30]
      output.bits.res <= _output_bits_res_T_1 @[addmul.scala 32:25]
      resultValid <= UInt<1>("h1") @[addmul.scala 34:21]
      node _T = and(output.ready, resultValid) @[addmul.scala 36:27]
      when _T : @[addmul.scala 36:43]
        busy <= UInt<1>("h0") @[addmul.scala 37:18]
        resultValid <= UInt<1>("h0") @[addmul.scala 38:25]
    else :
      when input.valid : @[addmul.scala 42:27]
        input.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= input.bits.op1 @[addmul.scala 44:15]
        y <= input.bits.op2 @[addmul.scala 45:15]
        busy <= UInt<1>("h1") @[addmul.scala 46:18]

  module DecoupledAdder_2 :
    input clock : Clock
    input reset : Reset
    input input : { flip ready : UInt<1>, valid : UInt<1>, bits : { op1 : UInt<32>, op2 : UInt<32>}}
    output output : { flip ready : UInt<1>, valid : UInt<1>, bits : { res : UInt<32>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[addmul.scala 22:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[addmul.scala 23:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 24:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 25:30]
    node _input_ready_T = eq(busy, UInt<1>("h0")) @[addmul.scala 27:20]
    input.ready <= _input_ready_T @[addmul.scala 27:17]
    output.valid <= resultValid @[addmul.scala 28:18]
    output.bits.res is invalid @[addmul.scala 29:17]
    when busy : @[addmul.scala 31:17]
      node _output_bits_res_T = add(x, y) @[addmul.scala 32:30]
      node _output_bits_res_T_1 = tail(_output_bits_res_T, 1) @[addmul.scala 32:30]
      output.bits.res <= _output_bits_res_T_1 @[addmul.scala 32:25]
      resultValid <= UInt<1>("h1") @[addmul.scala 34:21]
      node _T = and(output.ready, resultValid) @[addmul.scala 36:27]
      when _T : @[addmul.scala 36:43]
        busy <= UInt<1>("h0") @[addmul.scala 37:18]
        resultValid <= UInt<1>("h0") @[addmul.scala 38:25]
    else :
      when input.valid : @[addmul.scala 42:27]
        input.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= input.bits.op1 @[addmul.scala 44:15]
        y <= input.bits.op2 @[addmul.scala 45:15]
        busy <= UInt<1>("h1") @[addmul.scala 46:18]

  module NValuesAdder :
    input clock : Clock
    input reset : UInt<1>
    input inputs : { flip ready : UInt<1>, valid : UInt<1>, bits : { ops : { op1 : UInt<32>, op2 : UInt<32>}[2]}}
    output outputs : UInt<32>

    inputs.ready <= UInt<1>("h1") @[addmul.scala 77:16]
    inst res1 of DecoupledAdder @[addmul.scala 54:26]
    res1.clock <= clock
    res1.reset <= reset
    reg flag : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 56:34]
    node _inst_input_valid_T = eq(flag, UInt<1>("h0")) @[addmul.scala 59:29]
    res1.input.valid <= _inst_input_valid_T @[addmul.scala 59:26]
    res1.input.bits.op1 <= inputs.bits.ops[0].op1 @[addmul.scala 60:29]
    res1.input.bits.op2 <= inputs.bits.ops[0].op2 @[addmul.scala 61:29]
    res1.output.ready <= flag @[addmul.scala 63:27]
    inst res2 of DecoupledAdder_1 @[addmul.scala 54:26]
    res2.clock <= clock
    res2.reset <= reset
    reg flag_1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 56:34]
    node _inst_input_valid_T_1 = eq(flag_1, UInt<1>("h0")) @[addmul.scala 59:29]
    res2.input.valid <= _inst_input_valid_T_1 @[addmul.scala 59:26]
    res2.input.bits.op1 <= inputs.bits.ops[1].op1 @[addmul.scala 60:29]
    res2.input.bits.op2 <= inputs.bits.ops[1].op2 @[addmul.scala 61:29]
    res2.output.ready <= flag_1 @[addmul.scala 63:27]
    wire result : { op1 : UInt<32>, op2 : UInt<32>} @[addmul.scala 84:20]
    result.op1 <= res1.output.bits.res @[addmul.scala 86:14]
    result.op2 <= res2.output.bits.res @[addmul.scala 87:14]
    inst res3 of DecoupledAdder_2 @[addmul.scala 54:26]
    res3.clock <= clock
    res3.reset <= reset
    reg flag_2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[addmul.scala 56:34]
    node _inst_input_valid_T_2 = eq(flag_2, UInt<1>("h0")) @[addmul.scala 59:29]
    res3.input.valid <= _inst_input_valid_T_2 @[addmul.scala 59:26]
    res3.input.bits.op1 <= result.op1 @[addmul.scala 60:29]
    res3.input.bits.op2 <= result.op2 @[addmul.scala 61:29]
    res3.output.ready <= flag_2 @[addmul.scala 63:27]
    outputs <= res3.output.bits.res @[addmul.scala 93:11]

