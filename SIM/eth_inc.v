 // ___________________________________________________________________________
 //		MAC registers
 // ___________________________________________________________________________
    parameter	addr_rx_frame_addr_0    = 32'h2008 ;
    parameter	addr_rx_frame_addr_1    = 32'h200C ;
    parameter	addr_rx_frame_maxlength = 32'h2004 ;
    
    parameter	addr_rx_frame_spaddr0_0 = 32'h2010 ;
    parameter	addr_rx_frame_spaddr0_1 = 32'h2014 ;
    parameter	addr_rx_frame_spaddr1_0 = 32'h2018 ;
    parameter	addr_rx_frame_spaddr1_1 = 32'h201C ;
    parameter	addr_rx_frame_spaddr2_0 = 32'h2020 ;
    parameter	addr_rx_frame_spaddr2_1 = 32'h2024 ;
    parameter	addr_rx_frame_spaddr3_0 = 32'h2028 ;
    parameter	addr_rx_frame_spaddr3_1 = 32'h202C ;

 // Register to enable pad and crc stripping in the Receive
    parameter	addr_rx_padcrc_ctrl    = 32'h100 ;

    // Control register for source address insertion on TX path
    parameter TX_ADDRESS_INSERT_CONTROL_ADDR                    = 32'h4800;
    
    // Unicast address for source address insertion on TX path
    parameter TX_ADDRESS_INSERT_UCAST_MAC_ADD_0_ADDR            = 32'h4804;
    parameter TX_ADDRESS_INSERT_UCAST_MAC_ADD_1_ADDR            = 32'h4808;
    
    // statistics registers  	
    parameter RX_STATISTICS_ADDR                                = 32'h3000;
    parameter TX_STATISTICS_ADDR                                = 32'h7000;
    
    parameter RX_FIFO_DROP_ON_ERROR_ADDR                        = 32'h104;	
    parameter MAC_LOCAL_LOOPBACK_ADDR                           = 32'h0008;	
    
    parameter MDIO_ADDR_REGISTER                             	= 32'h10084; //MDIO base address + 0x84
    parameter MDIO_DATA_REGISTER                             	= 32'h10080; //MDIO base address + 0x80 
    
    parameter phy_powerdown_addr                           		= 32'h00084;
    
    
    // ******************************************************************************************
    // Registers Offset of MAC
    // ******************************************************************************************
    // ------------------------------------------------------------------------------------------
    // Statistics
    // ------------------------------------------------------------------------------------------
    /* lksim commented out 
    parameter STATISTICS_framesOK_OFFSET                        = 32'h008;
    parameter STATISTICS_framesErr_OFFSET                       = 32'h010;
    parameter STATISTICS_framesCRCErr_OFFSET                    = 32'h018;
    parameter STATISTICS_octetsOK_OFFSET                        = 32'h020;
    parameter STATISTICS_pauseMACCtrlFrames_OFFSET              = 32'h028;
    parameter STATISTICS_ifErrors_OFFSET                        = 32'h030;
    parameter STATISTICS_unicastFramesOK_OFFSET                 = 32'h038;
    parameter STATISTICS_unicastFramesErr_OFFSET                = 32'h040;
    parameter STATISTICS_multicastFramesOK_OFFSET               = 32'h048;
    parameter STATISTICS_multicastFramesErr_OFFSET              = 32'h050;
    parameter STATISTICS_broadcastFramesOK_OFFSET               = 32'h058;
    parameter STATISTICS_broadcastFramesErr_OFFSET              = 32'h060;
    parameter STATISTICS_etherStatsOctets_OFFSET                = 32'h068;
    parameter STATISTICS_etherStatsPkts_OFFSET                  = 32'h070;
    parameter STATISTICS_etherStatsUndersizePkts_OFFSET         = 32'h078;
    parameter STATISTICS_etherStatsOversizePkts_OFFSET          = 32'h080;
    parameter STATISTICS_etherStatsPkts64Octets_OFFSET          = 32'h088;
    parameter STATISTICS_etherStatsPkts65to127Octets_OFFSET     = 32'h090;
    parameter STATISTICS_etherStatsPkts128to255Octets_OFFSET    = 32'h098;
    parameter STATISTICS_etherStatsPkts256to511Octets_OFFSET    = 32'h0A0;
    parameter STATISTICS_etherStatsPkts512to1023Octets_OFFSET   = 32'h0A8;
    parameter STATISTICS_etherStatPkts1024to1518Octets_OFFSET   = 32'h0B0;
    parameter STATISTICS_etherStatsPkts1519toXOctets_OFFSET     = 32'h0B8;
    parameter STATISTICS_etherStatsFragments_OFFSET             = 32'h0C0;
    parameter STATISTICS_etherStatsJabbers_OFFSET               = 32'h0C8;
    parameter STATISTICS_etherStatsCRCErr_OFFSET                = 32'h0D0;
    parameter STATISTICS_unicastMACCtrlFrames_OFFSET            = 32'h0D8;
    parameter STATISTICS_multicastMACCtrlFrames_OFFSET          = 32'h0E0;
    parameter STATISTICS_broadcastMACCtrlFrames_OFFSET          = 32'h0E8;
    */

 // _______________________________________________________________________________________________
 //	Absolute Register Addresses for Ethernet System
 // _______________________________________________________________________________________________

  parameter	MAC_PRIMADDR_0 		= BASE_ADDR_ETH10G + addr_rx_frame_addr_0;
  parameter	MAC_PRIMADDR_1 		= BASE_ADDR_ETH10G + addr_rx_frame_addr_1;

  parameter	MAC_SUP0ADDR_0 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr0_0;
  parameter	MAC_SUP0ADDR_1 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr0_1;

  parameter	MAC_SUP1ADDR_0 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr1_0;
  parameter	MAC_SUP1ADDR_1 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr1_1;

  parameter	MAC_SUP2ADDR_0 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr2_0;
  parameter	MAC_SUP2ADDR_1 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr2_1;

  parameter	MAC_SUP3ADDR_0 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr3_0;
  parameter	MAC_SUP3ADDR_1 		= BASE_ADDR_ETH10G + addr_rx_frame_spaddr3_1;

  parameter	MAC_RX_PADCRC_CTRL 	= BASE_ADDR_ETH10G + addr_rx_padcrc_ctrl;
  
  parameter	MAC_LOCAL_LPBK 		= BASE_ADDR_XGMII_LB + MAC_LOCAL_LOOPBACK_ADDR;
  parameter MAC_RX_FIFO_DROP_ON_ERR = BASE_ADDR_10G_RX_FIFO + RX_FIFO_DROP_ON_ERROR_ADDR;
  parameter	PHY_GXB_PWRDWN 		= BASE_ADDR_PHY_IP + phy_powerdown_addr;
 // ___________________________________________________________________________


 task SETMAC_PRIMARY_ADDR;
     input[47:0] value;
     begin
       $display (" setting MAC primary address registers \n");
      `AVMM.write(MAC_PRIMADDR_1, {16'd0,value[47:32]}); 
      `AVMM.write(MAC_PRIMADDR_0, value[31:0]); 
     end
  endtask

 task CHKMAC_PRIMARY_ADDR;
     input[47:0] value;
     begin
       $display (" setting MAC primary address registers \n");
      `AVMM.read(MAC_PRIMADDR_1, {16'd0,value[47:32]}); 
      `AVMM.read(MAC_PRIMADDR_0, value[31:0]); 
     end
  endtask

 // ______________________________________________________
 // 

 task SETMAC_STRIP_RX_PADCRC;
     begin
       $display (" Enabling Stripping of PAD and CRC in Rx MAC \n");
      `AVMM.write(MAC_RX_PADCRC_CTRL, 32'd3); 
     end
  endtask

 task CHKMAC_STRIP_RX_PADCRC;
     input[32:0] value;
     begin
       $display (" Reading Stripping of PAD and CRC Setting in Rx MAC \n");
      `AVMM.read(MAC_RX_PADCRC_CTRL, value[31:0]); 
     end
  endtask

 // ______________________________________________________
 // ______________________________________________________
 // 

 task SETMAC_LOCAL_LPBK_ENA;
     begin
       $display (" Enabling Local Loopback at XGMII interface \n");
      `AVMM.write(MAC_LOCAL_LPBK, 32'd1); 
     end
  endtask

 task CHKMAC_LOCAL_LPBK_ENA;
     input[32:0] value;
     begin
       $display (" setting MAC primary address registers \n");
      `AVMM.read(MAC_LOCAL_LPBK, value[31:0]); 
     end
  endtask

 // ______________________________________________________
 // 

 task SETMAC_SECONDARY_ADDR;
     input[1:0]  number;
     input[47:0] value;
     begin
       $display (" Setting %h as %dth MAC primary address registers\n", value, number);
	if (number === 2'd0)
		begin
      		`AVMM.write(MAC_SUP0ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.write(MAC_SUP0ADDR_0, value[31:0]); 
		end
	else if (number === 2'd1)
		begin
      		`AVMM.write(MAC_SUP1ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.write(MAC_SUP1ADDR_0, value[31:0]); 
		end
	else if (number === 2'd2)
		begin
      		`AVMM.write(MAC_SUP2ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.write(MAC_SUP2ADDR_0, value[31:0]); 
		end
	else if (number === 2'd3)
		begin
      		`AVMM.write(MAC_SUP3ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.write(MAC_SUP3ADDR_0, value[31:0]); 
		end
     end
  endtask

 // _________________________________________________________


 task CHKMAC_SECONDARY_ADDR;
     input[1:0]  number;
     input[47:0] value;
     begin
       $display (" Setting %h as %dth MAC primary address registers\n", value, number);
	if (number === 2'd0)
		begin
      		`AVMM.read(MAC_SUP0ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.read(MAC_SUP0ADDR_0, value[31:0]); 
		end
	else if (number === 2'd1)
		begin
      		`AVMM.read(MAC_SUP1ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.read(MAC_SUP1ADDR_0, value[31:0]); 
		end
	else if (number === 2'd2)
		begin
      		`AVMM.read(MAC_SUP2ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.read(MAC_SUP2ADDR_0, value[31:0]); 
		end
	else if (number === 2'd3)
		begin
      		`AVMM.read(MAC_SUP3ADDR_1, {16'd0,value[47:32]}); 
      		`AVMM.read(MAC_SUP3ADDR_0, value[31:0]); 
		end
     end
   endtask


 // ______________________________________________________
 // 

 task SETPHY_GXB_PWRDWN;
     begin
       $display (" Powering Down PHY \n");
      `AVMM.write(PHY_GXB_PWRDWN, 32'd2); 
	#100;
      `AVMM.write(PHY_GXB_PWRDWN, 32'd0); 
     end
  endtask

 // ______________________________________________________
 // 

 task MDIO_WRITE;
     input [4:0] prt_addr;
     input [4:0] dev_addr;
     input [15:0] reg_addr;
     input [31:0] reg_wdata;
     begin
       $display (" writing data=%x to ext phy register @ portaddr=%x devaddr=%x, and regaddr=%x\n", reg_wdata, prt_addr, dev_addr, reg_addr);
      `AVMM.write(MDIO_ADDR_REGISTER, {reg_addr, 3'd0, prt_addr, 3'd0, dev_addr}); 
      `AVMM.write(MDIO_DATA_REGISTER, reg_wdata); 
     end
  endtask

 task MDIO_READ;
     input [4:0] prt_addr;
     input [4:0] dev_addr;
     input [15:0] reg_addr;
     input [31:0] exp_data;
     begin
       $display (" reading ext phy register @ portaddr=%x devaddr=%x, and regaddr=%x\n", prt_addr, dev_addr, reg_addr);
      `AVMM.write(MDIO_ADDR_REGISTER, {reg_addr, 3'd0, prt_addr, 3'd0, dev_addr}); 
      `AVMM.read(MDIO_DATA_REGISTER, exp_data); 
     end


  endtask
