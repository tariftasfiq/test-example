export DESIGN_NICKNAME = picosoc
export DESIGN_NAME = picosoc_with_pads
export PLATFORM    = ihp-sg13g2

export SRAM_DIRECTORY = /home/khalid/IHP-Open-PDK/ihp-sg13g2/libs.ref/sg13g2_sram
#export IO_PAD_DIRECTORY = /home/khalid/IHP-Open-PDK/ihp-sg13g2/libs.ref/sg13g2_io

# ---- RTL source list (explicit order) -------------------------------
export VERILOG_FILES = \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/picosoc_with_less_pad.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/picosoc.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/picorv32.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/simpleuart.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/spimemio.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/sp_ram.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/sp_ram_64.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/sp_ram_512.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/RM_IHPSG13_1P_256x64_c2_bm_bist.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/RM_IHPSG13_1P_64x64_c2_bm_bist.v \
    $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/RM_IHPSG13_1P_512x32_c2_bm_bist.v

    #$(sort $(wildcard $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/src/*.v))
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# SRAM

export ADDITIONAL_LEFS += $(SRAM_DIRECTORY)/lef/RM_IHPSG13_1P_256x64_c2_bm_bist.lef
export GDS_FILES       += $(SRAM_DIRECTORY)/gds/RM_IHPSG13_1P_256x64_c2_bm_bist.gds

export ADDITIONAL_LEFS += $(SRAM_DIRECTORY)/lef/RM_IHPSG13_1P_64x64_c2_bm_bist.lef
export GDS_FILES       += $(SRAM_DIRECTORY)/gds/RM_IHPSG13_1P_64x64_c2_bm_bist.gds

export ADDITIONAL_LEFS += $(SRAM_DIRECTORY)/lef/RM_IHPSG13_1P_512x32_c2_bm_bist.lef
export GDS_FILES       += $(SRAM_DIRECTORY)/gds/RM_IHPSG13_1P_512x32_c2_bm_bist.gds


# IO Pad
export FOOTPRINT_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/less_pad.tcl

export USE_FILL 1

export DIE_AREA = 0.0 0.0 1470.0 1470.0
export CORE_AREA = 340.0 340.0 1130.0 1130.0


export MAX_ROUTING_LAYER = TopMetal2
export PLACE_DENSITY = 0.7
export MACRO_PLACE_HALO = 20 20
#export CORE_UTILIZATION = 20
export MACRO_PLACEMENT =$(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/macro.cfg
export CORNERS = slow fast
#export PLACE_DENSITY_LB_ADDON = 0.2
export TNS_END_PERCENT = 100
export CTS_BUF_DISTANCE = 60
export SYNTH_MEMORY_MAX_BITS = 16384
