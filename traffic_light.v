module traffic_light(clk,car,pedestrian,traffic_light,prev_light,counter);
input clk,car,pedestrian;
output reg[1:0] traffic_light;
output reg [3:0] counter;
output reg prev_light; // when yellow, 1 for previous light red,0 for previous light green

initial begin 
traffic_light=0;
counter=4'b1001;
prev_light=1;
end


always @(posedge clk)
	begin
		if(counter==0) 
			case(traffic_light)
			
		2'b00:               
			if(car) begin
			traffic_light=2'b01;
			prev_light=1;
			counter<=4'b0011;end
			else begin
			traffic_light=2'b10;
			counter=4'b1001;
			 end
			
		2'b01:              
		if(prev_light) begin 
		traffic_light=2'b10;
		counter=4'b1001; end
		else begin
		traffic_light=0; 
		counter=4'b1001; end
		
		2'b10:              
			if(pedestrian) begin
			traffic_light=2'b01;
			prev_light=0;     
			counter=4'b0011; end
			else begin
			traffic_light=0;
			counter=4'b1001; end
		endcase
	
		else
			counter=counter-4'b0001;
		
end
endmodule
