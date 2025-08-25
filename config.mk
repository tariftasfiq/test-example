export DESIGN_NICKNAME = picosoc
export DESIGN_NAME = picosoc_with_pads
export PLATFORM    = ihp-sg13g2

export SRAM_DIRECTORY = /home/khalid/IHP-Open-PDK/ihp-sg13g2/libs.ref/sg13g2_sram

# ---- RTL source list (explicit order) -------------------------------
export VERILOG_FILES = \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/verilog/picosoc_with_less_pad.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/verilog/picosoc.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/verilog/picorv32.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/verilog/simpleuart.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/verilog/spimemio.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/verilog/sp_ram_512.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/verilog/RM_IHPSG13_1P_512x32_c2_bm_bist.v


export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# SRAM

export ADDITIONAL_LEFS += $(SRAM_DIRECTORY)/lef/RM_IHPSG13_1P_512x32_c2_bm_bist.lef
export GDS_FILES       += $(SRAM_DIRECTORY)/gds/RM_IHPSG13_1P_512x32_c2_bm_bist.gds


# IO Pad
export FOOTPRINT_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/less_pad.tcl

export USE_FILL 1

export DIE_AREA = 0.0 0.0 1700.0 1700.0
export CORE_AREA = 340.0 340.0 1360.0 1360.0


export MAX_ROUTING_LAYER = TopMetal2
export PLACE_DENSITY = 0.7
export MACRO_PLACE_HALO = 40 40
export MACRO_PLACEMENT =$(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/macro.cfg
#export CORNERS = slow fast
#export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100
export CTS_BUF_DISTANCE = 60
export SYNTH_MEMORY_MAX_BITS = 16384
