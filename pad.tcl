set IO_LENGTH 180
set IO_WIDTH 80
set BONDPAD_SIZE 70
set SEALRING_OFFSET 70
set IO_OFFSET [expr { $BONDPAD_SIZE + $SEALRING_OFFSET }]

proc calc_horizontal_pad_location { index total } {
  global IO_LENGTH
  global IO_WIDTH
  global BONDPAD_SIZE
  global SEALRING_OFFSET

  set DIE_WIDTH [expr { [lindex $::env(DIE_AREA) 2] - [lindex $::env(DIE_AREA) 0] }]
  set PAD_OFFSET [expr { $IO_LENGTH + $BONDPAD_SIZE + $SEALRING_OFFSET }]
  set PAD_AREA_WIDTH [expr { $DIE_WIDTH - ($PAD_OFFSET * 2) }]
  set HORIZONTAL_PAD_DISTANCE [expr { ($PAD_AREA_WIDTH / $total) - $IO_WIDTH }]

  return [expr { $PAD_OFFSET + (($IO_WIDTH + $HORIZONTAL_PAD_DISTANCE) * $index) + ($HORIZONTAL_PAD_DISTANCE / 2) }]
}

proc calc_vertical_pad_location { index total } {
  global IO_LENGTH
  global IO_WIDTH
  global BONDPAD_SIZE
  global SEALRING_OFFSET

  set DIE_HEIGHT [expr { [lindex $::env(DIE_AREA) 3] - [lindex $::env(DIE_AREA) 1] }]
  set PAD_OFFSET [expr { $IO_LENGTH + $BONDPAD_SIZE + $SEALRING_OFFSET }]
  set PAD_AREA_HEIGHT [expr { $DIE_HEIGHT - ($PAD_OFFSET * 2) }]
  set VERTICAL_PAD_DISTANCE [expr { ($PAD_AREA_HEIGHT / $total) - $IO_WIDTH }]

  return [expr { $PAD_OFFSET + (($IO_WIDTH + $VERTICAL_PAD_DISTANCE) * $index) + ($VERTICAL_PAD_DISTANCE / 2) }]
}

make_fake_io_site -name IOLibSite -width 1 -height $IO_LENGTH
make_fake_io_site -name IOLibCSite -width $IO_LENGTH -height $IO_LENGTH

set IO_OFFSET [expr { $BONDPAD_SIZE + $SEALRING_OFFSET }]
# Create IO Rows
make_io_sites \
  -horizontal_site IOLibSite \
  -vertical_site IOLibSite \
  -corner_site IOLibCSite \
  -offset $IO_OFFSET
# =============================================
# PAD PLACEMENT
# =============================================

# === SOUTH SIDE (32 pads) ===
# Input pads (11)
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 0 31] {sg13g2_IOPadIn_clk} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 1 31] {sg13g2_IOPadIn_resetn} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 2 31] {sg13g2_IOPadIn_irq_5} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 3 31] {sg13g2_IOPadIn_irq_6} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 4 31] {sg13g2_IOPadIn_irq_7} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 5 31] {sg13g2_IOPadIn_ser_rx} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 6 31] {sg13g2_IOPadIn_flash_io0_di} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 7 31] {sg13g2_IOPadIn_flash_io1_di} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 8 31] {sg13g2_IOPadIn_flash_io2_di} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 9 31] {sg13g2_IOPadIn_flash_io3_di} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 10 31] {sg13g2_IOPadIn_iomem_ready} -master sg13g2_IOPadIn

# iomem_rdata pads (21)
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 11 31] {sg13g2_IOPadIn_iomem_rdata_0} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 12 31] {sg13g2_IOPadIn_iomem_rdata_1} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 13 31] {sg13g2_IOPadIn_iomem_rdata_2} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 14 31] {sg13g2_IOPadIn_iomem_rdata_3} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 15 31] {sg13g2_IOPadIn_iomem_rdata_4} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 16 31] {sg13g2_IOPadIn_iomem_rdata_5} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 17 31] {sg13g2_IOPadIn_iomem_rdata_6} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 18 31] {sg13g2_IOPadIn_iomem_rdata_7} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 19 31] {sg13g2_IOPadIn_iomem_rdata_8} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 20 31] {sg13g2_IOPadIn_iomem_rdata_9} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 21 31] {sg13g2_IOPadIn_iomem_rdata_10} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 22 31] {sg13g2_IOPadIn_iomem_rdata_11} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 23 31] {sg13g2_IOPadIn_iomem_rdata_12} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 24 31] {sg13g2_IOPadIn_iomem_rdata_13} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 25 31] {sg13g2_IOPadIn_iomem_rdata_14} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 26 31] {sg13g2_IOPadIn_iomem_rdata_15} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 27 31] {sg13g2_IOPadIn_iomem_rdata_16} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 28 31] {sg13g2_IOPadIn_iomem_rdata_17} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 29 31] {sg13g2_IOPadIn_iomem_rdata_18} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 30 31] {sg13g2_IOPadIn_iomem_rdata_19} -master sg13g2_IOPadIn








