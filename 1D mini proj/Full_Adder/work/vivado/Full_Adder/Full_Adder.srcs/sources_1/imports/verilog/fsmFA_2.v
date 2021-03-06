/*
   This file was generated automatically by Alchitry Labs version 1.2.0.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module fsmFA_2 (
    input clk,
    input rst,
    output reg a,
    output reg b,
    output reg c
  );
  
  
  
  wire [1-1:0] M_slowclock_value;
  counter_3 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  
  
  localparam A0_state = 3'd0;
  localparam A1_state = 3'd1;
  localparam A2_state = 3'd2;
  localparam A3_state = 3'd3;
  localparam A4_state = 3'd4;
  localparam A5_state = 3'd5;
  localparam A6_state = 3'd6;
  localparam A7_state = 3'd7;
  
  reg [2:0] M_state_d, M_state_q = A0_state;
  
  wire [1-1:0] M_slowClockEdge_out;
  reg [1-1:0] M_slowClockEdge_in;
  edge_detector_4 slowClockEdge (
    .clk(clk),
    .in(M_slowClockEdge_in),
    .out(M_slowClockEdge_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    
    M_slowClockEdge_in = M_slowclock_value;
    M_state_d = M_state_q;
    a = 1'h0;
    b = 1'h0;
    c = 1'h0;
    
    case (M_state_q)
      A0_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A1_state;
        end
        a = 1'h0;
        b = 1'h0;
        c = 1'h1;
      end
      A1_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A2_state;
        end
        a = 1'h0;
        b = 1'h1;
        c = 1'h0;
      end
      A2_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A3_state;
        end
        a = 1'h0;
        b = 1'h1;
        c = 1'h1;
      end
      A3_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A4_state;
        end
        a = 1'h1;
        b = 1'h0;
        c = 1'h0;
      end
      A4_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A5_state;
        end
        a = 1'h1;
        b = 1'h0;
        c = 1'h1;
      end
      A5_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A6_state;
        end
        a = 1'h1;
        b = 1'h1;
        c = 1'h0;
      end
      A6_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A7_state;
        end
        a = 1'h1;
        b = 1'h1;
        c = 1'h1;
      end
      A7_state: begin
        if (M_slowClockEdge_out == 1'h1) begin
          M_state_d = A0_state;
        end
        a = 1'h0;
        b = 1'h0;
        c = 1'h0;
      end
    endcase
  end
  
  always @(posedge M_slowclock_value) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
