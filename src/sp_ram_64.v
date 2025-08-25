module sp_ram_64 (
    input clk,
    input [3:0] wen,
    input [21:0] addr,         // Byte address (as in original PicoSoC)
    input [31:0] wdata,
    output reg [31:0] rdata
);

    // Convert byte address to 64-bit word address (addr[2] selects lower/upper 32b)
    wire [6:0] word_addr = addr[8:2]; // 128 words of 64-bit total (7-bit address)
    wire sel_upper_word  = addr[2];   // 0 = lower 32b, 1 = upper 32b

    wire cs0 = (word_addr[6] == 1'b0);
    wire cs1 = (word_addr[6] == 1'b1);
    wire [5:0] sram_addr = word_addr[5:0];

    // Read signals
    wire [63:0] dout0, dout1;
    wire [63:0] dout = cs0 ? dout0 : dout1;

    // Byte mask for write enables
    wire [7:0] byte_mask = sel_upper_word ?
        {wen[3], wen[2], 2'b00, wen[1], wen[0], 2'b00} << 4 :
        {wen[3], wen[2], 2'b00, wen[1], wen[0], 2'b00};

    wire write_en = |wen;

    // Data mapped to full 64 bits
    wire [63:0] din = sel_upper_word ?
        {wdata, 32'b0} :
        {32'b0, wdata};

    // SRAM Instance 0
    RM_IHPSG13_1P_64x64_c2_bm_bist sram0 (
        .A_CLK(clk),
        .A_MEN(cs0),
        .A_WEN(write_en),
        .A_REN(!write_en),
        .A_ADDR(sram_addr),
        .A_DIN(din),
        .A_DLY(1'b0),
        .A_DOUT(dout0),
        .A_BM(byte_mask),
        .A_BIST_CLK(1'b0),
        .A_BIST_EN(1'b0),
        .A_BIST_MEN(1'b0),
        .A_BIST_WEN(1'b0),
        .A_BIST_REN(1'b0),
        .A_BIST_ADDR(6'b0),
        .A_BIST_DIN(64'b0),
        .A_BIST_BM(64'b0)
    );

    // SRAM Instance 1
    RM_IHPSG13_1P_64x64_c2_bm_bist sram1 (
        .A_CLK(clk),
        .A_MEN(cs1),
        .A_WEN(write_en),
        .A_REN(!write_en),
        .A_ADDR(sram_addr),
        .A_DIN(din),
        .A_DLY(1'b0),
        .A_DOUT(dout1),
        .A_BM(byte_mask),
        .A_BIST_CLK(1'b0),
        .A_BIST_EN(1'b0),
        .A_BIST_MEN(1'b0),
        .A_BIST_WEN(1'b0),
        .A_BIST_REN(1'b0),
        .A_BIST_ADDR(6'b0),
        .A_BIST_DIN(64'b0),
        .A_BIST_BM(64'b0)
    );

    // Register read output on clk edge
    always @(posedge clk) begin
        rdata <= sel_upper_word ? dout[63:32] : dout[31:0];
    end

endmodule

