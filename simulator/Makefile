TOP_NAME ?= ysyxSoCFPGA

VSRCS_DIR 	:= vsrc
CSRCS_DIR 	:= src
CINCS_DIR	:= src
OBJ_DIR 	:= obj_dir
VSRCS += $(shell find $(abspath $(VSRCS_DIR)) -name "*.v")
VSRCS += $(shell find $(abspath $(VSRCS_DIR)) -name "*.sv")
VINCS += $(shell find $(abspath $(VINCS_DIR)) -name "*.vh")
CSRCS += $(shell find $(abspath $(CSRCS_DIR)) -name "*.cpp") 
CINCS += $(shell find $(abspath $(CINCS_DIR)) -name "*.hpp") 

VERILATOR_FLAGS := -I$(VSRCS_DIR)/uart16550/rtl/
VERILATOR_FLAGS += --top $(TOP_NAME) -Wno-lint -Wno-style -Wno-UNUSED
VERILATOR_FLAGS += --trace --cc --exe --build --no-timing --timescale "1ns/1ns"
BIN 		:= $(OBJ_DIR)/V$(TOP_NAME)

CFLAGS 	:= -I$(CINCS_DIR) -Wall -Wextra -D$(TOP_NAME)
LDFLAGS := 

ARGS 	?=

all: bin

bin: $(CSRCS) $(VSRCS) $(CINCS) $(VINCS)
	verilator $(VERILATOR_FLAGS) $(CSRCS) $(VSRCS) \
	$(addprefix -CFLAGS , $(CFLAGS)) \
	$(addprefix -LDFLAGS , $(LDFLAGS))

run: bin
	@$(BIN) $(ARGS)

clean:
	rm -rf $(OBJ_DIR)

.PHONY:clean
