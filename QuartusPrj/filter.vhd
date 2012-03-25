-- megafunction wizard: %FIR Compiler II v11.1%
-- GENERATION: XML
-- filter.vhd

-- Generated using ACDS version 11.1 173 at 2012.03.25.16:41:11

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity filter is
	port (
		clk              : in  std_logic                    := '0';             --             clock_reset.clk
		reset_n          : in  std_logic                    := '0';             --       clock_reset_reset.reset_n
		coeff_in_clk     : in  std_logic                    := '0';             --       coeff_clock_reset.clk
		coeff_in_areset  : in  std_logic                    := '0';             -- coeff_clock_reset_reset.reset
		ast_sink_data    : in  std_logic_vector(7 downto 0) := (others => '0'); --   avalon_streaming_sink.data
		ast_sink_ready   : out std_logic;                                       --                        .ready
		ast_sink_valid   : in  std_logic                    := '0';             --                        .valid
		ast_sink_error   : in  std_logic_vector(1 downto 0) := (others => '0'); --                        .error
		ast_source_data  : out std_logic_vector(7 downto 0);                    -- avalon_streaming_source.data
		ast_source_ready : in  std_logic                    := '0';             --                        .ready
		ast_source_valid : out std_logic;                                       --                        .valid
		ast_source_error : out std_logic_vector(1 downto 0)                     --                        .error
	);
end entity filter;

architecture rtl of filter is
	component filter_0002 is
		port (
			clk              : in  std_logic                    := 'X';             -- clk
			reset_n          : in  std_logic                    := 'X';             -- reset_n
			coeff_in_clk     : in  std_logic                    := 'X';             -- clk
			coeff_in_areset  : in  std_logic                    := 'X';             -- reset
			ast_sink_data    : in  std_logic_vector(7 downto 0) := (others => 'X'); -- data
			ast_sink_ready   : out std_logic;                                       -- ready
			ast_sink_valid   : in  std_logic                    := 'X';             -- valid
			ast_sink_error   : in  std_logic_vector(1 downto 0) := (others => 'X'); -- error
			ast_source_data  : out std_logic_vector(7 downto 0);                    -- data
			ast_source_ready : in  std_logic                    := 'X';             -- ready
			ast_source_valid : out std_logic;                                       -- valid
			ast_source_error : out std_logic_vector(1 downto 0)                     -- error
		);
	end component filter_0002;

begin

	filter_inst : component filter_0002
		port map (
			clk              => clk,              --             clock_reset.clk
			reset_n          => reset_n,          --       clock_reset_reset.reset_n
			coeff_in_clk     => coeff_in_clk,     --       coeff_clock_reset.clk
			coeff_in_areset  => coeff_in_areset,  -- coeff_clock_reset_reset.reset
			ast_sink_data    => ast_sink_data,    --   avalon_streaming_sink.data
			ast_sink_ready   => ast_sink_ready,   --                        .ready
			ast_sink_valid   => ast_sink_valid,   --                        .valid
			ast_sink_error   => ast_sink_error,   --                        .error
			ast_source_data  => ast_source_data,  -- avalon_streaming_source.data
			ast_source_ready => ast_source_ready, --                        .ready
			ast_source_valid => ast_source_valid, --                        .valid
			ast_source_error => ast_source_error  --                        .error
		);

