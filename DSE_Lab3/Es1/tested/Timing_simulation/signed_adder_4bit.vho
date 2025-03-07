-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "04/08/2024 19:22:55"

-- 
-- Device: Altera EP4CGX75CF23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	signed_adder_4bit IS
    PORT (
	A4 : IN IEEE.NUMERIC_STD.signed(3 DOWNTO 0);
	B4 : IN IEEE.NUMERIC_STD.signed(3 DOWNTO 0);
	CR_in : IN std_logic;
	Clock : IN std_logic;
	RSTn : IN std_logic;
	OVF : OUT std_logic;
	SUM4 : OUT IEEE.NUMERIC_STD.signed(3 DOWNTO 0)
	);
END signed_adder_4bit;

-- Design Ports Information
-- OVF	=>  Location: PIN_G7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUM4[0]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUM4[1]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUM4[2]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SUM4[3]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CR_in	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RSTn	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A4[2]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B4[2]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A4[1]	=>  Location: PIN_D4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B4[1]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A4[0]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B4[0]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A4[3]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B4[3]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF signed_adder_4bit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A4 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B4 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CR_in : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_RSTn : std_logic;
SIGNAL ww_OVF : std_logic;
SIGNAL ww_SUM4 : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RSTn~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \OVF~output_o\ : std_logic;
SIGNAL \SUM4[0]~output_o\ : std_logic;
SIGNAL \SUM4[1]~output_o\ : std_logic;
SIGNAL \SUM4[2]~output_o\ : std_logic;
SIGNAL \SUM4[3]~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \B4[3]~input_o\ : std_logic;
SIGNAL \RSTn~input_o\ : std_logic;
SIGNAL \RSTn~inputclkctrl_outclk\ : std_logic;
SIGNAL \A4[3]~input_o\ : std_logic;
SIGNAL \B4[2]~input_o\ : std_logic;
SIGNAL \reg2|Q[2]~feeder_combout\ : std_logic;
SIGNAL \A4[2]~input_o\ : std_logic;
SIGNAL \reg1|Q[2]~feeder_combout\ : std_logic;
SIGNAL \rca|fa2|mux|m~0_combout\ : std_logic;
SIGNAL \A4[1]~input_o\ : std_logic;
SIGNAL \reg1|Q[1]~feeder_combout\ : std_logic;
SIGNAL \B4[1]~input_o\ : std_logic;
SIGNAL \reg2|Q[1]~feeder_combout\ : std_logic;
SIGNAL \rca|fa2|mux|m~1_combout\ : std_logic;
SIGNAL \A4[0]~input_o\ : std_logic;
SIGNAL \reg1|Q[0]~feeder_combout\ : std_logic;
SIGNAL \CR_in~input_o\ : std_logic;
SIGNAL \B4[0]~input_o\ : std_logic;
SIGNAL \rca|fa0|mux|m~0_combout\ : std_logic;
SIGNAL \rca|fa2|mux|m~2_combout\ : std_logic;
SIGNAL \r2~0_combout\ : std_logic;
SIGNAL \ff|Q~q\ : std_logic;
SIGNAL \rca|fa0|sum~0_combout\ : std_logic;
SIGNAL \rca|fa1|sum~combout\ : std_logic;
SIGNAL \rca|fa2|sum~0_combout\ : std_logic;
SIGNAL \rca|fa2|sum~combout\ : std_logic;
SIGNAL \rca|fa3|sum~combout\ : std_logic;
SIGNAL \reg2|Q\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg3|Q\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reg1|Q\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_A4 <= IEEE.STD_LOGIC_1164.STD_LOGIC_VECTOR(A4);
ww_B4 <= IEEE.STD_LOGIC_1164.STD_LOGIC_VECTOR(B4);
ww_CR_in <= CR_in;
ww_Clock <= Clock;
ww_RSTn <= RSTn;
OVF <= ww_OVF;
SUM4 <= IEEE.NUMERIC_STD.SIGNED(ww_SUM4);
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);

\RSTn~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \RSTn~input_o\);

-- Location: IOOBUF_X13_Y67_N9
\OVF~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ff|Q~q\,
	devoe => ww_devoe,
	o => \OVF~output_o\);

-- Location: IOOBUF_X13_Y67_N2
\SUM4[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg3|Q\(0),
	devoe => ww_devoe,
	o => \SUM4[0]~output_o\);

-- Location: IOOBUF_X15_Y67_N2
\SUM4[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg3|Q\(1),
	devoe => ww_devoe,
	o => \SUM4[1]~output_o\);

-- Location: IOOBUF_X15_Y67_N9
\SUM4[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg3|Q\(2),
	devoe => ww_devoe,
	o => \SUM4[2]~output_o\);

