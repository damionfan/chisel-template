module DecoupledAdder(
  input         clock,
  input         reset,
  output        input_ready,
  input         input_valid,
  input  [31:0] input_bits_op1,
  input  [31:0] input_bits_op2,
  input         output_ready,
  output        output_valid,
  output [31:0] output_bits_res
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] x; // @[addmul.scala 23:26]
  reg [31:0] y; // @[addmul.scala 24:26]
  reg  busy; // @[addmul.scala 25:30]
  reg  resultValid; // @[addmul.scala 26:30]
  wire  _GEN_2 = input_valid | ~busy; // @[addmul.scala 43:27 Decoupled.scala 81:20 addmul.scala 28:17]
  wire  _GEN_5 = input_valid | busy; // @[addmul.scala 43:27 47:18 25:30]
  assign input_ready = busy ? ~busy : _GEN_2; // @[addmul.scala 28:17 32:17]
  assign output_valid = resultValid; // @[addmul.scala 29:18]
  assign output_bits_res = x + y; // @[addmul.scala 33:30]
  always @(posedge clock) begin
    if (!(busy)) begin // @[addmul.scala 32:17]
      if (input_valid) begin // @[addmul.scala 43:27]
        x <= input_bits_op1; // @[addmul.scala 45:15]
      end
    end
    if (!(busy)) begin // @[addmul.scala 32:17]
      if (input_valid) begin // @[addmul.scala 43:27]
        y <= input_bits_op2; // @[addmul.scala 46:15]
      end
    end
    if (reset) begin // @[addmul.scala 25:30]
      busy <= 1'h0; // @[addmul.scala 25:30]
    end else if (busy) begin // @[addmul.scala 32:17]
      if (output_ready & resultValid) begin // @[addmul.scala 37:43]
        busy <= 1'h0; // @[addmul.scala 38:18]
      end
    end else begin
      busy <= _GEN_5;
    end
    if (reset) begin // @[addmul.scala 26:30]
      resultValid <= 1'h0; // @[addmul.scala 26:30]
    end else if (busy) begin // @[addmul.scala 32:17]
      if (output_ready & resultValid) begin // @[addmul.scala 37:43]
        resultValid <= 1'h0; // @[addmul.scala 39:25]
      end else begin
        resultValid <= 1'h1; // @[addmul.scala 35:21]
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
  x = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  y = _RAND_1[31:0];
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
