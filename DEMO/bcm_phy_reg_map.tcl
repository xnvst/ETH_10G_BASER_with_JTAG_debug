#==============================================================================
#                BroadCom PHY BCM 8727 PHY Register Address Map                
#==============================================================================

set CHIP_ID				0xC8020101

# ________________________________________________
#	XGXS registers
# ________________________________________________

# XGXS Control register bit[14]: xgxs system lpbk
# ________________________________________________
set XGXS_CONTROL 		0x00000104

# ________________________________________________
# xgxs Lane Status register
# bit[12:]: Lanes aligned
# bits[3:0]: Lanes in sync
# ________________________________________________
set XGXS_STATUS  		0x00180104


# ________________________________________________
# set bits[15:0] of RXA_LANESWAP to 11
# and bit[15] of TXA_LANESWAP to 1 for
# both directions lane swapped
# ________________________________________________
set XGXS_RXLANE_SWAP  	0x81000104
set XGXS_TXLANE_SWAP  	0x81010104

# ________________________________________________
# xgxs Mode Control
# bit[11:8] = 0000 for xgxs local loopback
# bit[6] = 1 for xgxs remote loopback
# ________________________________________________
set XGXS_MODE_CONTROL  	0x80000104


# ________________________________________________
#	PMA-PMD registers
# ________________________________________________

# ________________________________________________
#	PMA-PMD control register bit[0]: pma lpbk
#				 bit[15]: reset 
#	reset value = 0x2040
# ________________________________________________
set SFI_PMAPMD_CONTROL 	0x00000101

# ________________________________________________
#	PCS control register bit[14]: pcs system lpbk
# ________________________________________________
set SFI_PCS_CONTROL 	0x00000103