-- Location: IOOBUF_X17_Y67_N16
\SUM4[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reg3|Q\(3),
	devoe => ww_devoe,
	o => \SUM4[3]~output_o\);

-- Location: IOIBUF_X38_Y0_N15
\Clock~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G29
\Clock~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X17_Y67_N22
\B4[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B4(3),
	o => \B4[3]~input_o\);

-- Location: IOIBUF_X38_Y0_N22
\RSTn~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RSTn,
	o => \RSTn~input_o\);

-- Location: CLKCTRL_G28
\RSTn~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RSTn~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RSTn~inputclkctrl_outclk\);

-- Location: FF_X16_Y66_N31
\reg2|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \B4[3]~input_o\,
	clrn => \RSTn~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg2|Q\(3));

-- Location: IOIBUF_X19_Y67_N1
\A4[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A4(3),
	o => \A4[3]~input_o\);

-- Location: FF_X16_Y66_N7
\reg1|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \A4[3]~input_o\,
	clrn => \RSTn~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg1|Q\(3));

-- Location: IOIBUF_X15_Y67_N22
\B4[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B4(2),
	o => \B4[2]~input_o\);

-- Location: LCCOMB_X16_Y66_N24
\reg2|Q[2]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg2|Q[2]~feeder_combout\ = \B4[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \B4[2]~input_o\,
	combout => \reg2|Q[2]~feeder_combout\);

-- Location: FF_X16_Y66_N25
\reg2|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \reg2|Q[2]~feeder_combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg2|Q\(2));

-- Location: IOIBUF_X17_Y67_N1
\A4[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A4(2),
	o => \A4[2]~input_o\);

-- Location: LCCOMB_X16_Y66_N14
\reg1|Q[2]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg1|Q[2]~feeder_combout\ = \A4[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A4[2]~input_o\,
	combout => \reg1|Q[2]~feeder_combout\);

-- Location: FF_X16_Y66_N15
\reg1|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \reg1|Q[2]~feeder_combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg1|Q\(2));

-- Location: LCCOMB_X16_Y66_N30
\rca|fa2|mux|m~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa2|mux|m~0_combout\ = (\reg2|Q\(2) & \reg1|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg2|Q\(2),
	datad => \reg1|Q\(2),
	combout => \rca|fa2|mux|m~0_combout\);

-- Location: IOIBUF_X17_Y67_N8
\A4[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A4(1),
	o => \A4[1]~input_o\);

-- Location: LCCOMB_X16_Y66_N10
\reg1|Q[1]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg1|Q[1]~feeder_combout\ = \A4[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A4[1]~input_o\,
	combout => \reg1|Q[1]~feeder_combout\);

-- Location: FF_X16_Y66_N11
\reg1|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \reg1|Q[1]~feeder_combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg1|Q\(1));

-- Location: IOIBUF_X19_Y67_N8
\B4[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B4(1),
	o => \B4[1]~input_o\);

-- Location: LCCOMB_X16_Y66_N4
\reg2|Q[1]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg2|Q[1]~feeder_combout\ = \B4[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \B4[1]~input_o\,
	combout => \reg2|Q[1]~feeder_combout\);

-- Location: FF_X16_Y66_N5
\reg2|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \reg2|Q[1]~feeder_combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg2|Q\(1));

-- Location: LCCOMB_X16_Y66_N8
\rca|fa2|mux|m~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa2|mux|m~1_combout\ = (\reg1|Q\(2)) # (\reg2|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reg1|Q\(2),
	datad => \reg2|Q\(2),
	combout => \rca|fa2|mux|m~1_combout\);

-- Location: IOIBUF_X19_Y67_N22
\A4[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A4(0),
	o => \A4[0]~input_o\);

-- Location: LCCOMB_X16_Y66_N22
\reg1|Q[0]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reg1|Q[0]~feeder_combout\ = \A4[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \A4[0]~input_o\,
	combout => \reg1|Q[0]~feeder_combout\);

-- Location: FF_X16_Y66_N23
\reg1|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \reg1|Q[0]~feeder_combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg1|Q\(0));

-- Location: IOIBUF_X19_Y67_N15
\CR_in~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CR_in,
	o => \CR_in~input_o\);

-- Location: IOIBUF_X15_Y67_N15
\B4[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B4(0),
	o => \B4[0]~input_o\);

-- Location: FF_X16_Y66_N29
\reg2|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \B4[0]~input_o\,
	clrn => \RSTn~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg2|Q\(0));

