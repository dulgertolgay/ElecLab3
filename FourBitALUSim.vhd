--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:46:03 12/07/2020
-- Design Name:   
-- Module Name:   C:/ELEC LAB/FourBitALU/FourBitALUSim.vhd
-- Project Name:  FourBitALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitALU
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
 
ENTITY FourBitALUSim IS
END FourBitALUSim;
 
ARCHITECTURE behavior OF FourBitALUSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitALU
    PORT(
		Cin, M : in std_logic;
		A, B : in std_logic_vector(3 downto 0);
		S : in std_logic_vector(1 downto 0);
		Cout, Flag: out std_logic;
		F: out std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
	--inputs
	signal M : std_logic := '0';
	signal S : std_logic_vector(1 downto 0) := "00";
	signal Cin : std_logic := '0';
	signal A : std_logic_vector(3 downto 0) := "0000";
	signal B : std_logic_vector(3 downto 0) := "0000";
	
  --outputs
	signal Cout : std_logic;
	signal Flag : std_logic;
	signal F : std_logic_vector(3 downto 0);
	
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitALU PORT MAP (
		M => M,
		S => S,
		Cin => Cin,
		A => A,
		B => B,
		Cout => Cout,
		F => F,
		Flag => Flag
        );

   -- Stimulus process
   stim_proc: process
   begin		
			S <= "00"; Cin <= '0'; M <= '0'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "01"; Cin <= '0'; M <= '0'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "10"; Cin <= '0'; M <= '0'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "11"; Cin <= '0'; M <= '0'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "00"; Cin <= '0'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "00"; Cin <= '1'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "01"; Cin <= '0'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "01"; Cin <= '1'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "10"; Cin <= '0'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "10"; Cin <= '1'; M <= '1'; A <= "1001"; B <= "0110";
		wait for Clock_period;
			S <= "11"; Cin <= '0'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "11"; Cin <= '1'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait for Clock_period;
			S <= "10"; Cin <= '1'; M <= '1'; A <= "1001"; B <= "0110"; 
		wait;
   end process;

END;
