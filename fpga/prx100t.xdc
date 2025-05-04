set_property -dict { PACKAGE_PIN U22    IOSTANDARD LVCMOS33 } [get_ports { CLK_50M }];
create_clock -period 20.000 -name CLK -waveform {0.000 10.000} [get_ports CLK_50M]  # 50MHz
#set_property -dict { PACKAGE_PIN D18    IOSTANDARD LVCMOS33 } [get_ports { CLK_32K }];
#create_clock -period 20.000 -name CLK -waveform {0.000 10.000} [get_ports CLK_32K]  # 32.768KHz

set_property -dict { PACKAGE_PIN M4    IOSTANDARD LVCMOS33 } [get_ports { CPU_RESETN }]; # MENU

# LED
set_property -dict { PACKAGE_PIN N17    IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
set_property -dict { PACKAGE_PIN M19    IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
set_property -dict { PACKAGE_PIN P16    IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
set_property -dict { PACKAGE_PIN N16    IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];
set_property -dict { PACKAGE_PIN N19    IOSTANDARD LVCMOS33 } [get_ports { LED[4] }];
set_property -dict { PACKAGE_PIN P19    IOSTANDARD LVCMOS33 } [get_ports { LED[5] }];
set_property -dict { PACKAGE_PIN N24    IOSTANDARD LVCMOS33 } [get_ports { LED[6] }];
set_property -dict { PACKAGE_PIN N23    IOSTANDARD LVCMOS33 } [get_ports { LED[7] }];

#Buttons
#set_property -dict { PACKAGE_PIN M4     IOSTANDARD LVCMOS33 } [get_ports { MENU }];
#set_property -dict { PACKAGE_PIN L4     IOSTANDARD LVCMOS33 } [get_ports { UP }];
#set_property -dict { PACKAGE_PIN L5     IOSTANDARD LVCMOS33 } [get_ports { RETURN }];
#set_property -dict { PACKAGE_PIN K5     IOSTANDARD LVCMOS33 } [get_ports { LEFT }];
#set_property -dict { PACKAGE_PIN R1     IOSTANDARD LVCMOS33 } [get_ports { OK }];
#set_property -dict { PACKAGE_PIN P1     IOSTANDARD LVCMOS33 } [get_ports { RIGHT }];
#set_property -dict { PACKAGE_PIN R7     IOSTANDARD LVCMOS33 } [get_ports { DOWN }];

#7 segment display
set_property -dict { PACKAGE_PIN K26    IOSTANDARD LVCMOS33 } [get_ports { SEG[0] }];
set_property -dict { PACKAGE_PIN M20    IOSTANDARD LVCMOS33 } [get_ports { SEG[1] }];
set_property -dict { PACKAGE_PIN L20    IOSTANDARD LVCMOS33 } [get_ports { SEG[2] }];
set_property -dict { PACKAGE_PIN N21    IOSTANDARD LVCMOS33 } [get_ports { SEG[3] }];
set_property -dict { PACKAGE_PIN N22    IOSTANDARD LVCMOS33 } [get_ports { SEG[4] }];
set_property -dict { PACKAGE_PIN P21    IOSTANDARD LVCMOS33 } [get_ports { SEG[5] }];
set_property -dict { PACKAGE_PIN P23    IOSTANDARD LVCMOS33 } [get_ports { SEG[6] }];
set_property -dict { PACKAGE_PIN P24    IOSTANDARD LVCMOS33 } [get_ports { SEG[7] }];
set_property -dict { PACKAGE_PIN R16    IOSTANDARD LVCMOS33 } [get_ports { AN[5] }];
set_property -dict { PACKAGE_PIN R17    IOSTANDARD LVCMOS33 } [get_ports { AN[4] }];
set_property -dict { PACKAGE_PIN N18    IOSTANDARD LVCMOS33 } [get_ports { AN[3] }];
set_property -dict { PACKAGE_PIN K25    IOSTANDARD LVCMOS33 } [get_ports { AN[2] }];
set_property -dict { PACKAGE_PIN R25    IOSTANDARD LVCMOS33 } [get_ports { AN[1] }];
set_property -dict { PACKAGE_PIN T24    IOSTANDARD LVCMOS33 } [get_ports { AN[0] }];

#UART
set_property -dict { PACKAGE_PIN L17    IOSTANDARD LVCMOS33 } [get_ports { UART_RX }];
set_property -dict { PACKAGE_PIN L18    IOSTANDARD LVCMOS33 } [get_ports { UART_TX }];

# SRAM
set_property -dict { PACKAGE_PIN E23    IOSTANDARD LVCMOS33 } [get_ports { SRAM_ce[1] }];
set_property -dict { PACKAGE_PIN F25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_ce[0] }];
set_property -dict { PACKAGE_PIN F23    IOSTANDARD LVCMOS33 } [get_ports { SRAM_oe[1] }];
set_property -dict { PACKAGE_PIN H23    IOSTANDARD LVCMOS33 } [get_ports { SRAM_oe[0] }];
set_property -dict { PACKAGE_PIN J18    IOSTANDARD LVCMOS33 } [get_ports { SRAM_we[1] }];
set_property -dict { PACKAGE_PIN L19    IOSTANDARD LVCMOS33 } [get_ports { SRAM_we[0] }];
set_property -dict { PACKAGE_PIN K20    IOSTANDARD LVCMOS33 } [get_ports { SRAM_lb[1] }];
set_property -dict { PACKAGE_PIN G26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_lb[0] }];
set_property -dict { PACKAGE_PIN F24    IOSTANDARD LVCMOS33 } [get_ports { SRAM_ub[1] }];
set_property -dict { PACKAGE_PIN H24    IOSTANDARD LVCMOS33 } [get_ports { SRAM_ub[0] }];

set_property -dict { PACKAGE_PIN E26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[0] }];
set_property -dict { PACKAGE_PIN E25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[1] }];
set_property -dict { PACKAGE_PIN D26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[2] }];
set_property -dict { PACKAGE_PIN D25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[3] }];
set_property -dict { PACKAGE_PIN G22    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[4] }];
set_property -dict { PACKAGE_PIN H18    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[5] }];
set_property -dict { PACKAGE_PIN M15    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[6] }];
set_property -dict { PACKAGE_PIN M16    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[7] }];
set_property -dict { PACKAGE_PIN L15    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[8] }];
set_property -dict { PACKAGE_PIN K23    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[9] }];
set_property -dict { PACKAGE_PIN J25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[10] }];
set_property -dict { PACKAGE_PIN K22    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[11] }];
set_property -dict { PACKAGE_PIN H26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[12] }];
set_property -dict { PACKAGE_PIN J26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[13] }];
set_property -dict { PACKAGE_PIN J24    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[14] }];
set_property -dict { PACKAGE_PIN G25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[15] }];
set_property -dict { PACKAGE_PIN G24    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[16] }];
set_property -dict { PACKAGE_PIN J21    IOSTANDARD LVCMOS33 } [get_ports { SRAM_addr[17] }];

