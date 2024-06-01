 module fsm12(sr_in,clk,out,rst,alm,segment,wrong_out);

input clk,rst;

input [9:0] sr_in;

reg signed [2:0] count = 3'd5;
 
output [6:0] segment;

output out,wrong_out;

output alm;

assign alm = (count==3'd0)?1:0;



parameter IDEAL  = 9'b000000001,
          STATE1 = 9'b000000010,
			 STATE2 = 9'b000000100,
			 STATE3 = 9'b000001000,
			 STATE4 = 9'b000010000,
			 D0    = 9'b000100000,
			 D1    = 9'b001000000,
			 D2    = 9'b010000000,
			 D3    = 9'b100000000;

assign wrong_out=(present==D3)?1:0;
			 
reg [8:0] present=IDEAL,next;	

sevenSegmentdecorderForCounter counter(count,segment)	;	 

always@(posedge clk)
begin

if(rst)
begin

present<=IDEAL;

end

else

begin

present<=next;

end

if(present==IDEAL)
begin
count<=count-1'd1;
end

if(present==STATE4|rst)
count<=3'd5;

end 

always@(sr_in or present)
begin

case(present)

IDEAL : 
begin

if(sr_in==10'd8)

next<=STATE1; 

else
begin

next<=D0;

end
 
end


STATE1 : 
begin
if(sr_in==10'd1)

next<=STATE2;

else

begin
next<=D1;
end

end

STATE2 : 
begin
if(sr_in==10'd2)

next<=STATE3;

else

begin
next<=D2;
end
 
end


STATE3 : 
begin
if(sr_in==10'd4)

next<=STATE4;

else

begin
next<=D3;
end
 
end

STATE4:
begin
next<=IDEAL;

end

D0: next<=D1;

D1: next<=D2;

D2: next<=D3;

D3: next<=IDEAL;


default : next=IDEAL;
endcase 


end

assign out = (present==STATE4)?1:0;


endmodule 