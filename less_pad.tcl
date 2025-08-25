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
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 0 7] {sg13g2_IOPadIn_clk} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 1 7] {sg13g2_IOPadIn_resetn} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 2 7] {sg13g2_IOPadIn_irq_5} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 3 7] {sg13g2_IOPadIn_irq_6} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 4 7] {sg13g2_IOPadIn_irq_7} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 5 7] {sg13g2_IOPadIn_ser_rx} -master sg13g2_IOPadIn
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 6 7] {sg13g2_IOPadIn_flash_io0_di} -master sg13g2_IOPadIn



# === WEST SIDE (32 pads) ===
place_pad -row IO_WEST -location [calc_vertical_pad_location 0 7] {sg13g2_IOPadIn_flash_io1_di} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 1 7] {sg13g2_IOPadIn_flash_io2_di} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 2 7] {sg13g2_IOPadIn_flash_io3_di} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 3 7] {sg13g2_IOPadIn_iomem_ready} -master sg13g2_IOPadIn
place_pad -row IO_WEST -location [calc_vertical_pad_location 4 7] {sg13g2_IOPadOut16mA_flash_io2_do} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 5 7] {sg13g2_IOPadOut16mA_flash_io3_do} -master sg13g2_IOPadOut16mA
place_pad -row IO_WEST -location [calc_vertical_pad_location 6 7] {sg13g2_IOPadOut16mA_flash_csb} -master sg13g2_IOPadOut16mA






# === NORTH SIDE (32 pads) ===

place_pad -row IO_NORTH -location [calc_horizontal_pad_location 0 7] {sg13g2_IOPadOut16mA_ser_tx} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 1 7] {sg13g2_IOPadOut16mA_flash_io0_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 2 7] {sg13g2_IOPadOut16mA_flash_io1_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 3 7] {sg13g2_IOPadOut16mA_flash_io2_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 4 7] {sg13g2_IOPadOut16mA_flash_io3_oe} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 5 7] {sg13g2_IOPadOut16mA_flash_io0_do} -master sg13g2_IOPadOut16mA
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 6 7] {sg13g2_IOPadOut16mA_flash_io1_do} -master sg13g2_IOPadOut16mA






# === EAST SIDE (32 pads) ===

place_pad -row IO_EAST -location [calc_vertical_pad_location 0 7] {sg13g2_IOPadOut16mA_iomem_valid} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 1 7] {sg13g2_IOPadOut16mA_iomem_wstrb_0} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 2 7] {sg13g2_IOPadOut16mA_iomem_wstrb_1} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 3 7] {sg13g2_IOPadOut16mA_iomem_wstrb_2} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 4 7] {sg13g2_IOPadOut16mA_iomem_wstrb_3} -master sg13g2_IOPadOut16mA
place_pad -row IO_EAST -location [calc_vertical_pad_location 5 7] {sg13g2_IOPadOut16mA_flash_clk} -master sg13g2_IOPadOut16mA

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
