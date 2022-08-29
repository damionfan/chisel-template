module DecoupledAdder(
  input         clock,
  input         reset,
  input  [31:0] input_bits_op1,
  input  [31:0] input_bits_op2,
  output [31:0] output_bits_res
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] x; // @[addmul.scala 22:26]
  reg [31:0] y; // @[addmul.scala 23:26]
  reg  busy; // @[addmul.scala 24:30]
  assign output_bits_res = x + y; // @[addmul.scala 32:30]
  always @(posedge clock) begin
    if (!(busy)) begin // @[addmul.scala 31:17]
      x <= input_bits_op1;
    end
    if (!(busy)) begin // @[addmul.scala 31:17]
      y <= input_bits_op2;
    end
    if (reset) begin // @[addmul.scala 24:30]
      busy <= 1'h0; // @[addmul.scala 24:30]
    end else if (!(busy)) begin // @[addmul.scala 31:17]
      busy <= 1'h1;
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
  x = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  busy = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NValuesAdder(
  input         clock,
  input         reset,
  output        inputs_ready,
  input         inputs_valid,
  input  [31:0] inputs_bits_ops_0_op1,
  input  [31:0] inputs_bits_ops_0_op2,
  input  [31:0] inputs_bits_ops_1_op1,
  input  [31:0] inputs_bits_ops_1_op2,
  output [31:0] outputs
);
  wire  res1_clock; // @[addmul.scala 54:26]
  wire  res1_reset; // @[addmul.scala 54:26]
  wire [31:0] res1_input_bits_op1; // @[addmul.scala 54:26]
  wire [31:0] res1_input_bits_op2; // @[addmul.scala 54:26]
  wire [31:0] res1_output_bits_res; // @[addmul.scala 54:26]
  wire  res2_clock; // @[addmul.scala 54:26]
  wire  res2_reset; // @[addmul.scala 54:26]
  wire [31:0] res2_input_bits_op1; // @[addmul.scala 54:26]
  wire [31:0] res2_input_bits_op2; // @[addmul.scala 54:26]
  wire [31:0] res2_output_bits_res; // @[addmul.scala 54:26]
  wire  res3_clock; // @[addmul.scala 54:26]
  wire  res3_reset; // @[addmul.scala 54:26]
  wire [31:0] res3_input_bits_op1; // @[addmul.scala 54:26]
  wire [31:0] res3_input_bits_op2; // @[addmul.scala 54:26]
  wire [31:0] res3_output_bits_res; // @[addmul.scala 54:26]
  DecoupledAdder res1 ( // @[addmul.scala 54:26]
    .clock(res1_clock),
    .reset(res1_reset),
    .input_bits_op1(res1_input_bits_op1),
    .input_bits_op2(res1_input_bits_op2),
    .output_bits_res(res1_output_bits_res)
  );
  DecoupledAdder res2 ( // @[addmul.scala 54:26]
    .clock(res2_clock),
    .reset(res2_reset),
    .input_bits_op1(res2_input_bits_op1),
    .input_bits_op2(res2_input_bits_op2),
    .output_bits_res(res2_output_bits_res)
  );
  DecoupledAdder res3 ( // @[addmul.scala 54:26]
    .clock(res3_clock),
    .reset(res3_reset),
    .input_bits_op1(res3_input_bits_op1),
    .input_bits_op2(res3_input_bits_op2),
    .output_bits_res(res3_output_bits_res)
  );
  assign inputs_ready = 1'h1; // @[addmul.scala 77:16]
  assign outputs = res3_output_bits_res; // @[addmul.scala 96:11]
  assign res1_clock = clock;
  assign res1_reset = reset;
  assign res1_input_bits_op1 = inputs_bits_ops_0_op1; // @[addmul.scala 60:29]
  assign res1_input_bits_op2 = inputs_bits_ops_0_op2; // @[addmul.scala 61:29]
  assign res2_clock = clock;
  assign res2_reset = reset;
  assign res2_input_bits_op1 = inputs_bits_ops_1_op1; // @[addmul.scala 60:29]
  assign res2_input_bits_op2 = inputs_bits_ops_1_op2; // @[addmul.scala 61:29]
  assign res3_clock = clock;
  assign res3_reset = reset;
  assign res3_input_bits_op1 = res1_output_bits_res; // @[addmul.scala 87:20 89:14]
  assign res3_input_bits_op2 = res2_output_bits_res; // @[addmul.scala 87:20 90:14]
endmodule
