`timescale 1ns / 1ps

module stopwatch_counter #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output [DATA_WIDTH-1:0] count
);


reg [DATA_WIDTH-1:0] temp;
reg count_continuity;

always @(posedge clk) begin
  if(reset) begin
    temp <= 0;
    count_continuity <= 0;
  end
  else begin
      if (stop) begin
        temp <= temp;
        count_continuity <= 0;
  end
      else if (count_continuity || start) begin
        temp <= (temp == MAX) ? 0 : temp + 1'b 1;
        count_continuity <= 1;
  end
end
end

assign count = temp;
endmodule