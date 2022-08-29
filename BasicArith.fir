circuit BasicArith :
  module Mod :
    input clock : Clock
    input reset : Reset
    output io : { flip input1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<64>}, flip input2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[Arithmetic.scala 19:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[Arithmetic.scala 20:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 21:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 22:30]
    node _io_input1_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 24:24]
    io.input1.ready <= _io_input1_ready_T @[Arithmetic.scala 24:21]
    node _io_input2_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 25:24]
    io.input2.ready <= _io_input2_ready_T @[Arithmetic.scala 25:21]
    io.output.valid <= resultValid @[Arithmetic.scala 26:21]
    io.output.bits is invalid @[Arithmetic.scala 27:20]
    when busy : @[Arithmetic.scala 29:17]
      node _io_output_bits_T = rem(x, y) @[Arithmetic.scala 30:28]
      io.output.bits <= _io_output_bits_T @[Arithmetic.scala 30:24]
      resultValid <= UInt<1>("h1") @[Arithmetic.scala 31:21]
      node _T = and(io.output.ready, resultValid) @[Arithmetic.scala 33:30]
      when _T : @[Arithmetic.scala 33:49]
        busy <= UInt<1>("h0") @[Arithmetic.scala 34:18]
        resultValid <= UInt<1>("h0") @[Arithmetic.scala 35:25]
    else :
      node _T_1 = and(io.input1.valid, io.input2.valid) @[Arithmetic.scala 38:30]
      when _T_1 : @[Arithmetic.scala 38:51]
        io.input1.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        io.input2.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= io.input1.bits @[Arithmetic.scala 42:15]
        y <= io.input2.bits @[Arithmetic.scala 43:15]
        busy <= UInt<1>("h1") @[Arithmetic.scala 45:18]

  module Add :
    input clock : Clock
    input reset : Reset
    output io : { flip input1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, flip input2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<64>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[Arithmetic.scala 103:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[Arithmetic.scala 104:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 105:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 106:30]
    node _io_input1_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 108:24]
    io.input1.ready <= _io_input1_ready_T @[Arithmetic.scala 108:21]
    node _io_input2_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 109:24]
    io.input2.ready <= _io_input2_ready_T @[Arithmetic.scala 109:21]
    io.output.valid <= resultValid @[Arithmetic.scala 110:21]
    io.output.bits is invalid @[Arithmetic.scala 111:20]
    when busy : @[Arithmetic.scala 113:17]
      node _io_output_bits_T = add(x, y) @[Arithmetic.scala 114:28]
      node _io_output_bits_T_1 = tail(_io_output_bits_T, 1) @[Arithmetic.scala 114:28]
      io.output.bits <= _io_output_bits_T_1 @[Arithmetic.scala 114:24]
      resultValid <= UInt<1>("h1") @[Arithmetic.scala 115:21]
      node _T = and(io.output.ready, resultValid) @[Arithmetic.scala 117:30]
      when _T : @[Arithmetic.scala 117:49]
        busy <= UInt<1>("h0") @[Arithmetic.scala 118:18]
        resultValid <= UInt<1>("h0") @[Arithmetic.scala 119:25]
    else :
      node _T_1 = and(io.input1.valid, io.input2.valid) @[Arithmetic.scala 122:30]
      when _T_1 : @[Arithmetic.scala 122:51]
        io.input1.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        io.input2.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= io.input1.bits @[Arithmetic.scala 126:15]
        y <= io.input2.bits @[Arithmetic.scala 127:15]
        busy <= UInt<1>("h1") @[Arithmetic.scala 129:18]

  module Sub :
    input clock : Clock
    input reset : Reset
    output io : { flip input1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, flip input2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<64>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[Arithmetic.scala 145:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[Arithmetic.scala 146:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 147:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 148:30]
    node _io_input1_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 150:24]
    io.input1.ready <= _io_input1_ready_T @[Arithmetic.scala 150:21]
    node _io_input2_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 151:24]
    io.input2.ready <= _io_input2_ready_T @[Arithmetic.scala 151:21]
    io.output.valid <= resultValid @[Arithmetic.scala 152:21]
    io.output.bits is invalid @[Arithmetic.scala 153:20]
    when busy : @[Arithmetic.scala 155:17]
      node _io_output_bits_T = sub(x, y) @[Arithmetic.scala 156:28]
      node _io_output_bits_T_1 = tail(_io_output_bits_T, 1) @[Arithmetic.scala 156:28]
      io.output.bits <= _io_output_bits_T_1 @[Arithmetic.scala 156:24]
      resultValid <= UInt<1>("h1") @[Arithmetic.scala 157:21]
      node _T = and(io.output.ready, resultValid) @[Arithmetic.scala 159:30]
      when _T : @[Arithmetic.scala 159:49]
        busy <= UInt<1>("h0") @[Arithmetic.scala 160:18]
        resultValid <= UInt<1>("h0") @[Arithmetic.scala 161:25]
    else :
      node _T_1 = and(io.input1.valid, io.input2.valid) @[Arithmetic.scala 164:30]
      when _T_1 : @[Arithmetic.scala 164:51]
        io.input1.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        io.input2.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= io.input1.bits @[Arithmetic.scala 168:15]
        y <= io.input2.bits @[Arithmetic.scala 169:15]
        busy <= UInt<1>("h1") @[Arithmetic.scala 171:18]

  module Mul :
    input clock : Clock
    input reset : Reset
    output io : { flip input1 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, flip input2 : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<64>}}

    reg x : UInt, clock with :
      reset => (UInt<1>("h0"), x) @[Arithmetic.scala 61:26]
    reg y : UInt, clock with :
      reset => (UInt<1>("h0"), y) @[Arithmetic.scala 62:26]
    reg busy : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 63:30]
    reg resultValid : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[Arithmetic.scala 64:30]
    node _io_input1_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 66:24]
    io.input1.ready <= _io_input1_ready_T @[Arithmetic.scala 66:21]
    node _io_input2_ready_T = eq(busy, UInt<1>("h0")) @[Arithmetic.scala 67:24]
    io.input2.ready <= _io_input2_ready_T @[Arithmetic.scala 67:21]
    io.output.valid <= resultValid @[Arithmetic.scala 68:21]
    io.output.bits is invalid @[Arithmetic.scala 69:20]
    when busy : @[Arithmetic.scala 71:17]
      node _io_output_bits_T = mul(x, y) @[Arithmetic.scala 72:28]
      io.output.bits <= _io_output_bits_T @[Arithmetic.scala 72:24]
      resultValid <= UInt<1>("h1") @[Arithmetic.scala 73:21]
      node _T = and(io.output.ready, resultValid) @[Arithmetic.scala 75:30]
      when _T : @[Arithmetic.scala 75:49]
        busy <= UInt<1>("h0") @[Arithmetic.scala 76:18]
        resultValid <= UInt<1>("h0") @[Arithmetic.scala 77:25]
    else :
      node _T_1 = and(io.input1.valid, io.input2.valid) @[Arithmetic.scala 80:30]
      when _T_1 : @[Arithmetic.scala 80:51]
        io.input1.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        io.input2.ready <= UInt<1>("h1") @[Decoupled.scala 81:20]
        x <= io.input1.bits @[Arithmetic.scala 84:15]
        y <= io.input2.bits @[Arithmetic.scala 85:15]
        busy <= UInt<1>("h1") @[Arithmetic.scala 87:18]

  module BasicArith :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip q : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, flip a : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, flip b : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}, flip flag : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<2>}, output : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>}}

    inst mod of Mod @[Arithmetic.scala 192:21]
    mod.clock <= clock
    mod.reset <= reset
    inst add of Add @[Arithmetic.scala 193:21]
    add.clock <= clock
    add.reset <= reset
    inst sub of Sub @[Arithmetic.scala 194:21]
    sub.clock <= clock
    sub.reset <= reset
    inst mul of Mul @[Arithmetic.scala 195:21]
    mul.clock <= clock
    mul.reset <= reset
    wire SharedWire : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<32>} @[Arithmetic.scala 197:26]
    mod.io.input1.bits <= SharedWire.bits @[Arithmetic.scala 198:19]
    mod.io.input1.valid <= SharedWire.valid @[Arithmetic.scala 198:19]
    SharedWire.ready <= mod.io.input1.ready @[Arithmetic.scala 198:19]
    mul.io.input1.bits <= io.a.bits @[Arithmetic.scala 200:19]
    mul.io.input1.valid <= io.a.valid @[Arithmetic.scala 200:19]
    io.a.ready <= mul.io.input1.ready @[Arithmetic.scala 200:19]
    mul.io.input2.bits <= io.b.bits @[Arithmetic.scala 201:19]
    mul.io.input2.valid <= io.b.valid @[Arithmetic.scala 201:19]
    io.b.ready <= mul.io.input2.ready @[Arithmetic.scala 201:19]
    add.io.input1.bits <= io.a.bits @[Arithmetic.scala 203:19]
    add.io.input1.valid <= io.a.valid @[Arithmetic.scala 203:19]
    io.a.ready <= add.io.input1.ready @[Arithmetic.scala 203:19]
    add.io.input2.bits <= io.b.bits @[Arithmetic.scala 204:19]
    add.io.input2.valid <= io.b.valid @[Arithmetic.scala 204:19]
    io.b.ready <= add.io.input2.ready @[Arithmetic.scala 204:19]
    sub.io.input1.bits <= io.a.bits @[Arithmetic.scala 206:19]
    sub.io.input1.valid <= io.a.valid @[Arithmetic.scala 206:19]
    io.a.ready <= sub.io.input1.ready @[Arithmetic.scala 206:19]
    sub.io.input2.bits <= io.b.bits @[Arithmetic.scala 207:19]
    sub.io.input2.valid <= io.b.valid @[Arithmetic.scala 207:19]
    io.b.ready <= sub.io.input2.ready @[Arithmetic.scala 207:19]
    mod.io.input2.bits <= io.q.bits @[Arithmetic.scala 209:19]
    mod.io.input2.valid <= io.q.valid @[Arithmetic.scala 209:19]
    io.q.ready <= mod.io.input2.ready @[Arithmetic.scala 209:19]
    io.output.bits <= mod.io.output.bits @[Arithmetic.scala 210:15]
    io.output.valid <= mod.io.output.valid @[Arithmetic.scala 210:15]
    mod.io.output.ready <= io.output.ready @[Arithmetic.scala 210:15]
    io.flag.ready <= UInt<1>("h1") @[Arithmetic.scala 214:19]
    io.output.valid <= UInt<1>("h0") @[Arithmetic.scala 215:21]
    io.output.bits is invalid @[Arithmetic.scala 216:20]
    mul.io.output.ready <= SharedWire.ready @[Arithmetic.scala 222:17]
    add.io.output.ready <= SharedWire.ready @[Arithmetic.scala 223:17]
    sub.io.output.ready <= SharedWire.ready @[Arithmetic.scala 224:17]
    node _T = eq(io.flag.bits, UInt<1>("h0")) @[Arithmetic.scala 226:14]
    when _T : @[Arithmetic.scala 226:21]
      SharedWire.bits <= mul.io.output.bits @[Arithmetic.scala 227:29]
      SharedWire.valid <= mul.io.output.valid @[Arithmetic.scala 228:30]
    else :
      node _T_1 = eq(io.flag.bits, UInt<1>("h1")) @[Arithmetic.scala 229:20]
      when _T_1 : @[Arithmetic.scala 229:27]
        SharedWire.bits <= add.io.output.bits @[Arithmetic.scala 230:29]
        SharedWire.valid <= add.io.output.valid @[Arithmetic.scala 231:30]
      else :
        SharedWire.bits <= sub.io.output.bits @[Arithmetic.scala 233:29]
        SharedWire.valid <= sub.io.output.valid @[Arithmetic.scala 234:30]

