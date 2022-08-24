module DecoupledGcd(
  input         clock,
  input         reset,
  output        input_ready,
  input         input_valid,
  input  [31:0] input_bits_value1,
  input  [31:0] input_bits_value2,
  input         output_ready,
  output        output_valid,
  output [31:0] output_bits_value1,
  output [31:0] output_bits_value2,
  output [31:0] output_bits_gcd
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] xInitial; // @[DecoupledGCD.scala 44:24]
  reg [31:0] yInitial; // @[DecoupledGCD.scala 45:24]
  reg [31:0] x; // @[DecoupledGCD.scala 46:24]
  reg [31:0] y; // @[DecoupledGCD.scala 47:24]
  reg  busy; // @[DecoupledGCD.scala 48:28]
  reg  resultValid; // @[DecoupledGCD.scala 49:28]
  wire [31:0] _x_T_1 = x - y; // @[DecoupledGCD.scala 57:14]
  wire [31:0] _y_T_1 = y - x; // @[DecoupledGCD.scala 59:14]
  wire  _T_1 = x == 32'h0; // @[DecoupledGCD.scala 61:12]
  wire  _GEN_10 = input_valid | ~busy; // @[DecoupledGCD.scala 78:23 Decoupled.scala 81:20 DecoupledGCD.scala 51:15]
  wire  _GEN_15 = input_valid | busy; // @[DecoupledGCD.scala 78:23 84:12 48:28]
  assign input_ready = busy ? ~busy : _GEN_10; // @[DecoupledGCD.scala 51:15 55:15]
  assign output_valid = resultValid; // @[DecoupledGCD.scala 52:16]
  assign output_bits_value1 = xInitial; // @[DecoupledGCD.scala 61:34 68:26]
  assign output_bits_value2 = yInitial; // @[DecoupledGCD.scala 61:34 69:26]
  assign output_bits_gcd = _T_1 ? y : x; // @[DecoupledGCD.scala 62:23 63:25 65:25]
  always @(posedge clock) begin
    if (!(busy)) begin // @[DecoupledGCD.scala 55:15]
      if (input_valid) begin // @[DecoupledGCD.scala 78:23]
        xInitial <= input_bits_value1; // @[DecoupledGCD.scala 82:16]
      end
    end
    if (!(busy)) begin // @[DecoupledGCD.scala 55:15]
      if (input_valid) begin // @[DecoupledGCD.scala 78:23]
        yInitial <= input_bits_value2; // @[DecoupledGCD.scala 83:16]
      end
    end
    if (busy) begin // @[DecoupledGCD.scala 55:15]
      if (x > y) begin // @[DecoupledGCD.scala 56:17]
        x <= _x_T_1; // @[DecoupledGCD.scala 57:9]
      end
    end else if (input_valid) begin // @[DecoupledGCD.scala 78:23]
      x <= input_bits_value1; // @[DecoupledGCD.scala 80:9]
    end
    if (busy) begin // @[DecoupledGCD.scala 55:15]
      if (!(x > y)) begin // @[DecoupledGCD.scala 56:17]
        y <= _y_T_1; // @[DecoupledGCD.scala 59:9]
      end
    end else if (input_valid) begin // @[DecoupledGCD.scala 78:23]
      y <= input_bits_value2; // @[DecoupledGCD.scala 81:9]
    end
    if (reset) begin // @[DecoupledGCD.scala 48:28]
      busy <= 1'h0; // @[DecoupledGCD.scala 48:28]
    end else if (busy) begin // @[DecoupledGCD.scala 55:15]
      if (x == 32'h0 | y == 32'h0) begin // @[DecoupledGCD.scala 61:34]
        if (output_ready & resultValid) begin // @[DecoupledGCD.scala 72:41]
          busy <= 1'h0; // @[DecoupledGCD.scala 73:14]
        end
      end
    end else begin
      busy <= _GEN_15;
    end
    if (reset) begin // @[DecoupledGCD.scala 49:28]
      resultValid <= 1'h0; // @[DecoupledGCD.scala 49:28]
    end else if (busy) begin // @[DecoupledGCD.scala 55:15]
      if (x == 32'h0 | y == 32'h0) begin // @[DecoupledGCD.scala 61:34]
        if (output_ready & resultValid) begin // @[DecoupledGCD.scala 72:41]
          resultValid <= 1'h0; // @[DecoupledGCD.scala 74:21]
        end else begin
          resultValid <= 1'h1; // @[DecoupledGCD.scala 70:19]
        end
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
  xInitial = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  yInitial = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  x = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  y = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  busy = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  resultValid = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
