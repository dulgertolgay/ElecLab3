--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:49:23 12/05/2020
-- Design Name:   
-- Module Name:   C:/ELEC LAB/Bit-Slice/BitSliceSim.vhd
-- Project Name:  Bit-Slice
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BitSlice
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY BitSliceSim IS
END BitSliceSim;
 
ARCHITECTURE behavior OF BitSliceSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BitSlice
    PORT(
		Cin, A, B, M : in std_logic;
		S : in std_logic_vector(1 downto 0);
		Cout, F : out std_logic
        );
    END COMPONENT;
    
  --inputs
	signal M : std_logic := '0';
	signal S : std_logic_vector(1 downto 0) := "00";
	signal Cin : std_logic := '0';
	signal A : std_logic := '0';
	signal B : std_logic := '0';
	
  --outputs
	signal Cout : std_logic;
	signal F : std_logic;
	
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BitSlice PORT MAP (
		M => M,
		S => S,
		Cin => Cin,
		A => A,
		B => B,
		Cout => Cout,
		F => F
        );
 

   -- Stimulus process
   stim_proc: process
   begin
			S <= "00"; M <= '0'; A <= '0'; B <= '0'; 
		wait for Clock_period;
			S <= "01"; M <= '0'; A <= '1'; B <= '0';
		wait for Clock_period;
			S <= "10"; M <= '0'; A <= '1'; B <= '0';
		wait for Clock_period;
			S <= "00"; M <= '1';  A <= '1'; B <= '0'; Cin <= '0';
		wait for Clock_period;
			S <= "01"; M <= '1';  A <= '1'; B <= '0'; Cin <= '1';
		wait for Clock_period;
			S <= "10"; M <= '1';  A <= '1'; B <= '0'; Cin <= '1';
		wait;
   end process;

END;
