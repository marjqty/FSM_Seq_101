/*======================================
            SEQUENCE 101
========================================
Description: 
 This Moore FSM detects the non-overlapping
 sequence 101, assuming the input stream
 arrives LSB-first.
 
Design Engineer:
 Yuzon, Maria Rebekah J.
 
Date: 
 31 March 2026
----------------------------------------*/
module seq_101(out, state, clk_led, in, clk_50, rst_n);
 //ports
 input               in;
 input              clk_50;
 input            rst_n;
 output reg         out;
 output reg [1:0] state;
 output         clk_led;
 
 //3seconds_clock
   wire clk;
   clk_div #(.TICKS_1500MS(75_000_000)) div(
   .clk_out(clk),
   .clk_led(clk_led),
   .clk_in(clk_50)
  );
 
 //state assignment
 parameter [1:0] S0 = 2'b00;
 parameter [1:0] S1 = 2'b01;
 parameter [1:0] S2 = 2'b10;
 parameter [1:0] S3 = 2'b11;
 reg [1:0] nxt;
 reg [1:0] pre;
 
 //input block
 always @(in,pre) begin
	case(pre)
		S0: nxt = in? S1:S0;
		S1: nxt = in? S1:S2;
		S2: nxt = in? S3:S0;
		S3: nxt = in? S1:S0;
		default: nxt = S0;
	endcase
 
 end
 
 //sequential block
 always @(posedge clk, negedge rst_n) begin
	if(!rst_n) pre <= S0;
	else       pre <= nxt;	
 end
 
 //output block
 always @(pre) begin
	case(pre)
		S0: begin 
				out = 0;
				state = S0;
		    end
		S1: begin 
				out = 0;
				state = S1;
		    end	
		S2: begin 
				out = 0;
				state = S2;
		    end	

		S3: begin 
				out = 1;
				state = S3;
		    end	

		default: begin 
						out = 0;
						state = S0;
					end	

	endcase
 end

endmodule

