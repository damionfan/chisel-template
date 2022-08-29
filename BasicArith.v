module Mod(
  input   clock,
  input   reset,
  output  io_input1_ready,
  input   io_input1_valid,
  output  io_input2_ready,
  input   io_input2_valid,
  input   io_output_ready
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  busy; // @[Arithmetic.scala 21:30]
  reg  resultValid; // @[Arithmetic.scala 22:30]
  wire  _io_input1_ready_T = ~busy; // @[Arithmetic.scala 24:24]
  wire  _GEN_2 = io_input1_valid & io_input2_valid | ~busy; // @[Arithmetic.scala 38:51 Decoupled.scala 81:20 Arithmetic.scala 24:21]
  wire  _GEN_6 = io_input1_valid & io_input2_valid | busy; // @[Arithmetic.scala 38:51 45:18 21:30]
  assign io_input1_ready = busy ? ~busy : _GEN_2; // @[Arithmetic.scala 29:17 24:21]
  assign io_input2_ready = busy ? _io_input1_ready_T : _GEN_2; // @[Arithmetic.scala 29:17 25:21]
  always @(posedge clock) begin
    if (reset) begin // @[Arithmetic.scala 21:30]
      busy <= 1'h0; // @[Arithmetic.scala 21:30]
    end else if (busy) begin // @[Arithmetic.scala 29:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 33:49]
        busy <= 1'h0; // @[Arithmetic.scala 34:18]
      end
    end else begin
      busy <= _GEN_6;
    end
    if (reset) begin // @[Arithmetic.scala 22:30]
      resultValid <= 1'h0; // @[Arithmetic.scala 22:30]
    end else if (busy) begin // @[Arithmetic.scala 29:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 33:49]
        resultValid <= 1'h0; // @[Arithmetic.scala 35:25]
      end else begin
        resultValid <= 1'h1; // @[Arithmetic.scala 31:21]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  resultValid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Add(
  input   clock,
  input   reset,
  input   io_input1_valid,
  input   io_input2_valid,
  input   io_output_ready,
  output  io_output_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  busy; // @[Arithmetic.scala 105:30]
  reg  resultValid; // @[Arithmetic.scala 106:30]
  wire  _GEN_6 = io_input1_valid & io_input2_valid | busy; // @[Arithmetic.scala 122:51 129:18 105:30]
  assign io_output_valid = resultValid; // @[Arithmetic.scala 110:21]
  always @(posedge clock) begin
    if (reset) begin // @[Arithmetic.scala 105:30]
      busy <= 1'h0; // @[Arithmetic.scala 105:30]
    end else if (busy) begin // @[Arithmetic.scala 113:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 117:49]
        busy <= 1'h0; // @[Arithmetic.scala 118:18]
      end
    end else begin
      busy <= _GEN_6;
    end
    if (reset) begin // @[Arithmetic.scala 106:30]
      resultValid <= 1'h0; // @[Arithmetic.scala 106:30]
    end else if (busy) begin // @[Arithmetic.scala 113:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 117:49]
        resultValid <= 1'h0; // @[Arithmetic.scala 119:25]
      end else begin
        resultValid <= 1'h1; // @[Arithmetic.scala 115:21]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  resultValid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Sub(
  input   clock,
  input   reset,
  output  io_input1_ready,
  input   io_input1_valid,
  output  io_input2_ready,
  input   io_input2_valid,
  input   io_output_ready,
  output  io_output_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  busy; // @[Arithmetic.scala 147:30]
  reg  resultValid; // @[Arithmetic.scala 148:30]
  wire  _io_input1_ready_T = ~busy; // @[Arithmetic.scala 150:24]
  wire  _GEN_2 = io_input1_valid & io_input2_valid | ~busy; // @[Arithmetic.scala 164:51 Decoupled.scala 81:20 Arithmetic.scala 150:21]
  wire  _GEN_6 = io_input1_valid & io_input2_valid | busy; // @[Arithmetic.scala 164:51 171:18 147:30]
  assign io_input1_ready = busy ? ~busy : _GEN_2; // @[Arithmetic.scala 155:17 150:21]
  assign io_input2_ready = busy ? _io_input1_ready_T : _GEN_2; // @[Arithmetic.scala 155:17 151:21]
  assign io_output_valid = resultValid; // @[Arithmetic.scala 152:21]
  always @(posedge clock) begin
    if (reset) begin // @[Arithmetic.scala 147:30]
      busy <= 1'h0; // @[Arithmetic.scala 147:30]
    end else if (busy) begin // @[Arithmetic.scala 155:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 159:49]
        busy <= 1'h0; // @[Arithmetic.scala 160:18]
      end
    end else begin
      busy <= _GEN_6;
    end
    if (reset) begin // @[Arithmetic.scala 148:30]
      resultValid <= 1'h0; // @[Arithmetic.scala 148:30]
    end else if (busy) begin // @[Arithmetic.scala 155:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 159:49]
        resultValid <= 1'h0; // @[Arithmetic.scala 161:25]
      end else begin
        resultValid <= 1'h1; // @[Arithmetic.scala 157:21]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  resultValid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Mul(
  input   clock,
  input   reset,
  input   io_input1_valid,
  input   io_input2_valid,
  input   io_output_ready,
  output  io_output_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  busy; // @[Arithmetic.scala 63:30]
  reg  resultValid; // @[Arithmetic.scala 64:30]
  wire  _GEN_6 = io_input1_valid & io_input2_valid | busy; // @[Arithmetic.scala 80:51 87:18 63:30]
  assign io_output_valid = resultValid; // @[Arithmetic.scala 68:21]
  always @(posedge clock) begin
    if (reset) begin // @[Arithmetic.scala 63:30]
      busy <= 1'h0; // @[Arithmetic.scala 63:30]
    end else if (busy) begin // @[Arithmetic.scala 71:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 75:49]
        busy <= 1'h0; // @[Arithmetic.scala 76:18]
      end
    end else begin
      busy <= _GEN_6;
    end
    if (reset) begin // @[Arithmetic.scala 64:30]
      resultValid <= 1'h0; // @[Arithmetic.scala 64:30]
    end else if (busy) begin // @[Arithmetic.scala 71:17]
      if (io_output_ready & resultValid) begin // @[Arithmetic.scala 75:49]
        resultValid <= 1'h0; // @[Arithmetic.scala 77:25]
      end else begin
        resultValid <= 1'h1; // @[Arithmetic.scala 73:21]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  resultValid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BasicArith(
  input         clock,
  input         reset,
  output        io_q_ready,
  input         io_q_valid,
  input  [31:0] io_q_bits,
  output        io_a_ready,
  input         io_a_valid,
  input  [31:0] io_a_bits,
  output        io_b_ready,
  input         io_b_valid,
  input  [31:0] io_b_bits,
  output        io_flag_ready,
  input         io_flag_valid,
  input  [1:0]  io_flag_bits,
  input         io_output_ready,
  output        io_output_valid,
  output [31:0] io_output_bits
);
  wire  mod_clock; // @[Arithmetic.scala 192:21]
  wire  mod_reset; // @[Arithmetic.scala 192:21]
  wire  mod_io_input1_ready; // @[Arithmetic.scala 192:21]
  wire  mod_io_input1_valid; // @[Arithmetic.scala 192:21]
  wire  mod_io_input2_ready; // @[Arithmetic.scala 192:21]
  wire  mod_io_input2_valid; // @[Arithmetic.scala 192:21]
  wire  mod_io_output_ready; // @[Arithmetic.scala 192:21]
  wire  add_clock; // @[Arithmetic.scala 193:21]
  wire  add_reset; // @[Arithmetic.scala 193:21]
  wire  add_io_input1_valid; // @[Arithmetic.scala 193:21]
  wire  add_io_input2_valid; // @[Arithmetic.scala 193:21]
  wire  add_io_output_ready; // @[Arithmetic.scala 193:21]
  wire  add_io_output_valid; // @[Arithmetic.scala 193:21]
  wire  sub_clock; // @[Arithmetic.scala 194:21]
  wire  sub_reset; // @[Arithmetic.scala 194:21]
  wire  sub_io_input1_ready; // @[Arithmetic.scala 194:21]
  wire  sub_io_input1_valid; // @[Arithmetic.scala 194:21]
  wire  sub_io_input2_ready; // @[Arithmetic.scala 194:21]
  wire  sub_io_input2_valid; // @[Arithmetic.scala 194:21]
  wire  sub_io_output_ready; // @[Arithmetic.scala 194:21]
  wire  sub_io_output_valid; // @[Arithmetic.scala 194:21]
  wire  mul_clock; // @[Arithmetic.scala 195:21]
  wire  mul_reset; // @[Arithmetic.scala 195:21]
  wire  mul_io_input1_valid; // @[Arithmetic.scala 195:21]
  wire  mul_io_input2_valid; // @[Arithmetic.scala 195:21]
  wire  mul_io_output_ready; // @[Arithmetic.scala 195:21]
  wire  mul_io_output_valid; // @[Arithmetic.scala 195:21]
  wire  _GEN_1 = io_flag_bits == 2'h1 ? add_io_output_valid : sub_io_output_valid; // @[Arithmetic.scala 229:27 231:30 234:30]
  Mod mod ( // @[Arithmetic.scala 192:21]
    .clock(mod_clock),
    .reset(mod_reset),
    .io_input1_ready(mod_io_input1_ready),
    .io_input1_valid(mod_io_input1_valid),
    .io_input2_ready(mod_io_input2_ready),
    .io_input2_valid(mod_io_input2_valid),
    .io_output_ready(mod_io_output_ready)
  );
  Add add ( // @[Arithmetic.scala 193:21]
    .clock(add_clock),
    .reset(add_reset),
    .io_input1_valid(add_io_input1_valid),
    .io_input2_valid(add_io_input2_valid),
    .io_output_ready(add_io_output_ready),
    .io_output_valid(add_io_output_valid)
  );
  Sub sub ( // @[Arithmetic.scala 194:21]
    .clock(sub_clock),
    .reset(sub_reset),
    .io_input1_ready(sub_io_input1_ready),
    .io_input1_valid(sub_io_input1_valid),
    .io_input2_ready(sub_io_input2_ready),
    .io_input2_valid(sub_io_input2_valid),
    .io_output_ready(sub_io_output_ready),
    .io_output_valid(sub_io_output_valid)
  );
  Mul mul ( // @[Arithmetic.scala 195:21]
    .clock(mul_clock),
    .reset(mul_reset),
    .io_input1_valid(mul_io_input1_valid),
    .io_input2_valid(mul_io_input2_valid),
    .io_output_ready(mul_io_output_ready),
    .io_output_valid(mul_io_output_valid)
  );
  assign io_q_ready = mod_io_input2_ready; // @[Arithmetic.scala 209:19]
  assign io_a_ready = sub_io_input1_ready; // @[Arithmetic.scala 206:19]
  assign io_b_ready = sub_io_input2_ready; // @[Arithmetic.scala 207:19]
  assign io_flag_ready = 1'h1; // @[Arithmetic.scala 214:19]
  assign io_output_valid = 1'h0; // @[Arithmetic.scala 215:21]
  assign io_output_bits = 32'h0;
  assign mod_clock = clock;
  assign mod_reset = reset;
  assign mod_io_input1_valid = io_flag_bits == 2'h0 ? mul_io_output_valid : _GEN_1; // @[Arithmetic.scala 226:21 228:30]
  assign mod_io_input2_valid = io_q_valid; // @[Arithmetic.scala 209:19]
  assign mod_io_output_ready = io_output_ready; // @[Arithmetic.scala 210:15]
  assign add_clock = clock;
  assign add_reset = reset;
  assign add_io_input1_valid = io_a_valid; // @[Arithmetic.scala 203:19]
  assign add_io_input2_valid = io_b_valid; // @[Arithmetic.scala 204:19]
  assign add_io_output_ready = mod_io_input1_ready; // @[Arithmetic.scala 197:26 198:19]
  assign sub_clock = clock;
  assign sub_reset = reset;
  assign sub_io_input1_valid = io_a_valid; // @[Arithmetic.scala 206:19]
  assign sub_io_input2_valid = io_b_valid; // @[Arithmetic.scala 207:19]
  assign sub_io_output_ready = mod_io_input1_ready; // @[Arithmetic.scala 197:26 198:19]
  assign mul_clock = clock;
  assign mul_reset = reset;
  assign mul_io_input1_valid = io_a_valid; // @[Arithmetic.scala 200:19]
  assign mul_io_input2_valid = io_b_valid; // @[Arithmetic.scala 201:19]
  assign mul_io_output_ready = mod_io_input1_ready; // @[Arithmetic.scala 197:26 198:19]
endmodule
