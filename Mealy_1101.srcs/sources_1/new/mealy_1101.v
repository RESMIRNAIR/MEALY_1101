`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2024 22:53:51
// Design Name: 
// Module Name: mealy_1101
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mealy_1101(z,x,clk,reset);
input x,clk,reset;
output reg z;

parameter S0 = 2'b00 , S1 = 2'b01 , S2 = 2'b10 , S3 = 2'b11;
reg [1:0] PS,NS;

always@(posedge clk or posedge reset)
begin
	if(reset)
          PS <= S0;   
      else    
          PS <= NS;
end 
always@(PS or x)
 begin 
   case(PS)
      S0 : begin 
           z = 0 ;
	      NS = x ? S1 : S0 ;
	      $display(PS);
           end
       S1 : begin 
	       z = 0 ;
             NS = x ? S2 : S0 ;
             $display(PS);
             end
S2 : begin 
                z = 0 ;
                NS = x ? S2 : S3 ;
                $display(PS);
                 end 
           S3 : begin 
                z = x ? 1 : 0 ; 
                NS = x ? S1 : S0 ;
                $display(PS);
                end

            endcase
          end
        endmodule