end architecture rtl; -- of filter
-- Retrieval info: <?xml version="1.0"?>
--<!--
--	Generated by Altera MegaWizard Launcher Utility version 1.0
--	************************************************************
--	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--	************************************************************
--	Copyright (C) 1991-2012 Altera Corporation
--	Any megafunction design, and related net list (encrypted or decrypted),
--	support information, device programming or simulation file, and any other
--	associated documentation or information provided by Altera or a partner
--	under Altera's Megafunction Partnership Program may be used only to
--	program PLD devices (but not masked PLD devices) from Altera.  Any other
--	use of such megafunction design, net list, support information, device
--	programming or simulation file, or any other related documentation or
--	information is prohibited for any other purpose, including, but not
--	limited to modification, reverse engineering, de-compiling, or use with
--	any other silicon devices, unless such use is explicitly licensed under
--	a separate agreement with Altera or a megafunction partner.  Title to
--	the intellectual property, including patents, copyrights, trademarks,
--	trade secrets, or maskworks, embodied in any such megafunction design,
--	net list, support information, device programming or simulation file, or
--	any other related documentation or information provided by Altera or a
--	megafunction partner, remains with Altera, the megafunction partner, or
--	their respective licensors.  No other licenses, including any licenses
--	needed under any third party's intellectual property, are provided herein.
---->
-- Retrieval info: <instance entity-name="altera_fir_compiler_ii" version="11.1" >
-- Retrieval info: 	<generic name="deviceFamily" value="Cyclone II" />
-- Retrieval info: 	<generic name="filterType" value="Single Rate" />
-- Retrieval info: 	<generic name="interpFactor" value="1" />
-- Retrieval info: 	<generic name="decimFactor" value="1" />
-- Retrieval info: 	<generic name="L_bandsFilter" value="All taps" />
-- Retrieval info: 	<generic name="clockRate" value="2" />
-- Retrieval info: 	<generic name="clockSlack" value="50" />
-- Retrieval info: 	<generic name="speedGrade" value="Slow" />
-- Retrieval info: 	<generic name="coeffReload" value="false" />
-- Retrieval info: 	<generic name="baseAddress" value="0" />
-- Retrieval info: 	<generic name="readWriteMode" value="Read/Write" />
-- Retrieval info: 	<generic name="backPressure" value="false" />
-- Retrieval info: 	<generic name="symmetryMode" value="Non Symmetry" />
-- Retrieval info: 	<generic name="delayRAMBlockThreshold" value="20" />
-- Retrieval info: 	<generic name="dualMemDistRAMThreshold" value="1280" />
-- Retrieval info: 	<generic name="mRAMThreshold" value="1000000" />
-- Retrieval info: 	<generic name="hardMultiplierThreshold" value="-1" />
-- Retrieval info: 	<generic name="inputRate" value="2" />
-- Retrieval info: 	<generic name="inputChannelNum" value="1" />
-- Retrieval info: 	<generic name="inputType" value="Signed Binary" />
-- Retrieval info: 	<generic name="inputBitWidth" value="8" />
-- Retrieval info: 	<generic name="inputFracBitWidth" value="0" />
-- Retrieval info: 	<generic name="coeffSetRealValue" value="-0.001406,-0.001266,-0.001119,-9.59E-4,-7.83E-4,-5.87E-4,-3.67E-4,-1.17E-4,1.64E-4,4.8E-4,8.31E-4,0.00122,0.001643,0.002098,0.00258,0.003083,0.003597,0.004113,0.00462,0.005103,0.005549,0.005943,0.00627,0.006513,0.006659,0.006694,0.006603,0.006377,0.006007,0.005486,0.004811,0.003982,0.003002,0.001877,6.19E-4,-7.59E-4,-0.002239,-0.0038,-0.005419,-0.007069,-0.008722,-0.010346,-0.011911,-0.013384,-0.014734,-0.01593,-0.016942,-0.017744,-0.018311,-0.018621,-0.01866,-0.018413,-0.017875,-0.017042,-0.015918,-0.014512,-0.012838,-0.010916,-0.008771,-0.006432,-0.003932,-0.001309,0.001397,0.004143,0.006885,0.009578,0.012178,0.014641,0.016925,0.018992,0.020805,0.022334,0.023551,0.024436,0.024974,0.025154,0.024974,0.024436,0.023551,0.022334,0.020805,0.018992,0.016925,0.014641,0.012178,0.009578,0.006885,0.004143,0.001397,-0.001309,-0.003932,-0.006432,-0.008771,-0.010916,-0.012838,-0.014512,-0.015918,-0.017042,-0.017875,-0.018413,-0.01866,-0.018621,-0.018311,-0.017744,-0.016942,-0.01593,-0.014734,-0.013384,-0.011911,-0.010346,-0.008722,-0.007069,-0.005419,-0.0038,-0.002239,-7.59E-4,6.19E-4,0.001877,0.003002,0.003982,0.004811,0.005486,0.006007,0.006377,0.006603,0.006694,0.006659,0.006513,0.00627,0.005943,0.005549,0.005103,0.00462,0.004113,0.003597,0.003083,0.00258,0.002098,0.001643,0.00122,8.31E-4,4.8E-4,1.64E-4,-1.17E-4,-3.67E-4,-5.87E-4,-7.83E-4,-9.59E-4,-0.001119,-0.001266,-0.001406" />
-- Retrieval info: 	<generic name="coeffType" value="Signed Binary" />
-- Retrieval info: 	<generic name="coeffBitWidth" value="8" />
-- Retrieval info: 	<generic name="coeffFracBitWidth" value="0" />
-- Retrieval info: 	<generic name="outType" value="Signed Binary" />
-- Retrieval info: 	<generic name="outMSBRound" value="Truncation" />
-- Retrieval info: 	<generic name="outMsbBitRem" value="0" />
-- Retrieval info: 	<generic name="outLSBRound" value="Truncation" />
-- Retrieval info: 	<generic name="outLsbBitRem" value="16" />
-- Retrieval info: 	<generic name="resoureEstimation" value="1000,1200,10" />
-- Retrieval info: 	<generic name="bankCount" value="1" />
-- Retrieval info: 	<generic name="bankDisplay" value="0" />
-- Retrieval info: </instance>
-- IPFS_FILES : NONE
