
/* To integrate your physical IHP SG13G2 SRAM macro (RM_IHPSG13_1P_256x64_c2_bm_bist), you’ll replace the picosoc_mem module instantiation with your custom wrapper.
*/
module sp_ram (
    input         clk,
    input         wen,
    input  [3:0]  wstrb,
    input  [31:0] addr,
    input  [31:0] wdata,
    output [31:0] rdata
);

    wire        A_CLK   = clk;
    wire        A_MEN   = 1'b1;
    wire        A_WEN   = wen;
    wire        A_REN   = ~wen;
    wire [7:0]  A_ADDR  = addr[9:2];  // 256 locations × 4B
    wire [63:0] A_DIN   = {32'b0, wdata};
    wire        A_DLY   = 1'b0;
    wire [63:0] A_BM    = 64'h0000_0000_FFFF_FFFF; // byte mask for lower 32 bits

    wire        A_BIST_CLK = 1'b0;
    wire        A_BIST_EN  = 1'b0;
    wire        A_BIST_MEN = 1'b0;
    wire        A_BIST_WEN = 1'b0;
    wire        A_BIST_REN = 1'b0;
    wire [7:0]  A_BIST_ADDR = 8'b0;
    wire [63:0] A_BIST_DIN  = 64'b0;
    wire [63:0] A_BIST_BM   = 64'b0;

    wire [63:0] A_DOUT;

    assign rdata = A_DOUT[31:0];

    RM_IHPSG13_1P_256x64_c2_bm_bist sram_inst (
        .A_CLK(A_CLK),
        .A_MEN(A_MEN),
        .A_WEN(A_WEN),
        .A_REN(A_REN),
        .A_ADDR(A_ADDR),
        .A_DIN(A_DIN),
        .A_DLY(A_DLY),
        .A_DOUT(A_DOUT),
        .A_BM(A_BM),
        .A_BIST_CLK(A_BIST_CLK),
        .A_BIST_EN(A_BIST_EN),
        .A_BIST_MEN(A_BIST_MEN),
        .A_BIST_WEN(A_BIST_WEN),
        .A_BIST_REN(A_BIST_REN),
        .A_BIST_ADDR(A_BIST_ADDR),
        .A_BIST_DIN(A_BIST_DIN),
        .A_BIST_BM(A_BIST_BM)
    );

endmodule
