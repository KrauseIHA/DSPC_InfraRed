%
%THIS IS A WIZARD GENERATED FILE. DO NOT EDIT THIS FILE!
%
%---------------------------------------------------------------------------------------------------------
%This is a filter with fixed coefficients.
%This Model Only Support Single Channel Input Data.
%Please input:
%data vector: 		stimulation(1:n)

%    This Model Only Support FIR_WIDTH to 51 Bits

%FILTER PARAMETER
%Input Data Type :	Signed Binary
%Input Data Width: 8
%Interpolation Factor: 1
%Decimation Factor: 1
%FIR Width (Full Calculation Width Before Output Width Adjust) :8
%-----------------------------------------------------------------------------------------------------------
%MegaWizard Scaled Coefficient Values

 function  output = filter_mlab(stimulation, output)
 coef_matrix_in= [-7,-6,-5,-4,-3,-2,-1,0,0,2,4,6,8,10,13,15,18,20,23,25,28,30,31,32,33,33,33,32,30,27,24,20,15,9,3,-3,-11,-19,-27,-35,-44,-52,-60,-67,-74,-80,-85,-89,-92,-94,-94,-92,-90,-86,-80,-73,-64,-55,-44,-32,-19,-6,7,20,34,48,61,73,85,95,105,112,118,123,126,127,126,123,118,112,105,95,85,73,61,48,34,20,7,-6,-19,-32,-44,-55,-64,-73,-80,-86,-90,-92,-94,-94,-92,-89,-85,-80,-74,-67,-60,-52,-44,-35,-27,-19,-11,-3,3,9,15,20,24,27,30,32,33,33,33,32,31,30,28,25,23,20,18,15,13,10,8,6,4,2,0,0,-1,-2,-3,-4,-5,-6,-7];
 INTER_FACTOR  = 1;
 DECI_FACTOR  =  1;
 MSB_RM  = 0;
 MSB_TYPE  = 0;
 LSB_RM  = 16;
 LSB_TYPE  = 0;
 FIR_WIDTH  = 8 + MSB_RM + LSB_RM;
 OUT_WIDTH  = 8 ;  %8
 DATA_WIDTH = 8;
 BANKCOUNT = 1;
 data_type = 1;

  
 % check size of inputs. 
 [DX,DY] = size(stimulation);
 [CX,CY] = size(coef_matrix_in); 
 if (CY ~= DY * INTER_FACTOR) 
    fprintf('WARNING : coef_matrix size and input data size is not match\n'); 
 end 

 %fill coef_matrix to length of data with the latest coef set 
 if (CY < DY * INTER_FACTOR) 
   %for i= CX +1:DY * INTER_FACTOR 
   for i= 1:DY * INTER_FACTOR 
     if (BANKCOUNT > 1)
       coef_matrix(i,:) = coef_matrix_in(bank(i)+1,:); 
     else
       coef_matrix(i,:) = coef_matrix_in(1,:); 
     end
   end 
 end
	  
 % check if input is integer 
       	int_sti=round(stimulation); 
	    T = (int_sti ~= stimulation); 
	    if (max(T)~=0) 
	        fprintf('WARNING : Integer Input Expected: Rounding Fractional Input to Nearest Integer...\n'); 
	    end 
	     
	    %Input overflow check 
	    switch  data_type 
	    case 1 
	        %set max/min for signed 
	        maxdat = 2^(DATA_WIDTH-1)-1; 
	        mindat = -maxdat-1; 
	    case 2 
	        %set max/min for unsigned 
	        maxdat = 2^DATA_WIDTH-1; 
	        mindat = 0; 
	    end 

	    if(data_type == 2)
	    	if(abs(coef_matrix) == coef_matrix)
	    		FIR_WIDTH = FIR_WIDTH +1;
	    	end
	    end

	    %Saturating Input Value 
	    a=find(int_sti>maxdat); 
	    b=find(int_sti<mindat); 
	    if (~isempty(a)|~isempty(b)) 
	 	    fprintf('WARNING : Input Amplitude Exceeds MAXIMUM/MINIMUM allowable values - saturating input values...\n'); 
	            lena = length (a); 
	            lenb = length (b); 
	            for i =1:lena 
	        	    fprintf('%d > %d \n', int_sti(a(i)), maxdat); 
			        int_sti(a(i)) = maxdat; 
		        end 
		    for i =1:lenb 
			    fprintf('%d < %d \n', int_sti(b(i)), mindat); 
			    int_sti(b(i)) = mindat; 
		    end 
	    end 
         
	    % Add interpolation 
   	    inter_sti = zeros(1, INTER_FACTOR * length(int_sti)); 
	    inter_sti(1:INTER_FACTOR:INTER_FACTOR * length(int_sti)) = int_sti; 
 
         
        for i = 1 : DY *INTER_FACTOR 
    	    coef_current = coef_matrix(i,:); 
            output_temp(i) = simp_adaptive (inter_sti, coef_current, i); 
        end 
	% Truncate output 
	len1 = length(output_temp); 
	 
	    switch  LSB_TYPE 
	    case 0 
	        %truncate 
            out_dec = bi_trunc_lsb(output_temp,LSB_RM,FIR_WIDTH); 
	    case 1 
	        %round 
            out_dec = bi_round(output_temp,LSB_RM, FIR_WIDTH); 
	    end 
         
 	    switch  MSB_TYPE 
	    case 0 
	        %truncate 
            out_dec = bi_trunc_msb(out_dec,MSB_RM,FIR_WIDTH-LSB_RM); 
	    case 1 
	        %round 
            out_dec = bi_satu(out_dec,MSB_RM, FIR_WIDTH-LSB_RM); 
	    end 
 	    
    	% choose decimation output in phase=DECI_FACTOR-1  
     	if(DECI_FACTOR == 1) 
     		output = out_dec; 
     	else 
        output = out_dec(1:DECI_FACTOR:len1);

	 	end  
 	       
  	function[output, outindex] = simp_adaptive (int_sti, coef_current, data_index, output) 
	%Simulation is the whole input sequence 
	%coef_current is the current coefficient set 
	%data_index gives the last data to use 
	%outputs are the sum of input and coef multiplication 
	%outindex is the next data_index 
    
	sti_current = zeros(length(coef_current),1); 
	 
	data_length = length(int_sti); 
	 
	%Check data index 
	if (data_index > data_length) 
		fprintf('ERROR: DATA INDEX IS LARGER THAN DATA LENGTH!!!\n'); 
		return; 
	end 
	for i = 1: length(coef_current) 
	   if ((data_index -i+1)>0 & (data_index - i+1)<=data_length) 
	      sti_current(i,1) = int_sti(data_index - i+1); 
	   end 
	end 
	 
	outindex= data_index+1; 
	output = coef_current * sti_current; 
	% end of function simp_adaptive 
 
	function output = bi_round(data_in,LSB_RM,ORI_WIDTH, output) 
	% LSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width

	data = round (data_in / 2^LSB_RM);

	output = bi_satu(data,0,ORI_WIDTH - LSB_RM); 
	%end of function bi_trunc_lsb 
	 
	function output = bi_trunc_lsb(data_in,LSB_RM,ORI_WIDTH, output) 
	% LSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width 
	%2's complement system 
	output = bitshift(2^ORI_WIDTH*(data_in<0) + data_in, -LSB_RM) - 2^(ORI_WIDTH-LSB_RM) *(data_in<0); 
	% end of function bi_round 
	 
	function output = bi_trunc_msb(data_in,MSB_RM,ORI_WIDTH, output) 
	% MSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width 
	%2's complement system 
	data = 2^ORI_WIDTH * (data_in < 0)+ data_in; 
	erase_num = 2^(ORI_WIDTH - MSB_RM) - 1; 
	data = bitand(data, erase_num); 
	output = data - 2^(ORI_WIDTH - MSB_RM)*(bitget(data,ORI_WIDTH - MSB_RM)); 
	%end of bi_trunc_msb 
	 
	function output = bi_satu(data_in,MSB_RM,ORI_WIDTH, output) 
	% MSB_RM is the bit to lose in LSB 
	% ORI_WIDTH is the original data width 
	%2's complement system 
	maxdat = 2^(ORI_WIDTH - MSB_RM - 1)-1; 
	mindat = 2^(ORI_WIDTH - MSB_RM - 1)*(-1); 
	data_in(find(data_in > maxdat)) = maxdat; 
	data_in(find(data_in < mindat)) = mindat; 
	output = data_in; 
	%end of bi_satu  


