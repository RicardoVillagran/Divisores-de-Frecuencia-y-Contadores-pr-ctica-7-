library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

entity contador is
	Port (reloj : in STD_LOGIC;
	
		Seg: out STD_LOGIC_VECTOR (6 downto 0));
		
end contador;

architecture Behavioral of contador is
signal segundo: std_logic;
signal C: std_logic_vector (3 downto 0);
begin

Divi: process (reloj)
variable cuenta: std_logic_vector(27 downto 0) := x"0000000";
begin
	if rising_edge (reloj) then
		if cuenta= x"48009e0" then
		cuenta := x"0000000";
		else
		cuenta := cuenta+1;
		end if;
		end if;
segundo<= cuenta(24);
end process;

conta: process (segundo)
variable cuenta : std_logic_vector(3 downto 0) := "1001";
begin
	if rising_edge (segundo) then
	if cuenta = "0000" then
	cuenta := "1001";
else
	cuenta := cuenta -1;
	end if; 
	end if;
	C <= cuenta;
end process;

with C select
Seg <= "1000000" when "0000", --O
"1111001" when "0001", --1
"0100100" when "0010", --2
"0110000" when "0011", --3
"0011001" when "0100", --4
"0010010" when "0101", --5
"0000010" when "0110", --6
"1111000" when "0111", --7
"0000000" when "1000", --8
"0010000" when "1001", --91
"1000000" when others; --cero

end Behavioral;

