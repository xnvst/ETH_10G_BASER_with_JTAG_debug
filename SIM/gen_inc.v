 // ___________________________________________________________________________
 //		Generator registers
 // ___________________________________________________________________________

 parameter NUMPKTS 	= BASE_ADDR_GEN + 32'h0000; 	//'h0;
 parameter RANDOMLENGTH = BASE_ADDR_GEN + 32'h0004; 	//'h1;
 parameter RANDOMPAYLOAD= BASE_ADDR_GEN + 32'h0008; 	//'h2;
 parameter START 	= BASE_ADDR_GEN + 32'h000C; 	//'h3;
 parameter STOP 	= BASE_ADDR_GEN + 32'h0010; 	//'h4;
 parameter MACSA0 	= BASE_ADDR_GEN + 32'h0014; 	//'h5;
 parameter MACSA1 	= BASE_ADDR_GEN + 32'h0018; 	//'h6;
 parameter MACDA0 	= BASE_ADDR_GEN + 32'h001C; 	//'h7;
 parameter MACDA1 	= BASE_ADDR_GEN + 32'h0020; 	//'h8;
 parameter TXPKTCNT 	= BASE_ADDR_GEN + 32'h0024; 	//'h9;
 parameter RNDSEED0 	= BASE_ADDR_GEN + 32'h0028; 	//'ha;
 parameter RNDSEED1 	= BASE_ADDR_GEN + 32'h002C; 	//'hb;
 parameter RNDSEED2 	= BASE_ADDR_GEN + 32'h0030; 	//'hc;
 parameter PKTLENGTH 	= BASE_ADDR_GEN + 32'h0034; 	//'hd;

 parameter CNTDASA	= BASE_ADDR_GEN + 32'hf0;
 parameter CNTSATLEN	= BASE_ADDR_GEN + 32'hf1;
 parameter CNTDATA	= BASE_ADDR_GEN + 32'hf2;
 parameter CNTTRNSTN	= BASE_ADDR_GEN + 32'hf3;
 // ___________________________________________________________________________

 task SETGEN_PAYLOADRANDOM; 
     begin
       $display ("=================================================\n");
       $display (" Setting Random Payload Bytes \n");
       $display (" ------------------------------------------------ n");
      `AVMM.write(RANDOMPAYLOAD,32'd1); 
     end
  endtask

 task SETGEN_PKTLENGTH; 
     input[13:0] length;
     begin
       $display ("=================================================\n");
       $display (" Setting (max) Packet Length Bytes \n");
       $display (" ------------------------------------------------ n");
      `AVMM.write(PKTLENGTH,{18'd0, length}); 
     end
  endtask

 task SETGEN_LENGTHRANDOM; 
     begin
       $display (" Setting Random packet length \n");
       $display ("=================================================\n");
      `AVMM.write(RANDOMLENGTH,32'd1); 
     end
  endtask

 task SETGEN_START; 
     begin
       $display (" Starting Packet Generator at Time %t\n",$time);
       $display ("=================================================\n");
      `AVMM.write(START, 32'd01); 
     end
  endtask

 task SETGEN_STOP; 
     begin
       $display (" STOPING [user requested] Packet Generator at Time %t\n",$time);
       $display ("=================================================\n");
      `AVMM.write(STOP, 32'd01); 
     end
  endtask

 task SETGEN_NUMPKTS; 
     input[31:0] value;
     begin
       $display (" Generator: Setting Number of Packets to be Transmitted: %d \n",value);
       $display ("=================================================\n");
      `AVMM.write(NUMPKTS, value[31:0]); 
     end
  endtask

 task SETGEN_DST_ADDR; 
     input[47:0] value;
     begin
       $display (" Generator: Setting DESTINATION ADDRESS \n");
       $display ("=================================================\n");
      `AVMM.write(MACDA0, value[31:0]); 
      `AVMM.write(MACDA1, {16'd0,value[47:32]}); 
     end
  endtask

 task SETGEN_SRC_ADDR; 
     input[47:0] value;
     begin
       $display (" Generator: Setting MAC DESTINATION ADDRESS \n");
       $display ("=================================================\n");
      `AVMM.write(MACSA0, value[31:0]); 
      `AVMM.write(MACSA1, {16'd0,value[47:32]}); 
     end
  endtask

 // __________________________________________________________________________________________
 // 

 task CONFIG_BURST_PKT_SIZE_FIXED; 
     input[15:0] number;
     input[15:0] size;
     begin
       $display ("======================================================================\n");
       $display (" Configurating Generated Traffic Pattern - Fixed bytes and pkt size\n");
       $display ("======================================================================\n");
      `AVMM.write(MACDA1, {16'd0,16'hC5C4}); 
      `AVMM.write(MACDA0, 32'hC3C2C1C0); 
      `AVMM.write(MACSA1, {16'd0,16'hF5F4}); 
      `AVMM.write(MACSA0, 32'hF3F2F1F0); 
      `AVMM.write(NUMPKTS,number); 
      `AVMM.write(PKTLENGTH,{18'd0, size}); 
      `AVMM.write(RANDOMPAYLOAD,32'd0); 
      `AVMM.write(RANDOMLENGTH,32'd0); 
     end
  endtask

 task CONFIG_BURST_PKT_SIZE_RANDOM; 
     input[15:0] number;
     input[15:0] size;
     begin
       $display ("======================================================================\n");
       $display (" Configurating Generated Traffic Pattern - Random bytes and pkt size\n");
       $display ("======================================================================\n");
      `AVMM.write(MACDA1, {16'd0,16'hC5C4}); 
      `AVMM.write(MACDA0, 32'hC3C2C1C0); 
      `AVMM.write(MACSA1, {16'd0,16'hF5F4}); 
      `AVMM.write(MACSA0, 32'hF3F2F1F0); 
      `AVMM.write(NUMPKTS,number); 
      `AVMM.write(PKTLENGTH,{18'd0, size}); 
      `AVMM.write(RANDOMPAYLOAD,32'd1); 
      `AVMM.write(RANDOMLENGTH,32'd1); 
     end
  endtask




