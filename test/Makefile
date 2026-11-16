# Makefile
# See https://docs.cocotb.org/en/stable/quickstart.html for more info
#
# Changed from Tiny Tapeout's template only in PROJECT_SOURCES and COCOTB_TEST_MODULES, which
# already list every slot, so claiming a slot doesn't change this file.

# defaults
SIM ?= icarus
FST ?= -fst # Use more efficient FST format
TOPLEVEL_LANG ?= verilog
SRC_DIR = $(PWD)/../src
PROJECT_SOURCES = project.v slot_uo0.v slot_uo1.v slot_uo2.v slot_uo3.v slot_uo4.v slot_uo5.v slot_uo6.v slot_uo7.v slot_uio0.v slot_uio1.v slot_uio2.v slot_uio3.v slot_uio4.v slot_uio5.v slot_uio6.v slot_uio7.v

ifneq ($(GATES),yes)

# RTL simulation:
SIM_BUILD				= sim_build/rtl
VERILOG_SOURCES += $(addprefix $(SRC_DIR)/,$(PROJECT_SOURCES))

else

# Gate level simulation:
SIM_BUILD				= sim_build/gl
COMPILE_ARGS    += -DGL_TEST
COMPILE_ARGS    += -DFUNCTIONAL
COMPILE_ARGS    += -DUSE_POWER_PINS
COMPILE_ARGS    += -DSIM
COMPILE_ARGS    += -DUNIT_DELAY=\#1
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += $(PDK_ROOT)/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v

# this gets copied in by the GDS action workflow
VERILOG_SOURCES += $(PWD)/gate_level_netlist.v

endif

# Allow sharing configuration between design and testbench via `include`:
COMPILE_ARGS 		+= -I$(SRC_DIR)

# Include the testbench sources:
VERILOG_SOURCES += $(PWD)/tb.v
TOPLEVEL = tb

# One test module per slot, test/test_<pin>.py:
COCOTB_TEST_MODULES = test_uo0,test_uo1,test_uo2,test_uo3,test_uo4,test_uo5,test_uo6,test_uo7,test_uio0,test_uio1,test_uio2,test_uio3,test_uio4,test_uio5,test_uio6,test_uio7

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
