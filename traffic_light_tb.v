`timescale 1ns / 1ps
module traffic_light_tb();

reg clk,car,pedestrian;
wire [1:0] traffic_light;
wire[3:0] counter;
wire prev_light;

traffic_light dut(.clk(clk),.car(car),.pedestrian(pedestrian),.traffic_light(traffic_light),
.prev_light(prev_light),.counter(counter));

initial begin
clk=0;
car=0;
pedestrian=0;
end

always begin
clk<=0; #5;  clk<=1; #5;
end

always begin
#120;
car=1;
pedestrian=1;
#20;
car=0;
pedestrian=0;
#145;
car=1;
#20;
car=0;
#40;
car=1;
#20;
car=0;
#105;
pedestrian=1;
#20;
pedestrian=0;
#40;
pedestrian=1;
#20;
pedestrian=0;
#80;
pedestrian=1;
#20;
pedestrian=0;
end

initial 
#800 $finish;

endmodule
