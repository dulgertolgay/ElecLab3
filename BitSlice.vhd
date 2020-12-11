----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:48:48 12/05/2020 
-- Design Name: 
-- Module Name:    BitSlice - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity BitSlice is
	port(
		Cin, A, B, M : in std_logic;
		S : in std_logic_vector(1 downto 0);
		Cout, F : out std_logic
	);
end BitSlice;

architecture Behavioral of BitSlice is
begin
	process(S) 
	begin
		F <= '0';
		Cout <= '0';
		if M='0' then
		--implement logic unit
			case S is
				when "00" =>
					F <= A and B;
				when "01" =>
					F <= A or B;
				when "10" =>
					F <= A xor B;
				when others =>
					F <= A xnor B;
			end case;
		else
		--implement arithmetic unit
			case S is
				when "00" =>
					F <= A xor Cin;
					Cout <= Cin and A;
				when "01" =>
					F <= (A xor B) xor Cin;
					Cout <= (A and B) or (Cin and (A xor B));					
				when "10" =>
					F <= (A xor (not B)) xor Cin;
					Cout <= (A and (not B)) or (Cin and (A xor (not B)));
				when others =>
					F <= (B xor (not A)) xor Cin;
					Cout <= (B and (not A)) or (Cin and (B xor (not A)));
			end case;
		end if;
	end process;
end Behavioral;