-- Location: LCCOMB_X16_Y66_N6
\rca|fa0|mux|m~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa0|mux|m~0_combout\ = (\reg1|Q\(0) & ((\CR_in~input_o\) # (\reg2|Q\(0)))) # (!\reg1|Q\(0) & (\CR_in~input_o\ & \reg2|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1|Q\(0),
	datab => \CR_in~input_o\,
	datad => \reg2|Q\(0),
	combout => \rca|fa0|mux|m~0_combout\);

-- Location: LCCOMB_X16_Y66_N20
\rca|fa2|mux|m~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa2|mux|m~2_combout\ = (\rca|fa2|mux|m~1_combout\ & ((\reg1|Q\(1) & ((\reg2|Q\(1)) # (\rca|fa0|mux|m~0_combout\))) # (!\reg1|Q\(1) & (\reg2|Q\(1) & \rca|fa0|mux|m~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1|Q\(1),
	datab => \reg2|Q\(1),
	datac => \rca|fa2|mux|m~1_combout\,
	datad => \rca|fa0|mux|m~0_combout\,
	combout => \rca|fa2|mux|m~2_combout\);

-- Location: LCCOMB_X16_Y66_N0
\r2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \r2~0_combout\ = (\reg2|Q\(3) & (((!\rca|fa2|mux|m~0_combout\ & !\rca|fa2|mux|m~2_combout\)) # (!\reg1|Q\(3)))) # (!\reg2|Q\(3) & ((\reg1|Q\(3)) # ((\rca|fa2|mux|m~0_combout\) # (\rca|fa2|mux|m~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2|Q\(3),
	datab => \reg1|Q\(3),
	datac => \rca|fa2|mux|m~0_combout\,
	datad => \rca|fa2|mux|m~2_combout\,
	combout => \r2~0_combout\);

-- Location: FF_X16_Y66_N1
\ff|Q\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \r2~0_combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff|Q~q\);

-- Location: LCCOMB_X16_Y66_N18
\rca|fa0|sum~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa0|sum~0_combout\ = \reg1|Q\(0) $ (\CR_in~input_o\ $ (\reg2|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reg1|Q\(0),
	datac => \CR_in~input_o\,
	datad => \reg2|Q\(0),
	combout => \rca|fa0|sum~0_combout\);

-- Location: FF_X16_Y66_N19
\reg3|Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \rca|fa0|sum~0_combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg3|Q\(0));

-- Location: LCCOMB_X16_Y66_N16
\rca|fa1|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa1|sum~combout\ = \reg1|Q\(1) $ (\reg2|Q\(1) $ (\rca|fa0|mux|m~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1|Q\(1),
	datac => \reg2|Q\(1),
	datad => \rca|fa0|mux|m~0_combout\,
	combout => \rca|fa1|sum~combout\);

-- Location: FF_X16_Y66_N17
\reg3|Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \rca|fa1|sum~combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg3|Q\(1));

-- Location: LCCOMB_X16_Y66_N26
\rca|fa2|sum~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa2|sum~0_combout\ = \reg1|Q\(2) $ (\reg2|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reg1|Q\(2),
	datad => \reg2|Q\(2),
	combout => \rca|fa2|sum~0_combout\);

-- Location: LCCOMB_X16_Y66_N2
\rca|fa2|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa2|sum~combout\ = \rca|fa2|sum~0_combout\ $ (((\reg1|Q\(1) & ((\reg2|Q\(1)) # (\rca|fa0|mux|m~0_combout\))) # (!\reg1|Q\(1) & (\reg2|Q\(1) & \rca|fa0|mux|m~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg1|Q\(1),
	datab => \reg2|Q\(1),
	datac => \rca|fa2|sum~0_combout\,
	datad => \rca|fa0|mux|m~0_combout\,
	combout => \rca|fa2|sum~combout\);

-- Location: FF_X16_Y66_N3
\reg3|Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \rca|fa2|sum~combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg3|Q\(2));

-- Location: LCCOMB_X16_Y66_N12
\rca|fa3|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \rca|fa3|sum~combout\ = \reg2|Q\(3) $ (\reg1|Q\(3) $ (((\rca|fa2|mux|m~0_combout\) # (\rca|fa2|mux|m~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reg2|Q\(3),
	datab => \reg1|Q\(3),
	datac => \rca|fa2|mux|m~0_combout\,
	datad => \rca|fa2|mux|m~2_combout\,
	combout => \rca|fa3|sum~combout\);

-- Location: FF_X16_Y66_N13
\reg3|Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \rca|fa3|sum~combout\,
	clrn => \RSTn~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reg3|Q\(3));

ww_OVF <= \OVF~output_o\;

ww_SUM4(0) <= \SUM4[0]~output_o\;

ww_SUM4(1) <= \SUM4[1]~output_o\;

ww_SUM4(2) <= \SUM4[2]~output_o\;

ww_SUM4(3) <= \SUM4[3]~output_o\;
END structure;