set_property -dict { PACKAGE_PIN U21    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[0] }];
set_property -dict { PACKAGE_PIN U25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[1] }];
set_property -dict { PACKAGE_PIN W26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[2] }];
set_property -dict { PACKAGE_PIN Y26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[3] }];
set_property -dict { PACKAGE_PIN AA25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[4] }];
set_property -dict { PACKAGE_PIN AB26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[5] }];
set_property -dict { PACKAGE_PIN AA24    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[6] }];
set_property -dict { PACKAGE_PIN AB24    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[7] }];
set_property -dict { PACKAGE_PIN AC24    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[8] }];
set_property -dict { PACKAGE_PIN AC26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[9] }];
set_property -dict { PACKAGE_PIN AB25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[10] }];
set_property -dict { PACKAGE_PIN Y23    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[11] }];
set_property -dict { PACKAGE_PIN Y25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[12] }];
set_property -dict { PACKAGE_PIN W25    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[13] }];
set_property -dict { PACKAGE_PIN V26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[14] }];
set_property -dict { PACKAGE_PIN U26    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[15] }];
set_property -dict { PACKAGE_PIN T14    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[16] }];
set_property -dict { PACKAGE_PIN T17    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[17] }];
set_property -dict { PACKAGE_PIN W18    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[18] }];
set_property -dict { PACKAGE_PIN U17    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[19] }];
set_property -dict { PACKAGE_PIN V18    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[20] }];
set_property -dict { PACKAGE_PIN T18    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[21] }];
set_property -dict { PACKAGE_PIN W19    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[22] }];
set_property -dict { PACKAGE_PIN T19    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[23] }];
set_property -dict { PACKAGE_PIN W21    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[24] }];
set_property -dict { PACKAGE_PIN Y22    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[25] }];
set_property -dict { PACKAGE_PIN Y21    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[26] }];
set_property -dict { PACKAGE_PIN U20    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[27] }];
set_property -dict { PACKAGE_PIN T20    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[28] }];
set_property -dict { PACKAGE_PIN W20    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[29] }];
set_property -dict { PACKAGE_PIN Y20    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[30] }];
set_property -dict { PACKAGE_PIN V19    IOSTANDARD LVCMOS33 } [get_ports { SRAM_data[31] }];

#CH9350L
#set_property -dict { PACKAGE_PIN H22    IOSTANDARD LVCMOS33 } [get_ports { CH9350_TXD }];
#set_property -dict { PACKAGE_PIN H21    IOSTANDARD LVCMOS33 } [get_ports { CH9350_RXD }];
#set_property -dict { PACKAGE_PIN M17    IOSTANDARD LVCMOS33 } [get_ports { CH9350_RST }];