# === WEST SIDE (32 pads) ===
# iomem_rdata pads (11)
place_pad -row IO_WEST -location [calc_vertical_pad_location 0 31] {sg13g2_IOPadIn_iomem_rdata_21} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 1 31] {sg13g2_IOPadIn_iomem_rdata_22} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 2 31] {sg13g2_IOPadIn_iomem_rdata_23} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 3 31] {sg13g2_IOPadIn_iomem_rdata_24} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 4 31] {sg13g2_IOPadIn_iomem_rdata_25} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 5 31] {sg13g2_IOPadIn_iomem_rdata_26} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 6 31] {sg13g2_IOPadIn_iomem_rdata_27} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 7 31] {sg13g2_IOPadIn_iomem_rdata_28} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 8 31] {sg13g2_IOPadIn_iomem_rdata_29} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 9 31] {sg13g2_IOPadIn_iomem_rdata_30} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 10 31] {sg13g2_IOPadIn_iomem_rdata_31} -master sg13g2_IOPadIn
# === WEST SIDE (continued) ===
# iomem_wdata pads (11 bits: 21-31)
place_pad -row IO_WEST -location [calc_vertical_pad_location 11 31] {sg13g2_IOPadOut16mA_iomem_wdata_21} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 12 31] {sg13g2_IOPadOut16mA_iomem_wdata_22} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 13 31] {sg13g2_IOPadOut16mA_iomem_wdata_23} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 14 31] {sg13g2_IOPadOut16mA_iomem_wdata_24} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 15 31] {sg13g2_IOPadOut16mA_iomem_wdata_25} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 16 31] {sg13g2_IOPadOut16mA_iomem_wdata_26} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 17 31] {sg13g2_IOPadOut16mA_iomem_wdata_27} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 18 31] {sg13g2_IOPadOut16mA_iomem_wdata_28} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 19 31] {sg13g2_IOPadOut16mA_iomem_wdata_29} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 20 31] {sg13g2_IOPadOut16mA_iomem_wdata_30} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 21 31] {sg13g2_IOPadOut16mA_iomem_wdata_31} -master sg13g2_IOPadOut16mA

# iomem_addr pads (5 bits: 27-31)
place_pad -row IO_WEST -location [calc_vertical_pad_location 22 31] {sg13g2_IOPadOut16mA_iomem_addr_27} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 23 31] {sg13g2_IOPadOut16mA_iomem_addr_28} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 24 31] {sg13g2_IOPadOut16mA_iomem_addr_29} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 25 31] {sg13g2_IOPadOut16mA_iomem_addr_30} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 26 31] {sg13g2_IOPadOut16mA_iomem_addr_31} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 27 31] {sg13g2_IOPadOut16mA_iomem_addr_26} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 28 31] {sg13g2_IOPadOut16mA_iomem_wdata_20} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 29 31] {sg13g2_IOPadIn_iomem_rdata_20} -master sg13g2_IOPadIn





# === NORTH SIDE (32 pads) ===
# Output pads (10)
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 0 31] {sg13g2_IOPadOut16mA_ser_tx} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 1 31] {sg13g2_IOPadOut16mA_flash_io0_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 2 31] {sg13g2_IOPadOut16mA_flash_io1_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 3 31] {sg13g2_IOPadOut16mA_flash_io2_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 4 31] {sg13g2_IOPadOut16mA_flash_io3_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 5 31] {sg13g2_IOPadOut16mA_flash_io0_do} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 6 31] {sg13g2_IOPadOut16mA_flash_io1_do} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 7 31] {sg13g2_IOPadOut16mA_flash_io2_do} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 8 31] {sg13g2_IOPadOut16mA_flash_io3_do} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 9 31] {sg13g2_IOPadOut16mA_flash_csb} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 10 31] {sg13g2_IOPadOut16mA_flash_clk} -master sg13g2_IOPadOut16mA

