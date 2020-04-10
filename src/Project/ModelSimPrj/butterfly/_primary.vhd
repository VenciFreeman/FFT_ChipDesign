library verilog;
use verilog.vl_types.all;
entity butterfly is
    port(
        clac_in         : in     vl_logic_vector(135 downto 0);
        rotation_factors: in     vl_logic_vector(23 downto 0);
        calc_out        : out    vl_logic_vector(135 downto 0)
    );
end butterfly;
