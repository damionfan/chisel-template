module Mod(
  input         clock,
  input         reset,
  output        io_input1_ready,
  input         io_input1_valid,
  input  [55:0] io_input1_bits,
  output        io_input2_ready,
  input         io_input2_valid,
  input  [27:0] io_input2_bits,
  input         io_output_ready,
  output        io_output_valid,
  output [27:0] io_output_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [55:0] x; // @[arithmetic.scala 19:26]
  reg [27:0] y; // @[arithmetic.scala 20:26]
  reg  busy; // @[arithmetic.scala 21:30]
  reg  resultValid; // @[arithmetic.scala 22:30]
  wire  _io_input1_ready_T = ~busy; // @[arithmetic.scala 24:24]
  wire  _GEN_2 = io_input1_valid & io_input2_valid | ~busy; // @[arithmetic.scala 38:51 Decoupled.scala 81:20 arithmetic.scala 24:21]
  wire  _GEN_6 = io_input1_valid & io_input2_valid | busy; // @[arithmetic.scala 38:51 45:18 21:30]
  wire [55:0] _GEN_3 = {{28'd0}, y}; // @[arithmetic.scala 30:28]
  wire [55:0] _GEN_0 = x % _GEN_3; // @[arithmetic.scala 30:28]
  assign io_input1_ready = busy ? ~busy : _GEN_2; // @[arithmetic.scala 29:17 24:21]
  assign io_input2_ready = busy ? _io_input1_ready_T : _GEN_2; // @[arithmetic.scala 29:17 25:21]
  assign io_output_valid = resultValid; // @[arithmetic.scala 26:21]
  assign io_output_bits = _GEN_0[27:0]; // @[arithmetic.scala 30:28]
  always @(posedge clock) begin
    if (!(busy)) begin // @[arithmetic.scala 29:17]
      if (io_input1_valid & io_input2_valid) begin // @[arithmetic.scala 38:51]
        x <= io_input1_bits; // @[arithmetic.scala 42:15]
      end
    end
    if (!(busy)) begin // @[arithmetic.scala 29:17]
      if (io_input1_valid & io_input2_valid) begin // @[arithmetic.scala 38:51]
        y <= io_input2_bits; // @[arithmetic.scala 43:15]
      end
    end
    if (reset) begin // @[arithmetic.scala 21:30]
      busy <= 1'h0; // @[arithmetic.scala 21:30]
    end else if (busy) begin // @[arithmetic.scala 29:17]
      if (io_output_ready & resultValid) begin // @[arithmetic.scala 33:49]
        busy <= 1'h0; // @[arithmetic.scala 34:18]
      end
    end else begin
      busy <= _GEN_6;
    end
    if (reset) begin // @[arithmetic.scala 22:30]
      resultValid <= 1'h0; // @[arithmetic.scala 22:30]
    end else if (busy) begin // @[arithmetic.scala 29:17]
      if (io_output_ready & resultValid) begin // @[arithmetic.scala 33:49]
        resultValid <= 1'h0; // @[arithmetic.scala 35:25]
      end else begin
        resultValid <= 1'h1; // @[arithmetic.scala 31:21]
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
  _RAND_0 = {2{`RANDOM}};
  x = _RAND_0[55:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[27:0];
  _RAND_2 = {1{`RANDOM}};
  busy = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  resultValid = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
