set_property -dict { PACKAGE_PIN U22    IOSTANDARD LVCMOS33 } [get_ports { CLK_50M }];
create_clock -period 20.000 -name CLK -waveform {0.000 10.000} [get_ports CLK_50M]  # 50MHz
#set_property -dict { PACKAGE_PIN D18    IOSTANDARD LVCMOS33 } [get_ports { CLK_32K }];
#create_clock -period 20.000 -name CLK -waveform {0.000 10.000} [get_ports CLK_32K]  # 32.768KHz

set_property -dict { PACKAGE_PIN L19    IOSTANDARD LVCMOS33 } [get_ports { CPU_RESETN }];

# LED
#set_property -dict { PACKAGE_PIN N17    IOSTANDARD LVCMOS33 } [get_ports { LED[0] }];
#set_property -dict { PACKAGE_PIN M19    IOSTANDARD LVCMOS33 } [get_ports { LED[1] }];
#set_property -dict { PACKAGE_PIN P16    IOSTANDARD LVCMOS33 } [get_ports { LED[2] }];
#set_property -dict { PACKAGE_PIN N16    IOSTANDARD LVCMOS33 } [get_ports { LED[3] }];
#set_property -dict { PACKAGE_PIN N19    IOSTANDARD LVCMOS33 } [get_ports { LED[4] }];
#set_property -dict { PACKAGE_PIN P19    IOSTANDARD LVCMOS33 } [get_ports { LED[5] }];
#set_property -dict { PACKAGE_PIN N24    IOSTANDARD LVCMOS33 } [get_ports { LED[6] }];
#set_property -dict { PACKAGE_PIN N23    IOSTANDARD LVCMOS33 } [get_ports { LED[7] }];

#Buttons
#set_property -dict { PACKAGE_PIN M4     IOSTANDARD LVCMOS33 } [get_ports { MENU }];
#set_property -dict { PACKAGE_PIN L4     IOSTANDARD LVCMOS33 } [get_ports { UP }];
#set_property -dict { PACKAGE_PIN L5     IOSTANDARD LVCMOS33 } [get_ports { RETURN }];
#set_property -dict { PACKAGE_PIN K5     IOSTANDARD LVCMOS33 } [get_ports { LEFT }];
#set_property -dict { PACKAGE_PIN R1     IOSTANDARD LVCMOS33 } [get_ports { OK }];
#set_property -dict { PACKAGE_PIN P1     IOSTANDARD LVCMOS33 } [get_ports { RIGHT }];
#set_property -dict { PACKAGE_PIN R7     IOSTANDARD LVCMOS33 } [get_ports { DOWN }];

#7 segment display
set_property -dict { PACKAGE_PIN K26    IOSTANDARD LVCMOS33 } [get_ports { CA }];
set_property -dict { PACKAGE_PIN M20    IOSTANDARD LVCMOS33 } [get_ports { CB }];
set_property -dict { PACKAGE_PIN L20    IOSTANDARD LVCMOS33 } [get_ports { CC }];
set_property -dict { PACKAGE_PIN N21    IOSTANDARD LVCMOS33 } [get_ports { CD }];
set_property -dict { PACKAGE_PIN N22    IOSTANDARD LVCMOS33 } [get_ports { CE }];
set_property -dict { PACKAGE_PIN P21    IOSTANDARD LVCMOS33 } [get_ports { CF }];
set_property -dict { PACKAGE_PIN P23    IOSTANDARD LVCMOS33 } [get_ports { CG }];
set_property -dict { PACKAGE_PIN P24    IOSTANDARD LVCMOS33 } [get_ports { DP }];
set_property -dict { PACKAGE_PIN R16    IOSTANDARD LVCMOS33 } [get_ports { AN[0] }];
set_property -dict { PACKAGE_PIN R17    IOSTANDARD LVCMOS33 } [get_ports { AN[1] }];
set_property -dict { PACKAGE_PIN N18    IOSTANDARD LVCMOS33 } [get_ports { AN[2] }];
set_property -dict { PACKAGE_PIN K25    IOSTANDARD LVCMOS33 } [get_ports { AN[3] }];
set_property -dict { PACKAGE_PIN R25    IOSTANDARD LVCMOS33 } [get_ports { AN[4] }];
set_property -dict { PACKAGE_PIN T24    IOSTANDARD LVCMOS33 } [get_ports { AN[5] }];

#UART
#set_property -dict { PACKAGE_PIN L17    IOSTANDARD LVCMOS33 } [get_ports { UART_TX }];
#set_property -dict { PACKAGE_PIN L18    IOSTANDARD LVCMOS33 } [get_ports { UART_RX }];

#CH9350L
#set_property -dict { PACKAGE_PIN H22    IOSTANDARD LVCMOS33 } [get_ports { CH9350_TXD }];
#set_property -dict { PACKAGE_PIN H21    IOSTANDARD LVCMOS33 } [get_ports { CH9350_RXD }];
#set_property -dict { PACKAGE_PIN M17    IOSTANDARD LVCMOS33 } [get_ports { CH9350_RST }];