# iomem_wdata pads (21)
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 11 31] {sg13g2_IOPadOut16mA_iomem_wdata_0} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 12 31] {sg13g2_IOPadOut16mA_iomem_wdata_1} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 13 31] {sg13g2_IOPadOut16mA_iomem_wdata_2} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 14 31] {sg13g2_IOPadOut16mA_iomem_wdata_3} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 15 31] {sg13g2_IOPadOut16mA_iomem_wdata_4} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 16 31] {sg13g2_IOPadOut16mA_iomem_wdata_5} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 17 31] {sg13g2_IOPadOut16mA_iomem_wdata_6} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 18 31] {sg13g2_IOPadOut16mA_iomem_wdata_7} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 19 31] {sg13g2_IOPadOut16mA_iomem_wdata_8} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 20 31] {sg13g2_IOPadOut16mA_iomem_wdata_9} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 21 31] {sg13g2_IOPadOut16mA_iomem_wdata_10} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 22 31] {sg13g2_IOPadOut16mA_iomem_wdata_11} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 23 31] {sg13g2_IOPadOut16mA_iomem_wdata_12} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 24 31] {sg13g2_IOPadOut16mA_iomem_wdata_13} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 25 31] {sg13g2_IOPadOut16mA_iomem_wdata_14} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 26 31] {sg13g2_IOPadOut16mA_iomem_wdata_15} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 27 31] {sg13g2_IOPadOut16mA_iomem_wdata_16} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 28 31] {sg13g2_IOPadOut16mA_iomem_wdata_17} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 29 31] {sg13g2_IOPadOut16mA_iomem_wdata_18} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 30 31] {sg13g2_IOPadOut16mA_iomem_wdata_19} -master sg13g2_IOPadOut16mA








# === EAST SIDE (32 pads) ===
# Memory interface control (5)
place_pad -row IO_EAST -location [calc_vertical_pad_location 0 31] {sg13g2_IOPadOut16mA_iomem_valid} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 1 31] {sg13g2_IOPadOut16mA_iomem_wstrb_0} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 2 31] {sg13g2_IOPadOut16mA_iomem_wstrb_1} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 3 31] {sg13g2_IOPadOut16mA_iomem_wstrb_2} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 4 31] {sg13g2_IOPadOut16mA_iomem_wstrb_3} -master sg13g2_IOPadOut16mA

# iomem_addr pads (27)
place_pad -row IO_EAST -location [calc_vertical_pad_location 5 31] {sg13g2_IOPadOut16mA_iomem_addr_0} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 6 31] {sg13g2_IOPadOut16mA_iomem_addr_1} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 7 31] {sg13g2_IOPadOut16mA_iomem_addr_2} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 8 31] {sg13g2_IOPadOut16mA_iomem_addr_3} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 9 31] {sg13g2_IOPadOut16mA_iomem_addr_4} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 10 31] {sg13g2_IOPadOut16mA_iomem_addr_5} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 11 31] {sg13g2_IOPadOut16mA_iomem_addr_6} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 12 31] {sg13g2_IOPadOut16mA_iomem_addr_7} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 13 31] {sg13g2_IOPadOut16mA_iomem_addr_8} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 14 31] {sg13g2_IOPadOut16mA_iomem_addr_9} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 15 31] {sg13g2_IOPadOut16mA_iomem_addr_10} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 16 31] {sg13g2_IOPadOut16mA_iomem_addr_11} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 17 31] {sg13g2_IOPadOut16mA_iomem_addr_12} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 18 31] {sg13g2_IOPadOut16mA_iomem_addr_13} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 19 31] {sg13g2_IOPadOut16mA_iomem_addr_14} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 20 31] {sg13g2_IOPadOut16mA_iomem_addr_15} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 21 31] {sg13g2_IOPadOut16mA_iomem_addr_16} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 22 31] {sg13g2_IOPadOut16mA_iomem_addr_17} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 23 31] {sg13g2_IOPadOut16mA_iomem_addr_18} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 24 31] {sg13g2_IOPadOut16mA_iomem_addr_19} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 25 31] {sg13g2_IOPadOut16mA_iomem_addr_20} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 26 31] {sg13g2_IOPadOut16mA_iomem_addr_21} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 27 31] {sg13g2_IOPadOut16mA_iomem_addr_22} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 28 31] {sg13g2_IOPadOut16mA_iomem_addr_23} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 29 31] {sg13g2_IOPadOut16mA_iomem_addr_24} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 30 31] {sg13g2_IOPadOut16mA_iomem_addr_25} -master sg13g2_IOPadOut16mA

# Place Corner Cells and Filler
place_corners sg13g2_Corner

set iofill {
    sg13g2_Filler10000
    sg13g2_Filler4000
    sg13g2_Filler2000
    sg13g2_Filler1000
    sg13g2_Filler400
    sg13g2_Filler200
}

place_io_fill -row IO_NORTH {*}$iofill
place_io_fill -row IO_SOUTH {*}$iofill
place_io_fill -row IO_WEST {*}$iofill
place_io_fill -row IO_EAST {*}$iofill

connect_by_abutment

place_bondpad -bond bondpad_70x70 sg13g2_IOPad* -offset {5.0 -70.0}

remove_io_rows
