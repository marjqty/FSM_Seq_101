// testbench for seq_101_test
module testbench;

 //tb signals
  reg     in;
  reg    clk_50;
  reg  rst_n;
  
  wire   out;
  wire  [1:0] state;
  wire  clk_led;
  
  //instantiate seq_101
  seq_101 dut(
  .out(out),
  .state(state),
  .clk_led(clk_led),
  .in(in),
  .clk_50(clk_50),
  .rst_n(rst_n)
  );
  
  //apply stimuli
  initial clk_50 = 0;
  always #1 clk_50 = ~clk_50;
 
  //stimulus
  initial begin
     rst_n = 0; in = 1; #12;
     	rst_n = 1; in = 1; #8;
     	rst_n = 1; in = 0; #8;
     	rst_n = 1; in = 1; #8;
	
 
   
  end
  
endmodule
