----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:46 12/07/2020 
-- Design Name: 
-- Module Name:    FourBitALU - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FourBitALU is
	port(
		Cin, M : in std_logic;
		A, B : in std_logic_vector(3 downto 0);
		S : in std_logic_vector(1 downto 0);
		Cout, Flag: out std_logic;
		F: out std_logic_vector(3 downto 0)
	);
end FourBitALU;

architecture Behavioral of FourBitALU is

begin
	process(S,Cin,M,A,B)
	variable Cmid : std_logic_vector(4 downto 0);
	variable AN,BN : std_logic_vector(3 downto 0);
	begin
		Flag <= '0';
		F <= "0000";
		AN := "0000";
		BN := "0000";
		Cmid := "00000";
		Cmid(0) := Cin;
		for I in 0 to 3 loop
			if M='0' then
			--implement logic unit
				case S is
					when "00" =>
						F(I) <= A(I) and B(I);
					when "01" =>
						F(I) <= A(I) or B(I);
					when "10" =>
						F(I) <= A(I) xor B(I);
					when others =>
						F(I) <= A(I) xnor B(I);
				end case;
			else
			--implement arithmetic unit
				case S is
					when "00" =>
						F(I) <= A(I) xor Cmid(I);
						Cmid(I+1) := Cmid(I) and A(I);
					when "01" =>
						F(I) <= A(I) xor B(I) xor Cmid(I);
						Cmid(I+1) := (A(I) and B(I)) or (B(I) and Cmid(I)) or (Cmid(I) and A(I));					
					when "10" =>
						BN(I) := not B(I);
						F(I) <= A(I) xor BN(I) xor Cmid(I);
						Cmid(I+1) := (A(I) and BN(I)) or (Cmid(I) and A(I)) or (Cmid(I) and BN(I));
					when others =>
						AN(I) := not A(I);
						F(I) <= B(I) xor AN(I) xor Cmid(I);
						Cmid(I+1) := (B(I) and AN(I)) or (Cmid(I) and B(I)) or (Cmid(I) and AN(I));
				end case;
			end if;	
		end loop;
		Cout <= Cmid(4);
		if Cmid(4)/=Cmid(3) then
				Flag <= '1';
		end if;
	end process;
end Behavioral;

