 // ________________________________________________________________
 //	LED Control module
 // ________________________________________________________________

 module LED_CONTROL 
        #(parameter INWIDTH = 8, 
	  parameter CLKDIV = 24'd5000000) 
        (
     	  input wire reset_n,
	  input wire clk,
	  input wire sel_display,
	  input wire [INWIDTH-1:0] in ,
	  output wire[7:0] LEDHSMC_GRN,
	  output wire[7:0] LEDHSMC_RED,
	  output wire[7:0] LEDHOST_0815,
	  output wire[7:0] LEDHOST_0007
	);


	 reg[7:0] LEDHOST_0815i;
	 reg[7:0] LEDHSMC_GRNi;
	 reg[7:0] LEDHSMC_REDi;
	 reg[7:0] LEDHOST_0007i;

	 assign LEDHOST_0815   = ~LEDHOST_0815i;
	 assign LEDHSMC_GRN    = ~LEDHSMC_GRNi;
	 assign LEDHSMC_RED    = ~LEDHSMC_REDi;
	 assign LEDHOST_0007   = ~LEDHOST_0007i;

	 wire 	sel_display_tmp,
	 	tx_pma_ready_data, 
		rx_pma_ready_data, 
		tx_pma_ready, 
		rx_pma_ready,
		mon_error,
		mon_done, 
		mon_active;

	//Jier change the bit order for 10G Base R Ref Design	
	 assign {sel_display_tmp,
		tx_pma_ready_data, 
		rx_pma_ready_data,
		mon_active,
		mon_error,
		mon_done, 
		tx_pma_ready, 
		rx_pma_ready} = in;


 // clock division
 // ___________________________________________

  reg[31:0] clkcnt;
  wire clken = (clkcnt == 32'd0);
  always@(posedge clk or negedge reset_n)
    begin
      if (~reset_n) clkcnt <= 32'd0;
      else if (clkcnt == CLKDIV) clkcnt <= 32'd0; else clkcnt <= clkcnt + 32'd1;
    end
 // ___________________________________________
 //

  reg[2:0] state, next_state;
  parameter IDLE = 3'd0, PROGRESS = 3'd1, WAIT = 3'd2, PASS = 3'd3, FAIL = 3'd4;

  always@(posedge clk or negedge reset_n)
    begin
      if (~reset_n) state <= IDLE;
      else state <= next_state;
    end

  always@(*)
    begin
	next_state = state;
	case(state)
           IDLE: if (mon_active) next_state = PROGRESS;
           PROGRESS: if (mon_done) next_state = WAIT;
           WAIT: if (mon_error) next_state = FAIL; else next_state = PASS;
           PASS: if (mon_active) next_state = PROGRESS;
           FAIL: if (mon_active) next_state = PROGRESS;
	   default: next_state = state;
	endcase
    end
  
 // ___________________________________________
 //
  reg[7:0] progress, attention, pass, fail;
  always@(posedge clk or negedge reset_n)
    begin
      if (~reset_n) begin
	 progress <= 8'h7f;
	 attention <= 8'd0;
	 pass <= 8'hff;
	 fail <= 8'h00;
      end
      else if (clken) begin
	 progress <= {progress[0], progress[7:1]}; 
	 attention <= ~attention;
	 pass <= 8'hff;
	 fail <= 8'h00;
      end
    end
 // ___________________________________________
 //

 wire[7:0] progress_reverse = {progress[0], progress[1], progress[2], progress[3], 
	   progress[4], progress[5], progress[6], progress[7]};
 always@(*)
   begin
	LEDHOST_0007i = 8'd0;
	LEDHSMC_REDi = 8'd0;
	LEDHSMC_GRNi = 8'd0;
	LEDHOST_0815i = in;
	case(state)
           IDLE: begin LEDHOST_0007i = 8'd0; LEDHSMC_REDi = 8'd0; LEDHSMC_GRNi = 8'd0; end 
           PASS: begin LEDHOST_0007i = pass; LEDHSMC_REDi = 8'd0; LEDHSMC_GRNi = pass; end
           FAIL: begin LEDHOST_0007i = fail; LEDHSMC_REDi = 8'hff; LEDHSMC_GRNi = 8'd0; end
           WAIT: begin LEDHOST_0007i = attention; LEDHSMC_REDi = attention; LEDHSMC_GRNi = attention; end
           PROGRESS: begin LEDHOST_0007i = progress; LEDHSMC_REDi = ~progress; LEDHSMC_GRNi = progress_reverse; end
	   default: LEDHOST_0815i = in;
	endcase
    end
  
 // ___________________________________________
 
 endmodule


