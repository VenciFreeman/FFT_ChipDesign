
module ctrl ( clk, rst_n, s_p_flag_in, mux_flag, rotation, demux_flag );
  output [2:0] rotation;
  input clk, rst_n, s_p_flag_in;
  output mux_flag, demux_flag;
  wire   N17, N18, N19, n1, n2, n3, n4;
  wire   [2:0] core_tick;

  DFFRHQX1 rotation_reg_1_ ( .D(core_tick[1]), .CK(clk), .RN(rst_n), .Q(
        rotation[1]) );
  DFFRHQX1 rotation_reg_2_ ( .D(core_tick[2]), .CK(clk), .RN(rst_n), .Q(
        rotation[2]) );
  DFFRHQX1 rotation_reg_0_ ( .D(core_tick[0]), .CK(clk), .RN(rst_n), .Q(
        rotation[0]) );
  DFFRHQX1 core_tick_reg_2_ ( .D(N19), .CK(clk), .RN(rst_n), .Q(core_tick[2])
         );
  DFFRHQX1 core_tick_reg_1_ ( .D(N18), .CK(clk), .RN(rst_n), .Q(core_tick[1])
         );
  DFFRHQX1 core_tick_reg_0_ ( .D(N17), .CK(clk), .RN(rst_n), .Q(core_tick[0])
         );
  DFFRHQX1 mux_flag_reg ( .D(core_tick[2]), .CK(clk), .RN(rst_n), .Q(mux_flag)
         );
  DFFRHQX1 demux_flag_reg ( .D(n1), .CK(clk), .RN(rst_n), .Q(demux_flag) );
  INVX1 U3 ( .A(core_tick[2]), .Y(n1) );
  AOI21X1 U4 ( .A0(n4), .A1(n2), .B0(core_tick[0]), .Y(N17) );
  NOR2X1 U5 ( .A(s_p_flag_in), .B(core_tick[2]), .Y(n4) );
  INVX1 U6 ( .A(core_tick[1]), .Y(n2) );
  XOR2X1 U7 ( .A(core_tick[1]), .B(core_tick[0]), .Y(N18) );
  XOR2X1 U8 ( .A(n1), .B(n3), .Y(N19) );
  NAND2X1 U9 ( .A(core_tick[1]), .B(core_tick[0]), .Y(n3) );
endmodule


module s_p ( clk, rst_n, data_in_1, data_out_1, s_p_flag_out );
  input [33:0] data_in_1;
  output [135:0] data_out_1;
  input clk, rst_n;
  output s_p_flag_out;
  wire   N13, N14, N15, N171, N230, n550, n832, n833, n834, n835, n836, n837,
         n838, n839, n840, n841, n842, n843, n844, n845, n846, n847, n848,
         n849, n850, n851, n852, n853, n854, n855, n856, n857, n858, n859,
         n860, n861, n862, n863, n864, n865, n866, n867, n868, n869, n870,
         n871, n872, n873, n874, n875, n876, n877, n878, n879, n880, n881,
         n882, n883, n884, n885, n886, n887, n888, n889, n890, n891, n892,
         n893, n894, n895, n896, n897, n898, n899, n900, n901, n902, n903,
         n904, n905, n906, n907, n908, n909, n910, n911, n912, n913, n914,
         n915, n916, n917, n918, n919, n920, n921, n922, n923, n924, n925,
         n926, n927, n928, n929, n930, n931, n932, n933, n934, n935, n936,
         n937, n938, n939, n940, n941, n942, n943, n944, n945, n946, n947,
         n948, n949, n950, n951, n952, n953, n954, n955, n956, n957, n958,
         n959, n960, n961, n962, n963, n964, n965, n966, n967, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n1120, n1121, n1122, n1656, n972, n1876, n1877, n1878,
         n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887, n1888,
         n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897, n1898,
         n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907, n1908,
         n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917, n1918,
         n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927, n1928,
         n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937, n1938,
         n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947, n1948,
         n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956, n1957, n1958,
         n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966, n1967, n1968,
         n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976, n1977, n1978,
         n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986, n1987, n1988,
         n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996, n1997, n1998,
         n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006, n2007, n2008,
         n2009, n2010, n2011, n2148, n2149, n2150, n2151, n2152, n2153, n2154,
         n2155, n2156, n2157, n2158, n2159, n2160, n2161, n2162, n2163, n2164,
         n2165, n2166, n2167, n2168, n2169, n2170, n2171, n2172, n2173, n2174,
         n2175, n2176, n2177, n2178, n2179, n2180, n2181, n2182, n2183, n2184,
         n2185, n2186, n2187, n2188, n2189, n2190, n2191, n2192, n2193, n2194,
         n2195, n2196, n2197, n2198, n2199, n2200, n2201, n2202, n2203, n2204,
         n2205, n2206, n2207, n2208, n2209, n2210, n2211, n2212, n2213, n2214,
         n2215, n2216, n2217, n2218, n2219, n2220, n2221, n2222, n2223, n2224,
         n2225, n2226, n2227, n2228, n2229, n2230, n2231, n2232, n2233, n2234,
         n2235, n2236, n2237, n2238, n2239, n2240, n2241, n2242, n2243, n2244,
         n2245, n2246, n2247, n2248, n2249, n2250, n2251, n2252, n2253, n2254,
         n2255, n2256, n2257, n2258, n2259, n2260, n2261, n2262, n2263, n2264,
         n2265, n2266, n2267, n2268, n2269, n2270, n2271, n2272, n2273, n2274,
         n2275, n2276, n2277, n2278, n2279, n2280, n2281, n2282, n2283, n686,
         n687, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n968, n969, n970, n971, n974, n975, n976, n978, n980, n981,
         n2378, n2379, n2380, n2926, n2927, n2928, n2929, n2930, n2931, n2932,
         n2933, n2934, n2935, n2936, n2937, n2938, n2939, n2940, n2941, n2942,
         n2943, n2944, n2945, n2946, n2947, n2948, n2949, n2950, n2951, n2952,
         n2953, n2954, n2955, n2956, n2957, n2958, n2959, n2960, n2961, n2962,
         n2963, n2964, n2965, n2966, n2967, n2968, n2969, n2970, n2971, n2972,
         n2973, n2974, n2975, n2976, n2977, n2978, n2979, n2980, n2981, n2982,
         n2983, n2984, n2985, n2986, n2987, n2988, n2989, n2990, n2991, n2992,
         n2993, n2994, n2995, n2996, n2997, n2998, n2999, n3000, n3001, n3002,
         n3003, n3004, n3005, n3006, n3007, n3008, n3009, n3010, n3011, n3012,
         n3013, n3014, n3015, n3016, n3017, n3018, n3019, n3020, n3021, n3022,
         n3023, n3024, n3025, n3026, n3027;
  wire   [3:1] counter;
  wire   [33:0] R15;
  wire   [33:0] R11;
  wire   [33:0] R7;
  wire   [33:0] R3;

  EDFFX1 R15_reg_33_ ( .D(data_in_1[33]), .E(n3018), .CK(clk), .Q(R15[33]) );
  EDFFX1 R15_reg_32_ ( .D(data_in_1[32]), .E(n3018), .CK(clk), .Q(R15[32]) );
  EDFFX1 R15_reg_31_ ( .D(data_in_1[31]), .E(n3017), .CK(clk), .Q(R15[31]) );
  EDFFX1 R15_reg_30_ ( .D(data_in_1[30]), .E(n3019), .CK(clk), .Q(R15[30]) );
  EDFFX1 R15_reg_29_ ( .D(data_in_1[29]), .E(n3018), .CK(clk), .Q(R15[29]) );
  EDFFX1 R15_reg_28_ ( .D(data_in_1[28]), .E(n3018), .CK(clk), .Q(R15[28]) );
  EDFFX1 R15_reg_27_ ( .D(data_in_1[27]), .E(n3017), .CK(clk), .Q(R15[27]) );
  EDFFX1 R15_reg_26_ ( .D(data_in_1[26]), .E(n3019), .CK(clk), .Q(R15[26]) );
  EDFFX1 R15_reg_25_ ( .D(data_in_1[25]), .E(n3020), .CK(clk), .Q(R15[25]) );
  EDFFX1 R15_reg_24_ ( .D(data_in_1[24]), .E(n3017), .CK(clk), .Q(R15[24]) );
  EDFFX1 R15_reg_23_ ( .D(data_in_1[23]), .E(n3020), .CK(clk), .Q(R15[23]) );
  EDFFX1 R15_reg_22_ ( .D(data_in_1[22]), .E(n3018), .CK(clk), .Q(R15[22]) );
  EDFFX1 R15_reg_21_ ( .D(data_in_1[21]), .E(n3017), .CK(clk), .Q(R15[21]) );
  EDFFX1 R15_reg_20_ ( .D(data_in_1[20]), .E(n3019), .CK(clk), .Q(R15[20]) );
  EDFFX1 R15_reg_19_ ( .D(data_in_1[19]), .E(n3020), .CK(clk), .Q(R15[19]) );
  EDFFX1 R15_reg_18_ ( .D(data_in_1[18]), .E(n3019), .CK(clk), .Q(R15[18]) );
  EDFFX1 R15_reg_17_ ( .D(data_in_1[17]), .E(n3017), .CK(clk), .Q(R15[17]) );
  EDFFX1 R15_reg_16_ ( .D(data_in_1[16]), .E(n3018), .CK(clk), .Q(R15[16]) );
  EDFFX1 R15_reg_15_ ( .D(data_in_1[15]), .E(n3017), .CK(clk), .Q(R15[15]) );
  EDFFX1 R15_reg_14_ ( .D(data_in_1[14]), .E(n3019), .CK(clk), .Q(R15[14]) );
  EDFFX1 R15_reg_13_ ( .D(data_in_1[13]), .E(n3020), .CK(clk), .Q(R15[13]) );
  EDFFX1 R15_reg_12_ ( .D(data_in_1[12]), .E(n3018), .CK(clk), .Q(R15[12]) );
  EDFFX1 R15_reg_11_ ( .D(data_in_1[11]), .E(n3019), .CK(clk), .Q(R15[11]) );
  EDFFX1 R15_reg_10_ ( .D(data_in_1[10]), .E(n3018), .CK(clk), .Q(R15[10]) );
  EDFFX1 R15_reg_9_ ( .D(data_in_1[9]), .E(n3017), .CK(clk), .Q(R15[9]) );
  EDFFX1 R15_reg_8_ ( .D(data_in_1[8]), .E(n3019), .CK(clk), .Q(R15[8]) );
  EDFFX1 R15_reg_7_ ( .D(data_in_1[7]), .E(n3020), .CK(clk), .Q(R15[7]) );
  EDFFX1 R15_reg_6_ ( .D(data_in_1[6]), .E(n3020), .CK(clk), .Q(R15[6]) );
  EDFFX1 R15_reg_5_ ( .D(data_in_1[5]), .E(n3020), .CK(clk), .Q(R15[5]) );
  EDFFX1 R15_reg_4_ ( .D(data_in_1[4]), .E(n3020), .CK(clk), .Q(R15[4]) );
  EDFFX1 R15_reg_3_ ( .D(data_in_1[3]), .E(n3020), .CK(clk), .Q(R15[3]) );
  EDFFX1 R15_reg_2_ ( .D(data_in_1[2]), .E(n3020), .CK(clk), .Q(R15[2]) );
  EDFFX1 R15_reg_1_ ( .D(data_in_1[1]), .E(n3020), .CK(clk), .Q(R15[1]) );
  EDFFX1 R15_reg_0_ ( .D(data_in_1[0]), .E(n3020), .CK(clk), .Q(R15[0]) );
  EDFFX1 R11_reg_33_ ( .D(data_in_1[33]), .E(n1121), .CK(clk), .Q(R11[33]) );
  EDFFX1 R11_reg_32_ ( .D(data_in_1[32]), .E(n1121), .CK(clk), .Q(R11[32]) );
  EDFFX1 R11_reg_31_ ( .D(data_in_1[31]), .E(n1121), .CK(clk), .Q(R11[31]) );
  EDFFX1 R11_reg_30_ ( .D(data_in_1[30]), .E(n1121), .CK(clk), .Q(R11[30]) );
  EDFFX1 R11_reg_29_ ( .D(data_in_1[29]), .E(n1121), .CK(clk), .Q(R11[29]) );
  EDFFX1 R11_reg_28_ ( .D(data_in_1[28]), .E(n1121), .CK(clk), .Q(R11[28]) );
  EDFFX1 R11_reg_27_ ( .D(data_in_1[27]), .E(n1121), .CK(clk), .Q(R11[27]) );
  EDFFX1 R11_reg_26_ ( .D(data_in_1[26]), .E(n1121), .CK(clk), .Q(R11[26]) );
  EDFFX1 R11_reg_25_ ( .D(data_in_1[25]), .E(n3011), .CK(clk), .Q(R11[25]) );
  EDFFX1 R11_reg_24_ ( .D(data_in_1[24]), .E(n3010), .CK(clk), .Q(R11[24]) );
  EDFFX1 R11_reg_23_ ( .D(data_in_1[23]), .E(n3011), .CK(clk), .Q(R11[23]) );
  EDFFX1 R11_reg_22_ ( .D(data_in_1[22]), .E(n3011), .CK(clk), .Q(R11[22]) );
  EDFFX1 R11_reg_21_ ( .D(data_in_1[21]), .E(n3011), .CK(clk), .Q(R11[21]) );
  EDFFX1 R11_reg_20_ ( .D(data_in_1[20]), .E(n3011), .CK(clk), .Q(R11[20]) );
  EDFFX1 R11_reg_19_ ( .D(data_in_1[19]), .E(n3011), .CK(clk), .Q(R11[19]) );
  EDFFX1 R11_reg_18_ ( .D(data_in_1[18]), .E(n3011), .CK(clk), .Q(R11[18]) );
  EDFFX1 R11_reg_17_ ( .D(data_in_1[17]), .E(n3011), .CK(clk), .Q(R11[17]) );
  EDFFX1 R11_reg_16_ ( .D(data_in_1[16]), .E(n3011), .CK(clk), .Q(R11[16]) );
  EDFFX1 R11_reg_15_ ( .D(data_in_1[15]), .E(n3011), .CK(clk), .Q(R11[15]) );
  EDFFX1 R11_reg_14_ ( .D(data_in_1[14]), .E(n3011), .CK(clk), .Q(R11[14]) );
  EDFFX1 R11_reg_13_ ( .D(data_in_1[13]), .E(n3011), .CK(clk), .Q(R11[13]) );
  EDFFX1 R11_reg_12_ ( .D(data_in_1[12]), .E(n3011), .CK(clk), .Q(R11[12]) );
  EDFFX1 R11_reg_11_ ( .D(data_in_1[11]), .E(n3010), .CK(clk), .Q(R11[11]) );
  EDFFX1 R11_reg_10_ ( .D(data_in_1[10]), .E(n3010), .CK(clk), .Q(R11[10]) );
  EDFFX1 R11_reg_9_ ( .D(data_in_1[9]), .E(n3010), .CK(clk), .Q(R11[9]) );
  EDFFX1 R11_reg_8_ ( .D(data_in_1[8]), .E(n3010), .CK(clk), .Q(R11[8]) );
  EDFFX1 R11_reg_7_ ( .D(data_in_1[7]), .E(n3010), .CK(clk), .Q(R11[7]) );
  EDFFX1 R11_reg_6_ ( .D(data_in_1[6]), .E(n3010), .CK(clk), .Q(R11[6]) );
  EDFFX1 R11_reg_5_ ( .D(data_in_1[5]), .E(n3010), .CK(clk), .Q(R11[5]) );
  EDFFX1 R11_reg_4_ ( .D(data_in_1[4]), .E(n3010), .CK(clk), .Q(R11[4]) );
  EDFFX1 R11_reg_3_ ( .D(data_in_1[3]), .E(n3010), .CK(clk), .Q(R11[3]) );
  EDFFX1 R11_reg_2_ ( .D(data_in_1[2]), .E(n3010), .CK(clk), .Q(R11[2]) );
  EDFFX1 R11_reg_1_ ( .D(data_in_1[1]), .E(n3010), .CK(clk), .Q(R11[1]) );
  EDFFX1 R11_reg_0_ ( .D(data_in_1[0]), .E(n3010), .CK(clk), .Q(R11[0]) );
  EDFFX1 R7_reg_33_ ( .D(data_in_1[33]), .E(n3013), .CK(clk), .Q(R7[33]) );
  EDFFX1 R7_reg_32_ ( .D(data_in_1[32]), .E(n3013), .CK(clk), .Q(R7[32]) );
  EDFFX1 R7_reg_31_ ( .D(data_in_1[31]), .E(n3013), .CK(clk), .Q(R7[31]) );
  EDFFX1 R7_reg_30_ ( .D(data_in_1[30]), .E(n3013), .CK(clk), .Q(R7[30]) );
  EDFFX1 R7_reg_29_ ( .D(data_in_1[29]), .E(n3013), .CK(clk), .Q(R7[29]) );
  EDFFX1 R7_reg_28_ ( .D(data_in_1[28]), .E(n3013), .CK(clk), .Q(R7[28]) );
  EDFFX1 R7_reg_27_ ( .D(data_in_1[27]), .E(n3013), .CK(clk), .Q(R7[27]) );
  EDFFX1 R7_reg_26_ ( .D(data_in_1[26]), .E(n3013), .CK(clk), .Q(R7[26]) );
  EDFFX1 R7_reg_25_ ( .D(data_in_1[25]), .E(n3013), .CK(clk), .Q(R7[25]) );
  EDFFX1 R7_reg_24_ ( .D(data_in_1[24]), .E(n3013), .CK(clk), .Q(R7[24]) );
  EDFFX1 R7_reg_23_ ( .D(data_in_1[23]), .E(n3013), .CK(clk), .Q(R7[23]) );
  EDFFX1 R7_reg_22_ ( .D(data_in_1[22]), .E(n3013), .CK(clk), .Q(R7[22]) );
  EDFFX1 R7_reg_21_ ( .D(data_in_1[21]), .E(n3014), .CK(clk), .Q(R7[21]) );
  EDFFX1 R7_reg_20_ ( .D(data_in_1[20]), .E(n3014), .CK(clk), .Q(R7[20]) );
  EDFFX1 R7_reg_19_ ( .D(data_in_1[19]), .E(n3014), .CK(clk), .Q(R7[19]) );
  EDFFX1 R7_reg_18_ ( .D(data_in_1[18]), .E(n3014), .CK(clk), .Q(R7[18]) );
  EDFFX1 R7_reg_17_ ( .D(data_in_1[17]), .E(n3014), .CK(clk), .Q(R7[17]) );
  EDFFX1 R7_reg_16_ ( .D(data_in_1[16]), .E(n3014), .CK(clk), .Q(R7[16]) );
  EDFFX1 R7_reg_15_ ( .D(data_in_1[15]), .E(n3014), .CK(clk), .Q(R7[15]) );
  EDFFX1 R7_reg_14_ ( .D(data_in_1[14]), .E(n3014), .CK(clk), .Q(R7[14]) );
  EDFFX1 R7_reg_13_ ( .D(data_in_1[13]), .E(n3014), .CK(clk), .Q(R7[13]) );
  EDFFX1 R7_reg_12_ ( .D(data_in_1[12]), .E(n3014), .CK(clk), .Q(R7[12]) );
  EDFFX1 R7_reg_11_ ( .D(data_in_1[11]), .E(n3014), .CK(clk), .Q(R7[11]) );
  EDFFX1 R7_reg_10_ ( .D(data_in_1[10]), .E(n3014), .CK(clk), .Q(R7[10]) );
  EDFFX1 R7_reg_9_ ( .D(data_in_1[9]), .E(n1120), .CK(clk), .Q(R7[9]) );
  EDFFX1 R7_reg_8_ ( .D(data_in_1[8]), .E(n1120), .CK(clk), .Q(R7[8]) );
  EDFFX1 R7_reg_7_ ( .D(data_in_1[7]), .E(n1120), .CK(clk), .Q(R7[7]) );
  EDFFX1 R7_reg_6_ ( .D(data_in_1[6]), .E(n1120), .CK(clk), .Q(R7[6]) );
  EDFFX1 R7_reg_5_ ( .D(data_in_1[5]), .E(n1120), .CK(clk), .Q(R7[5]) );
  EDFFX1 R7_reg_4_ ( .D(data_in_1[4]), .E(n1120), .CK(clk), .Q(R7[4]) );
  EDFFX1 R7_reg_3_ ( .D(data_in_1[3]), .E(n1120), .CK(clk), .Q(R7[3]) );
  EDFFX1 R7_reg_2_ ( .D(data_in_1[2]), .E(n3013), .CK(clk), .Q(R7[2]) );
  EDFFX1 R7_reg_1_ ( .D(data_in_1[1]), .E(n3014), .CK(clk), .Q(R7[1]) );
  EDFFX1 R7_reg_0_ ( .D(data_in_1[0]), .E(n3014), .CK(clk), .Q(R7[0]) );
  EDFFX1 R3_reg_33_ ( .D(data_in_1[33]), .E(n1122), .CK(clk), .Q(R3[33]) );
  EDFFX1 R3_reg_32_ ( .D(data_in_1[32]), .E(n1122), .CK(clk), .Q(R3[32]) );
  EDFFX1 R3_reg_31_ ( .D(data_in_1[31]), .E(n1122), .CK(clk), .Q(R3[31]) );
  EDFFX1 R3_reg_30_ ( .D(data_in_1[30]), .E(n1122), .CK(clk), .Q(R3[30]) );
  EDFFX1 R3_reg_29_ ( .D(data_in_1[29]), .E(n1122), .CK(clk), .Q(R3[29]) );
  EDFFX1 R3_reg_28_ ( .D(data_in_1[28]), .E(n1122), .CK(clk), .Q(R3[28]) );
  EDFFX1 R3_reg_27_ ( .D(data_in_1[27]), .E(n1122), .CK(clk), .Q(R3[27]) );
  EDFFX1 R3_reg_26_ ( .D(data_in_1[26]), .E(n1122), .CK(clk), .Q(R3[26]) );
  EDFFX1 R3_reg_25_ ( .D(data_in_1[25]), .E(n3008), .CK(clk), .Q(R3[25]) );
  EDFFX1 R3_reg_24_ ( .D(data_in_1[24]), .E(n3007), .CK(clk), .Q(R3[24]) );
  EDFFX1 R3_reg_23_ ( .D(data_in_1[23]), .E(n3008), .CK(clk), .Q(R3[23]) );
  EDFFX1 R3_reg_22_ ( .D(data_in_1[22]), .E(n3008), .CK(clk), .Q(R3[22]) );
  EDFFX1 R3_reg_21_ ( .D(data_in_1[21]), .E(n3008), .CK(clk), .Q(R3[21]) );
  EDFFX1 R3_reg_20_ ( .D(data_in_1[20]), .E(n3008), .CK(clk), .Q(R3[20]) );
  EDFFX1 R3_reg_19_ ( .D(data_in_1[19]), .E(n3008), .CK(clk), .Q(R3[19]) );
  EDFFX1 R3_reg_18_ ( .D(data_in_1[18]), .E(n3008), .CK(clk), .Q(R3[18]) );
  EDFFX1 R3_reg_17_ ( .D(data_in_1[17]), .E(n3008), .CK(clk), .Q(R3[17]) );
  EDFFX1 R3_reg_16_ ( .D(data_in_1[16]), .E(n3008), .CK(clk), .Q(R3[16]) );
  EDFFX1 R3_reg_15_ ( .D(data_in_1[15]), .E(n3008), .CK(clk), .Q(R3[15]) );
  EDFFX1 R3_reg_14_ ( .D(data_in_1[14]), .E(n3008), .CK(clk), .Q(R3[14]) );
  EDFFX1 R3_reg_13_ ( .D(data_in_1[13]), .E(n3008), .CK(clk), .Q(R3[13]) );
  EDFFX1 R3_reg_12_ ( .D(data_in_1[12]), .E(n3008), .CK(clk), .Q(R3[12]) );
  EDFFX1 R3_reg_11_ ( .D(data_in_1[11]), .E(n3007), .CK(clk), .Q(R3[11]) );
  EDFFX1 R3_reg_10_ ( .D(data_in_1[10]), .E(n3007), .CK(clk), .Q(R3[10]) );
  EDFFX1 R3_reg_9_ ( .D(data_in_1[9]), .E(n3007), .CK(clk), .Q(R3[9]) );
  EDFFX1 R3_reg_8_ ( .D(data_in_1[8]), .E(n3007), .CK(clk), .Q(R3[8]) );
  EDFFX1 R3_reg_7_ ( .D(data_in_1[7]), .E(n3007), .CK(clk), .Q(R3[7]) );
  EDFFX1 R3_reg_6_ ( .D(data_in_1[6]), .E(n3007), .CK(clk), .Q(R3[6]) );
  EDFFX1 R3_reg_5_ ( .D(data_in_1[5]), .E(n3007), .CK(clk), .Q(R3[5]) );
  EDFFX1 R3_reg_4_ ( .D(data_in_1[4]), .E(n3007), .CK(clk), .Q(R3[4]) );
  EDFFX1 R3_reg_3_ ( .D(data_in_1[3]), .E(n3007), .CK(clk), .Q(R3[3]) );
  EDFFX1 R3_reg_2_ ( .D(data_in_1[2]), .E(n3007), .CK(clk), .Q(R3[2]) );
  EDFFX1 R3_reg_1_ ( .D(data_in_1[1]), .E(n3007), .CK(clk), .Q(R3[1]) );
  EDFFX1 R3_reg_0_ ( .D(data_in_1[0]), .E(n3007), .CK(clk), .Q(R3[0]) );
  EDFFX1 R13_reg_33_ ( .D(data_in_1[33]), .E(n2999), .CK(clk), .QN(n2283) );
  EDFFX1 R13_reg_32_ ( .D(data_in_1[32]), .E(n3001), .CK(clk), .QN(n2282) );
  EDFFX1 R13_reg_31_ ( .D(data_in_1[31]), .E(n3000), .CK(clk), .QN(n2281) );
  EDFFX1 R13_reg_30_ ( .D(data_in_1[30]), .E(n3001), .CK(clk), .QN(n2280) );
  EDFFX1 R13_reg_29_ ( .D(data_in_1[29]), .E(n3002), .CK(clk), .QN(n2279) );
  EDFFX1 R13_reg_28_ ( .D(data_in_1[28]), .E(n3003), .CK(clk), .QN(n2278) );
  EDFFX1 R13_reg_27_ ( .D(data_in_1[27]), .E(n3000), .CK(clk), .QN(n2277) );
  EDFFX1 R13_reg_26_ ( .D(data_in_1[26]), .E(n3001), .CK(clk), .QN(n2276) );
  EDFFX1 R13_reg_25_ ( .D(data_in_1[25]), .E(n3000), .CK(clk), .QN(n2275) );
  EDFFX1 R13_reg_24_ ( .D(data_in_1[24]), .E(n3000), .CK(clk), .QN(n2274) );
  EDFFX1 R13_reg_23_ ( .D(data_in_1[23]), .E(n3000), .CK(clk), .QN(n2273) );
  EDFFX1 R13_reg_22_ ( .D(data_in_1[22]), .E(n3000), .CK(clk), .QN(n2272) );
  EDFFX1 R13_reg_21_ ( .D(data_in_1[21]), .E(n3000), .CK(clk), .QN(n2271) );
  EDFFX1 R13_reg_20_ ( .D(data_in_1[20]), .E(n3002), .CK(clk), .QN(n2270) );
  EDFFX1 R13_reg_19_ ( .D(data_in_1[19]), .E(n3003), .CK(clk), .QN(n2269) );
  EDFFX1 R13_reg_18_ ( .D(data_in_1[18]), .E(n3000), .CK(clk), .QN(n2268) );
  EDFFX1 R13_reg_17_ ( .D(data_in_1[17]), .E(n3002), .CK(clk), .QN(n2267) );
  EDFFX1 R13_reg_16_ ( .D(data_in_1[16]), .E(n3000), .CK(clk), .QN(n2266) );
  EDFFX1 R13_reg_15_ ( .D(data_in_1[15]), .E(n3001), .CK(clk), .QN(n2265) );
  EDFFX1 R13_reg_14_ ( .D(data_in_1[14]), .E(n3003), .CK(clk), .QN(n2264) );
  EDFFX1 R13_reg_13_ ( .D(data_in_1[13]), .E(n3002), .CK(clk), .QN(n2263) );
  EDFFX1 R13_reg_12_ ( .D(data_in_1[12]), .E(n3001), .CK(clk), .QN(n2262) );
  EDFFX1 R13_reg_11_ ( .D(data_in_1[11]), .E(n3001), .CK(clk), .QN(n2261) );
  EDFFX1 R13_reg_10_ ( .D(data_in_1[10]), .E(n3001), .CK(clk), .QN(n2260) );
  EDFFX1 R13_reg_9_ ( .D(data_in_1[9]), .E(n3001), .CK(clk), .QN(n2259) );
  EDFFX1 R13_reg_8_ ( .D(data_in_1[8]), .E(n3002), .CK(clk), .QN(n2258) );
  EDFFX1 R13_reg_7_ ( .D(data_in_1[7]), .E(n3002), .CK(clk), .QN(n2257) );
  EDFFX1 R13_reg_6_ ( .D(data_in_1[6]), .E(n3002), .CK(clk), .QN(n2256) );
  EDFFX1 R13_reg_5_ ( .D(data_in_1[5]), .E(n3002), .CK(clk), .QN(n2255) );
  EDFFX1 R13_reg_4_ ( .D(data_in_1[4]), .E(n3003), .CK(clk), .QN(n2254) );
  EDFFX1 R13_reg_3_ ( .D(data_in_1[3]), .E(n3003), .CK(clk), .QN(n2253) );
  EDFFX1 R13_reg_2_ ( .D(data_in_1[2]), .E(n3003), .CK(clk), .QN(n2252) );
  EDFFX1 R13_reg_1_ ( .D(data_in_1[1]), .E(n3003), .CK(clk), .QN(n2251) );
  EDFFX1 R13_reg_0_ ( .D(data_in_1[0]), .E(n3003), .CK(clk), .QN(n2250) );
  EDFFX1 R9_reg_33_ ( .D(data_in_1[33]), .E(n2937), .CK(clk), .QN(n2249) );
  EDFFX1 R9_reg_32_ ( .D(data_in_1[32]), .E(n2938), .CK(clk), .QN(n2248) );
  EDFFX1 R9_reg_31_ ( .D(data_in_1[31]), .E(n2937), .CK(clk), .QN(n2247) );
  EDFFX1 R9_reg_30_ ( .D(data_in_1[30]), .E(n2938), .CK(clk), .QN(n2246) );
  EDFFX1 R9_reg_29_ ( .D(data_in_1[29]), .E(n2937), .CK(clk), .QN(n2245) );
  EDFFX1 R9_reg_28_ ( .D(data_in_1[28]), .E(n2938), .CK(clk), .QN(n2244) );
  EDFFX1 R9_reg_27_ ( .D(data_in_1[27]), .E(n2937), .CK(clk), .QN(n2243) );
  EDFFX1 R9_reg_26_ ( .D(data_in_1[26]), .E(n2938), .CK(clk), .QN(n2242) );
  EDFFX1 R9_reg_25_ ( .D(data_in_1[25]), .E(n2937), .CK(clk), .QN(n2241) );
  EDFFX1 R9_reg_24_ ( .D(data_in_1[24]), .E(n2938), .CK(clk), .QN(n2240) );
  EDFFX1 R9_reg_23_ ( .D(data_in_1[23]), .E(n2938), .CK(clk), .QN(n2239) );
  EDFFX1 R9_reg_22_ ( .D(data_in_1[22]), .E(n2938), .CK(clk), .QN(n2238) );
  EDFFX1 R9_reg_21_ ( .D(data_in_1[21]), .E(n2938), .CK(clk), .QN(n2237) );
  EDFFX1 R9_reg_20_ ( .D(data_in_1[20]), .E(n2938), .CK(clk), .QN(n2236) );
  EDFFX1 R9_reg_19_ ( .D(data_in_1[19]), .E(n2938), .CK(clk), .QN(n2235) );
  EDFFX1 R9_reg_18_ ( .D(data_in_1[18]), .E(n2938), .CK(clk), .QN(n2234) );
  EDFFX1 R9_reg_17_ ( .D(data_in_1[17]), .E(n2938), .CK(clk), .QN(n2233) );
  EDFFX1 R9_reg_16_ ( .D(data_in_1[16]), .E(n2938), .CK(clk), .QN(n2232) );
  EDFFX1 R9_reg_15_ ( .D(data_in_1[15]), .E(n2938), .CK(clk), .QN(n2231) );
  EDFFX1 R9_reg_14_ ( .D(data_in_1[14]), .E(n2938), .CK(clk), .QN(n2230) );
  EDFFX1 R9_reg_13_ ( .D(data_in_1[13]), .E(n2938), .CK(clk), .QN(n2229) );
  EDFFX1 R9_reg_12_ ( .D(data_in_1[12]), .E(n2938), .CK(clk), .QN(n2228) );
  EDFFX1 R9_reg_11_ ( .D(data_in_1[11]), .E(n2937), .CK(clk), .QN(n2227) );
  EDFFX1 R9_reg_10_ ( .D(data_in_1[10]), .E(n2937), .CK(clk), .QN(n2226) );
  EDFFX1 R9_reg_9_ ( .D(data_in_1[9]), .E(n2937), .CK(clk), .QN(n2225) );
  EDFFX1 R9_reg_8_ ( .D(data_in_1[8]), .E(n2937), .CK(clk), .QN(n2224) );
  EDFFX1 R9_reg_7_ ( .D(data_in_1[7]), .E(n2937), .CK(clk), .QN(n2223) );
  EDFFX1 R9_reg_6_ ( .D(data_in_1[6]), .E(n2937), .CK(clk), .QN(n2222) );
  EDFFX1 R9_reg_5_ ( .D(data_in_1[5]), .E(n2937), .CK(clk), .QN(n2221) );
  EDFFX1 R9_reg_4_ ( .D(data_in_1[4]), .E(n2937), .CK(clk), .QN(n2220) );
  EDFFX1 R9_reg_3_ ( .D(data_in_1[3]), .E(n2937), .CK(clk), .QN(n2219) );
  EDFFX1 R9_reg_2_ ( .D(data_in_1[2]), .E(n2937), .CK(clk), .QN(n2218) );
  EDFFX1 R9_reg_1_ ( .D(data_in_1[1]), .E(n2937), .CK(clk), .QN(n2217) );
  EDFFX1 R9_reg_0_ ( .D(data_in_1[0]), .E(n2937), .CK(clk), .QN(n2216) );
  EDFFX1 R5_reg_33_ ( .D(data_in_1[33]), .E(n2940), .CK(clk), .QN(n2215) );
  EDFFX1 R5_reg_32_ ( .D(data_in_1[32]), .E(n2940), .CK(clk), .QN(n2214) );
  EDFFX1 R5_reg_31_ ( .D(data_in_1[31]), .E(n2940), .CK(clk), .QN(n2213) );
  EDFFX1 R5_reg_30_ ( .D(data_in_1[30]), .E(n2940), .CK(clk), .QN(n2212) );
  EDFFX1 R5_reg_29_ ( .D(data_in_1[29]), .E(n2940), .CK(clk), .QN(n2211) );
  EDFFX1 R5_reg_28_ ( .D(data_in_1[28]), .E(n2940), .CK(clk), .QN(n2210) );
  EDFFX1 R5_reg_27_ ( .D(data_in_1[27]), .E(n2940), .CK(clk), .QN(n2209) );
  EDFFX1 R5_reg_26_ ( .D(data_in_1[26]), .E(n2940), .CK(clk), .QN(n2208) );
  EDFFX1 R5_reg_25_ ( .D(data_in_1[25]), .E(n2940), .CK(clk), .QN(n2207) );
  EDFFX1 R5_reg_24_ ( .D(data_in_1[24]), .E(n2940), .CK(clk), .QN(n2206) );
  EDFFX1 R5_reg_23_ ( .D(data_in_1[23]), .E(n2939), .CK(clk), .QN(n2205) );
  EDFFX1 R5_reg_22_ ( .D(data_in_1[22]), .E(n2939), .CK(clk), .QN(n2204) );
  EDFFX1 R5_reg_21_ ( .D(data_in_1[21]), .E(n2939), .CK(clk), .QN(n2203) );
  EDFFX1 R5_reg_20_ ( .D(data_in_1[20]), .E(n2939), .CK(clk), .QN(n2202) );
  EDFFX1 R5_reg_19_ ( .D(data_in_1[19]), .E(n2939), .CK(clk), .QN(n2201) );
  EDFFX1 R5_reg_18_ ( .D(data_in_1[18]), .E(n2939), .CK(clk), .QN(n2200) );
  EDFFX1 R5_reg_17_ ( .D(data_in_1[17]), .E(n2939), .CK(clk), .QN(n2199) );
  EDFFX1 R5_reg_16_ ( .D(data_in_1[16]), .E(n2939), .CK(clk), .QN(n2198) );
  EDFFX1 R5_reg_15_ ( .D(data_in_1[15]), .E(n2939), .CK(clk), .QN(n2197) );
  EDFFX1 R5_reg_14_ ( .D(data_in_1[14]), .E(n2939), .CK(clk), .QN(n2196) );
  EDFFX1 R5_reg_13_ ( .D(data_in_1[13]), .E(n2939), .CK(clk), .QN(n2195) );
  EDFFX1 R5_reg_12_ ( .D(data_in_1[12]), .E(n2939), .CK(clk), .QN(n2194) );
  EDFFX1 R5_reg_11_ ( .D(data_in_1[11]), .E(n976), .CK(clk), .QN(n2193) );
  EDFFX1 R5_reg_10_ ( .D(data_in_1[10]), .E(n976), .CK(clk), .QN(n2192) );
  EDFFX1 R5_reg_9_ ( .D(data_in_1[9]), .E(n976), .CK(clk), .QN(n2191) );
  EDFFX1 R5_reg_8_ ( .D(data_in_1[8]), .E(n976), .CK(clk), .QN(n2190) );
  EDFFX1 R5_reg_7_ ( .D(data_in_1[7]), .E(n976), .CK(clk), .QN(n2189) );
  EDFFX1 R5_reg_6_ ( .D(data_in_1[6]), .E(n976), .CK(clk), .QN(n2188) );
  EDFFX1 R5_reg_5_ ( .D(data_in_1[5]), .E(n976), .CK(clk), .QN(n2187) );
  EDFFX1 R5_reg_4_ ( .D(data_in_1[4]), .E(n976), .CK(clk), .QN(n2186) );
  EDFFX1 R5_reg_3_ ( .D(data_in_1[3]), .E(n2940), .CK(clk), .QN(n2185) );
  EDFFX1 R5_reg_2_ ( .D(data_in_1[2]), .E(n2939), .CK(clk), .QN(n2184) );
  EDFFX1 R5_reg_1_ ( .D(data_in_1[1]), .E(n2940), .CK(clk), .QN(n2183) );
  EDFFX1 R5_reg_0_ ( .D(data_in_1[0]), .E(n2940), .CK(clk), .QN(n2182) );
  EDFFX1 R1_reg_33_ ( .D(data_in_1[33]), .E(n2935), .CK(clk), .QN(n2181) );
  EDFFX1 R1_reg_32_ ( .D(data_in_1[32]), .E(n2935), .CK(clk), .QN(n2180) );
  EDFFX1 R1_reg_31_ ( .D(data_in_1[31]), .E(n2935), .CK(clk), .QN(n2179) );
  EDFFX1 R1_reg_30_ ( .D(data_in_1[30]), .E(n2935), .CK(clk), .QN(n2178) );
  EDFFX1 R1_reg_29_ ( .D(data_in_1[29]), .E(n2935), .CK(clk), .QN(n2177) );
  EDFFX1 R1_reg_28_ ( .D(data_in_1[28]), .E(n2935), .CK(clk), .QN(n2176) );
  EDFFX1 R1_reg_27_ ( .D(data_in_1[27]), .E(n2935), .CK(clk), .QN(n2175) );
  EDFFX1 R1_reg_26_ ( .D(data_in_1[26]), .E(n2935), .CK(clk), .QN(n2174) );
  EDFFX1 R1_reg_25_ ( .D(data_in_1[25]), .E(n2935), .CK(clk), .QN(n2173) );
  EDFFX1 R1_reg_24_ ( .D(data_in_1[24]), .E(n2935), .CK(clk), .QN(n2172) );
  EDFFX1 R1_reg_23_ ( .D(data_in_1[23]), .E(n2934), .CK(clk), .QN(n2171) );
  EDFFX1 R1_reg_22_ ( .D(data_in_1[22]), .E(n2934), .CK(clk), .QN(n2170) );
  EDFFX1 R1_reg_21_ ( .D(data_in_1[21]), .E(n2934), .CK(clk), .QN(n2169) );
  EDFFX1 R1_reg_20_ ( .D(data_in_1[20]), .E(n2934), .CK(clk), .QN(n2168) );
  EDFFX1 R1_reg_19_ ( .D(data_in_1[19]), .E(n2934), .CK(clk), .QN(n2167) );
  EDFFX1 R1_reg_18_ ( .D(data_in_1[18]), .E(n2934), .CK(clk), .QN(n2166) );
  EDFFX1 R1_reg_17_ ( .D(data_in_1[17]), .E(n2934), .CK(clk), .QN(n2165) );
  EDFFX1 R1_reg_16_ ( .D(data_in_1[16]), .E(n2934), .CK(clk), .QN(n2164) );
  EDFFX1 R1_reg_15_ ( .D(data_in_1[15]), .E(n2934), .CK(clk), .QN(n2163) );
  EDFFX1 R1_reg_14_ ( .D(data_in_1[14]), .E(n2934), .CK(clk), .QN(n2162) );
  EDFFX1 R1_reg_13_ ( .D(data_in_1[13]), .E(n2934), .CK(clk), .QN(n2161) );
  EDFFX1 R1_reg_12_ ( .D(data_in_1[12]), .E(n2934), .CK(clk), .QN(n2160) );
  EDFFX1 R1_reg_11_ ( .D(data_in_1[11]), .E(n978), .CK(clk), .QN(n2159) );
  EDFFX1 R1_reg_10_ ( .D(data_in_1[10]), .E(n978), .CK(clk), .QN(n2158) );
  EDFFX1 R1_reg_9_ ( .D(data_in_1[9]), .E(n978), .CK(clk), .QN(n2157) );
  EDFFX1 R1_reg_8_ ( .D(data_in_1[8]), .E(n978), .CK(clk), .QN(n2156) );
  EDFFX1 R1_reg_7_ ( .D(data_in_1[7]), .E(n978), .CK(clk), .QN(n2155) );
  EDFFX1 R1_reg_6_ ( .D(data_in_1[6]), .E(n978), .CK(clk), .QN(n2154) );
  EDFFX1 R1_reg_5_ ( .D(data_in_1[5]), .E(n978), .CK(clk), .QN(n2153) );
  EDFFX1 R1_reg_4_ ( .D(data_in_1[4]), .E(n978), .CK(clk), .QN(n2152) );
  EDFFX1 R1_reg_3_ ( .D(data_in_1[3]), .E(n2935), .CK(clk), .QN(n2151) );
  EDFFX1 R1_reg_2_ ( .D(data_in_1[2]), .E(n2934), .CK(clk), .QN(n2150) );
  EDFFX1 R1_reg_1_ ( .D(data_in_1[1]), .E(n2935), .CK(clk), .QN(n2149) );
  EDFFX1 R1_reg_0_ ( .D(data_in_1[0]), .E(n2935), .CK(clk), .QN(n2148) );
  EDFFX1 R12_reg_12_ ( .D(data_in_1[12]), .E(n981), .CK(clk), .QN(n160) );
  EDFFX1 R12_reg_11_ ( .D(data_in_1[11]), .E(n981), .CK(clk), .QN(n159) );
  EDFFX1 R12_reg_10_ ( .D(data_in_1[10]), .E(n981), .CK(clk), .QN(n158) );
  EDFFX1 R12_reg_9_ ( .D(data_in_1[9]), .E(n981), .CK(clk), .QN(n157) );
  EDFFX1 R12_reg_8_ ( .D(data_in_1[8]), .E(n981), .CK(clk), .QN(n156) );
  EDFFX1 R12_reg_7_ ( .D(data_in_1[7]), .E(n981), .CK(clk), .QN(n155) );
  EDFFX1 R12_reg_6_ ( .D(data_in_1[6]), .E(n981), .CK(clk), .QN(n154) );
  EDFFX1 R12_reg_5_ ( .D(data_in_1[5]), .E(n981), .CK(clk), .QN(n153) );
  EDFFX1 R12_reg_4_ ( .D(data_in_1[4]), .E(n981), .CK(clk), .QN(n152) );
  EDFFX1 R12_reg_3_ ( .D(data_in_1[3]), .E(n2926), .CK(clk), .QN(n151) );
  EDFFX1 R12_reg_2_ ( .D(data_in_1[2]), .E(n2927), .CK(clk), .QN(n150) );
  EDFFX1 R12_reg_1_ ( .D(data_in_1[1]), .E(n2927), .CK(clk), .QN(n149) );
  EDFFX1 R12_reg_0_ ( .D(data_in_1[0]), .E(n2926), .CK(clk), .QN(n148) );
  EDFFX1 R12_reg_33_ ( .D(data_in_1[33]), .E(n2926), .CK(clk), .QN(n181) );
  EDFFX1 R12_reg_32_ ( .D(data_in_1[32]), .E(n2926), .CK(clk), .QN(n180) );
  EDFFX1 R12_reg_31_ ( .D(data_in_1[31]), .E(n2926), .CK(clk), .QN(n179) );
  EDFFX1 R12_reg_30_ ( .D(data_in_1[30]), .E(n2926), .CK(clk), .QN(n178) );
  EDFFX1 R12_reg_29_ ( .D(data_in_1[29]), .E(n2926), .CK(clk), .QN(n177) );
  EDFFX1 R12_reg_28_ ( .D(data_in_1[28]), .E(n2926), .CK(clk), .QN(n176) );
  EDFFX1 R12_reg_27_ ( .D(data_in_1[27]), .E(n2926), .CK(clk), .QN(n175) );
  EDFFX1 R12_reg_26_ ( .D(data_in_1[26]), .E(n2926), .CK(clk), .QN(n174) );
  EDFFX1 R12_reg_25_ ( .D(data_in_1[25]), .E(n2926), .CK(clk), .QN(n173) );
  EDFFX1 R12_reg_24_ ( .D(data_in_1[24]), .E(n2926), .CK(clk), .QN(n172) );
  EDFFX1 R12_reg_23_ ( .D(data_in_1[23]), .E(n2926), .CK(clk), .QN(n171) );
  EDFFX1 R12_reg_22_ ( .D(data_in_1[22]), .E(n2927), .CK(clk), .QN(n170) );
  EDFFX1 R12_reg_21_ ( .D(data_in_1[21]), .E(n2927), .CK(clk), .QN(n169) );
  EDFFX1 R12_reg_20_ ( .D(data_in_1[20]), .E(n2927), .CK(clk), .QN(n168) );
  EDFFX1 R12_reg_19_ ( .D(data_in_1[19]), .E(n2927), .CK(clk), .QN(n167) );
  EDFFX1 R12_reg_18_ ( .D(data_in_1[18]), .E(n2927), .CK(clk), .QN(n166) );
  EDFFX1 R12_reg_17_ ( .D(data_in_1[17]), .E(n2927), .CK(clk), .QN(n165) );
  EDFFX1 R12_reg_16_ ( .D(data_in_1[16]), .E(n2927), .CK(clk), .QN(n164) );
  EDFFX1 R12_reg_15_ ( .D(data_in_1[15]), .E(n2927), .CK(clk), .QN(n163) );
  EDFFX1 R12_reg_14_ ( .D(data_in_1[14]), .E(n2927), .CK(clk), .QN(n162) );
  EDFFX1 R12_reg_13_ ( .D(data_in_1[13]), .E(n2927), .CK(clk), .QN(n161) );
  EDFFX1 R8_reg_27_ ( .D(data_in_1[27]), .E(n2932), .CK(clk), .QN(n209) );
  EDFFX1 R8_reg_26_ ( .D(data_in_1[26]), .E(n2933), .CK(clk), .QN(n208) );
  EDFFX1 R8_reg_25_ ( .D(data_in_1[25]), .E(n2932), .CK(clk), .QN(n207) );
  EDFFX1 R8_reg_24_ ( .D(data_in_1[24]), .E(n2933), .CK(clk), .QN(n206) );
  EDFFX1 R8_reg_23_ ( .D(data_in_1[23]), .E(n2933), .CK(clk), .QN(n205) );
  EDFFX1 R8_reg_22_ ( .D(data_in_1[22]), .E(n2933), .CK(clk), .QN(n204) );
  EDFFX1 R8_reg_21_ ( .D(data_in_1[21]), .E(n2933), .CK(clk), .QN(n203) );
  EDFFX1 R8_reg_20_ ( .D(data_in_1[20]), .E(n2933), .CK(clk), .QN(n202) );
  EDFFX1 R8_reg_19_ ( .D(data_in_1[19]), .E(n2933), .CK(clk), .QN(n201) );
  EDFFX1 R8_reg_18_ ( .D(data_in_1[18]), .E(n2933), .CK(clk), .QN(n200) );
  EDFFX1 R8_reg_17_ ( .D(data_in_1[17]), .E(n2933), .CK(clk), .QN(n199) );
  EDFFX1 R8_reg_16_ ( .D(data_in_1[16]), .E(n2933), .CK(clk), .QN(n198) );
  EDFFX1 R8_reg_15_ ( .D(data_in_1[15]), .E(n2933), .CK(clk), .QN(n197) );
  EDFFX1 R8_reg_14_ ( .D(data_in_1[14]), .E(n2933), .CK(clk), .QN(n196) );
  EDFFX1 R8_reg_13_ ( .D(data_in_1[13]), .E(n2933), .CK(clk), .QN(n195) );
  EDFFX1 R8_reg_12_ ( .D(data_in_1[12]), .E(n2933), .CK(clk), .QN(n194) );
  EDFFX1 R8_reg_11_ ( .D(data_in_1[11]), .E(n2932), .CK(clk), .QN(n193) );
  EDFFX1 R8_reg_10_ ( .D(data_in_1[10]), .E(n2932), .CK(clk), .QN(n192) );
  EDFFX1 R8_reg_9_ ( .D(data_in_1[9]), .E(n2932), .CK(clk), .QN(n191) );
  EDFFX1 R8_reg_8_ ( .D(data_in_1[8]), .E(n2932), .CK(clk), .QN(n190) );
  EDFFX1 R8_reg_7_ ( .D(data_in_1[7]), .E(n2932), .CK(clk), .QN(n189) );
  EDFFX1 R8_reg_6_ ( .D(data_in_1[6]), .E(n2932), .CK(clk), .QN(n188) );
  EDFFX1 R8_reg_5_ ( .D(data_in_1[5]), .E(n2932), .CK(clk), .QN(n187) );
  EDFFX1 R8_reg_4_ ( .D(data_in_1[4]), .E(n2932), .CK(clk), .QN(n186) );
  EDFFX1 R8_reg_3_ ( .D(data_in_1[3]), .E(n2932), .CK(clk), .QN(n185) );
  EDFFX1 R8_reg_2_ ( .D(data_in_1[2]), .E(n2932), .CK(clk), .QN(n184) );
  EDFFX1 R8_reg_1_ ( .D(data_in_1[1]), .E(n2932), .CK(clk), .QN(n183) );
  EDFFX1 R8_reg_0_ ( .D(data_in_1[0]), .E(n2932), .CK(clk), .QN(n182) );
  EDFFX1 R0_reg_15_ ( .D(data_in_1[15]), .E(N171), .CK(clk), .QN(n265) );
  EDFFX1 R0_reg_14_ ( .D(data_in_1[14]), .E(N171), .CK(clk), .QN(n264) );
  EDFFX1 R0_reg_13_ ( .D(data_in_1[13]), .E(N171), .CK(clk), .QN(n263) );
  EDFFX1 R0_reg_12_ ( .D(data_in_1[12]), .E(n3023), .CK(clk), .QN(n262) );
  EDFFX1 R0_reg_11_ ( .D(data_in_1[11]), .E(n3023), .CK(clk), .QN(n261) );
  EDFFX1 R0_reg_10_ ( .D(data_in_1[10]), .E(n3023), .CK(clk), .QN(n260) );
  EDFFX1 R0_reg_9_ ( .D(data_in_1[9]), .E(n3026), .CK(clk), .QN(n259) );
  EDFFX1 R0_reg_8_ ( .D(data_in_1[8]), .E(n3024), .CK(clk), .QN(n258) );
  EDFFX1 R0_reg_7_ ( .D(data_in_1[7]), .E(n3025), .CK(clk), .QN(n257) );
  EDFFX1 R0_reg_6_ ( .D(data_in_1[6]), .E(n3026), .CK(clk), .QN(n256) );
  EDFFX1 R0_reg_5_ ( .D(data_in_1[5]), .E(n3024), .CK(clk), .QN(n255) );
  EDFFX1 R0_reg_4_ ( .D(data_in_1[4]), .E(n3025), .CK(clk), .QN(n254) );
  EDFFX1 R0_reg_3_ ( .D(data_in_1[3]), .E(n3026), .CK(clk), .QN(n253) );
  EDFFX1 R0_reg_2_ ( .D(data_in_1[2]), .E(n3024), .CK(clk), .QN(n252) );
  EDFFX1 R0_reg_1_ ( .D(data_in_1[1]), .E(n3025), .CK(clk), .QN(n251) );
  EDFFX1 R0_reg_0_ ( .D(data_in_1[0]), .E(n3024), .CK(clk), .QN(n250) );
  EDFFX1 R8_reg_33_ ( .D(data_in_1[33]), .E(n2932), .CK(clk), .QN(n215) );
  EDFFX1 R8_reg_32_ ( .D(data_in_1[32]), .E(n2933), .CK(clk), .QN(n214) );
  EDFFX1 R8_reg_31_ ( .D(data_in_1[31]), .E(n2932), .CK(clk), .QN(n213) );
  EDFFX1 R8_reg_30_ ( .D(data_in_1[30]), .E(n2933), .CK(clk), .QN(n212) );
  EDFFX1 R8_reg_29_ ( .D(data_in_1[29]), .E(n2932), .CK(clk), .QN(n211) );
  EDFFX1 R8_reg_28_ ( .D(data_in_1[28]), .E(n2933), .CK(clk), .QN(n210) );
  EDFFX1 R4_reg_33_ ( .D(data_in_1[33]), .E(n2930), .CK(clk), .QN(n249) );
  EDFFX1 R4_reg_32_ ( .D(data_in_1[32]), .E(n2930), .CK(clk), .QN(n248) );
  EDFFX1 R4_reg_31_ ( .D(data_in_1[31]), .E(n2930), .CK(clk), .QN(n247) );
  EDFFX1 R4_reg_30_ ( .D(data_in_1[30]), .E(n2930), .CK(clk), .QN(n246) );
  EDFFX1 R4_reg_29_ ( .D(data_in_1[29]), .E(n2930), .CK(clk), .QN(n245) );
  EDFFX1 R4_reg_28_ ( .D(data_in_1[28]), .E(n2930), .CK(clk), .QN(n244) );
  EDFFX1 R4_reg_27_ ( .D(data_in_1[27]), .E(n2930), .CK(clk), .QN(n243) );
  EDFFX1 R4_reg_26_ ( .D(data_in_1[26]), .E(n2930), .CK(clk), .QN(n242) );
  EDFFX1 R4_reg_25_ ( .D(data_in_1[25]), .E(n2930), .CK(clk), .QN(n241) );
  EDFFX1 R4_reg_24_ ( .D(data_in_1[24]), .E(n2930), .CK(clk), .QN(n240) );
  EDFFX1 R4_reg_23_ ( .D(data_in_1[23]), .E(n2929), .CK(clk), .QN(n239) );
  EDFFX1 R4_reg_22_ ( .D(data_in_1[22]), .E(n2929), .CK(clk), .QN(n238) );
  EDFFX1 R4_reg_21_ ( .D(data_in_1[21]), .E(n2929), .CK(clk), .QN(n237) );
  EDFFX1 R4_reg_20_ ( .D(data_in_1[20]), .E(n2929), .CK(clk), .QN(n236) );
  EDFFX1 R4_reg_19_ ( .D(data_in_1[19]), .E(n2929), .CK(clk), .QN(n235) );
  EDFFX1 R4_reg_18_ ( .D(data_in_1[18]), .E(n2929), .CK(clk), .QN(n234) );
  EDFFX1 R4_reg_17_ ( .D(data_in_1[17]), .E(n2929), .CK(clk), .QN(n233) );
  EDFFX1 R4_reg_16_ ( .D(data_in_1[16]), .E(n2929), .CK(clk), .QN(n232) );
  EDFFX1 R4_reg_15_ ( .D(data_in_1[15]), .E(n2929), .CK(clk), .QN(n231) );
  EDFFX1 R4_reg_14_ ( .D(data_in_1[14]), .E(n2929), .CK(clk), .QN(n230) );
  EDFFX1 R4_reg_13_ ( .D(data_in_1[13]), .E(n2929), .CK(clk), .QN(n229) );
  EDFFX1 R4_reg_12_ ( .D(data_in_1[12]), .E(n2929), .CK(clk), .QN(n228) );
  EDFFX1 R4_reg_11_ ( .D(data_in_1[11]), .E(n980), .CK(clk), .QN(n227) );
  EDFFX1 R4_reg_10_ ( .D(data_in_1[10]), .E(n980), .CK(clk), .QN(n226) );
  EDFFX1 R4_reg_9_ ( .D(data_in_1[9]), .E(n980), .CK(clk), .QN(n225) );
  EDFFX1 R4_reg_8_ ( .D(data_in_1[8]), .E(n980), .CK(clk), .QN(n224) );
  EDFFX1 R4_reg_7_ ( .D(data_in_1[7]), .E(n980), .CK(clk), .QN(n223) );
  EDFFX1 R4_reg_6_ ( .D(data_in_1[6]), .E(n980), .CK(clk), .QN(n222) );
  EDFFX1 R4_reg_5_ ( .D(data_in_1[5]), .E(n980), .CK(clk), .QN(n221) );
  EDFFX1 R4_reg_4_ ( .D(data_in_1[4]), .E(n980), .CK(clk), .QN(n220) );
  EDFFX1 R4_reg_3_ ( .D(data_in_1[3]), .E(n2930), .CK(clk), .QN(n219) );
  EDFFX1 R4_reg_2_ ( .D(data_in_1[2]), .E(n2929), .CK(clk), .QN(n218) );
  EDFFX1 R4_reg_1_ ( .D(data_in_1[1]), .E(n2930), .CK(clk), .QN(n217) );
  EDFFX1 R4_reg_0_ ( .D(data_in_1[0]), .E(n2930), .CK(clk), .QN(n216) );
  EDFFX1 R0_reg_33_ ( .D(data_in_1[33]), .E(n3025), .CK(clk), .QN(n283) );
  EDFFX1 R0_reg_32_ ( .D(data_in_1[32]), .E(n3024), .CK(clk), .QN(n282) );
  EDFFX1 R0_reg_31_ ( .D(data_in_1[31]), .E(n3025), .CK(clk), .QN(n281) );
  EDFFX1 R0_reg_30_ ( .D(data_in_1[30]), .E(n3026), .CK(clk), .QN(n280) );
  EDFFX1 R0_reg_29_ ( .D(data_in_1[29]), .E(n3026), .CK(clk), .QN(n279) );
  EDFFX1 R0_reg_28_ ( .D(data_in_1[28]), .E(n3024), .CK(clk), .QN(n278) );
  EDFFX1 R0_reg_27_ ( .D(data_in_1[27]), .E(n3025), .CK(clk), .QN(n277) );
  EDFFX1 R0_reg_26_ ( .D(data_in_1[26]), .E(n3026), .CK(clk), .QN(n276) );
  EDFFX1 R0_reg_25_ ( .D(data_in_1[25]), .E(n3024), .CK(clk), .QN(n275) );
  EDFFX1 R0_reg_24_ ( .D(data_in_1[24]), .E(n3024), .CK(clk), .QN(n274) );
  EDFFX1 R0_reg_23_ ( .D(data_in_1[23]), .E(n3025), .CK(clk), .QN(n273) );
  EDFFX1 R0_reg_22_ ( .D(data_in_1[22]), .E(n3026), .CK(clk), .QN(n272) );
  EDFFX1 R0_reg_21_ ( .D(data_in_1[21]), .E(n3024), .CK(clk), .QN(n271) );
  EDFFX1 R0_reg_20_ ( .D(data_in_1[20]), .E(n3025), .CK(clk), .QN(n270) );
  EDFFX1 R0_reg_19_ ( .D(data_in_1[19]), .E(n3026), .CK(clk), .QN(n269) );
  EDFFX1 R0_reg_18_ ( .D(data_in_1[18]), .E(n3024), .CK(clk), .QN(n268) );
  EDFFX1 R0_reg_17_ ( .D(data_in_1[17]), .E(n3025), .CK(clk), .QN(n267) );
  EDFFX1 R0_reg_16_ ( .D(data_in_1[16]), .E(n3026), .CK(clk), .QN(n266) );
  EDFFX1 R14_reg_33_ ( .D(data_in_1[33]), .E(n2977), .CK(clk), .Q(n2011) );
  EDFFX1 R14_reg_32_ ( .D(data_in_1[32]), .E(n2981), .CK(clk), .Q(n2010) );
  EDFFX1 R14_reg_31_ ( .D(data_in_1[31]), .E(n2980), .CK(clk), .Q(n2009) );
  EDFFX1 R14_reg_30_ ( .D(data_in_1[30]), .E(n2980), .CK(clk), .Q(n2008) );
  EDFFX1 R14_reg_29_ ( .D(data_in_1[29]), .E(n2978), .CK(clk), .Q(n2007) );
  EDFFX1 R14_reg_28_ ( .D(data_in_1[28]), .E(n2979), .CK(clk), .Q(n2006) );
  EDFFX1 R14_reg_27_ ( .D(data_in_1[27]), .E(n2978), .CK(clk), .Q(n2005) );
  EDFFX1 R14_reg_26_ ( .D(data_in_1[26]), .E(n2981), .CK(clk), .Q(n2004) );
  EDFFX1 R14_reg_25_ ( .D(data_in_1[25]), .E(n2980), .CK(clk), .Q(n2003) );
  EDFFX1 R14_reg_24_ ( .D(data_in_1[24]), .E(n2979), .CK(clk), .Q(n2002) );
  EDFFX1 R14_reg_23_ ( .D(data_in_1[23]), .E(n2978), .CK(clk), .Q(n2001) );
  EDFFX1 R14_reg_22_ ( .D(data_in_1[22]), .E(n2981), .CK(clk), .Q(n2000) );
  EDFFX1 R14_reg_21_ ( .D(data_in_1[21]), .E(n2979), .CK(clk), .Q(n1999) );
  EDFFX1 R14_reg_20_ ( .D(data_in_1[20]), .E(n2978), .CK(clk), .Q(n1998) );
  EDFFX1 R14_reg_19_ ( .D(data_in_1[19]), .E(n2981), .CK(clk), .Q(n1997) );
  EDFFX1 R14_reg_18_ ( .D(data_in_1[18]), .E(n2979), .CK(clk), .Q(n1996) );
  EDFFX1 R14_reg_17_ ( .D(data_in_1[17]), .E(n2981), .CK(clk), .Q(n1995) );
  EDFFX1 R14_reg_16_ ( .D(data_in_1[16]), .E(n2981), .CK(clk), .Q(n1994) );
  EDFFX1 R14_reg_15_ ( .D(data_in_1[15]), .E(n2981), .CK(clk), .Q(n1993) );
  EDFFX1 R14_reg_14_ ( .D(data_in_1[14]), .E(n2980), .CK(clk), .Q(n1992) );
  EDFFX1 R14_reg_13_ ( .D(data_in_1[13]), .E(n2980), .CK(clk), .Q(n1991) );
  EDFFX1 R14_reg_12_ ( .D(data_in_1[12]), .E(n2980), .CK(clk), .Q(n1990) );
  EDFFX1 R14_reg_11_ ( .D(data_in_1[11]), .E(n2980), .CK(clk), .Q(n1989) );
  EDFFX1 R14_reg_10_ ( .D(data_in_1[10]), .E(n2979), .CK(clk), .Q(n1988) );
  EDFFX1 R14_reg_9_ ( .D(data_in_1[9]), .E(n2981), .CK(clk), .Q(n1987) );
  EDFFX1 R14_reg_8_ ( .D(data_in_1[8]), .E(n2979), .CK(clk), .Q(n1986) );
  EDFFX1 R14_reg_7_ ( .D(data_in_1[7]), .E(n2979), .CK(clk), .Q(n1985) );
  EDFFX1 R14_reg_6_ ( .D(data_in_1[6]), .E(n2978), .CK(clk), .Q(n1984) );
  EDFFX1 R14_reg_5_ ( .D(data_in_1[5]), .E(n2979), .CK(clk), .Q(n1983) );
  EDFFX1 R14_reg_4_ ( .D(data_in_1[4]), .E(n2978), .CK(clk), .Q(n1982) );
  EDFFX1 R14_reg_3_ ( .D(data_in_1[3]), .E(n2978), .CK(clk), .Q(n1981) );
  EDFFX1 R14_reg_2_ ( .D(data_in_1[2]), .E(n2977), .CK(clk), .Q(n1980) );
  EDFFX1 R14_reg_1_ ( .D(data_in_1[1]), .E(n2978), .CK(clk), .Q(n1979) );
  EDFFX1 R14_reg_0_ ( .D(data_in_1[0]), .E(n2977), .CK(clk), .Q(n1978) );
  EDFFX1 R10_reg_33_ ( .D(data_in_1[33]), .E(n2948), .CK(clk), .Q(n1977) );
  EDFFX1 R10_reg_32_ ( .D(data_in_1[32]), .E(n2949), .CK(clk), .Q(n1976) );
  EDFFX1 R10_reg_31_ ( .D(data_in_1[31]), .E(n2948), .CK(clk), .Q(n1975) );
  EDFFX1 R10_reg_30_ ( .D(data_in_1[30]), .E(n2949), .CK(clk), .Q(n1974) );
  EDFFX1 R10_reg_29_ ( .D(data_in_1[29]), .E(n2948), .CK(clk), .Q(n1973) );
  EDFFX1 R10_reg_28_ ( .D(data_in_1[28]), .E(n2949), .CK(clk), .Q(n1972) );
  EDFFX1 R10_reg_27_ ( .D(data_in_1[27]), .E(n2948), .CK(clk), .Q(n1971) );
  EDFFX1 R10_reg_26_ ( .D(data_in_1[26]), .E(n2949), .CK(clk), .Q(n1970) );
  EDFFX1 R10_reg_25_ ( .D(data_in_1[25]), .E(n2948), .CK(clk), .Q(n1969) );
  EDFFX1 R10_reg_24_ ( .D(data_in_1[24]), .E(n2949), .CK(clk), .Q(n1968) );
  EDFFX1 R10_reg_23_ ( .D(data_in_1[23]), .E(n2949), .CK(clk), .Q(n1967) );
  EDFFX1 R10_reg_22_ ( .D(data_in_1[22]), .E(n2949), .CK(clk), .Q(n1966) );
  EDFFX1 R10_reg_21_ ( .D(data_in_1[21]), .E(n2949), .CK(clk), .Q(n1965) );
  EDFFX1 R10_reg_20_ ( .D(data_in_1[20]), .E(n2949), .CK(clk), .Q(n1964) );
  EDFFX1 R10_reg_19_ ( .D(data_in_1[19]), .E(n2949), .CK(clk), .Q(n1963) );
  EDFFX1 R10_reg_18_ ( .D(data_in_1[18]), .E(n2949), .CK(clk), .Q(n1962) );
  EDFFX1 R10_reg_17_ ( .D(data_in_1[17]), .E(n2949), .CK(clk), .Q(n1961) );
  EDFFX1 R10_reg_16_ ( .D(data_in_1[16]), .E(n2949), .CK(clk), .Q(n1960) );
  EDFFX1 R10_reg_15_ ( .D(data_in_1[15]), .E(n2949), .CK(clk), .Q(n1959) );
  EDFFX1 R10_reg_14_ ( .D(data_in_1[14]), .E(n2949), .CK(clk), .Q(n1958) );
  EDFFX1 R10_reg_13_ ( .D(data_in_1[13]), .E(n2949), .CK(clk), .Q(n1957) );
  EDFFX1 R10_reg_12_ ( .D(data_in_1[12]), .E(n2949), .CK(clk), .Q(n1956) );
  EDFFX1 R10_reg_11_ ( .D(data_in_1[11]), .E(n2948), .CK(clk), .Q(n1955) );
  EDFFX1 R10_reg_10_ ( .D(data_in_1[10]), .E(n2948), .CK(clk), .Q(n1954) );
  EDFFX1 R10_reg_9_ ( .D(data_in_1[9]), .E(n2948), .CK(clk), .Q(n1953) );
  EDFFX1 R10_reg_8_ ( .D(data_in_1[8]), .E(n2948), .CK(clk), .Q(n1952) );
  EDFFX1 R10_reg_7_ ( .D(data_in_1[7]), .E(n2948), .CK(clk), .Q(n1951) );
  EDFFX1 R10_reg_6_ ( .D(data_in_1[6]), .E(n2948), .CK(clk), .Q(n1950) );
  EDFFX1 R10_reg_5_ ( .D(data_in_1[5]), .E(n2948), .CK(clk), .Q(n1949) );
  EDFFX1 R10_reg_4_ ( .D(data_in_1[4]), .E(n2948), .CK(clk), .Q(n1948) );
  EDFFX1 R10_reg_3_ ( .D(data_in_1[3]), .E(n2948), .CK(clk), .Q(n1947) );
  EDFFX1 R10_reg_2_ ( .D(data_in_1[2]), .E(n2948), .CK(clk), .Q(n1946) );
  EDFFX1 R10_reg_1_ ( .D(data_in_1[1]), .E(n2948), .CK(clk), .Q(n1945) );
  EDFFX1 R10_reg_0_ ( .D(data_in_1[0]), .E(n2948), .CK(clk), .Q(n1944) );
  EDFFX1 R6_reg_33_ ( .D(data_in_1[33]), .E(n2943), .CK(clk), .Q(n1943) );
  EDFFX1 R6_reg_32_ ( .D(data_in_1[32]), .E(n2943), .CK(clk), .Q(n1942) );
  EDFFX1 R6_reg_31_ ( .D(data_in_1[31]), .E(n2943), .CK(clk), .Q(n1941) );
  EDFFX1 R6_reg_30_ ( .D(data_in_1[30]), .E(n2943), .CK(clk), .Q(n1940) );
  EDFFX1 R6_reg_29_ ( .D(data_in_1[29]), .E(n2943), .CK(clk), .Q(n1939) );
  EDFFX1 R6_reg_28_ ( .D(data_in_1[28]), .E(n2943), .CK(clk), .Q(n1938) );
  EDFFX1 R6_reg_27_ ( .D(data_in_1[27]), .E(n2943), .CK(clk), .Q(n1937) );
  EDFFX1 R6_reg_26_ ( .D(data_in_1[26]), .E(n2943), .CK(clk), .Q(n1936) );
  EDFFX1 R6_reg_25_ ( .D(data_in_1[25]), .E(n2943), .CK(clk), .Q(n1935) );
  EDFFX1 R6_reg_24_ ( .D(data_in_1[24]), .E(n2943), .CK(clk), .Q(n1934) );
  EDFFX1 R6_reg_23_ ( .D(data_in_1[23]), .E(n2942), .CK(clk), .Q(n1933) );
  EDFFX1 R6_reg_22_ ( .D(data_in_1[22]), .E(n2942), .CK(clk), .Q(n1932) );
  EDFFX1 R6_reg_21_ ( .D(data_in_1[21]), .E(n2942), .CK(clk), .Q(n1931) );
  EDFFX1 R6_reg_20_ ( .D(data_in_1[20]), .E(n2942), .CK(clk), .Q(n1930) );
  EDFFX1 R6_reg_19_ ( .D(data_in_1[19]), .E(n2942), .CK(clk), .Q(n1929) );
  EDFFX1 R6_reg_18_ ( .D(data_in_1[18]), .E(n2942), .CK(clk), .Q(n1928) );
  EDFFX1 R6_reg_17_ ( .D(data_in_1[17]), .E(n2942), .CK(clk), .Q(n1927) );
  EDFFX1 R6_reg_16_ ( .D(data_in_1[16]), .E(n2942), .CK(clk), .Q(n1926) );
  EDFFX1 R6_reg_15_ ( .D(data_in_1[15]), .E(n2942), .CK(clk), .Q(n1925) );
  EDFFX1 R6_reg_14_ ( .D(data_in_1[14]), .E(n2942), .CK(clk), .Q(n1924) );
  EDFFX1 R6_reg_13_ ( .D(data_in_1[13]), .E(n2942), .CK(clk), .Q(n1923) );
  EDFFX1 R6_reg_12_ ( .D(data_in_1[12]), .E(n2942), .CK(clk), .Q(n1922) );
  EDFFX1 R6_reg_11_ ( .D(data_in_1[11]), .E(n975), .CK(clk), .Q(n1921) );
  EDFFX1 R6_reg_10_ ( .D(data_in_1[10]), .E(n975), .CK(clk), .Q(n1920) );
  EDFFX1 R6_reg_9_ ( .D(data_in_1[9]), .E(n975), .CK(clk), .Q(n1919) );
  EDFFX1 R6_reg_8_ ( .D(data_in_1[8]), .E(n975), .CK(clk), .Q(n1918) );
  EDFFX1 R6_reg_7_ ( .D(data_in_1[7]), .E(n975), .CK(clk), .Q(n1917) );
  EDFFX1 R6_reg_6_ ( .D(data_in_1[6]), .E(n975), .CK(clk), .Q(n1916) );
  EDFFX1 R6_reg_5_ ( .D(data_in_1[5]), .E(n975), .CK(clk), .Q(n1915) );
  EDFFX1 R6_reg_4_ ( .D(data_in_1[4]), .E(n975), .CK(clk), .Q(n1914) );
  EDFFX1 R6_reg_3_ ( .D(data_in_1[3]), .E(n2943), .CK(clk), .Q(n1913) );
  EDFFX1 R6_reg_2_ ( .D(data_in_1[2]), .E(n2942), .CK(clk), .Q(n1912) );
  EDFFX1 R6_reg_1_ ( .D(data_in_1[1]), .E(n2943), .CK(clk), .Q(n1911) );
  EDFFX1 R6_reg_0_ ( .D(data_in_1[0]), .E(n2943), .CK(clk), .Q(n1910) );
  EDFFX1 R2_reg_33_ ( .D(data_in_1[33]), .E(n2946), .CK(clk), .Q(n1909) );
  EDFFX1 R2_reg_32_ ( .D(data_in_1[32]), .E(n2946), .CK(clk), .Q(n1908) );
  EDFFX1 R2_reg_31_ ( .D(data_in_1[31]), .E(n2946), .CK(clk), .Q(n1907) );
  EDFFX1 R2_reg_30_ ( .D(data_in_1[30]), .E(n2946), .CK(clk), .Q(n1906) );
  EDFFX1 R2_reg_29_ ( .D(data_in_1[29]), .E(n2946), .CK(clk), .Q(n1905) );
  EDFFX1 R2_reg_28_ ( .D(data_in_1[28]), .E(n2946), .CK(clk), .Q(n1904) );
  EDFFX1 R2_reg_27_ ( .D(data_in_1[27]), .E(n2946), .CK(clk), .Q(n1903) );
  EDFFX1 R2_reg_26_ ( .D(data_in_1[26]), .E(n2946), .CK(clk), .Q(n1902) );
  EDFFX1 R2_reg_25_ ( .D(data_in_1[25]), .E(n2946), .CK(clk), .Q(n1901) );
  EDFFX1 R2_reg_24_ ( .D(data_in_1[24]), .E(n2946), .CK(clk), .Q(n1900) );
  EDFFX1 R2_reg_23_ ( .D(data_in_1[23]), .E(n2945), .CK(clk), .Q(n1899) );
  EDFFX1 R2_reg_22_ ( .D(data_in_1[22]), .E(n2945), .CK(clk), .Q(n1898) );
  EDFFX1 R2_reg_21_ ( .D(data_in_1[21]), .E(n2945), .CK(clk), .Q(n1897) );
  EDFFX1 R2_reg_20_ ( .D(data_in_1[20]), .E(n2945), .CK(clk), .Q(n1896) );
  EDFFX1 R2_reg_19_ ( .D(data_in_1[19]), .E(n2945), .CK(clk), .Q(n1895) );
  EDFFX1 R2_reg_18_ ( .D(data_in_1[18]), .E(n2945), .CK(clk), .Q(n1894) );
  EDFFX1 R2_reg_17_ ( .D(data_in_1[17]), .E(n2945), .CK(clk), .Q(n1893) );
  EDFFX1 R2_reg_16_ ( .D(data_in_1[16]), .E(n2945), .CK(clk), .Q(n1892) );
  EDFFX1 R2_reg_15_ ( .D(data_in_1[15]), .E(n2945), .CK(clk), .Q(n1891) );
  EDFFX1 R2_reg_14_ ( .D(data_in_1[14]), .E(n2945), .CK(clk), .Q(n1890) );
  EDFFX1 R2_reg_13_ ( .D(data_in_1[13]), .E(n2945), .CK(clk), .Q(n1889) );
  EDFFX1 R2_reg_12_ ( .D(data_in_1[12]), .E(n2945), .CK(clk), .Q(n1888) );
  EDFFX1 R2_reg_11_ ( .D(data_in_1[11]), .E(n974), .CK(clk), .Q(n1887) );
  EDFFX1 R2_reg_10_ ( .D(data_in_1[10]), .E(n974), .CK(clk), .Q(n1886) );
  EDFFX1 R2_reg_9_ ( .D(data_in_1[9]), .E(n974), .CK(clk), .Q(n1885) );
  EDFFX1 R2_reg_8_ ( .D(data_in_1[8]), .E(n974), .CK(clk), .Q(n1884) );
  EDFFX1 R2_reg_7_ ( .D(data_in_1[7]), .E(n974), .CK(clk), .Q(n1883) );
  EDFFX1 R2_reg_6_ ( .D(data_in_1[6]), .E(n974), .CK(clk), .Q(n1882) );
  EDFFX1 R2_reg_5_ ( .D(data_in_1[5]), .E(n974), .CK(clk), .Q(n1881) );
  EDFFX1 R2_reg_4_ ( .D(data_in_1[4]), .E(n974), .CK(clk), .Q(n1880) );
  EDFFX1 R2_reg_3_ ( .D(data_in_1[3]), .E(n2946), .CK(clk), .Q(n1879) );
  EDFFX1 R2_reg_2_ ( .D(data_in_1[2]), .E(n2945), .CK(clk), .Q(n1878) );
  EDFFX1 R2_reg_1_ ( .D(data_in_1[1]), .E(n2946), .CK(clk), .Q(n1877) );
  EDFFX1 R2_reg_0_ ( .D(data_in_1[0]), .E(n2946), .CK(clk), .Q(n1876) );
  DFFHQX1 data_out_1_reg_67_ ( .D(n900), .CK(clk), .Q(data_out_1[67]) );
  DFFHQX1 data_out_1_reg_51_ ( .D(n916), .CK(clk), .Q(data_out_1[51]) );
  DFFHQX1 data_out_1_reg_50_ ( .D(n917), .CK(clk), .Q(data_out_1[50]) );
  DFFHQX1 data_out_1_reg_34_ ( .D(n933), .CK(clk), .Q(data_out_1[34]) );
  DFFHQX1 data_out_1_reg_101_ ( .D(n866), .CK(clk), .Q(data_out_1[101]) );
  DFFHQX1 data_out_1_reg_85_ ( .D(n882), .CK(clk), .Q(data_out_1[85]) );
  DFFHQX1 data_out_1_reg_84_ ( .D(n883), .CK(clk), .Q(data_out_1[84]) );
  DFFHQX1 data_out_1_reg_68_ ( .D(n899), .CK(clk), .Q(data_out_1[68]) );
  DFFHQX1 data_out_1_reg_135_ ( .D(n832), .CK(clk), .Q(data_out_1[135]) );
  DFFHQX1 data_out_1_reg_123_ ( .D(n844), .CK(clk), .Q(data_out_1[123]) );
  DFFHQX1 data_out_1_reg_122_ ( .D(n845), .CK(clk), .Q(data_out_1[122]) );
  DFFHQX1 data_out_1_reg_119_ ( .D(n848), .CK(clk), .Q(data_out_1[119]) );
  DFFHQX1 data_out_1_reg_118_ ( .D(n849), .CK(clk), .Q(data_out_1[118]) );
  DFFHQX1 data_out_1_reg_106_ ( .D(n861), .CK(clk), .Q(data_out_1[106]) );
  DFFHQX1 data_out_1_reg_102_ ( .D(n865), .CK(clk), .Q(data_out_1[102]) );
  DFFHQX1 data_out_1_reg_61_ ( .D(n906), .CK(clk), .Q(data_out_1[61]) );
  DFFHQX1 data_out_1_reg_60_ ( .D(n907), .CK(clk), .Q(data_out_1[60]) );
  DFFHQX1 data_out_1_reg_96_ ( .D(n871), .CK(clk), .Q(data_out_1[96]) );
  DFFHQX1 data_out_1_reg_95_ ( .D(n872), .CK(clk), .Q(data_out_1[95]) );
  DFFHQX1 data_out_1_reg_94_ ( .D(n873), .CK(clk), .Q(data_out_1[94]) );
  DFFHQX1 data_out_1_reg_130_ ( .D(n837), .CK(clk), .Q(data_out_1[130]) );
  DFFHQX1 data_out_1_reg_129_ ( .D(n838), .CK(clk), .Q(data_out_1[129]) );
  DFFHQX1 data_out_1_reg_128_ ( .D(n839), .CK(clk), .Q(data_out_1[128]) );
  DFFHQX1 data_out_1_reg_113_ ( .D(n854), .CK(clk), .Q(data_out_1[113]) );
  DFFHQX1 data_out_1_reg_112_ ( .D(n855), .CK(clk), .Q(data_out_1[112]) );
  DFFHQX1 data_out_1_reg_111_ ( .D(n856), .CK(clk), .Q(data_out_1[111]) );
  DFFHQX1 data_out_1_reg_59_ ( .D(n908), .CK(clk), .Q(data_out_1[59]) );
  DFFHQX1 data_out_1_reg_58_ ( .D(n909), .CK(clk), .Q(data_out_1[58]) );
  DFFHQX1 data_out_1_reg_93_ ( .D(n874), .CK(clk), .Q(data_out_1[93]) );
  DFFHQX1 data_out_1_reg_92_ ( .D(n875), .CK(clk), .Q(data_out_1[92]) );
  DFFHQX1 data_out_1_reg_78_ ( .D(n889), .CK(clk), .Q(data_out_1[78]) );
  DFFHQX1 data_out_1_reg_77_ ( .D(n890), .CK(clk), .Q(data_out_1[77]) );
  DFFHQX1 data_out_1_reg_127_ ( .D(n840), .CK(clk), .Q(data_out_1[127]) );
  DFFHQX1 data_out_1_reg_126_ ( .D(n841), .CK(clk), .Q(data_out_1[126]) );
  DFFHQX1 data_out_1_reg_110_ ( .D(n857), .CK(clk), .Q(data_out_1[110]) );
  DFFHQX1 data_out_1_reg_109_ ( .D(n858), .CK(clk), .Q(data_out_1[109]) );
  DFFHQX1 data_out_1_reg_108_ ( .D(n859), .CK(clk), .Q(data_out_1[108]) );
  DFFHQX1 data_out_1_reg_125_ ( .D(n842), .CK(clk), .Q(data_out_1[125]) );
  DFFHQX1 data_out_1_reg_120_ ( .D(n847), .CK(clk), .Q(data_out_1[120]) );
  DFFHQX1 data_out_1_reg_76_ ( .D(n891), .CK(clk), .Q(data_out_1[76]) );
  DFFHQX1 data_out_1_reg_107_ ( .D(n860), .CK(clk), .Q(data_out_1[107]) );
  DFFHQX1 data_out_1_reg_74_ ( .D(n893), .CK(clk), .Q(data_out_1[74]) );
  DFFHQX1 data_out_1_reg_124_ ( .D(n843), .CK(clk), .Q(data_out_1[124]) );
  DFFHQX1 data_out_1_reg_57_ ( .D(n910), .CK(clk), .Q(data_out_1[57]) );
  DFFHQX1 data_out_1_reg_39_ ( .D(n928), .CK(clk), .Q(data_out_1[39]) );
  DFFHQX1 data_out_1_reg_89_ ( .D(n878), .CK(clk), .Q(data_out_1[89]) );
  DFFHQX1 data_out_1_reg_72_ ( .D(n895), .CK(clk), .Q(data_out_1[72]) );
  DFFHQX1 data_out_1_reg_73_ ( .D(n894), .CK(clk), .Q(data_out_1[73]) );
  DFFHQX1 data_out_1_reg_56_ ( .D(n911), .CK(clk), .Q(data_out_1[56]) );
  DFFHQX1 data_out_1_reg_71_ ( .D(n896), .CK(clk), .Q(data_out_1[71]) );
  DFFHQX1 data_out_1_reg_105_ ( .D(n862), .CK(clk), .Q(data_out_1[105]) );
  DFFHQX1 data_out_1_reg_38_ ( .D(n929), .CK(clk), .Q(data_out_1[38]) );
  DFFHQX1 data_out_1_reg_37_ ( .D(n930), .CK(clk), .Q(data_out_1[37]) );
  DFFHQX1 data_out_1_reg_55_ ( .D(n912), .CK(clk), .Q(data_out_1[55]) );
  DFFHQX1 data_out_1_reg_36_ ( .D(n931), .CK(clk), .Q(data_out_1[36]) );
  DFFHQX1 data_out_1_reg_35_ ( .D(n932), .CK(clk), .Q(data_out_1[35]) );
  DFFHQX1 data_out_1_reg_88_ ( .D(n879), .CK(clk), .Q(data_out_1[88]) );
  DFFHQX1 data_out_1_reg_69_ ( .D(n898), .CK(clk), .Q(data_out_1[69]) );
  DFFHQX1 data_out_1_reg_86_ ( .D(n881), .CK(clk), .Q(data_out_1[86]) );
  DFFHQX1 data_out_1_reg_103_ ( .D(n864), .CK(clk), .Q(data_out_1[103]) );
  DFFHQX1 data_out_1_reg_54_ ( .D(n913), .CK(clk), .Q(data_out_1[54]) );
  DFFHQX1 data_out_1_reg_104_ ( .D(n863), .CK(clk), .Q(data_out_1[104]) );
  DFFHQX1 data_out_1_reg_53_ ( .D(n914), .CK(clk), .Q(data_out_1[53]) );
  DFFHQX1 data_out_1_reg_121_ ( .D(n846), .CK(clk), .Q(data_out_1[121]) );
  DFFHQX1 data_out_1_reg_52_ ( .D(n915), .CK(clk), .Q(data_out_1[52]) );
  DFFHQX1 data_out_1_reg_117_ ( .D(n850), .CK(clk), .Q(data_out_1[117]) );
  DFFHQX1 data_out_1_reg_66_ ( .D(n901), .CK(clk), .Q(data_out_1[66]) );
  DFFHQX1 data_out_1_reg_65_ ( .D(n902), .CK(clk), .Q(data_out_1[65]) );
  DFFHQX1 data_out_1_reg_49_ ( .D(n918), .CK(clk), .Q(data_out_1[49]) );
  DFFHQX1 data_out_1_reg_48_ ( .D(n919), .CK(clk), .Q(data_out_1[48]) );
  DFFHQX1 data_out_1_reg_100_ ( .D(n867), .CK(clk), .Q(data_out_1[100]) );
  DFFHQX1 data_out_1_reg_134_ ( .D(n833), .CK(clk), .Q(data_out_1[134]) );
  DFFHQX1 data_out_1_reg_47_ ( .D(n920), .CK(clk), .Q(data_out_1[47]) );
  DFFHQX1 data_out_1_reg_133_ ( .D(n834), .CK(clk), .Q(data_out_1[133]) );
  DFFHQX1 data_out_1_reg_116_ ( .D(n851), .CK(clk), .Q(data_out_1[116]) );
  DFFHQX1 data_out_1_reg_83_ ( .D(n884), .CK(clk), .Q(data_out_1[83]) );
  DFFHQX1 data_out_1_reg_82_ ( .D(n885), .CK(clk), .Q(data_out_1[82]) );
  DFFHQX1 data_out_1_reg_81_ ( .D(n886), .CK(clk), .Q(data_out_1[81]) );
  DFFHQX1 data_out_1_reg_80_ ( .D(n887), .CK(clk), .Q(data_out_1[80]) );
  DFFHQX1 data_out_1_reg_46_ ( .D(n921), .CK(clk), .Q(data_out_1[46]) );
  DFFHQX1 data_out_1_reg_64_ ( .D(n903), .CK(clk), .Q(data_out_1[64]) );
  DFFHQX1 data_out_1_reg_99_ ( .D(n868), .CK(clk), .Q(data_out_1[99]) );
  DFFHQX1 data_out_1_reg_63_ ( .D(n904), .CK(clk), .Q(data_out_1[63]) );
  DFFHQX1 data_out_1_reg_98_ ( .D(n869), .CK(clk), .Q(data_out_1[98]) );
  DFFHQX1 data_out_1_reg_79_ ( .D(n888), .CK(clk), .Q(data_out_1[79]) );
  DFFHQX1 data_out_1_reg_45_ ( .D(n922), .CK(clk), .Q(data_out_1[45]) );
  DFFHQX1 data_out_1_reg_70_ ( .D(n897), .CK(clk), .Q(data_out_1[70]) );
  DFFHQX1 data_out_1_reg_87_ ( .D(n880), .CK(clk), .Q(data_out_1[87]) );
  DFFHQX1 data_out_1_reg_132_ ( .D(n835), .CK(clk), .Q(data_out_1[132]) );
  DFFHQX1 data_out_1_reg_131_ ( .D(n836), .CK(clk), .Q(data_out_1[131]) );
  DFFHQX1 data_out_1_reg_115_ ( .D(n852), .CK(clk), .Q(data_out_1[115]) );
  DFFHQX1 data_out_1_reg_114_ ( .D(n853), .CK(clk), .Q(data_out_1[114]) );
  DFFHQX1 data_out_1_reg_97_ ( .D(n870), .CK(clk), .Q(data_out_1[97]) );
  DFFHQX1 data_out_1_reg_62_ ( .D(n905), .CK(clk), .Q(data_out_1[62]) );
  DFFHQX1 data_out_1_reg_44_ ( .D(n923), .CK(clk), .Q(data_out_1[44]) );
  DFFHQX1 data_out_1_reg_43_ ( .D(n924), .CK(clk), .Q(data_out_1[43]) );
  DFFHQX1 data_out_1_reg_42_ ( .D(n925), .CK(clk), .Q(data_out_1[42]) );
  DFFHQX1 data_out_1_reg_41_ ( .D(n926), .CK(clk), .Q(data_out_1[41]) );
  DFFHQX1 data_out_1_reg_40_ ( .D(n927), .CK(clk), .Q(data_out_1[40]) );
  DFFHQX1 data_out_1_reg_75_ ( .D(n892), .CK(clk), .Q(data_out_1[75]) );
  DFFHQX1 data_out_1_reg_90_ ( .D(n877), .CK(clk), .Q(data_out_1[90]) );
  DFFHQX1 data_out_1_reg_91_ ( .D(n876), .CK(clk), .Q(data_out_1[91]) );
  DFFRHQX1 s_p_flag_out_reg ( .D(n2927), .CK(clk), .RN(rst_n), .Q(s_p_flag_out) );
  DFFHQX1 data_out_1_reg_33_ ( .D(n934), .CK(clk), .Q(data_out_1[33]) );
  DFFHQX1 data_out_1_reg_16_ ( .D(n951), .CK(clk), .Q(data_out_1[16]) );
  DFFHQX1 data_out_1_reg_15_ ( .D(n952), .CK(clk), .Q(data_out_1[15]) );
  DFFHQX1 data_out_1_reg_32_ ( .D(n935), .CK(clk), .Q(data_out_1[32]) );
  DFFHQX1 data_out_1_reg_13_ ( .D(n954), .CK(clk), .Q(data_out_1[13]) );
  DFFHQX1 data_out_1_reg_31_ ( .D(n936), .CK(clk), .Q(data_out_1[31]) );
  DFFHQX1 data_out_1_reg_30_ ( .D(n937), .CK(clk), .Q(data_out_1[30]) );
  DFFHQX1 data_out_1_reg_14_ ( .D(n953), .CK(clk), .Q(data_out_1[14]) );
  DFFHQX1 data_out_1_reg_29_ ( .D(n938), .CK(clk), .Q(data_out_1[29]) );
  DFFRHQX1 counter_reg_1_ ( .D(N13), .CK(clk), .RN(rst_n), .Q(counter[1]) );
  DFFRHQX1 counter_reg_3_ ( .D(N15), .CK(clk), .RN(rst_n), .Q(counter[3]) );
  DFFRHQX1 counter_reg_2_ ( .D(N14), .CK(clk), .RN(rst_n), .Q(counter[2]) );
  JKFFRXL counter_reg_0_ ( .J(1'b1), .K(1'b1), .CK(clk), .RN(rst_n), .QN(n550)
         );
  DFFHQX1 data_out_1_reg_12_ ( .D(n955), .CK(clk), .Q(data_out_1[12]) );
  DFFHQX1 data_out_1_reg_11_ ( .D(n956), .CK(clk), .Q(data_out_1[11]) );
  DFFHQX1 data_out_1_reg_28_ ( .D(n939), .CK(clk), .Q(data_out_1[28]) );
  DFFHQX1 data_out_1_reg_27_ ( .D(n940), .CK(clk), .Q(data_out_1[27]) );
  DFFHQX1 data_out_1_reg_26_ ( .D(n941), .CK(clk), .Q(data_out_1[26]) );
  DFFHQX1 data_out_1_reg_25_ ( .D(n942), .CK(clk), .Q(data_out_1[25]) );
  DFFHQX1 data_out_1_reg_9_ ( .D(n958), .CK(clk), .Q(data_out_1[9]) );
  DFFHQX1 data_out_1_reg_8_ ( .D(n959), .CK(clk), .Q(data_out_1[8]) );
  DFFHQX1 data_out_1_reg_10_ ( .D(n957), .CK(clk), .Q(data_out_1[10]) );
  DFFHQX1 data_out_1_reg_24_ ( .D(n943), .CK(clk), .Q(data_out_1[24]) );
  DFFHQX1 data_out_1_reg_23_ ( .D(n944), .CK(clk), .Q(data_out_1[23]) );
  DFFHQX1 data_out_1_reg_22_ ( .D(n945), .CK(clk), .Q(data_out_1[22]) );
  DFFHQX1 data_out_1_reg_7_ ( .D(n960), .CK(clk), .Q(data_out_1[7]) );
  DFFHQX1 data_out_1_reg_21_ ( .D(n946), .CK(clk), .Q(data_out_1[21]) );
  DFFHQX1 data_out_1_reg_6_ ( .D(n961), .CK(clk), .Q(data_out_1[6]) );
  DFFHQX1 data_out_1_reg_4_ ( .D(n963), .CK(clk), .Q(data_out_1[4]) );
  DFFHQX1 data_out_1_reg_20_ ( .D(n947), .CK(clk), .Q(data_out_1[20]) );
  DFFHQX1 data_out_1_reg_5_ ( .D(n962), .CK(clk), .Q(data_out_1[5]) );
  DFFHQX1 data_out_1_reg_1_ ( .D(n966), .CK(clk), .Q(data_out_1[1]) );
  DFFHQX1 data_out_1_reg_3_ ( .D(n964), .CK(clk), .Q(data_out_1[3]) );
  DFFHQX1 data_out_1_reg_2_ ( .D(n965), .CK(clk), .Q(data_out_1[2]) );
  DFFHQX1 data_out_1_reg_17_ ( .D(n950), .CK(clk), .Q(data_out_1[17]) );
  DFFHQX1 data_out_1_reg_0_ ( .D(n967), .CK(clk), .Q(data_out_1[0]) );
  DFFHQX1 data_out_1_reg_19_ ( .D(n948), .CK(clk), .Q(data_out_1[19]) );
  DFFHQX1 data_out_1_reg_18_ ( .D(n949), .CK(clk), .Q(data_out_1[18]) );
  OR2X2 U4 ( .A(n691), .B(n692), .Y(n2378) );
  OR2X2 U5 ( .A(n691), .B(n695), .Y(n2379) );
  OR2X2 U6 ( .A(n691), .B(n696), .Y(n2380) );
  INVX1 U7 ( .A(n3022), .Y(n3016) );
  AOI222XL U8 ( .A0(n1894), .A1(n3019), .B0(data_out_1[18]), .B1(n2959), .C0(
        n3025), .C1(R3[18]), .Y(n717) );
  AOI222XL U9 ( .A0(n1895), .A1(n3017), .B0(data_out_1[19]), .B1(n2959), .C0(
        n3024), .C1(R3[19]), .Y(n718) );
  AOI222XL U10 ( .A0(n1893), .A1(n3020), .B0(data_out_1[17]), .B1(n2959), .C0(
        n3023), .C1(R3[17]), .Y(n716) );
  AOI222XL U11 ( .A0(n1880), .A1(n3016), .B0(data_out_1[4]), .B1(n699), .C0(
        n3023), .C1(R3[4]), .Y(n703) );
  AOI222XL U12 ( .A0(n1881), .A1(n3016), .B0(data_out_1[5]), .B1(n2950), .C0(
        n3023), .C1(R3[5]), .Y(n704) );
  AOI222XL U13 ( .A0(n1882), .A1(n3016), .B0(data_out_1[6]), .B1(n699), .C0(
        n3023), .C1(R3[6]), .Y(n705) );
  AOI222XL U14 ( .A0(n1896), .A1(n3020), .B0(data_out_1[20]), .B1(n2959), .C0(
        n3025), .C1(R3[20]), .Y(n719) );
  AOI222XL U15 ( .A0(n1897), .A1(n3018), .B0(data_out_1[21]), .B1(n2959), .C0(
        n3026), .C1(R3[21]), .Y(n720) );
  AOI222XL U16 ( .A0(n1883), .A1(n3016), .B0(data_out_1[7]), .B1(n699), .C0(
        n3023), .C1(R3[7]), .Y(n706) );
  AOI222XL U17 ( .A0(n1898), .A1(n3020), .B0(data_out_1[22]), .B1(n2959), .C0(
        n3026), .C1(R3[22]), .Y(n721) );
  AOI222XL U18 ( .A0(n1899), .A1(n3019), .B0(data_out_1[23]), .B1(n2959), .C0(
        n3025), .C1(R3[23]), .Y(n722) );
  AOI222XL U19 ( .A0(n1900), .A1(n3017), .B0(data_out_1[24]), .B1(n2959), .C0(
        n3024), .C1(R3[24]), .Y(n723) );
  AOI222XL U20 ( .A0(n1879), .A1(n3016), .B0(data_out_1[3]), .B1(n2950), .C0(
        n3023), .C1(R3[3]), .Y(n702) );
  AOI222XL U21 ( .A0(n1876), .A1(n3018), .B0(data_out_1[0]), .B1(n699), .C0(
        n3026), .C1(R3[0]), .Y(n698) );
  AOI222XL U22 ( .A0(n1878), .A1(n3016), .B0(data_out_1[2]), .B1(n699), .C0(
        n3023), .C1(R3[2]), .Y(n701) );
  INVX1 U23 ( .A(n2961), .Y(n2959) );
  INVX1 U24 ( .A(n2960), .Y(n2955) );
  INVX1 U25 ( .A(n2961), .Y(n2957) );
  INVX1 U26 ( .A(n2961), .Y(n2953) );
  INVX1 U27 ( .A(n2961), .Y(n2952) );
  INVX1 U28 ( .A(n2960), .Y(n2956) );
  INVX1 U29 ( .A(n2960), .Y(n2954) );
  INVX1 U30 ( .A(n2960), .Y(n2958) );
  INVX1 U31 ( .A(n2950), .Y(n2961) );
  INVX1 U32 ( .A(n2950), .Y(n2960) );
  INVX1 U33 ( .A(n2951), .Y(n2950) );
  CLKINVX3 U34 ( .A(n3021), .Y(n3019) );
  CLKINVX3 U35 ( .A(n3021), .Y(n3018) );
  CLKINVX3 U36 ( .A(n3021), .Y(n3017) );
  CLKINVX3 U37 ( .A(n3021), .Y(n3020) );
  INVX1 U38 ( .A(n2998), .Y(n2988) );
  INVX1 U39 ( .A(n2998), .Y(n2987) );
  INVX1 U40 ( .A(n2999), .Y(n2985) );
  INVX1 U41 ( .A(n2999), .Y(n2986) );
  INVX1 U42 ( .A(n2998), .Y(n2989) );
  INVX1 U43 ( .A(n2997), .Y(n2990) );
  INVX1 U44 ( .A(n2997), .Y(n2991) );
  INVX1 U45 ( .A(n2997), .Y(n2992) );
  INVX1 U46 ( .A(n2974), .Y(n2971) );
  INVX1 U47 ( .A(n2976), .Y(n2965) );
  INVX1 U48 ( .A(n2974), .Y(n2968) );
  INVX1 U49 ( .A(n2977), .Y(n2963) );
  INVX1 U50 ( .A(n2976), .Y(n2962) );
  INVX1 U51 ( .A(n2975), .Y(n2966) );
  INVX1 U52 ( .A(n2976), .Y(n2964) );
  INVX1 U53 ( .A(n2974), .Y(n2970) );
  INVX1 U54 ( .A(n2975), .Y(n2969) );
  INVX1 U55 ( .A(n2975), .Y(n2967) );
  INVX1 U56 ( .A(n3009), .Y(n3008) );
  INVX1 U57 ( .A(n2996), .Y(n2995) );
  INVX1 U58 ( .A(N230), .Y(n3022) );
  INVX1 U59 ( .A(n699), .Y(n2951) );
  NOR4BX1 U60 ( .AN(n2995), .B(n2973), .C(n3016), .D(n3023), .Y(n699) );
  CLKINVX3 U61 ( .A(n3027), .Y(n3026) );
  CLKINVX3 U62 ( .A(n3027), .Y(n3025) );
  CLKINVX3 U63 ( .A(n3027), .Y(n3024) );
  INVX1 U64 ( .A(n2996), .Y(n2993) );
  INVX1 U65 ( .A(n2996), .Y(n2994) );
  INVX1 U66 ( .A(n2973), .Y(n2972) );
  INVX1 U67 ( .A(n2983), .Y(n2977) );
  INVX1 U68 ( .A(n2982), .Y(n2978) );
  INVX1 U69 ( .A(n2982), .Y(n2979) );
  INVX1 U70 ( .A(n2982), .Y(n2980) );
  INVX1 U71 ( .A(n2982), .Y(n2981) );
  INVX1 U72 ( .A(n3004), .Y(n3003) );
  INVX1 U73 ( .A(n3004), .Y(n3002) );
  INVX1 U74 ( .A(n3004), .Y(n3001) );
  INVX1 U75 ( .A(n3005), .Y(n3000) );
  INVX1 U76 ( .A(n3005), .Y(n2998) );
  INVX1 U77 ( .A(n2983), .Y(n2976) );
  INVX1 U78 ( .A(n2983), .Y(n2974) );
  INVX1 U79 ( .A(n3005), .Y(n2997) );
  INVX1 U80 ( .A(n2983), .Y(n2975) );
  INVX1 U81 ( .A(n3004), .Y(n2999) );
  INVX1 U82 ( .A(N230), .Y(n3021) );
  INVX1 U83 ( .A(n3009), .Y(n3007) );
  INVX1 U84 ( .A(n3015), .Y(n3014) );
  INVX1 U85 ( .A(n3015), .Y(n3013) );
  INVX1 U86 ( .A(n3012), .Y(n3011) );
  INVX1 U87 ( .A(n2947), .Y(n2945) );
  INVX1 U88 ( .A(n2944), .Y(n2942) );
  INVX1 U89 ( .A(n2378), .Y(n2949) );
  INVX1 U90 ( .A(n2931), .Y(n2929) );
  INVX1 U91 ( .A(n2380), .Y(n2933) );
  INVX1 U92 ( .A(n2928), .Y(n2926) );
  INVX1 U93 ( .A(n2936), .Y(n2934) );
  INVX1 U94 ( .A(n2941), .Y(n2939) );
  INVX1 U95 ( .A(n2379), .Y(n2938) );
  INVX1 U96 ( .A(n2928), .Y(n2927) );
  INVX1 U97 ( .A(n2947), .Y(n2946) );
  INVX1 U98 ( .A(n2944), .Y(n2943) );
  INVX1 U99 ( .A(n2931), .Y(n2930) );
  INVX1 U100 ( .A(n2936), .Y(n2935) );
  INVX1 U101 ( .A(n2941), .Y(n2940) );
  INVX1 U102 ( .A(n1122), .Y(n3009) );
  NOR2BX1 U103 ( .AN(n697), .B(n686), .Y(N230) );
  CLKINVX3 U104 ( .A(n3027), .Y(n3023) );
  INVX1 U105 ( .A(N171), .Y(n3027) );
  INVX1 U106 ( .A(n3006), .Y(n2996) );
  INVX1 U107 ( .A(n1656), .Y(n3006) );
  INVX1 U108 ( .A(n2984), .Y(n2973) );
  INVX1 U109 ( .A(n972), .Y(n2984) );
  INVX1 U110 ( .A(n972), .Y(n2983) );
  INVX1 U111 ( .A(n1656), .Y(n3005) );
  INVX1 U112 ( .A(n972), .Y(n2982) );
  INVX1 U113 ( .A(n1656), .Y(n3004) );
  NOR2X1 U114 ( .A(n693), .B(n686), .Y(n1122) );
  INVX1 U115 ( .A(n3012), .Y(n3010) );
  INVX1 U116 ( .A(n974), .Y(n2947) );
  INVX1 U117 ( .A(n975), .Y(n2944) );
  INVX1 U118 ( .A(n980), .Y(n2931) );
  INVX1 U119 ( .A(n981), .Y(n2928) );
  INVX1 U120 ( .A(n978), .Y(n2936) );
  INVX1 U121 ( .A(n976), .Y(n2941) );
  INVX1 U122 ( .A(n1121), .Y(n3012) );
  INVX1 U123 ( .A(n1120), .Y(n3015) );
  INVX1 U124 ( .A(n2380), .Y(n2932) );
  INVX1 U125 ( .A(n2378), .Y(n2948) );
  INVX1 U126 ( .A(n2379), .Y(n2937) );
  NOR2BX1 U127 ( .AN(n697), .B(n692), .Y(n972) );
  NOR2BX1 U128 ( .AN(n697), .B(n695), .Y(n1656) );
  NOR2X1 U129 ( .A(n696), .B(n693), .Y(N171) );
  INVX1 U130 ( .A(n971), .Y(n686) );
  NAND2X1 U131 ( .A(n690), .B(n689), .Y(n693) );
  NOR2X1 U132 ( .A(n690), .B(n689), .Y(n697) );
  OAI211X1 U133 ( .A0(n971), .A1(n689), .B0(n691), .C0(n3015), .Y(N15) );
  NOR2X1 U134 ( .A(n686), .B(n694), .Y(n1120) );
  NOR2X1 U135 ( .A(n691), .B(n686), .Y(n1121) );
  NOR2X1 U136 ( .A(n692), .B(n693), .Y(n974) );
  NOR2X1 U137 ( .A(n692), .B(n694), .Y(n975) );
  NOR2X1 U138 ( .A(n693), .B(n695), .Y(n978) );
  NOR2X1 U139 ( .A(n694), .B(n695), .Y(n976) );
  NOR2X1 U140 ( .A(n694), .B(n696), .Y(n980) );
  NOR2BX1 U141 ( .AN(n697), .B(n696), .Y(n981) );
  XOR2X1 U142 ( .A(n690), .B(n686), .Y(N14) );
  NAND2X1 U143 ( .A(n692), .B(n695), .Y(N13) );
  NAND2BX1 U144 ( .AN(n550), .B(n687), .Y(n695) );
  NAND2X1 U145 ( .A(n550), .B(counter[1]), .Y(n692) );
  OAI221XL U146 ( .A0(n268), .A1(n2991), .B0(n2166), .B1(n2971), .C0(n717), 
        .Y(n949) );
  OAI221XL U147 ( .A0(n269), .A1(n2991), .B0(n2167), .B1(n2971), .C0(n718), 
        .Y(n948) );
  OAI221XL U148 ( .A0(n250), .A1(n2990), .B0(n2148), .B1(n2982), .C0(n698), 
        .Y(n967) );
  OAI221XL U149 ( .A0(n267), .A1(n2991), .B0(n2165), .B1(n2971), .C0(n716), 
        .Y(n950) );
  OAI221XL U150 ( .A0(n252), .A1(n2990), .B0(n2150), .B1(n2972), .C0(n701), 
        .Y(n965) );
  OAI221XL U151 ( .A0(n253), .A1(n2989), .B0(n2151), .B1(n2982), .C0(n702), 
        .Y(n964) );
  OAI221XL U152 ( .A0(n251), .A1(n2989), .B0(n2149), .B1(n2972), .C0(n700), 
        .Y(n966) );
  AOI222X1 U153 ( .A0(n1877), .A1(n3016), .B0(data_out_1[1]), .B1(n2953), .C0(
        n3023), .C1(R3[1]), .Y(n700) );
  OAI221XL U154 ( .A0(n254), .A1(n2990), .B0(n2152), .B1(n2972), .C0(n703), 
        .Y(n963) );
  OAI221XL U155 ( .A0(n255), .A1(n2989), .B0(n2153), .B1(n2972), .C0(n704), 
        .Y(n962) );
  OAI221XL U156 ( .A0(n256), .A1(n2990), .B0(n2154), .B1(n2972), .C0(n705), 
        .Y(n961) );
  OAI221XL U157 ( .A0(n270), .A1(n2991), .B0(n2168), .B1(n2971), .C0(n719), 
        .Y(n947) );
  OAI221XL U158 ( .A0(n271), .A1(n2991), .B0(n2169), .B1(n2971), .C0(n720), 
        .Y(n946) );
  OAI221XL U159 ( .A0(n257), .A1(n2990), .B0(n2155), .B1(n2972), .C0(n706), 
        .Y(n960) );
  OAI221XL U160 ( .A0(n272), .A1(n2991), .B0(n2170), .B1(n2971), .C0(n721), 
        .Y(n945) );
  OAI221XL U161 ( .A0(n273), .A1(n2991), .B0(n2171), .B1(n2971), .C0(n722), 
        .Y(n944) );
  OAI221XL U162 ( .A0(n279), .A1(n2991), .B0(n2177), .B1(n2970), .C0(n728), 
        .Y(n938) );
  AOI222X1 U163 ( .A0(n1905), .A1(n3020), .B0(data_out_1[29]), .B1(n2958), 
        .C0(n3026), .C1(R3[29]), .Y(n728) );
  OAI221XL U164 ( .A0(n258), .A1(n2990), .B0(n2156), .B1(n2972), .C0(n707), 
        .Y(n959) );
  AOI222X1 U165 ( .A0(n1884), .A1(n3016), .B0(data_out_1[8]), .B1(n699), .C0(
        n3023), .C1(R3[8]), .Y(n707) );
  OAI221XL U166 ( .A0(n259), .A1(n2990), .B0(n2157), .B1(n2972), .C0(n708), 
        .Y(n958) );
  AOI222X1 U167 ( .A0(n1885), .A1(n3016), .B0(data_out_1[9]), .B1(n2952), .C0(
        n3023), .C1(R3[9]), .Y(n708) );
  OAI221XL U168 ( .A0(n274), .A1(n2991), .B0(n2172), .B1(n2971), .C0(n723), 
        .Y(n943) );
  OAI221XL U169 ( .A0(n275), .A1(n2991), .B0(n2173), .B1(n2971), .C0(n724), 
        .Y(n942) );
  AOI222X1 U170 ( .A0(n1901), .A1(n3020), .B0(data_out_1[25]), .B1(n2959), 
        .C0(n3026), .C1(R3[25]), .Y(n724) );
  OAI221XL U171 ( .A0(n276), .A1(n2992), .B0(n2174), .B1(n2971), .C0(n725), 
        .Y(n941) );
  AOI222X1 U172 ( .A0(n1902), .A1(n3018), .B0(data_out_1[26]), .B1(n2959), 
        .C0(n3024), .C1(R3[26]), .Y(n725) );
  OAI221XL U173 ( .A0(n260), .A1(n2990), .B0(n2158), .B1(n2972), .C0(n709), 
        .Y(n957) );
  AOI222X1 U174 ( .A0(n1886), .A1(n3016), .B0(data_out_1[10]), .B1(n2952), 
        .C0(n3023), .C1(R3[10]), .Y(n709) );
  OAI221XL U175 ( .A0(n277), .A1(n2991), .B0(n2175), .B1(n2971), .C0(n726), 
        .Y(n940) );
  AOI222X1 U176 ( .A0(n1903), .A1(n3020), .B0(data_out_1[27]), .B1(n2959), 
        .C0(n3025), .C1(R3[27]), .Y(n726) );
  OAI221XL U177 ( .A0(n278), .A1(n2991), .B0(n2176), .B1(n2970), .C0(n727), 
        .Y(n939) );
  AOI222X1 U178 ( .A0(n1904), .A1(n3018), .B0(data_out_1[28]), .B1(n2958), 
        .C0(n3025), .C1(R3[28]), .Y(n727) );
  OAI221XL U179 ( .A0(n261), .A1(n2990), .B0(n2159), .B1(n2972), .C0(n710), 
        .Y(n956) );
  AOI222X1 U180 ( .A0(n1887), .A1(n3016), .B0(data_out_1[11]), .B1(n2957), 
        .C0(n3023), .C1(R3[11]), .Y(n710) );
  OAI221XL U181 ( .A0(n264), .A1(n2990), .B0(n2162), .B1(n2972), .C0(n713), 
        .Y(n953) );
  AOI222X1 U182 ( .A0(n1890), .A1(n3016), .B0(data_out_1[14]), .B1(n2958), 
        .C0(n3023), .C1(R3[14]), .Y(n713) );
  OAI221XL U183 ( .A0(n280), .A1(n2992), .B0(n2178), .B1(n2970), .C0(n729), 
        .Y(n937) );
  AOI222X1 U184 ( .A0(n1906), .A1(n3018), .B0(data_out_1[30]), .B1(n2958), 
        .C0(n3026), .C1(R3[30]), .Y(n729) );
  OAI221XL U185 ( .A0(n281), .A1(n2992), .B0(n2179), .B1(n2970), .C0(n730), 
        .Y(n936) );
  AOI222X1 U186 ( .A0(n1907), .A1(n3020), .B0(data_out_1[31]), .B1(n2958), 
        .C0(n3024), .C1(R3[31]), .Y(n730) );
  OAI221XL U187 ( .A0(n262), .A1(n2990), .B0(n2160), .B1(n2972), .C0(n711), 
        .Y(n955) );
  AOI222X1 U188 ( .A0(n1888), .A1(n3016), .B0(data_out_1[12]), .B1(n2959), 
        .C0(n3023), .C1(R3[12]), .Y(n711) );
  OAI221XL U189 ( .A0(n263), .A1(n2990), .B0(n2161), .B1(n2972), .C0(n712), 
        .Y(n954) );
  AOI222X1 U190 ( .A0(n1889), .A1(n3016), .B0(data_out_1[13]), .B1(n2950), 
        .C0(n3023), .C1(R3[13]), .Y(n712) );
  OAI221XL U191 ( .A0(n282), .A1(n2992), .B0(n2180), .B1(n2970), .C0(n731), 
        .Y(n935) );
  AOI222X1 U192 ( .A0(n1908), .A1(n3019), .B0(data_out_1[32]), .B1(n2958), 
        .C0(n3025), .C1(R3[32]), .Y(n731) );
  OAI221XL U193 ( .A0(n265), .A1(n2990), .B0(n2163), .B1(n2972), .C0(n714), 
        .Y(n952) );
  AOI222X1 U194 ( .A0(n1891), .A1(n3016), .B0(data_out_1[15]), .B1(n2950), 
        .C0(n3023), .C1(R3[15]), .Y(n714) );
  OAI221XL U195 ( .A0(n266), .A1(n2991), .B0(n2164), .B1(n2971), .C0(n715), 
        .Y(n951) );
  AOI222X1 U196 ( .A0(n1892), .A1(n3016), .B0(data_out_1[16]), .B1(n2959), 
        .C0(n3023), .C1(R3[16]), .Y(n715) );
  OAI221XL U197 ( .A0(n283), .A1(n2992), .B0(n2181), .B1(n2970), .C0(n732), 
        .Y(n934) );
  AOI222X1 U198 ( .A0(n1909), .A1(n3017), .B0(data_out_1[33]), .B1(n2958), 
        .C0(n3024), .C1(R3[33]), .Y(n732) );
  OAI221XL U199 ( .A0(n2986), .A1(n205), .B0(n2239), .B1(n2965), .C0(n790), 
        .Y(n876) );
  AOI222X1 U200 ( .A0(n1967), .A1(n3017), .B0(data_out_1[91]), .B1(n2955), 
        .C0(n3026), .C1(R11[23]), .Y(n790) );
  OAI221XL U201 ( .A0(n2986), .A1(n204), .B0(n2238), .B1(n2965), .C0(n789), 
        .Y(n877) );
  AOI222X1 U202 ( .A0(n1966), .A1(n3020), .B0(data_out_1[90]), .B1(n2955), 
        .C0(n3025), .C1(R11[22]), .Y(n789) );
  OAI221XL U203 ( .A0(n2985), .A1(n189), .B0(n2223), .B1(n2967), .C0(n774), 
        .Y(n892) );
  AOI222X1 U204 ( .A0(n1951), .A1(n3018), .B0(data_out_1[75]), .B1(n2957), 
        .C0(n3026), .C1(R11[7]), .Y(n774) );
  OAI221XL U205 ( .A0(n222), .A1(n2992), .B0(n2188), .B1(n2969), .C0(n739), 
        .Y(n927) );
  AOI222X1 U206 ( .A0(n1916), .A1(n3017), .B0(data_out_1[40]), .B1(n2956), 
        .C0(n3024), .C1(R7[6]), .Y(n739) );
  OAI221XL U207 ( .A0(n223), .A1(n2992), .B0(n2189), .B1(n2969), .C0(n740), 
        .Y(n926) );
  AOI222X1 U208 ( .A0(n1917), .A1(n3017), .B0(data_out_1[41]), .B1(n2955), 
        .C0(n3026), .C1(R7[7]), .Y(n740) );
  OAI221XL U209 ( .A0(n224), .A1(n2993), .B0(n2190), .B1(n2969), .C0(n741), 
        .Y(n925) );
  AOI222X1 U210 ( .A0(n1918), .A1(n3017), .B0(data_out_1[42]), .B1(n2954), 
        .C0(n3025), .C1(R7[8]), .Y(n741) );
  OAI221XL U211 ( .A0(n225), .A1(n2993), .B0(n2191), .B1(n2969), .C0(n742), 
        .Y(n924) );
  AOI222X1 U212 ( .A0(n1919), .A1(n3017), .B0(data_out_1[43]), .B1(n2956), 
        .C0(n3024), .C1(R7[9]), .Y(n742) );
  OAI221XL U213 ( .A0(n226), .A1(n2993), .B0(n2192), .B1(n2969), .C0(n743), 
        .Y(n923) );
  AOI222X1 U214 ( .A0(n1920), .A1(n3017), .B0(data_out_1[44]), .B1(n2955), 
        .C0(n3026), .C1(R7[10]), .Y(n743) );
  OAI221XL U215 ( .A0(n244), .A1(n2994), .B0(n2210), .B1(n2968), .C0(n761), 
        .Y(n905) );
  AOI222X1 U216 ( .A0(n1938), .A1(n3019), .B0(data_out_1[62]), .B1(n2957), 
        .C0(n3024), .C1(R7[28]), .Y(n761) );
  OAI221XL U217 ( .A0(n211), .A1(n2995), .B0(n2245), .B1(n2965), .C0(n796), 
        .Y(n870) );
  AOI222X1 U218 ( .A0(n1973), .A1(n3017), .B0(data_out_1[97]), .B1(n2955), 
        .C0(n3025), .C1(R11[29]), .Y(n796) );
  OAI221XL U219 ( .A0(n2988), .A1(n160), .B0(n2262), .B1(n2963), .C0(n813), 
        .Y(n853) );
  AOI222X1 U220 ( .A0(n1990), .A1(n3019), .B0(data_out_1[114]), .B1(n2953), 
        .C0(n3026), .C1(R15[12]), .Y(n813) );
  OAI221XL U221 ( .A0(n2988), .A1(n161), .B0(n2263), .B1(n2963), .C0(n814), 
        .Y(n852) );
  AOI222X1 U222 ( .A0(n1991), .A1(n3019), .B0(data_out_1[115]), .B1(n2953), 
        .C0(n3026), .C1(R15[13]), .Y(n814) );
  OAI221XL U223 ( .A0(n2989), .A1(n177), .B0(n2279), .B1(n2962), .C0(n830), 
        .Y(n836) );
  AOI222X1 U224 ( .A0(n2007), .A1(n3020), .B0(data_out_1[131]), .B1(n2952), 
        .C0(n3024), .C1(R15[29]), .Y(n830) );
  OAI221XL U225 ( .A0(n2989), .A1(n178), .B0(n2280), .B1(n2962), .C0(n831), 
        .Y(n835) );
  AOI222X1 U226 ( .A0(n2008), .A1(n3020), .B0(data_out_1[132]), .B1(n2952), 
        .C0(n3026), .C1(R15[30]), .Y(n831) );
  OAI221XL U227 ( .A0(n2986), .A1(n201), .B0(n2235), .B1(n2966), .C0(n786), 
        .Y(n880) );
  AOI222X1 U228 ( .A0(n1963), .A1(n3018), .B0(data_out_1[87]), .B1(n2956), 
        .C0(n3025), .C1(R11[19]), .Y(n786) );
  OAI221XL U229 ( .A0(n2985), .A1(n184), .B0(n2218), .B1(n2967), .C0(n769), 
        .Y(n897) );
  AOI222X1 U230 ( .A0(n1946), .A1(n3019), .B0(data_out_1[70]), .B1(n2958), 
        .C0(n3024), .C1(R11[2]), .Y(n769) );
  OAI221XL U231 ( .A0(n227), .A1(n2993), .B0(n2193), .B1(n2969), .C0(n744), 
        .Y(n922) );
  AOI222X1 U232 ( .A0(n1921), .A1(n3017), .B0(data_out_1[45]), .B1(n2954), 
        .C0(n3025), .C1(R7[11]), .Y(n744) );
  OAI221XL U233 ( .A0(n2985), .A1(n193), .B0(n2227), .B1(n2966), .C0(n778), 
        .Y(n888) );
  AOI222X1 U234 ( .A0(n1955), .A1(n3018), .B0(data_out_1[79]), .B1(n2956), 
        .C0(n3024), .C1(R11[11]), .Y(n778) );
  OAI221XL U235 ( .A0(n212), .A1(n2995), .B0(n2246), .B1(n2965), .C0(n797), 
        .Y(n869) );
  AOI222X1 U236 ( .A0(n1974), .A1(n3020), .B0(data_out_1[98]), .B1(n2955), 
        .C0(n3025), .C1(R11[30]), .Y(n797) );
  OAI221XL U237 ( .A0(n245), .A1(n2994), .B0(n2211), .B1(n2968), .C0(n762), 
        .Y(n904) );
  AOI222X1 U238 ( .A0(n1939), .A1(n3017), .B0(data_out_1[63]), .B1(n2957), 
        .C0(n3024), .C1(R7[29]), .Y(n762) );
  OAI221XL U239 ( .A0(n213), .A1(n2995), .B0(n2247), .B1(n2965), .C0(n798), 
        .Y(n868) );
  AOI222X1 U240 ( .A0(n1975), .A1(n3018), .B0(data_out_1[99]), .B1(n2955), 
        .C0(n3025), .C1(R11[31]), .Y(n798) );
  OAI221XL U241 ( .A0(n246), .A1(n2994), .B0(n2212), .B1(n2967), .C0(n763), 
        .Y(n903) );
  AOI222X1 U242 ( .A0(n1940), .A1(n3018), .B0(data_out_1[64]), .B1(n2959), 
        .C0(n3024), .C1(R7[30]), .Y(n763) );
  OAI221XL U243 ( .A0(n228), .A1(n2993), .B0(n2194), .B1(n2969), .C0(n745), 
        .Y(n921) );
  AOI222X1 U244 ( .A0(n1922), .A1(n3017), .B0(data_out_1[46]), .B1(n2958), 
        .C0(n3024), .C1(R7[12]), .Y(n745) );
  OAI221XL U245 ( .A0(n2985), .A1(n194), .B0(n2228), .B1(n2966), .C0(n779), 
        .Y(n887) );
  AOI222X1 U246 ( .A0(n1956), .A1(n3018), .B0(data_out_1[80]), .B1(n2956), 
        .C0(n3026), .C1(R11[12]), .Y(n779) );
  OAI221XL U247 ( .A0(n2986), .A1(n195), .B0(n2229), .B1(n2966), .C0(n780), 
        .Y(n886) );
  AOI222X1 U248 ( .A0(n1957), .A1(n3018), .B0(data_out_1[81]), .B1(n2956), 
        .C0(n3025), .C1(R11[13]), .Y(n780) );
  OAI221XL U249 ( .A0(n2986), .A1(n196), .B0(n2230), .B1(n2966), .C0(n781), 
        .Y(n885) );
  AOI222X1 U250 ( .A0(n1958), .A1(n3018), .B0(data_out_1[82]), .B1(n2956), 
        .C0(n3024), .C1(R11[14]), .Y(n781) );
  OAI221XL U251 ( .A0(n2986), .A1(n197), .B0(n2231), .B1(n2966), .C0(n782), 
        .Y(n884) );
  AOI222X1 U252 ( .A0(n1959), .A1(n3018), .B0(data_out_1[83]), .B1(n2956), 
        .C0(n3026), .C1(R11[15]), .Y(n782) );
  OAI221XL U253 ( .A0(n2988), .A1(n162), .B0(n2264), .B1(n2963), .C0(n815), 
        .Y(n851) );
  AOI222X1 U254 ( .A0(n1992), .A1(n3019), .B0(data_out_1[116]), .B1(n2953), 
        .C0(n3026), .C1(R15[14]), .Y(n815) );
  OAI221XL U255 ( .A0(n2989), .A1(n179), .B0(n2281), .B1(n2962), .C0(n968), 
        .Y(n834) );
  AOI222X1 U256 ( .A0(n2009), .A1(n3020), .B0(data_out_1[133]), .B1(n2952), 
        .C0(n3025), .C1(R15[31]), .Y(n968) );
  OAI221XL U257 ( .A0(n229), .A1(n2993), .B0(n2195), .B1(n2969), .C0(n746), 
        .Y(n920) );
  AOI222X1 U258 ( .A0(n1923), .A1(n3017), .B0(data_out_1[47]), .B1(n2957), 
        .C0(n3024), .C1(R7[13]), .Y(n746) );
  OAI221XL U259 ( .A0(n2989), .A1(n180), .B0(n2282), .B1(n2962), .C0(n969), 
        .Y(n833) );
  AOI222X1 U260 ( .A0(n2010), .A1(n3020), .B0(data_out_1[134]), .B1(n2952), 
        .C0(n3024), .C1(R15[32]), .Y(n969) );
  OAI221XL U261 ( .A0(n214), .A1(n2995), .B0(n2248), .B1(n2964), .C0(n799), 
        .Y(n867) );
  AOI222X1 U262 ( .A0(n1976), .A1(n3019), .B0(data_out_1[100]), .B1(n2954), 
        .C0(n3025), .C1(R11[32]), .Y(n799) );
  OAI221XL U263 ( .A0(n230), .A1(n2993), .B0(n2196), .B1(n2969), .C0(n747), 
        .Y(n919) );
  AOI222X1 U264 ( .A0(n1924), .A1(n3017), .B0(data_out_1[48]), .B1(n2955), 
        .C0(n3024), .C1(R7[14]), .Y(n747) );
  OAI221XL U265 ( .A0(n231), .A1(n2993), .B0(n2197), .B1(n2969), .C0(n748), 
        .Y(n918) );
  AOI222X1 U266 ( .A0(n1925), .A1(n3017), .B0(data_out_1[49]), .B1(n2952), 
        .C0(n3026), .C1(R7[15]), .Y(n748) );
  OAI221XL U267 ( .A0(n247), .A1(n2994), .B0(n2213), .B1(n2967), .C0(n764), 
        .Y(n902) );
  AOI222X1 U268 ( .A0(n1941), .A1(n3020), .B0(data_out_1[65]), .B1(n2958), 
        .C0(n3024), .C1(R7[31]), .Y(n764) );
  OAI221XL U269 ( .A0(n248), .A1(n2994), .B0(n2214), .B1(n2967), .C0(n765), 
        .Y(n901) );
  AOI222X1 U270 ( .A0(n1942), .A1(n3018), .B0(data_out_1[66]), .B1(n2959), 
        .C0(n3024), .C1(R7[32]), .Y(n765) );
  OAI221XL U271 ( .A0(n2988), .A1(n163), .B0(n2265), .B1(n2963), .C0(n816), 
        .Y(n850) );
  AOI222X1 U272 ( .A0(n1993), .A1(n3019), .B0(data_out_1[117]), .B1(n2953), 
        .C0(n3026), .C1(R15[15]), .Y(n816) );
  OAI221XL U273 ( .A0(n234), .A1(n2993), .B0(n2200), .B1(n2968), .C0(n751), 
        .Y(n915) );
  AOI222X1 U274 ( .A0(n1928), .A1(n3017), .B0(data_out_1[52]), .B1(n2957), 
        .C0(n3025), .C1(R7[18]), .Y(n751) );
  OAI221XL U275 ( .A0(n2988), .A1(n167), .B0(n2269), .B1(n2963), .C0(n820), 
        .Y(n846) );
  AOI222X1 U276 ( .A0(n1997), .A1(n3019), .B0(data_out_1[121]), .B1(n2953), 
        .C0(n3026), .C1(R15[19]), .Y(n820) );
  OAI221XL U277 ( .A0(n235), .A1(n2993), .B0(n2201), .B1(n2968), .C0(n752), 
        .Y(n914) );
  AOI222X1 U278 ( .A0(n1929), .A1(n3019), .B0(data_out_1[53]), .B1(n2957), 
        .C0(n3026), .C1(R7[19]), .Y(n752) );
  OAI221XL U279 ( .A0(n2987), .A1(n150), .B0(n2252), .B1(n2964), .C0(n803), 
        .Y(n863) );
  AOI222X1 U280 ( .A0(n1980), .A1(n3018), .B0(data_out_1[104]), .B1(n2954), 
        .C0(n3025), .C1(R15[2]), .Y(n803) );
  OAI221XL U281 ( .A0(n236), .A1(n2993), .B0(n2202), .B1(n2968), .C0(n753), 
        .Y(n913) );
  AOI222X1 U282 ( .A0(n1930), .A1(n3017), .B0(data_out_1[54]), .B1(n2957), 
        .C0(n3024), .C1(R7[20]), .Y(n753) );
  OAI221XL U283 ( .A0(n2987), .A1(n149), .B0(n2251), .B1(n2964), .C0(n802), 
        .Y(n864) );
  AOI222X1 U284 ( .A0(n1979), .A1(n3019), .B0(data_out_1[103]), .B1(n2954), 
        .C0(n3025), .C1(R15[1]), .Y(n802) );
  OAI221XL U285 ( .A0(n2986), .A1(n200), .B0(n2234), .B1(n2966), .C0(n785), 
        .Y(n881) );
  AOI222X1 U286 ( .A0(n1962), .A1(n3018), .B0(data_out_1[86]), .B1(n2956), 
        .C0(n3025), .C1(R11[18]), .Y(n785) );
  OAI221XL U287 ( .A0(n2985), .A1(n183), .B0(n2217), .B1(n2967), .C0(n768), 
        .Y(n898) );
  AOI222X1 U288 ( .A0(n1945), .A1(n3017), .B0(data_out_1[69]), .B1(n2955), 
        .C0(n3024), .C1(R11[1]), .Y(n768) );
  OAI221XL U289 ( .A0(n2986), .A1(n202), .B0(n2236), .B1(n2965), .C0(n787), 
        .Y(n879) );
  AOI222X1 U290 ( .A0(n1964), .A1(n3017), .B0(data_out_1[88]), .B1(n2955), 
        .C0(n3024), .C1(R11[20]), .Y(n787) );
  OAI221XL U291 ( .A0(n217), .A1(n2992), .B0(n2183), .B1(n2970), .C0(n734), 
        .Y(n932) );
  AOI222X1 U292 ( .A0(n1911), .A1(n3017), .B0(data_out_1[35]), .B1(n2958), 
        .C0(n3026), .C1(R7[1]), .Y(n734) );
  OAI221XL U293 ( .A0(n218), .A1(n2992), .B0(n2184), .B1(n2970), .C0(n735), 
        .Y(n931) );
  AOI222X1 U294 ( .A0(n1912), .A1(n3017), .B0(data_out_1[36]), .B1(n2958), 
        .C0(n3025), .C1(R7[2]), .Y(n735) );
  OAI221XL U295 ( .A0(n237), .A1(n2994), .B0(n2203), .B1(n2968), .C0(n754), 
        .Y(n912) );
  AOI222X1 U296 ( .A0(n1931), .A1(n3019), .B0(data_out_1[55]), .B1(n2957), 
        .C0(n3026), .C1(R7[21]), .Y(n754) );
  OAI221XL U297 ( .A0(n219), .A1(n2992), .B0(n2185), .B1(n2970), .C0(n736), 
        .Y(n930) );
  AOI222X1 U298 ( .A0(n1913), .A1(n3017), .B0(data_out_1[37]), .B1(n2958), 
        .C0(n3025), .C1(R7[3]), .Y(n736) );
  OAI221XL U299 ( .A0(n220), .A1(n2992), .B0(n2186), .B1(n2970), .C0(n737), 
        .Y(n929) );
  AOI222X1 U300 ( .A0(n1914), .A1(n3017), .B0(data_out_1[38]), .B1(n2958), 
        .C0(n3025), .C1(R7[4]), .Y(n737) );
  OAI221XL U301 ( .A0(n2987), .A1(n151), .B0(n2253), .B1(n2964), .C0(n804), 
        .Y(n862) );
  AOI222X1 U302 ( .A0(n1981), .A1(n3020), .B0(data_out_1[105]), .B1(n2954), 
        .C0(n3025), .C1(R15[3]), .Y(n804) );
  OAI221XL U303 ( .A0(n2985), .A1(n185), .B0(n2219), .B1(n2967), .C0(n770), 
        .Y(n896) );
  AOI222X1 U304 ( .A0(n1947), .A1(n3018), .B0(data_out_1[71]), .B1(n2952), 
        .C0(n3024), .C1(R11[3]), .Y(n770) );
  OAI221XL U305 ( .A0(n238), .A1(n2994), .B0(n2204), .B1(n2968), .C0(n755), 
        .Y(n911) );
  AOI222X1 U306 ( .A0(n1932), .A1(n3020), .B0(data_out_1[56]), .B1(n2957), 
        .C0(n3024), .C1(R7[22]), .Y(n755) );
  OAI221XL U307 ( .A0(n2985), .A1(n187), .B0(n2221), .B1(n2967), .C0(n772), 
        .Y(n894) );
  AOI222X1 U308 ( .A0(n1949), .A1(n3018), .B0(data_out_1[73]), .B1(n2953), 
        .C0(n3024), .C1(R11[5]), .Y(n772) );
  OAI221XL U309 ( .A0(n2985), .A1(n186), .B0(n2220), .B1(n2967), .C0(n771), 
        .Y(n895) );
  AOI222X1 U310 ( .A0(n1948), .A1(n3018), .B0(data_out_1[72]), .B1(n2959), 
        .C0(n3024), .C1(R11[4]), .Y(n771) );
  OAI221XL U311 ( .A0(n2986), .A1(n203), .B0(n2237), .B1(n2965), .C0(n788), 
        .Y(n878) );
  AOI222X1 U312 ( .A0(n1965), .A1(n3018), .B0(data_out_1[89]), .B1(n2955), 
        .C0(n3026), .C1(R11[21]), .Y(n788) );
  OAI221XL U313 ( .A0(n221), .A1(n2992), .B0(n2187), .B1(n2970), .C0(n738), 
        .Y(n928) );
  AOI222X1 U314 ( .A0(n1915), .A1(n3017), .B0(data_out_1[39]), .B1(n2958), 
        .C0(n3024), .C1(R7[5]), .Y(n738) );
  OAI221XL U315 ( .A0(n239), .A1(n2994), .B0(n2205), .B1(n2968), .C0(n756), 
        .Y(n910) );
  AOI222X1 U316 ( .A0(n1933), .A1(n3018), .B0(data_out_1[57]), .B1(n2957), 
        .C0(n3024), .C1(R7[23]), .Y(n756) );
  OAI221XL U317 ( .A0(n2989), .A1(n170), .B0(n2272), .B1(n2962), .C0(n823), 
        .Y(n843) );
  AOI222X1 U318 ( .A0(n2000), .A1(n3020), .B0(data_out_1[124]), .B1(n2952), 
        .C0(n3026), .C1(R15[22]), .Y(n823) );
  OAI221XL U319 ( .A0(n2985), .A1(n188), .B0(n2222), .B1(n2967), .C0(n773), 
        .Y(n893) );
  AOI222X1 U320 ( .A0(n1950), .A1(n3018), .B0(data_out_1[74]), .B1(n2954), 
        .C0(n3024), .C1(R11[6]), .Y(n773) );
  OAI221XL U321 ( .A0(n2987), .A1(n153), .B0(n2255), .B1(n2964), .C0(n806), 
        .Y(n860) );
  AOI222X1 U322 ( .A0(n1983), .A1(n3019), .B0(data_out_1[107]), .B1(n2954), 
        .C0(n3025), .C1(R15[5]), .Y(n806) );
  OAI221XL U323 ( .A0(n2985), .A1(n190), .B0(n2224), .B1(n2966), .C0(n775), 
        .Y(n891) );
  AOI222X1 U324 ( .A0(n1952), .A1(n3018), .B0(data_out_1[76]), .B1(n2956), 
        .C0(n3025), .C1(R11[8]), .Y(n775) );
  OAI221XL U325 ( .A0(n2988), .A1(n166), .B0(n2268), .B1(n2963), .C0(n819), 
        .Y(n847) );
  AOI222X1 U326 ( .A0(n1996), .A1(n3019), .B0(data_out_1[120]), .B1(n2953), 
        .C0(n3026), .C1(R15[18]), .Y(n819) );
  OAI221XL U327 ( .A0(n2988), .A1(n171), .B0(n2273), .B1(n2962), .C0(n824), 
        .Y(n842) );
  AOI222X1 U328 ( .A0(n2001), .A1(n3020), .B0(data_out_1[125]), .B1(n2952), 
        .C0(n3026), .C1(R15[23]), .Y(n824) );
  OAI221XL U329 ( .A0(n2987), .A1(n154), .B0(n2256), .B1(n2964), .C0(n807), 
        .Y(n859) );
  AOI222X1 U330 ( .A0(n1984), .A1(n3019), .B0(data_out_1[108]), .B1(n2954), 
        .C0(n3025), .C1(R15[6]), .Y(n807) );
  OAI221XL U331 ( .A0(n2987), .A1(n155), .B0(n2257), .B1(n2964), .C0(n808), 
        .Y(n858) );
  AOI222X1 U332 ( .A0(n1985), .A1(n3019), .B0(data_out_1[109]), .B1(n2954), 
        .C0(n3025), .C1(R15[7]), .Y(n808) );
  OAI221XL U333 ( .A0(n2988), .A1(n156), .B0(n2258), .B1(n2964), .C0(n809), 
        .Y(n857) );
  AOI222X1 U334 ( .A0(n1986), .A1(n3019), .B0(data_out_1[110]), .B1(n2954), 
        .C0(n3025), .C1(R15[8]), .Y(n809) );
  OAI221XL U335 ( .A0(n2989), .A1(n172), .B0(n2274), .B1(n2962), .C0(n825), 
        .Y(n841) );
  AOI222X1 U336 ( .A0(n2002), .A1(n3020), .B0(data_out_1[126]), .B1(n2952), 
        .C0(n3026), .C1(R15[24]), .Y(n825) );
  OAI221XL U337 ( .A0(n2988), .A1(n173), .B0(n2275), .B1(n2962), .C0(n826), 
        .Y(n840) );
  AOI222X1 U338 ( .A0(n2003), .A1(n3020), .B0(data_out_1[127]), .B1(n2952), 
        .C0(n3026), .C1(R15[25]), .Y(n826) );
  OAI221XL U339 ( .A0(n2985), .A1(n191), .B0(n2225), .B1(n2966), .C0(n776), 
        .Y(n890) );
  AOI222X1 U340 ( .A0(n1953), .A1(n3018), .B0(data_out_1[77]), .B1(n2956), 
        .C0(n3024), .C1(R11[9]), .Y(n776) );
  OAI221XL U341 ( .A0(n2985), .A1(n192), .B0(n2226), .B1(n2966), .C0(n777), 
        .Y(n889) );
  AOI222X1 U342 ( .A0(n1954), .A1(n3018), .B0(data_out_1[78]), .B1(n2956), 
        .C0(n3026), .C1(R11[10]), .Y(n777) );
  OAI221XL U343 ( .A0(n2986), .A1(n206), .B0(n2240), .B1(n2965), .C0(n791), 
        .Y(n875) );
  AOI222X1 U344 ( .A0(n1968), .A1(n3019), .B0(data_out_1[92]), .B1(n2955), 
        .C0(n3026), .C1(R11[24]), .Y(n791) );
  OAI221XL U345 ( .A0(n2986), .A1(n207), .B0(n2241), .B1(n2965), .C0(n792), 
        .Y(n874) );
  AOI222X1 U346 ( .A0(n1969), .A1(n3017), .B0(data_out_1[93]), .B1(n2955), 
        .C0(n3025), .C1(R11[25]), .Y(n792) );
  OAI221XL U347 ( .A0(n240), .A1(n2994), .B0(n2206), .B1(n2968), .C0(n757), 
        .Y(n909) );
  AOI222X1 U348 ( .A0(n1934), .A1(n3019), .B0(data_out_1[58]), .B1(n2957), 
        .C0(n3024), .C1(R7[24]), .Y(n757) );
  OAI221XL U349 ( .A0(n241), .A1(n2994), .B0(n2207), .B1(n2968), .C0(n758), 
        .Y(n908) );
  AOI222X1 U350 ( .A0(n1935), .A1(n3017), .B0(data_out_1[59]), .B1(n2957), 
        .C0(n3024), .C1(R7[25]), .Y(n758) );
  OAI221XL U351 ( .A0(n2987), .A1(n157), .B0(n2259), .B1(n2964), .C0(n810), 
        .Y(n856) );
  AOI222X1 U352 ( .A0(n1987), .A1(n3019), .B0(data_out_1[111]), .B1(n2954), 
        .C0(n3025), .C1(R15[9]), .Y(n810) );
  OAI221XL U353 ( .A0(n2988), .A1(n158), .B0(n2260), .B1(n2963), .C0(n811), 
        .Y(n855) );
  AOI222X1 U354 ( .A0(n1988), .A1(n3019), .B0(data_out_1[112]), .B1(n2953), 
        .C0(n3026), .C1(R15[10]), .Y(n811) );
  OAI221XL U355 ( .A0(n2987), .A1(n159), .B0(n2261), .B1(n2963), .C0(n812), 
        .Y(n854) );
  AOI222X1 U356 ( .A0(n1989), .A1(n3019), .B0(data_out_1[113]), .B1(n2953), 
        .C0(n3026), .C1(R15[11]), .Y(n812) );
  OAI221XL U357 ( .A0(n2989), .A1(n174), .B0(n2276), .B1(n2962), .C0(n827), 
        .Y(n839) );
  AOI222X1 U358 ( .A0(n2004), .A1(n3020), .B0(data_out_1[128]), .B1(n2952), 
        .C0(n3026), .C1(R15[26]), .Y(n827) );
  OAI221XL U359 ( .A0(n2989), .A1(n175), .B0(n2277), .B1(n2962), .C0(n828), 
        .Y(n838) );
  AOI222X1 U360 ( .A0(n2005), .A1(n3020), .B0(data_out_1[129]), .B1(n2952), 
        .C0(n3026), .C1(R15[27]), .Y(n828) );
  OAI221XL U361 ( .A0(n2989), .A1(n176), .B0(n2278), .B1(n2962), .C0(n829), 
        .Y(n837) );
  AOI222X1 U362 ( .A0(n2006), .A1(n3020), .B0(data_out_1[130]), .B1(n2952), 
        .C0(n3026), .C1(R15[28]), .Y(n829) );
  OAI221XL U363 ( .A0(n2987), .A1(n208), .B0(n2242), .B1(n2965), .C0(n793), 
        .Y(n873) );
  AOI222X1 U364 ( .A0(n1970), .A1(n3020), .B0(data_out_1[94]), .B1(n2955), 
        .C0(n3025), .C1(R11[26]), .Y(n793) );
  OAI221XL U365 ( .A0(n2987), .A1(n209), .B0(n2243), .B1(n2965), .C0(n794), 
        .Y(n872) );
  AOI222X1 U366 ( .A0(n1971), .A1(n3018), .B0(data_out_1[95]), .B1(n2955), 
        .C0(n3025), .C1(R11[27]), .Y(n794) );
  OAI221XL U367 ( .A0(n210), .A1(n2995), .B0(n2244), .B1(n2965), .C0(n795), 
        .Y(n871) );
  AOI222X1 U368 ( .A0(n1972), .A1(n3017), .B0(data_out_1[96]), .B1(n2955), 
        .C0(n3025), .C1(R11[28]), .Y(n795) );
  OAI221XL U369 ( .A0(n242), .A1(n2994), .B0(n2208), .B1(n2968), .C0(n759), 
        .Y(n907) );
  AOI222X1 U370 ( .A0(n1936), .A1(n3017), .B0(data_out_1[60]), .B1(n2957), 
        .C0(n3024), .C1(R7[26]), .Y(n759) );
  OAI221XL U371 ( .A0(n243), .A1(n2994), .B0(n2209), .B1(n2968), .C0(n760), 
        .Y(n906) );
  AOI222X1 U372 ( .A0(n1937), .A1(n3020), .B0(data_out_1[61]), .B1(n2957), 
        .C0(n3024), .C1(R7[27]), .Y(n760) );
  OAI221XL U373 ( .A0(n2987), .A1(n148), .B0(n2250), .B1(n2964), .C0(n801), 
        .Y(n865) );
  AOI222X1 U374 ( .A0(n1978), .A1(n3019), .B0(data_out_1[102]), .B1(n2954), 
        .C0(n3025), .C1(R15[0]), .Y(n801) );
  OAI221XL U375 ( .A0(n2987), .A1(n152), .B0(n2254), .B1(n2964), .C0(n805), 
        .Y(n861) );
  AOI222X1 U376 ( .A0(n1982), .A1(n3019), .B0(data_out_1[106]), .B1(n2954), 
        .C0(n3025), .C1(R15[4]), .Y(n805) );
  OAI221XL U377 ( .A0(n2988), .A1(n164), .B0(n2266), .B1(n2963), .C0(n817), 
        .Y(n849) );
  AOI222X1 U378 ( .A0(n1994), .A1(n3019), .B0(data_out_1[118]), .B1(n2953), 
        .C0(n3026), .C1(R15[16]), .Y(n817) );
  OAI221XL U379 ( .A0(n2988), .A1(n165), .B0(n2267), .B1(n2963), .C0(n818), 
        .Y(n848) );
  AOI222X1 U380 ( .A0(n1995), .A1(n3019), .B0(data_out_1[119]), .B1(n2953), 
        .C0(n3026), .C1(R15[17]), .Y(n818) );
  OAI221XL U381 ( .A0(n2989), .A1(n168), .B0(n2270), .B1(n2963), .C0(n821), 
        .Y(n845) );
  AOI222X1 U382 ( .A0(n1998), .A1(n3019), .B0(data_out_1[122]), .B1(n2953), 
        .C0(n3026), .C1(R15[20]), .Y(n821) );
  OAI221XL U383 ( .A0(n2988), .A1(n169), .B0(n2271), .B1(n2963), .C0(n822), 
        .Y(n844) );
  AOI222X1 U384 ( .A0(n1999), .A1(n3019), .B0(data_out_1[123]), .B1(n2953), 
        .C0(n3026), .C1(R15[21]), .Y(n822) );
  OAI221XL U385 ( .A0(n2987), .A1(n181), .B0(n2283), .B1(n2962), .C0(n970), 
        .Y(n832) );
  AOI222X1 U386 ( .A0(n2011), .A1(n3020), .B0(data_out_1[135]), .B1(n2952), 
        .C0(n3025), .C1(R15[33]), .Y(n970) );
  OAI221XL U387 ( .A0(n2985), .A1(n182), .B0(n2216), .B1(n2967), .C0(n767), 
        .Y(n899) );
  AOI222X1 U388 ( .A0(n1944), .A1(n3019), .B0(data_out_1[68]), .B1(n2957), 
        .C0(n3024), .C1(R11[0]), .Y(n767) );
  OAI221XL U389 ( .A0(n2986), .A1(n198), .B0(n2232), .B1(n2966), .C0(n783), 
        .Y(n883) );
  AOI222X1 U390 ( .A0(n1960), .A1(n3018), .B0(data_out_1[84]), .B1(n2956), 
        .C0(n3025), .C1(R11[16]), .Y(n783) );
  OAI221XL U391 ( .A0(n2986), .A1(n199), .B0(n2233), .B1(n2966), .C0(n784), 
        .Y(n882) );
  AOI222X1 U392 ( .A0(n1961), .A1(n3018), .B0(data_out_1[85]), .B1(n2956), 
        .C0(n3024), .C1(R11[17]), .Y(n784) );
  OAI221XL U393 ( .A0(n215), .A1(n2995), .B0(n2249), .B1(n2964), .C0(n800), 
        .Y(n866) );
  AOI222X1 U394 ( .A0(n1977), .A1(n3020), .B0(data_out_1[101]), .B1(n2954), 
        .C0(n3025), .C1(R11[33]), .Y(n800) );
  OAI221XL U395 ( .A0(n216), .A1(n2992), .B0(n2182), .B1(n2970), .C0(n733), 
        .Y(n933) );
  AOI222X1 U396 ( .A0(n1910), .A1(n3018), .B0(data_out_1[34]), .B1(n2958), 
        .C0(n3024), .C1(R7[0]), .Y(n733) );
  OAI221XL U397 ( .A0(n232), .A1(n2993), .B0(n2198), .B1(n2969), .C0(n749), 
        .Y(n917) );
  AOI222X1 U398 ( .A0(n1926), .A1(n3017), .B0(data_out_1[50]), .B1(n2953), 
        .C0(n3026), .C1(R7[16]), .Y(n749) );
  OAI221XL U399 ( .A0(n233), .A1(n2993), .B0(n2199), .B1(n2969), .C0(n750), 
        .Y(n916) );
  AOI222X1 U400 ( .A0(n1927), .A1(n3017), .B0(data_out_1[51]), .B1(n2956), 
        .C0(n3025), .C1(R7[17]), .Y(n750) );
  OAI221XL U401 ( .A0(n249), .A1(n2994), .B0(n2215), .B1(n2967), .C0(n766), 
        .Y(n900) );
  AOI222X1 U402 ( .A0(n1943), .A1(n3018), .B0(data_out_1[67]), .B1(n2954), 
        .C0(n3024), .C1(R7[33]), .Y(n766) );
  NAND2X1 U403 ( .A(n550), .B(n687), .Y(n696) );
  INVX1 U404 ( .A(counter[2]), .Y(n690) );
  INVX1 U405 ( .A(counter[3]), .Y(n689) );
  INVX1 U406 ( .A(counter[1]), .Y(n687) );
  NOR2X1 U407 ( .A(n687), .B(n550), .Y(n971) );
  NAND2X1 U408 ( .A(counter[3]), .B(n690), .Y(n691) );
  NAND2X1 U409 ( .A(counter[2]), .B(n689), .Y(n694) );
endmodule


module mux ( mux_flag, clk, rst_n, data_in_1, data_in_2, data_out, 
        data_in_3_33_, data_in_3_32_, data_in_3_31_, data_in_3_30_, 
        data_in_3_29_, data_in_3_28_, data_in_3_27_, data_in_3_26_, 
        data_in_3_25_, data_in_3_24_, data_in_3_23_, data_in_3_22_, 
        data_in_3_21_, data_in_3_20_, data_in_3_19_, data_in_3_18_, 
        data_in_3_17_, data_in_3_16_, data_in_3_15_, data_in_3_14_, 
        data_in_3_13_, data_in_3_12_, data_in_3_11_, data_in_3_10_, 
        data_in_3_9_, data_in_3_8_, data_in_3_7_, data_in_3_6_, data_in_3_5_, 
        data_in_3_4_, data_in_3_3_, data_in_3_2_, data_in_3_1_, data_in_3_0_
 );
  input [135:0] data_in_1;
  input [135:0] data_in_2;
  output [135:0] data_out;
  input mux_flag, clk, rst_n, data_in_3_33_, data_in_3_32_, data_in_3_31_,
         data_in_3_30_, data_in_3_29_, data_in_3_28_, data_in_3_27_,
         data_in_3_26_, data_in_3_25_, data_in_3_24_, data_in_3_23_,
         data_in_3_22_, data_in_3_21_, data_in_3_20_, data_in_3_19_,
         data_in_3_18_, data_in_3_17_, data_in_3_16_, data_in_3_15_,
         data_in_3_14_, data_in_3_13_, data_in_3_12_, data_in_3_11_,
         data_in_3_10_, data_in_3_9_, data_in_3_8_, data_in_3_7_, data_in_3_6_,
         data_in_3_5_, data_in_3_4_, data_in_3_3_, data_in_3_2_, data_in_3_1_,
         data_in_3_0_;
  wire   N6, N7, N8, n285, n762, n1302, n1303, n1304, n1305, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328,
         n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358,
         n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368,
         n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378,
         n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388,
         n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398,
         n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408,
         n1409, n1410, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423,
         n1424, n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433,
         n1434, n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443,
         n138, n139, n140, n141, n142, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n287, n1478, n1479, n1480, n1481, n1482, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1627, n1628, n1629, n1630,
         n1631, n1632, n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640,
         n1641, n1642, n1643, n1644, n1645;
  wire   [3:1] counter;

  DFFRHQX4 counter_reg_1_ ( .D(N6), .CK(clk), .RN(rst_n), .Q(counter[1]) );
  JKFFRX4 counter_reg_0_ ( .J(1'b1), .K(1'b1), .CK(clk), .RN(rst_n), .QN(n762)
         );
  DFFRHQX4 counter_reg_2_ ( .D(N7), .CK(clk), .RN(rst_n), .Q(counter[2]) );
  OAI21X4 U163 ( .A0(n1394), .A1(n1635), .B0(n223), .Y(data_out[2]) );
  OAI21X4 U183 ( .A0(n1421), .A1(n1639), .B0(n233), .Y(data_out[20]) );
  OAI21X4 U189 ( .A0(n1420), .A1(n1639), .B0(n236), .Y(data_out[18]) );
  OAI21X4 U191 ( .A0(n1432), .A1(n1639), .B0(n237), .Y(data_out[17]) );
  OAI21X4 U279 ( .A0(n1433), .A1(n1637), .B0(n281), .Y(data_out[0]) );
  TLATX1 R3_reg_33_ ( .G(n287), .D(data_in_3_33_), .QN(n1443) );
  TLATX1 R4_reg_33_ ( .G(n1630), .D(data_in_3_33_), .QN(n1442) );
  TLATX1 R2_reg_18_ ( .G(n1632), .D(data_in_3_18_), .QN(n1441) );
  TLATX1 R2_reg_17_ ( .G(n1632), .D(data_in_3_17_), .QN(n1440) );
  TLATX1 R4_reg_18_ ( .G(n1631), .D(data_in_3_18_), .QN(n1439) );
  TLATX1 R3_reg_1_ ( .G(n287), .D(data_in_3_1_), .QN(n1438) );
  TLATX1 R4_reg_17_ ( .G(n1630), .D(data_in_3_17_), .QN(n1437) );
  TLATX1 R4_reg_16_ ( .G(n1631), .D(data_in_3_16_), .QN(n1436) );
  TLATX1 R3_reg_16_ ( .G(n287), .D(data_in_3_16_), .QN(n1435) );
  TLATX1 R2_reg_1_ ( .G(n1632), .D(data_in_3_1_), .QN(n1434) );
  TLATX1 R1_reg_0_ ( .G(n1643), .D(data_in_3_0_), .QN(n1433) );
  TLATX1 R1_reg_17_ ( .G(n1643), .D(data_in_3_17_), .QN(n1432) );
  TLATX1 R2_reg_0_ ( .G(n1632), .D(data_in_3_0_), .QN(n1431) );
  TLATX1 R1_reg_1_ ( .G(n1643), .D(data_in_3_1_), .QN(n1430) );
  TLATX1 R2_reg_20_ ( .G(n1632), .D(data_in_3_20_), .QN(n1429) );
  TLATX1 R2_reg_33_ ( .G(n1632), .D(data_in_3_33_), .QN(n1428) );
  TLATX1 R1_reg_16_ ( .G(n1643), .D(data_in_3_16_), .QN(n1427) );
  TLATX1 R2_reg_16_ ( .G(n1632), .D(data_in_3_16_), .QN(n1426) );
  TLATX1 R3_reg_20_ ( .G(n287), .D(data_in_3_20_), .QN(n1425) );
  TLATX1 R4_reg_20_ ( .G(n1630), .D(data_in_3_20_), .QN(n1424) );
  TLATX1 R4_reg_1_ ( .G(n1631), .D(data_in_3_1_), .QN(n1423) );
  TLATX1 R3_reg_18_ ( .G(n287), .D(data_in_3_18_), .QN(n1422) );
  TLATX1 R1_reg_20_ ( .G(n1643), .D(data_in_3_20_), .QN(n1421) );
  TLATX1 R1_reg_18_ ( .G(n1643), .D(data_in_3_18_), .QN(n1420) );
  TLATX1 R3_reg_0_ ( .G(n287), .D(data_in_3_0_), .QN(n1418) );
  TLATX1 R4_reg_0_ ( .G(n1630), .D(data_in_3_0_), .QN(n1417) );
  TLATX1 R3_reg_17_ ( .G(n287), .D(data_in_3_17_), .QN(n1416) );
  TLATX1 R4_reg_19_ ( .G(n1631), .D(data_in_3_19_), .QN(n1396) );
  TLATX1 R4_reg_2_ ( .G(n1631), .D(data_in_3_2_), .QN(n1395) );
  TLATX1 R1_reg_2_ ( .G(n1644), .D(data_in_3_2_), .QN(n1394) );
  TLATX1 R1_reg_19_ ( .G(n1644), .D(data_in_3_19_), .QN(n1355) );
  TLATX1 R3_reg_19_ ( .G(n1628), .D(data_in_3_19_), .QN(n1346) );
  TLATX1 R3_reg_2_ ( .G(n1628), .D(data_in_3_2_), .QN(n1345) );
  TLATX1 R2_reg_19_ ( .G(n1632), .D(data_in_3_19_), .QN(n1311) );
  TLATX1 R2_reg_2_ ( .G(n1633), .D(data_in_3_2_), .QN(n1310) );
  TLATXL R3_reg_15_ ( .G(n1627), .D(data_in_3_15_), .QN(n1313) );
  TLATXL R1_reg_15_ ( .G(n1644), .D(data_in_3_15_), .QN(n1348) );
  TLATXL R4_reg_15_ ( .G(n1630), .D(data_in_3_15_), .QN(n1357) );
  TLATXL R2_reg_15_ ( .G(n1633), .D(data_in_3_15_), .QN(n1331) );
  TLATXL R1_reg_25_ ( .G(n1643), .D(data_in_3_25_), .QN(n1352) );
  TLATXL R1_reg_27_ ( .G(n1644), .D(data_in_3_27_), .QN(n1354) );
  TLATXL R1_reg_24_ ( .G(n1643), .D(data_in_3_24_), .QN(n1351) );
  TLATXL R1_reg_26_ ( .G(n1644), .D(data_in_3_26_), .QN(n1353) );
  TLATXL R1_reg_14_ ( .G(n285), .D(data_in_3_14_), .QN(n1347) );
  TLATXL R1_reg_32_ ( .G(n1643), .D(data_in_3_32_), .QN(n1409) );
  TLATXL R1_reg_31_ ( .G(n1643), .D(data_in_3_31_), .QN(n1408) );
  TLATXL R1_reg_30_ ( .G(n1643), .D(data_in_3_30_), .QN(n1407) );
  TLATXL R1_reg_28_ ( .G(n1643), .D(data_in_3_28_), .QN(n1406) );
  TLATXL R1_reg_6_ ( .G(n1644), .D(data_in_3_6_), .QN(n1389) );
  TLATXL R1_reg_29_ ( .G(n1643), .D(data_in_3_29_), .QN(n1410) );
  TLATXL R1_reg_13_ ( .G(n1644), .D(data_in_3_13_), .QN(n1404) );
  TLATXL R1_reg_33_ ( .G(n1643), .D(data_in_3_33_), .QN(n1419) );
  TLATXL R4_reg_29_ ( .G(n1630), .D(data_in_3_29_), .QN(n1366) );
  TLATXL R4_reg_28_ ( .G(n1630), .D(data_in_3_28_), .QN(n1365) );
  TLATXL R4_reg_27_ ( .G(n1630), .D(data_in_3_27_), .QN(n1364) );
  TLATXL R4_reg_26_ ( .G(n1630), .D(data_in_3_26_), .QN(n1363) );
  TLATXL R4_reg_25_ ( .G(n1630), .D(data_in_3_25_), .QN(n1362) );
  TLATXL R4_reg_24_ ( .G(n1630), .D(data_in_3_24_), .QN(n1361) );
  TLATXL R4_reg_23_ ( .G(n1630), .D(data_in_3_23_), .QN(n1360) );
  TLATXL R4_reg_22_ ( .G(n1630), .D(data_in_3_22_), .QN(n1359) );
  TLATXL R4_reg_21_ ( .G(n1630), .D(data_in_3_21_), .QN(n1358) );
  TLATXL R4_reg_14_ ( .G(n1630), .D(data_in_3_14_), .QN(n1356) );
  TLATXL R3_reg_27_ ( .G(n1627), .D(data_in_3_27_), .QN(n1319) );
  TLATXL R3_reg_25_ ( .G(n1627), .D(data_in_3_25_), .QN(n1318) );
  TLATXL R3_reg_24_ ( .G(n1627), .D(data_in_3_24_), .QN(n1317) );
  TLATXL R3_reg_23_ ( .G(n1627), .D(data_in_3_23_), .QN(n1316) );
  TLATXL R3_reg_22_ ( .G(n1627), .D(data_in_3_22_), .QN(n1315) );
  TLATXL R3_reg_21_ ( .G(n1627), .D(data_in_3_21_), .QN(n1314) );
  TLATXL R3_reg_14_ ( .G(n1627), .D(data_in_3_14_), .QN(n1312) );
  TLATXL R3_reg_31_ ( .G(n1627), .D(data_in_3_31_), .QN(n1309) );
  TLATXL R3_reg_29_ ( .G(n1627), .D(data_in_3_29_), .QN(n1308) );
  TLATXL R3_reg_26_ ( .G(n1627), .D(data_in_3_26_), .QN(n1307) );
  TLATXL R4_reg_3_ ( .G(n1630), .D(data_in_3_3_), .QN(n1304) );
  TLATXL R3_reg_3_ ( .G(n1627), .D(data_in_3_3_), .QN(n1302) );
  TLATXL R4_reg_13_ ( .G(n1631), .D(data_in_3_13_), .QN(n1400) );
  TLATXL R4_reg_12_ ( .G(n1630), .D(data_in_3_12_), .QN(n1399) );
  TLATXL R4_reg_11_ ( .G(n1631), .D(data_in_3_11_), .QN(n1398) );
  TLATXL R3_reg_13_ ( .G(n287), .D(data_in_3_13_), .QN(n1371) );
  TLATXL R3_reg_12_ ( .G(n287), .D(data_in_3_12_), .QN(n1370) );
  TLATXL R3_reg_11_ ( .G(n287), .D(data_in_3_11_), .QN(n1369) );
  TLATXL R1_reg_23_ ( .G(n285), .D(data_in_3_23_), .QN(n1350) );
  TLATXL R1_reg_22_ ( .G(n285), .D(data_in_3_22_), .QN(n1349) );
  TLATXL R1_reg_10_ ( .G(n285), .D(data_in_3_10_), .QN(n1344) );
  TLATXL R2_reg_7_ ( .G(n1632), .D(data_in_3_7_), .QN(n1323) );
  TLATXL R1_reg_3_ ( .G(n285), .D(data_in_3_3_), .QN(n1305) );
  TLATXL R2_reg_3_ ( .G(n1633), .D(data_in_3_3_), .QN(n1303) );
  TLATXL R1_reg_21_ ( .G(n1644), .D(data_in_3_21_), .QN(n1405) );
  TLATXL R1_reg_4_ ( .G(n1644), .D(data_in_3_4_), .QN(n1403) );
  TLATXL R1_reg_12_ ( .G(n1644), .D(data_in_3_12_), .QN(n1402) );
  TLATXL R1_reg_9_ ( .G(n1644), .D(data_in_3_9_), .QN(n1401) );
  TLATXL R4_reg_10_ ( .G(n1631), .D(data_in_3_10_), .QN(n1397) );
  TLATXL R1_reg_5_ ( .G(n1644), .D(data_in_3_5_), .QN(n1393) );
  TLATXL R1_reg_11_ ( .G(n1644), .D(data_in_3_11_), .QN(n1392) );
  TLATXL R1_reg_8_ ( .G(n1644), .D(data_in_3_8_), .QN(n1391) );
  TLATXL R1_reg_7_ ( .G(n1644), .D(data_in_3_7_), .QN(n1390) );
  TLATXL R4_reg_9_ ( .G(n1631), .D(data_in_3_9_), .QN(n1388) );
  TLATXL R4_reg_8_ ( .G(n1631), .D(data_in_3_8_), .QN(n1387) );
  TLATXL R4_reg_7_ ( .G(n1631), .D(data_in_3_7_), .QN(n1386) );
  TLATXL R4_reg_6_ ( .G(n1631), .D(data_in_3_6_), .QN(n1385) );
  TLATXL R4_reg_5_ ( .G(n1631), .D(data_in_3_5_), .QN(n1384) );
  TLATXL R4_reg_4_ ( .G(n1631), .D(data_in_3_4_), .QN(n1383) );
  TLATXL R2_reg_5_ ( .G(n1632), .D(data_in_3_5_), .QN(n1382) );
  TLATXL R2_reg_4_ ( .G(n1632), .D(data_in_3_4_), .QN(n1381) );
  TLATXL R4_reg_32_ ( .G(n1631), .D(data_in_3_32_), .QN(n1380) );
  TLATXL R4_reg_31_ ( .G(n1631), .D(data_in_3_31_), .QN(n1379) );
  TLATXL R2_reg_32_ ( .G(n1632), .D(data_in_3_32_), .QN(n1378) );
  TLATXL R2_reg_31_ ( .G(n1632), .D(data_in_3_31_), .QN(n1377) );
  TLATXL R2_reg_30_ ( .G(n1632), .D(data_in_3_30_), .QN(n1376) );
  TLATXL R3_reg_10_ ( .G(n1628), .D(data_in_3_10_), .QN(n1368) );
  TLATXL R4_reg_30_ ( .G(n1631), .D(data_in_3_30_), .QN(n1367) );
  TLATXL R3_reg_9_ ( .G(n1628), .D(data_in_3_9_), .QN(n1343) );
  TLATXL R3_reg_8_ ( .G(n1628), .D(data_in_3_8_), .QN(n1342) );
  TLATXL R3_reg_7_ ( .G(n1628), .D(data_in_3_7_), .QN(n1341) );
  TLATXL R3_reg_6_ ( .G(n1628), .D(data_in_3_6_), .QN(n1340) );
  TLATXL R3_reg_5_ ( .G(n1628), .D(data_in_3_5_), .QN(n1339) );
  TLATXL R3_reg_4_ ( .G(n1628), .D(data_in_3_4_), .QN(n1338) );
  TLATXL R3_reg_32_ ( .G(n1628), .D(data_in_3_32_), .QN(n1337) );
  TLATXL R2_reg_24_ ( .G(n1633), .D(data_in_3_24_), .QN(n1335) );
  TLATXL R3_reg_30_ ( .G(n1628), .D(data_in_3_30_), .QN(n1321) );
  TLATXL R3_reg_28_ ( .G(n1628), .D(data_in_3_28_), .QN(n1320) );
  TLATXL R2_reg_12_ ( .G(n1632), .D(data_in_3_12_), .QN(n1328) );
  TLATXL R2_reg_11_ ( .G(n1633), .D(data_in_3_11_), .QN(n1327) );
  TLATXL R2_reg_10_ ( .G(n1632), .D(data_in_3_10_), .QN(n1326) );
  TLATXL R2_reg_9_ ( .G(n1633), .D(data_in_3_9_), .QN(n1325) );
  TLATXL R2_reg_8_ ( .G(n1632), .D(data_in_3_8_), .QN(n1324) );
  TLATXL R2_reg_6_ ( .G(n1633), .D(data_in_3_6_), .QN(n1322) );
  TLATXL R2_reg_29_ ( .G(n1633), .D(data_in_3_29_), .QN(n1375) );
  TLATXL R2_reg_28_ ( .G(n1633), .D(data_in_3_28_), .QN(n1374) );
  TLATXL R2_reg_27_ ( .G(n1633), .D(data_in_3_27_), .QN(n1373) );
  TLATXL R2_reg_26_ ( .G(n1633), .D(data_in_3_26_), .QN(n1372) );
  TLATXL R2_reg_25_ ( .G(n1633), .D(data_in_3_25_), .QN(n1336) );
  TLATXL R2_reg_23_ ( .G(n1633), .D(data_in_3_23_), .QN(n1334) );
  TLATXL R2_reg_22_ ( .G(n1633), .D(data_in_3_22_), .QN(n1333) );
  TLATXL R2_reg_21_ ( .G(n1633), .D(data_in_3_21_), .QN(n1332) );
  TLATXL R2_reg_14_ ( .G(n1633), .D(data_in_3_14_), .QN(n1330) );
  TLATXL R2_reg_13_ ( .G(n1633), .D(data_in_3_13_), .QN(n1329) );
  DFFRHQX2 counter_reg_3_ ( .D(N8), .CK(clk), .RN(rst_n), .Q(counter[3]) );
  CLKINVX2 U4 ( .A(n1641), .Y(n1640) );
  INVX12 U5 ( .A(n1480), .Y(n1641) );
  INVX12 U6 ( .A(n1482), .Y(n1483) );
  INVX16 U7 ( .A(n1642), .Y(n1635) );
  INVX12 U8 ( .A(n1484), .Y(n1485) );
  CLKINVX2 U9 ( .A(n1480), .Y(n1642) );
  OAI21X1 U10 ( .A0(n1354), .A1(n1635), .B0(n226), .Y(data_out[27]) );
  OAI21X2 U11 ( .A0(n1402), .A1(n1639), .B0(n248), .Y(data_out[12]) );
  BUFX16 U12 ( .A(n146), .Y(n1488) );
  AOI22X1 U13 ( .A0(data_in_1[4]), .A1(n1489), .B0(data_in_2[4]), .B1(n1488), 
        .Y(n201) );
  AOI22XL U14 ( .A0(data_in_1[2]), .A1(n1489), .B0(data_in_2[2]), .B1(n1488), 
        .Y(n223) );
  AOI22X1 U15 ( .A0(data_in_1[3]), .A1(n1489), .B0(data_in_2[3]), .B1(n1488), 
        .Y(n212) );
  AOI22X1 U16 ( .A0(data_in_1[8]), .A1(n1489), .B0(data_in_2[8]), .B1(n1488), 
        .Y(n157) );
  NAND2X1 U17 ( .A(n1490), .B(n144), .Y(data_out[9]) );
  AOI22X1 U18 ( .A0(data_in_1[18]), .A1(n1489), .B0(data_in_2[18]), .B1(n1488), 
        .Y(n236) );
  OAI21X1 U19 ( .A0(n1408), .A1(n1638), .B0(n221), .Y(data_out[31]) );
  OR2X2 U20 ( .A(n1430), .B(n1639), .Y(n1481) );
  OAI21X2 U21 ( .A0(n1390), .A1(n1635), .B0(n168), .Y(data_out[7]) );
  AOI22X1 U22 ( .A0(data_in_1[7]), .A1(n1489), .B0(data_in_2[7]), .B1(n1488), 
        .Y(n168) );
  OAI21X2 U23 ( .A0(n1351), .A1(n1635), .B0(n229), .Y(data_out[24]) );
  AOI22X1 U24 ( .A0(data_in_1[0]), .A1(n1489), .B0(data_in_2[0]), .B1(n1488), 
        .Y(n281) );
  AOI22X1 U25 ( .A0(data_in_1[17]), .A1(n1489), .B0(data_in_2[17]), .B1(n1488), 
        .Y(n237) );
  CLKINVX3 U26 ( .A(counter[2]), .Y(n141) );
  INVX4 U27 ( .A(counter[3]), .Y(n140) );
  INVX8 U28 ( .A(n1641), .Y(n1639) );
  OR2X2 U29 ( .A(n762), .B(n142), .Y(n1478) );
  OR3XL U30 ( .A(n140), .B(n138), .C(n141), .Y(n1479) );
  INVX4 U31 ( .A(n1642), .Y(n1637) );
  NAND4X4 U32 ( .A(n762), .B(counter[1]), .C(n141), .D(n140), .Y(n1480) );
  NAND2X4 U33 ( .A(n1481), .B(n234), .Y(data_out[1]) );
  AOI22X1 U34 ( .A0(data_in_1[1]), .A1(n1489), .B0(data_in_2[1]), .B1(n1488), 
        .Y(n234) );
  INVXL U35 ( .A(n1488), .Y(n1482) );
  OAI21X4 U36 ( .A0(n1389), .A1(n1635), .B0(n179), .Y(data_out[6]) );
  INVXL U37 ( .A(n1489), .Y(n1484) );
  BUFX16 U38 ( .A(n145), .Y(n1489) );
  NOR2XL U39 ( .A(n1355), .B(n1639), .Y(n1486) );
  INVX2 U40 ( .A(n235), .Y(n1487) );
  OR2X4 U41 ( .A(n1486), .B(n1487), .Y(data_out[19]) );
  NOR2BX2 U42 ( .AN(n1480), .B(mux_flag), .Y(n146) );
  AND2X1 U43 ( .A(mux_flag), .B(n1480), .Y(n145) );
  OR2X2 U44 ( .A(n1401), .B(n1637), .Y(n1490) );
  AOI22XL U45 ( .A0(data_in_1[9]), .A1(n1489), .B0(data_in_2[9]), .B1(n1488), 
        .Y(n144) );
  INVXL U46 ( .A(n1641), .Y(n1636) );
  AOI22XL U47 ( .A0(data_in_1[19]), .A1(n1489), .B0(data_in_2[19]), .B1(n1488), 
        .Y(n235) );
  AOI22X1 U48 ( .A0(data_in_1[23]), .A1(n1489), .B0(data_in_2[23]), .B1(n1488), 
        .Y(n230) );
  AOI22X1 U49 ( .A0(data_in_1[21]), .A1(n1489), .B0(data_in_2[21]), .B1(n1488), 
        .Y(n232) );
  AOI22X1 U50 ( .A0(data_in_1[12]), .A1(n1485), .B0(data_in_2[12]), .B1(n1483), 
        .Y(n248) );
  OAI21X4 U51 ( .A0(n1403), .A1(n1639), .B0(n201), .Y(data_out[4]) );
  OAI21X4 U52 ( .A0(n1305), .A1(n1637), .B0(n212), .Y(data_out[3]) );
  OAI21X4 U53 ( .A0(n1405), .A1(n1639), .B0(n232), .Y(data_out[21]) );
  OAI21X4 U54 ( .A0(n1393), .A1(n1639), .B0(n190), .Y(data_out[5]) );
  OAI21X4 U55 ( .A0(n1349), .A1(n1639), .B0(n231), .Y(data_out[22]) );
  AOI22XL U56 ( .A0(data_in_1[22]), .A1(n1489), .B0(data_in_2[22]), .B1(n1488), 
        .Y(n231) );
  OAI21X4 U57 ( .A0(n1350), .A1(n1639), .B0(n230), .Y(data_out[23]) );
  AOI22XL U58 ( .A0(data_in_1[20]), .A1(n1489), .B0(data_in_2[20]), .B1(n1488), 
        .Y(n233) );
  AOI22XL U59 ( .A0(data_in_1[24]), .A1(n1489), .B0(data_in_2[24]), .B1(n1488), 
        .Y(n229) );
  AOI22XL U60 ( .A0(data_in_1[28]), .A1(n1489), .B0(data_in_2[28]), .B1(n1488), 
        .Y(n225) );
  AOI22XL U61 ( .A0(data_in_1[27]), .A1(n1489), .B0(data_in_2[27]), .B1(n1488), 
        .Y(n226) );
  AOI22XL U62 ( .A0(data_in_1[25]), .A1(n1489), .B0(data_in_2[25]), .B1(n1488), 
        .Y(n228) );
  OAI21X4 U63 ( .A0(n1344), .A1(n1640), .B0(n270), .Y(data_out[10]) );
  AOI22XL U64 ( .A0(data_in_1[10]), .A1(n1489), .B0(data_in_2[10]), .B1(n1488), 
        .Y(n270) );
  OAI21X1 U65 ( .A0(n1353), .A1(n1635), .B0(n227), .Y(data_out[26]) );
  AOI22XL U66 ( .A0(data_in_1[26]), .A1(n1489), .B0(data_in_2[26]), .B1(n1488), 
        .Y(n227) );
  OAI21X4 U67 ( .A0(n1391), .A1(n1638), .B0(n157), .Y(data_out[8]) );
  OAI21X4 U68 ( .A0(n1392), .A1(n1640), .B0(n259), .Y(data_out[11]) );
  AOI22X2 U69 ( .A0(data_in_1[11]), .A1(n1485), .B0(data_in_2[11]), .B1(n1483), 
        .Y(n259) );
  AOI22XL U70 ( .A0(data_in_1[30]), .A1(n1485), .B0(data_in_2[30]), .B1(n1483), 
        .Y(n222) );
  OAI21X1 U71 ( .A0(n1404), .A1(n1639), .B0(n241), .Y(data_out[13]) );
  AOI22XL U72 ( .A0(data_in_1[29]), .A1(n1489), .B0(data_in_2[29]), .B1(n1488), 
        .Y(n224) );
  AOI22XL U73 ( .A0(data_in_1[32]), .A1(n1485), .B0(data_in_2[32]), .B1(n1483), 
        .Y(n220) );
  AOI22XL U74 ( .A0(data_in_1[31]), .A1(n1485), .B0(data_in_2[31]), .B1(n1483), 
        .Y(n221) );
  AOI22XL U75 ( .A0(data_in_1[15]), .A1(n1485), .B0(data_in_2[15]), .B1(n1483), 
        .Y(n239) );
  OAI21X1 U76 ( .A0(n1347), .A1(n1639), .B0(n240), .Y(data_out[14]) );
  OAI21X1 U77 ( .A0(n1427), .A1(n1639), .B0(n238), .Y(data_out[16]) );
  AOI22XL U78 ( .A0(data_in_1[16]), .A1(n1485), .B0(data_in_2[16]), .B1(n1483), 
        .Y(n238) );
  OAI21X1 U79 ( .A0(n1419), .A1(n1638), .B0(n219), .Y(data_out[33]) );
  AOI22XL U80 ( .A0(data_in_1[33]), .A1(n1485), .B0(data_in_2[33]), .B1(n1483), 
        .Y(n219) );
  NOR2XL U81 ( .A(n139), .B(n762), .Y(n283) );
  INVXL U82 ( .A(counter[1]), .Y(n139) );
  NAND2XL U83 ( .A(counter[2]), .B(n283), .Y(n282) );
  XNOR2XL U84 ( .A(counter[1]), .B(n762), .Y(N6) );
  AOI22XL U85 ( .A0(data_in_1[34]), .A1(n1485), .B0(data_in_2[34]), .B1(n1483), 
        .Y(n218) );
  AOI22XL U86 ( .A0(data_in_1[35]), .A1(n1485), .B0(data_in_2[35]), .B1(n1483), 
        .Y(n217) );
  AOI22XL U87 ( .A0(data_in_1[108]), .A1(n1485), .B0(data_in_2[108]), .B1(
        n1483), .Y(n272) );
  AOI22XL U88 ( .A0(data_in_1[109]), .A1(n1485), .B0(data_in_2[109]), .B1(
        n1483), .Y(n271) );
  AOI22XL U89 ( .A0(data_in_1[110]), .A1(n1485), .B0(data_in_2[110]), .B1(
        n1483), .Y(n269) );
  AOI22XL U90 ( .A0(data_in_1[111]), .A1(n1485), .B0(data_in_2[111]), .B1(
        n1483), .Y(n268) );
  AOI22XL U91 ( .A0(data_in_1[112]), .A1(n1485), .B0(data_in_2[112]), .B1(
        n1483), .Y(n267) );
  AOI22XL U92 ( .A0(data_in_1[113]), .A1(n1485), .B0(data_in_2[113]), .B1(
        n1483), .Y(n266) );
  AOI22XL U93 ( .A0(data_in_1[114]), .A1(n1485), .B0(data_in_2[114]), .B1(
        n1483), .Y(n265) );
  AOI22XL U94 ( .A0(data_in_1[115]), .A1(n1485), .B0(data_in_2[115]), .B1(
        n1483), .Y(n264) );
  AOI22XL U95 ( .A0(data_in_1[116]), .A1(n1485), .B0(data_in_2[116]), .B1(
        n1483), .Y(n263) );
  AOI22XL U96 ( .A0(data_in_1[117]), .A1(n1485), .B0(data_in_2[117]), .B1(
        n1483), .Y(n262) );
  AOI22XL U97 ( .A0(data_in_1[118]), .A1(n1485), .B0(data_in_2[118]), .B1(
        n1483), .Y(n261) );
  AOI22XL U98 ( .A0(data_in_1[37]), .A1(n1485), .B0(data_in_2[37]), .B1(n1483), 
        .Y(n215) );
  AOI22XL U99 ( .A0(data_in_1[38]), .A1(n1485), .B0(data_in_2[38]), .B1(n1483), 
        .Y(n214) );
  AOI22XL U100 ( .A0(data_in_1[39]), .A1(n1485), .B0(data_in_2[39]), .B1(n1483), .Y(n213) );
  AOI22XL U101 ( .A0(data_in_1[40]), .A1(n1485), .B0(data_in_2[40]), .B1(n1483), .Y(n211) );
  AOI22XL U102 ( .A0(data_in_1[41]), .A1(n1485), .B0(data_in_2[41]), .B1(n1483), .Y(n210) );
  AOI22XL U103 ( .A0(data_in_1[42]), .A1(n1485), .B0(data_in_2[42]), .B1(n1483), .Y(n209) );
  AOI22XL U104 ( .A0(data_in_1[43]), .A1(n1485), .B0(data_in_2[43]), .B1(n1483), .Y(n208) );
  AOI22XL U105 ( .A0(data_in_1[44]), .A1(n1485), .B0(data_in_2[44]), .B1(n1483), .Y(n207) );
  AOI22XL U106 ( .A0(data_in_1[45]), .A1(n1485), .B0(data_in_2[45]), .B1(n1483), .Y(n206) );
  AOI22XL U107 ( .A0(data_in_1[46]), .A1(n1485), .B0(data_in_2[46]), .B1(n1483), .Y(n205) );
  AOI22XL U108 ( .A0(data_in_1[47]), .A1(n1485), .B0(data_in_2[47]), .B1(n1483), .Y(n204) );
  AOI22XL U109 ( .A0(data_in_1[48]), .A1(n1485), .B0(data_in_2[48]), .B1(n1483), .Y(n203) );
  AOI22XL U110 ( .A0(data_in_1[49]), .A1(n1485), .B0(data_in_2[49]), .B1(n1483), .Y(n202) );
  AOI22XL U111 ( .A0(data_in_1[50]), .A1(n1485), .B0(data_in_2[50]), .B1(n1483), .Y(n200) );
  AOI22XL U112 ( .A0(data_in_1[53]), .A1(n1485), .B0(data_in_2[53]), .B1(n1483), .Y(n197) );
  AOI22XL U113 ( .A0(data_in_1[54]), .A1(n1485), .B0(data_in_2[54]), .B1(n1483), .Y(n196) );
  AOI22XL U114 ( .A0(data_in_1[55]), .A1(n1485), .B0(data_in_2[55]), .B1(n1483), .Y(n195) );
  AOI22XL U115 ( .A0(data_in_1[56]), .A1(n1485), .B0(data_in_2[56]), .B1(n1483), .Y(n194) );
  AOI22XL U116 ( .A0(data_in_1[57]), .A1(n1485), .B0(data_in_2[57]), .B1(n1483), .Y(n193) );
  AOI22XL U117 ( .A0(data_in_1[58]), .A1(n1485), .B0(data_in_2[58]), .B1(n1483), .Y(n192) );
  AOI22XL U118 ( .A0(data_in_1[59]), .A1(n1485), .B0(data_in_2[59]), .B1(n1483), .Y(n191) );
  AOI22XL U119 ( .A0(data_in_1[65]), .A1(n1485), .B0(data_in_2[65]), .B1(n1483), .Y(n184) );
  AOI22XL U120 ( .A0(data_in_1[84]), .A1(n1485), .B0(data_in_2[84]), .B1(n1483), .Y(n163) );
  AOI22XL U121 ( .A0(data_in_1[88]), .A1(n1485), .B0(data_in_2[88]), .B1(n1483), .Y(n159) );
  AOI22XL U122 ( .A0(data_in_1[89]), .A1(n1485), .B0(data_in_2[89]), .B1(n1483), .Y(n158) );
  AOI22XL U123 ( .A0(data_in_1[91]), .A1(n1485), .B0(data_in_2[91]), .B1(n1483), .Y(n155) );
  AOI22XL U124 ( .A0(data_in_1[92]), .A1(n1485), .B0(data_in_2[92]), .B1(n1483), .Y(n154) );
  AOI22XL U125 ( .A0(data_in_1[93]), .A1(n1485), .B0(data_in_2[93]), .B1(n1483), .Y(n153) );
  AOI22XL U126 ( .A0(data_in_1[94]), .A1(n1485), .B0(data_in_2[94]), .B1(n1483), .Y(n152) );
  AOI22XL U127 ( .A0(data_in_1[96]), .A1(n1485), .B0(data_in_2[96]), .B1(n1483), .Y(n150) );
  AOI22XL U128 ( .A0(data_in_1[97]), .A1(n1485), .B0(data_in_2[97]), .B1(n1483), .Y(n149) );
  AOI22XL U129 ( .A0(data_in_1[98]), .A1(n1485), .B0(data_in_2[98]), .B1(n1483), .Y(n148) );
  AOI22XL U130 ( .A0(data_in_1[99]), .A1(n1485), .B0(data_in_2[99]), .B1(n1483), .Y(n147) );
  AOI22XL U131 ( .A0(data_in_1[122]), .A1(n1485), .B0(data_in_2[122]), .B1(
        n1483), .Y(n256) );
  AOI22XL U132 ( .A0(data_in_1[123]), .A1(n1485), .B0(data_in_2[123]), .B1(
        n1483), .Y(n255) );
  AOI22XL U133 ( .A0(data_in_1[124]), .A1(n1485), .B0(data_in_2[124]), .B1(
        n1483), .Y(n254) );
  AOI22XL U134 ( .A0(data_in_1[125]), .A1(n1485), .B0(data_in_2[125]), .B1(
        n1483), .Y(n253) );
  AOI22XL U135 ( .A0(data_in_1[126]), .A1(n1485), .B0(data_in_2[126]), .B1(
        n1483), .Y(n252) );
  AOI22XL U136 ( .A0(data_in_1[127]), .A1(n1485), .B0(data_in_2[127]), .B1(
        n1483), .Y(n251) );
  AOI22XL U137 ( .A0(data_in_1[128]), .A1(n1485), .B0(data_in_2[128]), .B1(
        n1483), .Y(n250) );
  AOI22XL U138 ( .A0(data_in_1[129]), .A1(n1485), .B0(data_in_2[129]), .B1(
        n1483), .Y(n249) );
  AOI22XL U139 ( .A0(data_in_1[130]), .A1(n1485), .B0(data_in_2[130]), .B1(
        n1483), .Y(n247) );
  AOI22XL U140 ( .A0(data_in_1[131]), .A1(n1485), .B0(data_in_2[131]), .B1(
        n1483), .Y(n246) );
  AOI22XL U141 ( .A0(data_in_1[132]), .A1(n1485), .B0(data_in_2[132]), .B1(
        n1483), .Y(n245) );
  AOI22XL U142 ( .A0(data_in_1[133]), .A1(n1485), .B0(data_in_2[133]), .B1(
        n1483), .Y(n244) );
  AOI22XL U143 ( .A0(data_in_1[68]), .A1(n1485), .B0(data_in_2[68]), .B1(n1483), .Y(n181) );
  AOI22XL U144 ( .A0(data_in_1[71]), .A1(n1485), .B0(data_in_2[71]), .B1(n1483), .Y(n177) );
  AOI22XL U145 ( .A0(data_in_1[72]), .A1(n1485), .B0(data_in_2[72]), .B1(n1483), .Y(n176) );
  AOI22XL U146 ( .A0(data_in_1[73]), .A1(n1485), .B0(data_in_2[73]), .B1(n1483), .Y(n175) );
  AOI22XL U147 ( .A0(data_in_1[74]), .A1(n1485), .B0(data_in_2[74]), .B1(n1483), .Y(n174) );
  AOI22XL U148 ( .A0(data_in_1[75]), .A1(n1485), .B0(data_in_2[75]), .B1(n1483), .Y(n173) );
  AOI22XL U149 ( .A0(data_in_1[76]), .A1(n1485), .B0(data_in_2[76]), .B1(n1483), .Y(n172) );
  AOI22XL U150 ( .A0(data_in_1[77]), .A1(n1485), .B0(data_in_2[77]), .B1(n1483), .Y(n171) );
  AOI22XL U151 ( .A0(data_in_1[78]), .A1(n1485), .B0(data_in_2[78]), .B1(n1483), .Y(n170) );
  AOI22XL U152 ( .A0(data_in_1[79]), .A1(n1485), .B0(data_in_2[79]), .B1(n1483), .Y(n169) );
  AOI22XL U153 ( .A0(data_in_1[80]), .A1(n1485), .B0(data_in_2[80]), .B1(n1483), .Y(n167) );
  AOI22XL U154 ( .A0(data_in_1[81]), .A1(n1485), .B0(data_in_2[81]), .B1(n1483), .Y(n166) );
  AOI22XL U155 ( .A0(data_in_1[82]), .A1(n1485), .B0(data_in_2[82]), .B1(n1483), .Y(n165) );
  AOI22XL U156 ( .A0(data_in_1[83]), .A1(n1485), .B0(data_in_2[83]), .B1(n1483), .Y(n164) );
  AOI22XL U157 ( .A0(data_in_1[85]), .A1(n1485), .B0(data_in_2[85]), .B1(n1483), .Y(n162) );
  AOI22XL U158 ( .A0(data_in_1[87]), .A1(n1485), .B0(data_in_2[87]), .B1(n1483), .Y(n160) );
  AOI22XL U159 ( .A0(data_in_1[90]), .A1(n1485), .B0(data_in_2[90]), .B1(n1483), .Y(n156) );
  AOI22XL U160 ( .A0(data_in_1[95]), .A1(n1485), .B0(data_in_2[95]), .B1(n1483), .Y(n151) );
  AOI22XL U161 ( .A0(data_in_1[60]), .A1(n1485), .B0(data_in_2[60]), .B1(n1483), .Y(n189) );
  AOI22XL U162 ( .A0(data_in_1[61]), .A1(n1485), .B0(data_in_2[61]), .B1(n1483), .Y(n188) );
  AOI22XL U164 ( .A0(data_in_1[62]), .A1(n1485), .B0(data_in_2[62]), .B1(n1483), .Y(n187) );
  AOI22XL U165 ( .A0(data_in_1[63]), .A1(n1485), .B0(data_in_2[63]), .B1(n1483), .Y(n186) );
  AOI22XL U166 ( .A0(data_in_1[64]), .A1(n1485), .B0(data_in_2[64]), .B1(n1483), .Y(n185) );
  AOI22XL U167 ( .A0(data_in_1[66]), .A1(n1485), .B0(data_in_2[66]), .B1(n1483), .Y(n183) );
  AOI22XL U168 ( .A0(data_in_1[51]), .A1(n1485), .B0(data_in_2[51]), .B1(n1483), .Y(n199) );
  AOI22XL U169 ( .A0(data_in_1[134]), .A1(n1485), .B0(data_in_2[134]), .B1(
        n1483), .Y(n243) );
  AOI22XL U170 ( .A0(data_in_1[104]), .A1(n1485), .B0(data_in_2[104]), .B1(
        n1483), .Y(n276) );
  AOI22XL U171 ( .A0(data_in_1[119]), .A1(n1485), .B0(data_in_2[119]), .B1(
        n1483), .Y(n260) );
  AOI22XL U172 ( .A0(data_in_1[120]), .A1(n1485), .B0(data_in_2[120]), .B1(
        n1483), .Y(n258) );
  AOI22XL U173 ( .A0(data_in_1[121]), .A1(n1485), .B0(data_in_2[121]), .B1(
        n1483), .Y(n257) );
  AOI22XL U174 ( .A0(data_in_1[135]), .A1(n1485), .B0(data_in_2[135]), .B1(
        n1483), .Y(n242) );
  AOI22XL U175 ( .A0(data_in_1[69]), .A1(n1485), .B0(data_in_2[69]), .B1(n1483), .Y(n180) );
  AOI22XL U176 ( .A0(data_in_1[70]), .A1(n1485), .B0(data_in_2[70]), .B1(n1483), .Y(n178) );
  AOI22XL U177 ( .A0(data_in_1[86]), .A1(n1485), .B0(data_in_2[86]), .B1(n1483), .Y(n161) );
  AOI22XL U178 ( .A0(data_in_1[101]), .A1(n1485), .B0(data_in_2[101]), .B1(
        n1483), .Y(n279) );
  AOI22XL U179 ( .A0(data_in_1[36]), .A1(n1485), .B0(data_in_2[36]), .B1(n1483), .Y(n216) );
  AOI22XL U180 ( .A0(data_in_1[52]), .A1(n1485), .B0(data_in_2[52]), .B1(n1483), .Y(n198) );
  AOI22XL U181 ( .A0(data_in_1[67]), .A1(n1485), .B0(data_in_2[67]), .B1(n1483), .Y(n182) );
  AOI22XL U182 ( .A0(data_in_1[102]), .A1(n1485), .B0(data_in_2[102]), .B1(
        n1483), .Y(n278) );
  AOI22XL U184 ( .A0(data_in_1[103]), .A1(n1485), .B0(data_in_2[103]), .B1(
        n1483), .Y(n277) );
  AOI22XL U185 ( .A0(data_in_1[105]), .A1(n1485), .B0(data_in_2[105]), .B1(
        n1483), .Y(n275) );
  AOI22XL U186 ( .A0(data_in_1[106]), .A1(n1485), .B0(data_in_2[106]), .B1(
        n1483), .Y(n274) );
  AOI22XL U187 ( .A0(data_in_1[107]), .A1(n1485), .B0(data_in_2[107]), .B1(
        n1483), .Y(n273) );
  AOI22XL U188 ( .A0(data_in_1[100]), .A1(n1485), .B0(data_in_2[100]), .B1(
        n1483), .Y(n280) );
  NOR4BXL U190 ( .AN(n762), .B(n140), .C(n141), .D(n139), .Y(n285) );
  AOI22XL U192 ( .A0(data_in_1[13]), .A1(n1489), .B0(data_in_2[13]), .B1(n1488), .Y(n241) );
  AOI22XL U193 ( .A0(data_in_1[14]), .A1(n1485), .B0(data_in_2[14]), .B1(n1483), .Y(n240) );
  INVX1 U194 ( .A(n1479), .Y(n1633) );
  INVX1 U195 ( .A(n1641), .Y(n1638) );
  INVX1 U196 ( .A(n1641), .Y(n1634) );
  INVX1 U197 ( .A(n1629), .Y(n1628) );
  INVX1 U198 ( .A(n1478), .Y(n1631) );
  INVX1 U199 ( .A(n1645), .Y(n1644) );
  INVX1 U200 ( .A(n1479), .Y(n1632) );
  INVX1 U201 ( .A(n283), .Y(n138) );
  NAND3X1 U202 ( .A(n141), .B(n140), .C(n139), .Y(n142) );
  INVX1 U203 ( .A(n1629), .Y(n1627) );
  INVX1 U204 ( .A(n287), .Y(n1629) );
  INVX1 U205 ( .A(n1478), .Y(n1630) );
  INVX1 U206 ( .A(n1645), .Y(n1643) );
  INVX1 U207 ( .A(n285), .Y(n1645) );
  AOI22X1 U208 ( .A0(data_in_1[6]), .A1(n1489), .B0(data_in_2[6]), .B1(n1488), 
        .Y(n179) );
  AOI22X1 U209 ( .A0(data_in_1[5]), .A1(n1489), .B0(data_in_2[5]), .B1(n1488), 
        .Y(n190) );
  OAI21X2 U210 ( .A0(n1352), .A1(n1635), .B0(n228), .Y(data_out[25]) );
  OAI21X2 U211 ( .A0(n1406), .A1(n1635), .B0(n225), .Y(data_out[28]) );
  OAI21X2 U212 ( .A0(n1410), .A1(n1638), .B0(n224), .Y(data_out[29]) );
  OAI21X2 U213 ( .A0(n1407), .A1(n1638), .B0(n222), .Y(data_out[30]) );
  OAI21X2 U214 ( .A0(n1409), .A1(n1638), .B0(n220), .Y(data_out[32]) );
  OAI21X2 U215 ( .A0(n1348), .A1(n1639), .B0(n239), .Y(data_out[15]) );
  XNOR2X1 U216 ( .A(counter[2]), .B(n138), .Y(N7) );
  XNOR2X1 U217 ( .A(counter[3]), .B(n282), .Y(N8) );
  OAI21XL U218 ( .A0(n1417), .A1(n1634), .B0(n278), .Y(data_out[102]) );
  OAI21XL U219 ( .A0(n1423), .A1(n1639), .B0(n277), .Y(data_out[103]) );
  OAI21XL U220 ( .A0(n1304), .A1(n1634), .B0(n275), .Y(data_out[105]) );
  OAI21XL U221 ( .A0(n1383), .A1(n1639), .B0(n274), .Y(data_out[106]) );
  OAI21XL U222 ( .A0(n1384), .A1(n1637), .B0(n273), .Y(data_out[107]) );
  OAI21XL U223 ( .A0(n1337), .A1(n1639), .B0(n280), .Y(data_out[100]) );
  OAI21XL U224 ( .A0(n1435), .A1(n1634), .B0(n163), .Y(data_out[84]) );
  OAI21XL U225 ( .A0(n1425), .A1(n1634), .B0(n159), .Y(data_out[88]) );
  OAI21XL U226 ( .A0(n1314), .A1(n1634), .B0(n158), .Y(data_out[89]) );
  OAI21XL U227 ( .A0(n1316), .A1(n1634), .B0(n155), .Y(data_out[91]) );
  OAI21XL U228 ( .A0(n1317), .A1(n1634), .B0(n154), .Y(data_out[92]) );
  OAI21XL U229 ( .A0(n1318), .A1(n1634), .B0(n153), .Y(data_out[93]) );
  OAI21XL U230 ( .A0(n1307), .A1(n1634), .B0(n152), .Y(data_out[94]) );
  OAI21XL U231 ( .A0(n1320), .A1(n1634), .B0(n150), .Y(data_out[96]) );
  OAI21XL U232 ( .A0(n1308), .A1(n1634), .B0(n149), .Y(data_out[97]) );
  OAI21XL U233 ( .A0(n1321), .A1(n1634), .B0(n148), .Y(data_out[98]) );
  OAI21XL U234 ( .A0(n1309), .A1(n1634), .B0(n147), .Y(data_out[99]) );
  OAI21XL U235 ( .A0(n1634), .A1(n1440), .B0(n199), .Y(data_out[51]) );
  OAI21XL U236 ( .A0(n1385), .A1(n1640), .B0(n272), .Y(data_out[108]) );
  OAI21XL U237 ( .A0(n1386), .A1(n1640), .B0(n271), .Y(data_out[109]) );
  OAI21XL U238 ( .A0(n1387), .A1(n1640), .B0(n269), .Y(data_out[110]) );
  OAI21XL U239 ( .A0(n1388), .A1(n1640), .B0(n268), .Y(data_out[111]) );
  OAI21XL U240 ( .A0(n1397), .A1(n1640), .B0(n267), .Y(data_out[112]) );
  OAI21XL U241 ( .A0(n1398), .A1(n1640), .B0(n266), .Y(data_out[113]) );
  OAI21XL U242 ( .A0(n1399), .A1(n1640), .B0(n265), .Y(data_out[114]) );
  OAI21XL U243 ( .A0(n1400), .A1(n1640), .B0(n264), .Y(data_out[115]) );
  OAI21XL U244 ( .A0(n1356), .A1(n1640), .B0(n263), .Y(data_out[116]) );
  OAI21XL U245 ( .A0(n1357), .A1(n1640), .B0(n262), .Y(data_out[117]) );
  OAI21XL U246 ( .A0(n1436), .A1(n1640), .B0(n261), .Y(data_out[118]) );
  OAI21XL U247 ( .A0(n1424), .A1(n1639), .B0(n256), .Y(data_out[122]) );
  OAI21XL U248 ( .A0(n1358), .A1(n1639), .B0(n255), .Y(data_out[123]) );
  OAI21XL U249 ( .A0(n1359), .A1(n1639), .B0(n254), .Y(data_out[124]) );
  OAI21XL U250 ( .A0(n1360), .A1(n1639), .B0(n253), .Y(data_out[125]) );
  OAI21XL U251 ( .A0(n1361), .A1(n1639), .B0(n252), .Y(data_out[126]) );
  OAI21XL U252 ( .A0(n1362), .A1(n1639), .B0(n251), .Y(data_out[127]) );
  OAI21XL U253 ( .A0(n1363), .A1(n1639), .B0(n250), .Y(data_out[128]) );
  OAI21XL U254 ( .A0(n1364), .A1(n1639), .B0(n249), .Y(data_out[129]) );
  OAI21XL U255 ( .A0(n1365), .A1(n1639), .B0(n247), .Y(data_out[130]) );
  OAI21XL U256 ( .A0(n1366), .A1(n1639), .B0(n246), .Y(data_out[131]) );
  OAI21XL U257 ( .A0(n1367), .A1(n1639), .B0(n245), .Y(data_out[132]) );
  OAI21XL U258 ( .A0(n1379), .A1(n1639), .B0(n244), .Y(data_out[133]) );
  OAI21XL U259 ( .A0(n1380), .A1(n1639), .B0(n243), .Y(data_out[134]) );
  OAI21XL U260 ( .A0(n1418), .A1(n1635), .B0(n181), .Y(data_out[68]) );
  OAI21XL U261 ( .A0(n1302), .A1(n1635), .B0(n177), .Y(data_out[71]) );
  OAI21XL U262 ( .A0(n1338), .A1(n1635), .B0(n176), .Y(data_out[72]) );
  OAI21XL U263 ( .A0(n1339), .A1(n1635), .B0(n175), .Y(data_out[73]) );
  OAI21XL U264 ( .A0(n1340), .A1(n1638), .B0(n174), .Y(data_out[74]) );
  OAI21XL U265 ( .A0(n1341), .A1(n1638), .B0(n173), .Y(data_out[75]) );
  OAI21XL U266 ( .A0(n1342), .A1(n1638), .B0(n172), .Y(data_out[76]) );
  OAI21XL U267 ( .A0(n1343), .A1(n1635), .B0(n171), .Y(data_out[77]) );
  OAI21XL U268 ( .A0(n1368), .A1(n1638), .B0(n170), .Y(data_out[78]) );
  OAI21XL U269 ( .A0(n1369), .A1(n1638), .B0(n169), .Y(data_out[79]) );
  OAI21XL U270 ( .A0(n1370), .A1(n1640), .B0(n167), .Y(data_out[80]) );
  OAI21XL U271 ( .A0(n1371), .A1(n1638), .B0(n166), .Y(data_out[81]) );
  OAI21XL U272 ( .A0(n1312), .A1(n1635), .B0(n165), .Y(data_out[82]) );
  OAI21XL U273 ( .A0(n1313), .A1(n1635), .B0(n164), .Y(data_out[83]) );
  OAI21XL U274 ( .A0(n1416), .A1(n1635), .B0(n162), .Y(data_out[85]) );
  OAI21XL U275 ( .A0(n1346), .A1(n1635), .B0(n160), .Y(data_out[87]) );
  OAI21XL U276 ( .A0(n1315), .A1(n1635), .B0(n156), .Y(data_out[90]) );
  OAI21XL U277 ( .A0(n1319), .A1(n1640), .B0(n151), .Y(data_out[95]) );
  OAI21XL U278 ( .A0(n1431), .A1(n1638), .B0(n218), .Y(data_out[34]) );
  OAI21XL U280 ( .A0(n1434), .A1(n1638), .B0(n217), .Y(data_out[35]) );
  OAI21XL U281 ( .A0(n1303), .A1(n1637), .B0(n215), .Y(data_out[37]) );
  OAI21XL U282 ( .A0(n1381), .A1(n1637), .B0(n214), .Y(data_out[38]) );
  OAI21XL U283 ( .A0(n1382), .A1(n1637), .B0(n213), .Y(data_out[39]) );
  OAI21XL U284 ( .A0(n1322), .A1(n1637), .B0(n211), .Y(data_out[40]) );
  OAI21XL U285 ( .A0(n1323), .A1(n1637), .B0(n210), .Y(data_out[41]) );
  OAI21XL U286 ( .A0(n1324), .A1(n1637), .B0(n209), .Y(data_out[42]) );
  OAI21XL U287 ( .A0(n1325), .A1(n1637), .B0(n208), .Y(data_out[43]) );
  OAI21XL U288 ( .A0(n1326), .A1(n1637), .B0(n207), .Y(data_out[44]) );
  OAI21XL U289 ( .A0(n1327), .A1(n1637), .B0(n206), .Y(data_out[45]) );
  OAI21XL U290 ( .A0(n1328), .A1(n1637), .B0(n205), .Y(data_out[46]) );
  OAI21XL U291 ( .A0(n1329), .A1(n1637), .B0(n204), .Y(data_out[47]) );
  OAI21XL U292 ( .A0(n1330), .A1(n1636), .B0(n203), .Y(data_out[48]) );
  OAI21XL U293 ( .A0(n1331), .A1(n1636), .B0(n202), .Y(data_out[49]) );
  OAI21XL U294 ( .A0(n1426), .A1(n1636), .B0(n200), .Y(data_out[50]) );
  OAI21XL U295 ( .A0(n1311), .A1(n1636), .B0(n197), .Y(data_out[53]) );
  OAI21XL U296 ( .A0(n1429), .A1(n1636), .B0(n196), .Y(data_out[54]) );
  OAI21XL U297 ( .A0(n1332), .A1(n1636), .B0(n195), .Y(data_out[55]) );
  OAI21XL U298 ( .A0(n1333), .A1(n1636), .B0(n194), .Y(data_out[56]) );
  OAI21XL U299 ( .A0(n1334), .A1(n1636), .B0(n193), .Y(data_out[57]) );
  OAI21XL U300 ( .A0(n1335), .A1(n1636), .B0(n192), .Y(data_out[58]) );
  OAI21XL U301 ( .A0(n1336), .A1(n1636), .B0(n191), .Y(data_out[59]) );
  OAI21XL U302 ( .A0(n1372), .A1(n1635), .B0(n189), .Y(data_out[60]) );
  OAI21XL U303 ( .A0(n1373), .A1(n1635), .B0(n188), .Y(data_out[61]) );
  OAI21XL U304 ( .A0(n1374), .A1(n1635), .B0(n187), .Y(data_out[62]) );
  OAI21XL U305 ( .A0(n1375), .A1(n1635), .B0(n186), .Y(data_out[63]) );
  OAI21XL U306 ( .A0(n1376), .A1(n1635), .B0(n185), .Y(data_out[64]) );
  OAI21XL U307 ( .A0(n1377), .A1(n1636), .B0(n184), .Y(data_out[65]) );
  OAI21XL U308 ( .A0(n1378), .A1(n1635), .B0(n183), .Y(data_out[66]) );
  OAI21XL U309 ( .A0(n1634), .A1(n1395), .B0(n276), .Y(data_out[104]) );
  OAI21XL U310 ( .A0(n1634), .A1(n1437), .B0(n260), .Y(data_out[119]) );
  OAI21XL U311 ( .A0(n1634), .A1(n1439), .B0(n258), .Y(data_out[120]) );
  OAI21XL U312 ( .A0(n1634), .A1(n1396), .B0(n257), .Y(data_out[121]) );
  OAI21XL U313 ( .A0(n1639), .A1(n1442), .B0(n242), .Y(data_out[135]) );
  OAI21XL U314 ( .A0(n1638), .A1(n1438), .B0(n180), .Y(data_out[69]) );
  OAI21XL U315 ( .A0(n1638), .A1(n1345), .B0(n178), .Y(data_out[70]) );
  OAI21XL U316 ( .A0(n1640), .A1(n1422), .B0(n161), .Y(data_out[86]) );
  OAI21XL U317 ( .A0(n1637), .A1(n1443), .B0(n279), .Y(data_out[101]) );
  OAI21XL U318 ( .A0(n1637), .A1(n1310), .B0(n216), .Y(data_out[36]) );
  OAI21XL U319 ( .A0(n1637), .A1(n1441), .B0(n198), .Y(data_out[52]) );
  OAI21XL U320 ( .A0(n1637), .A1(n1428), .B0(n182), .Y(data_out[67]) );
  NOR2BX1 U321 ( .AN(n762), .B(n142), .Y(n287) );
endmodule


module butterfly_DW01_sub_10 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307;

  XOR2X1 U3 ( .A(n239), .B(n240), .Y(DIFF[7]) );
  XNOR2X1 U4 ( .A(n252), .B(n253), .Y(DIFF[4]) );
  XNOR2X1 U5 ( .A(n264), .B(n260), .Y(DIFF[1]) );
  XOR2X1 U6 ( .A(n232), .B(n233), .Y(DIFF[9]) );
  OAI21X1 U7 ( .A0(B[0]), .A1(n223), .B0(n260), .Y(DIFF[0]) );
  XOR2X1 U8 ( .A(n255), .B(n256), .Y(DIFF[3]) );
  XOR2X1 U9 ( .A(n286), .B(n287), .Y(DIFF[15]) );
  INVX1 U10 ( .A(n279), .Y(n213) );
  NAND2X1 U11 ( .A(n242), .B(n243), .Y(n239) );
  AOI21X1 U12 ( .A0(n241), .A1(n215), .B0(n214), .Y(n240) );
  NOR2X1 U13 ( .A(n216), .B(n251), .Y(n253) );
  NAND2BX1 U14 ( .AN(n261), .B(n259), .Y(n264) );
  NOR2BX1 U15 ( .AN(n234), .B(n235), .Y(n233) );
  OAI211X1 U16 ( .A0(n252), .A1(n213), .B0(n284), .C0(n242), .Y(n237) );
  XOR2X1 U17 ( .A(n288), .B(n290), .Y(DIFF[14]) );
  NOR2X1 U18 ( .A(n289), .B(n203), .Y(n290) );
  XOR2X1 U19 ( .A(n250), .B(n248), .Y(DIFF[5]) );
  NAND2BX1 U20 ( .AN(n247), .B(n249), .Y(n250) );
  XOR2X1 U21 ( .A(n207), .B(n294), .Y(DIFF[12]) );
  NOR2BX1 U22 ( .AN(n280), .B(n272), .Y(n294) );
  XOR2X1 U23 ( .A(n293), .B(n292), .Y(DIFF[13]) );
  NAND2X1 U24 ( .A(n273), .B(n205), .Y(n293) );
  XOR2X1 U25 ( .A(n241), .B(n244), .Y(DIFF[6]) );
  NOR2X1 U26 ( .A(n214), .B(n245), .Y(n244) );
  XOR2X1 U27 ( .A(n258), .B(n257), .Y(DIFF[2]) );
  NAND2X1 U28 ( .A(n219), .B(n262), .Y(n258) );
  XNOR2X1 U29 ( .A(n236), .B(n237), .Y(DIFF[8]) );
  NAND2X1 U30 ( .A(n212), .B(n238), .Y(n236) );
  XOR2X1 U31 ( .A(n304), .B(n303), .Y(DIFF[10]) );
  NAND2BX1 U32 ( .AN(n300), .B(n296), .Y(n304) );
  NOR4BX1 U33 ( .AN(n243), .B(n251), .C(n247), .D(n245), .Y(n279) );
  OAI211X1 U34 ( .A0(n272), .A1(n206), .B0(n205), .C0(n204), .Y(n270) );
  INVX1 U35 ( .A(n273), .Y(n206) );
  AOI21X1 U36 ( .A0(n259), .A1(n260), .B0(n261), .Y(n257) );
  AOI21X1 U37 ( .A0(n232), .A1(n234), .B0(n235), .Y(n303) );
  AOI21X1 U38 ( .A0(n207), .A1(n280), .B0(n272), .Y(n292) );
  OAI211X1 U39 ( .A0(n217), .A1(n213), .B0(n284), .C0(n242), .Y(n281) );
  INVX1 U40 ( .A(n285), .Y(n217) );
  OAI21XL U41 ( .A0(n291), .A1(n292), .B0(n273), .Y(n288) );
  OAI21XL U42 ( .A0(n247), .A1(n248), .B0(n249), .Y(n241) );
  NOR2X1 U43 ( .A(n285), .B(n277), .Y(n252) );
  AOI2BB1X1 U44 ( .A0N(n251), .A1N(n252), .B0(n216), .Y(n248) );
  INVX1 U45 ( .A(n289), .Y(n204) );
  NAND3X1 U46 ( .A(n215), .B(n243), .C(n305), .Y(n284) );
  OAI211X1 U47 ( .A0(n247), .A1(n254), .B0(n249), .C0(n246), .Y(n305) );
  INVX1 U48 ( .A(n291), .Y(n205) );
  INVX1 U49 ( .A(n295), .Y(n207) );
  AOI211X1 U50 ( .A0(n237), .A1(n278), .B0(n283), .C0(n282), .Y(n295) );
  OAI2BB1X1 U51 ( .A0N(n212), .A1N(n237), .B0(n238), .Y(n232) );
  INVX1 U52 ( .A(n245), .Y(n215) );
  OAI21XL U53 ( .A0(n274), .A1(n275), .B0(n276), .Y(n267) );
  NAND4BXL U54 ( .AN(n275), .B(n277), .C(n278), .D(n279), .Y(n276) );
  NAND4X1 U55 ( .A(n205), .B(n204), .C(n280), .D(n202), .Y(n275) );
  AOI211X1 U56 ( .A0(n278), .A1(n281), .B0(n282), .C0(n283), .Y(n274) );
  AND3X2 U57 ( .A(n260), .B(n259), .C(n306), .Y(n277) );
  INVX1 U58 ( .A(n263), .Y(n219) );
  INVX1 U59 ( .A(n262), .Y(n220) );
  INVX1 U60 ( .A(n254), .Y(n216) );
  INVX1 U61 ( .A(n269), .Y(n203) );
  INVX1 U62 ( .A(n246), .Y(n214) );
  NAND2BX1 U63 ( .AN(n300), .B(n234), .Y(n298) );
  INVX1 U64 ( .A(n271), .Y(n202) );
  INVX1 U65 ( .A(n299), .Y(n212) );
  XOR2X1 U66 ( .A(n218), .B(B[3]), .Y(n256) );
  OAI21XL U67 ( .A0(n220), .A1(n257), .B0(n219), .Y(n255) );
  AOI211X1 U68 ( .A0(n208), .A1(B[11]), .B0(n299), .C0(n298), .Y(n278) );
  OAI2BB1X1 U69 ( .A0N(n224), .A1N(A[15]), .B0(n202), .Y(n286) );
  AOI21X1 U70 ( .A0(n288), .A1(n204), .B0(n203), .Y(n287) );
  XOR2X1 U71 ( .A(n301), .B(n302), .Y(DIFF[11]) );
  OAI21XL U72 ( .A0(n300), .A1(n303), .B0(n296), .Y(n301) );
  AOI21X1 U73 ( .A0(B[11]), .A1(n208), .B0(n282), .Y(n302) );
  XOR2X1 U74 ( .A(n265), .B(n266), .Y(DIFF[16]) );
  XOR2X1 U75 ( .A(B[16]), .B(A[16]), .Y(n266) );
  AOI211X1 U76 ( .A0(A[15]), .A1(n224), .B0(n267), .C0(n268), .Y(n265) );
  AOI21X1 U77 ( .A0(n269), .A1(n270), .B0(n271), .Y(n268) );
  NOR2X1 U78 ( .A(n230), .B(A[5]), .Y(n247) );
  NOR2X1 U79 ( .A(n210), .B(B[9]), .Y(n235) );
  NOR2X1 U80 ( .A(n229), .B(A[6]), .Y(n245) );
  NOR2X1 U81 ( .A(n231), .B(A[4]), .Y(n251) );
  NAND2X1 U82 ( .A(B[0]), .B(n223), .Y(n260) );
  NOR2BX1 U83 ( .AN(A[12]), .B(B[12]), .Y(n272) );
  NOR2X1 U84 ( .A(n222), .B(B[1]), .Y(n261) );
  NOR2X1 U85 ( .A(n208), .B(B[11]), .Y(n282) );
  INVX1 U86 ( .A(A[11]), .Y(n208) );
  NOR2X1 U87 ( .A(n227), .B(A[10]), .Y(n300) );
  OAI21XL U88 ( .A0(B[3]), .A1(n218), .B0(n307), .Y(n285) );
  OAI21XL U89 ( .A0(n261), .A1(n263), .B0(n306), .Y(n307) );
  AOI22X1 U90 ( .A0(n208), .A1(B[11]), .B0(n296), .B1(n297), .Y(n283) );
  OAI21XL U91 ( .A0(n235), .A1(n211), .B0(n209), .Y(n297) );
  INVX1 U92 ( .A(n298), .Y(n209) );
  INVX1 U93 ( .A(n238), .Y(n211) );
  NAND2X1 U94 ( .A(A[10]), .B(n227), .Y(n296) );
  AOI21X1 U95 ( .A0(n218), .A1(B[3]), .B0(n220), .Y(n306) );
  NOR2X1 U96 ( .A(n226), .B(A[13]), .Y(n291) );
  NOR2X1 U97 ( .A(n221), .B(B[2]), .Y(n263) );
  NAND2X1 U98 ( .A(A[13]), .B(n226), .Y(n273) );
  INVX1 U99 ( .A(A[3]), .Y(n218) );
  NOR2X1 U100 ( .A(n225), .B(A[14]), .Y(n289) );
  NOR2X1 U101 ( .A(n224), .B(A[15]), .Y(n271) );
  NAND2X1 U102 ( .A(B[9]), .B(n210), .Y(n234) );
  NAND2X1 U103 ( .A(A[8]), .B(n228), .Y(n238) );
  NAND2X1 U104 ( .A(A[5]), .B(n230), .Y(n249) );
  NAND2X1 U105 ( .A(B[1]), .B(n222), .Y(n259) );
  NAND2BX1 U106 ( .AN(A[7]), .B(B[7]), .Y(n243) );
  NAND2BX1 U107 ( .AN(A[12]), .B(B[12]), .Y(n280) );
  NAND2BX1 U108 ( .AN(B[7]), .B(A[7]), .Y(n242) );
  NOR2X1 U109 ( .A(n228), .B(A[8]), .Y(n299) );
  INVX1 U110 ( .A(B[15]), .Y(n224) );
  NAND2X1 U111 ( .A(A[14]), .B(n225), .Y(n269) );
  NAND2X1 U112 ( .A(B[2]), .B(n221), .Y(n262) );
  NAND2X1 U113 ( .A(A[4]), .B(n231), .Y(n254) );
  INVX1 U114 ( .A(A[0]), .Y(n223) );
  NAND2X1 U115 ( .A(A[6]), .B(n229), .Y(n246) );
  INVX1 U116 ( .A(A[2]), .Y(n221) );
  INVX1 U117 ( .A(A[1]), .Y(n222) );
  INVX1 U118 ( .A(B[5]), .Y(n230) );
  INVX1 U119 ( .A(B[4]), .Y(n231) );
  INVX1 U120 ( .A(B[6]), .Y(n229) );
  INVX1 U121 ( .A(B[8]), .Y(n228) );
  INVX1 U122 ( .A(A[9]), .Y(n210) );
  INVX1 U123 ( .A(B[10]), .Y(n227) );
  INVX1 U124 ( .A(B[14]), .Y(n225) );
  INVX1 U125 ( .A(B[13]), .Y(n226) );
endmodule


module butterfly_DW01_add_16 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261;

  AND2X2 U32 ( .A(B[15]), .B(A[15]), .Y(n225) );
  AND2X2 U44 ( .A(B[13]), .B(A[13]), .Y(n230) );
  AND2X2 U82 ( .A(B[2]), .B(A[2]), .Y(n215) );
  AND2X2 U86 ( .A(B[10]), .B(A[10]), .Y(n251) );
  XOR2X1 U2 ( .A(n194), .B(n195), .Y(SUM[8]) );
  AOI21X1 U3 ( .A0(n192), .A1(n183), .B0(n182), .Y(n255) );
  NAND2X1 U4 ( .A(n181), .B(n243), .Y(n227) );
  OR2X2 U5 ( .A(n243), .B(n180), .Y(n240) );
  OAI21X2 U6 ( .A0(n244), .A1(n240), .B0(n245), .Y(SUM[12]) );
  OAI21XL U7 ( .A0(n244), .A1(n180), .B0(n243), .Y(n245) );
  OAI31X1 U8 ( .A0(n246), .A1(n247), .A2(n248), .B0(n249), .Y(n243) );
  NOR3X1 U9 ( .A(n250), .B(n182), .C(n251), .Y(n246) );
  OAI32X1 U10 ( .A0(n194), .A1(n196), .A2(n252), .B0(n252), .B1(n197), .Y(n250) );
  XOR2X1 U11 ( .A(n218), .B(n219), .Y(SUM[1]) );
  NAND2BX1 U12 ( .AN(n220), .B(n221), .Y(n219) );
  NAND2BX1 U13 ( .AN(n196), .B(n197), .Y(n195) );
  XOR2X1 U14 ( .A(n238), .B(n239), .Y(SUM[14]) );
  OR2X2 U15 ( .A(n228), .B(n177), .Y(n238) );
  AOI31X1 U16 ( .A0(n181), .A1(n179), .A2(n240), .B0(n230), .Y(n239) );
  XOR2X1 U17 ( .A(n253), .B(n254), .Y(SUM[11]) );
  NAND2BX1 U18 ( .AN(n248), .B(n249), .Y(n253) );
  AOI2BB1X1 U19 ( .A0N(n255), .A1N(n247), .B0(n251), .Y(n254) );
  XOR2X1 U20 ( .A(n256), .B(n255), .Y(SUM[10]) );
  OR2X2 U21 ( .A(n251), .B(n247), .Y(n256) );
  XNOR2X1 U22 ( .A(n210), .B(n209), .Y(SUM[4]) );
  NAND2X1 U23 ( .A(n208), .B(n211), .Y(n210) );
  XOR2X1 U24 ( .A(n207), .B(n205), .Y(SUM[5]) );
  NAND2X1 U25 ( .A(n186), .B(n206), .Y(n207) );
  XOR2X1 U26 ( .A(n214), .B(n216), .Y(SUM[2]) );
  NOR2X1 U27 ( .A(n215), .B(n217), .Y(n216) );
  XOR2X1 U28 ( .A(n236), .B(n241), .Y(SUM[13]) );
  NOR2X1 U29 ( .A(n230), .B(n237), .Y(n241) );
  XOR2X1 U30 ( .A(n232), .B(n233), .Y(SUM[15]) );
  NAND2X1 U31 ( .A(n234), .B(n235), .Y(n232) );
  NOR2X1 U33 ( .A(n225), .B(n226), .Y(n233) );
  OAI21XL U34 ( .A0(n230), .A1(n236), .B0(n231), .Y(n235) );
  XNOR2X1 U35 ( .A(n203), .B(n200), .Y(SUM[6]) );
  NAND2X1 U36 ( .A(n201), .B(n202), .Y(n203) );
  XNOR2X1 U37 ( .A(n191), .B(n192), .Y(SUM[9]) );
  NAND2X1 U38 ( .A(n183), .B(n193), .Y(n191) );
  OAI21XL U39 ( .A0(n220), .A1(n218), .B0(n221), .Y(n214) );
  OAI21XL U40 ( .A0(n196), .A1(n194), .B0(n197), .Y(n192) );
  AOI211X1 U41 ( .A0(n209), .A1(n208), .B0(n187), .C0(n188), .Y(n258) );
  INVX1 U42 ( .A(n206), .Y(n187) );
  OAI21XL U43 ( .A0(n204), .A1(n205), .B0(n206), .Y(n200) );
  AOI21X1 U45 ( .A0(n208), .A1(n209), .B0(n188), .Y(n205) );
  OAI22X1 U46 ( .A0(n227), .A1(n178), .B0(n228), .B1(n229), .Y(n224) );
  INVX1 U47 ( .A(n231), .Y(n178) );
  AOI211X1 U48 ( .A0(n180), .A1(n179), .B0(n230), .C0(n177), .Y(n229) );
  NOR2X1 U49 ( .A(n237), .B(n228), .Y(n231) );
  NAND2X1 U50 ( .A(n242), .B(n227), .Y(n236) );
  INVX1 U51 ( .A(n242), .Y(n180) );
  INVX1 U52 ( .A(n252), .Y(n183) );
  INVX1 U53 ( .A(n204), .Y(n186) );
  INVX1 U54 ( .A(n244), .Y(n181) );
  INVX1 U55 ( .A(n193), .Y(n182) );
  INVX1 U56 ( .A(n217), .Y(n189) );
  INVX1 U57 ( .A(n237), .Y(n179) );
  INVX1 U58 ( .A(n211), .Y(n188) );
  INVX1 U59 ( .A(n234), .Y(n177) );
  XOR2X2 U60 ( .A(n198), .B(n199), .Y(SUM[7]) );
  XOR2X1 U61 ( .A(n184), .B(B[7]), .Y(n198) );
  AOI21X1 U62 ( .A0(n200), .A1(n201), .B0(n185), .Y(n199) );
  INVX1 U63 ( .A(n202), .Y(n185) );
  XOR2X1 U64 ( .A(n212), .B(n213), .Y(SUM[3]) );
  XNOR2X1 U65 ( .A(A[3]), .B(B[3]), .Y(n212) );
  AOI21X1 U66 ( .A0(n189), .A1(n214), .B0(n215), .Y(n213) );
  INVX1 U67 ( .A(n261), .Y(SUM[0]) );
  OAI21XL U68 ( .A0(B[0]), .A1(A[0]), .B0(n218), .Y(n261) );
  XOR2X1 U69 ( .A(n222), .B(n223), .Y(SUM[16]) );
  XNOR2X1 U70 ( .A(B[16]), .B(A[16]), .Y(n222) );
  AOI21X1 U71 ( .A0(n224), .A1(n176), .B0(n225), .Y(n223) );
  INVX1 U72 ( .A(n226), .Y(n176) );
  OAI21XL U73 ( .A0(A[7]), .A1(B[7]), .B0(n257), .Y(n194) );
  OAI221XL U74 ( .A0(n258), .A1(n259), .B0(n184), .B1(n190), .C0(n202), .Y(
        n257) );
  INVX1 U75 ( .A(B[7]), .Y(n190) );
  NAND2X1 U76 ( .A(n186), .B(n201), .Y(n259) );
  NOR2X1 U77 ( .A(B[12]), .B(A[12]), .Y(n244) );
  NOR2X1 U78 ( .A(A[13]), .B(B[13]), .Y(n237) );
  NOR2X1 U79 ( .A(A[14]), .B(B[14]), .Y(n228) );
  NOR2X1 U80 ( .A(B[8]), .B(A[8]), .Y(n196) );
  NOR2X1 U81 ( .A(B[9]), .B(A[9]), .Y(n252) );
  OAI2BB1X1 U83 ( .A0N(A[3]), .A1N(B[3]), .B0(n260), .Y(n209) );
  OAI221XL U84 ( .A0(n215), .A1(n214), .B0(B[3]), .B1(A[3]), .C0(n189), .Y(
        n260) );
  NOR2X1 U85 ( .A(A[10]), .B(B[10]), .Y(n247) );
  NAND2X1 U87 ( .A(B[0]), .B(A[0]), .Y(n218) );
  NOR2X1 U88 ( .A(B[5]), .B(A[5]), .Y(n204) );
  NAND2X1 U89 ( .A(B[5]), .B(A[5]), .Y(n206) );
  NAND2X1 U90 ( .A(B[8]), .B(A[8]), .Y(n197) );
  NOR2X1 U91 ( .A(B[2]), .B(A[2]), .Y(n217) );
  NOR2X1 U92 ( .A(A[15]), .B(B[15]), .Y(n226) );
  OR2X2 U93 ( .A(B[6]), .B(A[6]), .Y(n201) );
  NOR2X1 U94 ( .A(B[1]), .B(A[1]), .Y(n220) );
  NAND2X1 U95 ( .A(B[6]), .B(A[6]), .Y(n202) );
  OR2X2 U96 ( .A(B[4]), .B(A[4]), .Y(n208) );
  NOR2X1 U97 ( .A(B[11]), .B(A[11]), .Y(n248) );
  NAND2X1 U98 ( .A(B[1]), .B(A[1]), .Y(n221) );
  NAND2X1 U99 ( .A(B[12]), .B(A[12]), .Y(n242) );
  NAND2X1 U100 ( .A(B[14]), .B(A[14]), .Y(n234) );
  NAND2X1 U101 ( .A(B[4]), .B(A[4]), .Y(n211) );
  NAND2X1 U102 ( .A(B[9]), .B(A[9]), .Y(n193) );
  NAND2X1 U103 ( .A(B[11]), .B(A[11]), .Y(n249) );
  INVX1 U104 ( .A(A[7]), .Y(n184) );
endmodule


module butterfly_DW01_add_15 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238;

  AND2X2 U44 ( .A(B[12]), .B(A[12]), .Y(n218) );
  AND2X2 U56 ( .A(B[10]), .B(A[10]), .Y(n227) );
  AND2X2 U62 ( .A(n177), .B(n179), .Y(n226) );
  AND2X2 U69 ( .A(B[6]), .B(A[6]), .Y(n186) );
  AND2X2 U79 ( .A(B[2]), .B(A[2]), .Y(n200) );
  AOI21X2 U2 ( .A0(n172), .A1(n170), .B0(n202), .Y(SUM[0]) );
  OAI21X1 U3 ( .A0(n198), .A1(n197), .B0(n199), .Y(SUM[2]) );
  XOR2X1 U4 ( .A(n180), .B(n181), .Y(SUM[7]) );
  OAI21X1 U5 ( .A0(n184), .A1(n167), .B0(n185), .Y(SUM[6]) );
  XOR2X1 U6 ( .A(n195), .B(n196), .Y(SUM[3]) );
  XOR2X1 U7 ( .A(n193), .B(n194), .Y(SUM[4]) );
  XOR2X1 U8 ( .A(n215), .B(n216), .Y(SUM[14]) );
  INVX1 U9 ( .A(n188), .Y(n167) );
  NAND2BX1 U10 ( .AN(n184), .B(n167), .Y(n180) );
  NAND2BX1 U11 ( .AN(n182), .B(n183), .Y(n181) );
  OAI21XL U12 ( .A0(n198), .A1(n200), .B0(n201), .Y(n199) );
  OAI21XL U13 ( .A0(n184), .A1(n186), .B0(n187), .Y(n185) );
  OAI31X1 U14 ( .A0(n188), .A1(n184), .A2(n182), .B0(n183), .Y(n177) );
  XNOR2X1 U15 ( .A(n189), .B(n190), .Y(SUM[5]) );
  NOR2BX1 U16 ( .AN(n191), .B(n192), .Y(n190) );
  XOR2X1 U17 ( .A(n217), .B(n223), .Y(SUM[12]) );
  NOR2X1 U18 ( .A(n222), .B(n218), .Y(n223) );
  XOR2X1 U19 ( .A(n232), .B(n234), .Y(SUM[10]) );
  NOR2X1 U20 ( .A(n233), .B(n227), .Y(n234) );
  XNOR2X1 U21 ( .A(n210), .B(n211), .Y(SUM[15]) );
  OAI21XL U22 ( .A0(n212), .A1(n213), .B0(n209), .Y(n210) );
  OAI21XL U23 ( .A0(n171), .A1(n161), .B0(n206), .Y(n211) );
  XNOR2X1 U24 ( .A(n176), .B(n177), .Y(SUM[8]) );
  NAND2X1 U25 ( .A(n178), .B(n179), .Y(n176) );
  NOR2X1 U26 ( .A(n172), .B(n170), .Y(n202) );
  NOR2BX1 U27 ( .AN(n178), .B(n226), .Y(n174) );
  OAI21XL U28 ( .A0(n189), .A1(n192), .B0(n191), .Y(n187) );
  NOR2X1 U29 ( .A(n187), .B(n186), .Y(n188) );
  OR2X2 U30 ( .A(n201), .B(n200), .Y(n197) );
  NAND2X1 U31 ( .A(n171), .B(n161), .Y(n206) );
  INVX1 U32 ( .A(n233), .Y(n166) );
  INVX1 U33 ( .A(n212), .Y(n162) );
  INVX1 U34 ( .A(n198), .Y(n169) );
  INVX1 U35 ( .A(n213), .Y(n163) );
  INVX1 U36 ( .A(n222), .Y(n164) );
  NAND2X1 U37 ( .A(n197), .B(n169), .Y(n195) );
  XNOR2X1 U38 ( .A(A[3]), .B(B[3]), .Y(n196) );
  XOR2X1 U39 ( .A(B[4]), .B(A[4]), .Y(n194) );
  OR2X2 U40 ( .A(n214), .B(n163), .Y(n215) );
  AOI21X1 U41 ( .A0(B[14]), .A1(A[14]), .B0(n212), .Y(n216) );
  XOR2X1 U42 ( .A(n173), .B(n174), .Y(SUM[9]) );
  OAI21XL U43 ( .A0(B[9]), .A1(A[9]), .B0(n175), .Y(n173) );
  XOR2X1 U45 ( .A(n220), .B(n221), .Y(SUM[13]) );
  XNOR2X1 U46 ( .A(B[13]), .B(A[13]), .Y(n220) );
  AOI21X1 U47 ( .A0(n164), .A1(n217), .B0(n218), .Y(n221) );
  XNOR2X1 U48 ( .A(n230), .B(n231), .Y(SUM[11]) );
  AOI21X1 U49 ( .A0(A[11]), .A1(B[11]), .B0(n224), .Y(n230) );
  AOI21X1 U50 ( .A0(n232), .A1(n166), .B0(n227), .Y(n231) );
  XOR2X1 U51 ( .A(n202), .B(n203), .Y(SUM[1]) );
  XOR2X1 U52 ( .A(B[1]), .B(A[1]), .Y(n203) );
  OAI211X1 U53 ( .A0(B[13]), .A1(A[13]), .B0(n164), .C0(n217), .Y(n213) );
  XOR2X1 U54 ( .A(n204), .B(n205), .Y(SUM[16]) );
  XNOR2X1 U55 ( .A(B[16]), .B(A[16]), .Y(n204) );
  AOI31X1 U57 ( .A0(n206), .A1(n162), .A2(n163), .B0(n207), .Y(n205) );
  AOI22X1 U58 ( .A0(n208), .A1(n171), .B0(n209), .B1(n161), .Y(n207) );
  NOR2X1 U59 ( .A(A[6]), .B(B[6]), .Y(n184) );
  AOI22X1 U60 ( .A0(A[14]), .A1(B[14]), .B0(n162), .B1(n214), .Y(n209) );
  OAI2BB2X1 U61 ( .B0(n224), .B1(n225), .A0N(A[11]), .A1N(B[11]), .Y(n217) );
  AOI211X1 U63 ( .A0(n226), .A1(n165), .B0(n227), .C0(n228), .Y(n225) );
  INVX1 U64 ( .A(n229), .Y(n165) );
  AOI21X1 U65 ( .A0(n178), .A1(n175), .B0(n229), .Y(n228) );
  NOR2X1 U66 ( .A(A[2]), .B(B[2]), .Y(n198) );
  NOR2X1 U67 ( .A(A[14]), .B(B[14]), .Y(n212) );
  OAI21XL U68 ( .A0(n174), .A1(n235), .B0(n175), .Y(n232) );
  NOR2X1 U70 ( .A(A[9]), .B(B[9]), .Y(n235) );
  AOI21X1 U71 ( .A0(n193), .A1(A[4]), .B0(n168), .Y(n189) );
  INVX1 U72 ( .A(n236), .Y(n168) );
  OAI21XL U73 ( .A0(A[4]), .A1(n193), .B0(B[4]), .Y(n236) );
  OAI21XL U74 ( .A0(B[9]), .A1(A[9]), .B0(n166), .Y(n229) );
  OAI2BB1X1 U75 ( .A0N(A[3]), .A1N(B[3]), .B0(n237), .Y(n193) );
  OAI211X1 U76 ( .A0(B[3]), .A1(A[3]), .B0(n197), .C0(n169), .Y(n237) );
  NOR2X1 U77 ( .A(B[11]), .B(A[11]), .Y(n224) );
  NOR2X1 U78 ( .A(A[5]), .B(B[5]), .Y(n192) );
  NAND2X1 U80 ( .A(B[9]), .B(A[9]), .Y(n175) );
  INVX1 U81 ( .A(B[15]), .Y(n171) );
  INVX1 U82 ( .A(A[15]), .Y(n161) );
  NOR2X1 U83 ( .A(A[10]), .B(B[10]), .Y(n233) );
  NOR2X1 U84 ( .A(B[12]), .B(A[12]), .Y(n222) );
  NAND2X1 U85 ( .A(B[8]), .B(A[8]), .Y(n178) );
  AOI2BB1X1 U86 ( .A0N(A[13]), .A1N(n218), .B0(n219), .Y(n214) );
  AOI21X1 U87 ( .A0(n218), .A1(A[13]), .B0(B[13]), .Y(n219) );
  NOR2X1 U88 ( .A(A[7]), .B(B[7]), .Y(n182) );
  INVX1 U89 ( .A(B[0]), .Y(n172) );
  INVX1 U90 ( .A(A[0]), .Y(n170) );
  NAND2X1 U91 ( .A(B[7]), .B(A[7]), .Y(n183) );
  OAI2BB1X1 U92 ( .A0N(n202), .A1N(A[1]), .B0(n238), .Y(n201) );
  OAI21XL U93 ( .A0(n202), .A1(A[1]), .B0(B[1]), .Y(n238) );
  NAND2X1 U94 ( .A(B[5]), .B(A[5]), .Y(n191) );
  OR2X2 U95 ( .A(B[8]), .B(A[8]), .Y(n179) );
  NAND2BX1 U96 ( .AN(n209), .B(A[15]), .Y(n208) );
endmodule


module butterfly_DW01_sub_12 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302;

  AND2X2 U47 ( .A(n284), .B(n193), .Y(n281) );
  AND2X2 U58 ( .A(n276), .B(n263), .Y(n289) );
  XNOR2X1 U3 ( .A(n285), .B(n284), .Y(DIFF[13]) );
  XOR2X1 U4 ( .A(n226), .B(n227), .Y(DIFF[7]) );
  OAI21X1 U5 ( .A0(B[0]), .A1(n211), .B0(n248), .Y(DIFF[0]) );
  XOR2X1 U6 ( .A(n241), .B(n242), .Y(DIFF[3]) );
  AOI21X1 U7 ( .A0(n223), .A1(n201), .B0(n200), .Y(n221) );
  OAI31X1 U8 ( .A0(n291), .A1(n292), .A2(n293), .B0(n267), .Y(n272) );
  AOI211X1 U9 ( .A0(n222), .A1(n294), .B0(n197), .C0(n269), .Y(n293) );
  NAND2X1 U10 ( .A(n277), .B(n193), .Y(n285) );
  XOR2X1 U11 ( .A(n297), .B(n298), .Y(DIFF[10]) );
  NOR2X1 U12 ( .A(n197), .B(n292), .Y(n298) );
  XOR2X1 U13 ( .A(n295), .B(n296), .Y(DIFF[11]) );
  NAND2BX1 U14 ( .AN(n291), .B(n267), .Y(n295) );
  AOI21X1 U15 ( .A0(n297), .A1(n268), .B0(n292), .Y(n296) );
  XOR2X1 U16 ( .A(n223), .B(n224), .Y(DIFF[8]) );
  NOR2X1 U17 ( .A(n200), .B(n225), .Y(n224) );
  XOR2X1 U18 ( .A(n220), .B(n221), .Y(DIFF[9]) );
  NAND2X1 U19 ( .A(n199), .B(n222), .Y(n220) );
  XOR2X1 U20 ( .A(n282), .B(n283), .Y(DIFF[14]) );
  OR2X2 U21 ( .A(n273), .B(n191), .Y(n282) );
  NOR2X1 U22 ( .A(n281), .B(n194), .Y(n283) );
  XOR2X1 U23 ( .A(n288), .B(n289), .Y(DIFF[12]) );
  NAND2X1 U24 ( .A(n272), .B(n287), .Y(n288) );
  XOR2X1 U25 ( .A(n228), .B(n230), .Y(DIFF[6]) );
  NOR2X1 U26 ( .A(n203), .B(n231), .Y(n230) );
  XOR2X1 U27 ( .A(n236), .B(n234), .Y(DIFF[5]) );
  NAND2X1 U28 ( .A(n206), .B(n235), .Y(n236) );
  XOR2X1 U29 ( .A(n247), .B(n245), .Y(DIFF[2]) );
  NAND2X1 U30 ( .A(n246), .B(n209), .Y(n247) );
  NAND4X1 U31 ( .A(n267), .B(n199), .C(n201), .D(n268), .Y(n258) );
  NAND4X1 U32 ( .A(n223), .B(n268), .C(n201), .D(n290), .Y(n287) );
  NOR2BX1 U33 ( .AN(n267), .B(n269), .Y(n290) );
  OAI21XL U34 ( .A0(n221), .A1(n269), .B0(n222), .Y(n297) );
  OAI21XL U35 ( .A0(n233), .A1(n234), .B0(n235), .Y(n228) );
  INVX1 U36 ( .A(n231), .Y(n204) );
  NAND2X1 U37 ( .A(n266), .B(n299), .Y(n223) );
  NAND4X1 U38 ( .A(n261), .B(n239), .C(n204), .D(n229), .Y(n299) );
  INVX1 U39 ( .A(n244), .Y(n209) );
  NAND4BXL U40 ( .AN(n243), .B(n248), .C(n209), .D(n210), .Y(n257) );
  INVX1 U41 ( .A(n225), .Y(n201) );
  OAI21XL U42 ( .A0(n195), .A1(n262), .B0(n259), .Y(n255) );
  INVX1 U43 ( .A(n272), .Y(n195) );
  AOI21X1 U44 ( .A0(n265), .A1(n266), .B0(n258), .Y(n262) );
  NAND4X1 U45 ( .A(n261), .B(n270), .C(n204), .D(n229), .Y(n265) );
  NAND4BBX1 U46 ( .AN(n257), .BN(n258), .C(n259), .D(n260), .Y(n256) );
  AND3X2 U48 ( .A(n261), .B(n229), .C(n204), .Y(n260) );
  OAI21XL U49 ( .A0(n275), .A1(n276), .B0(n277), .Y(n274) );
  INVX1 U50 ( .A(n250), .Y(n210) );
  INVX1 U51 ( .A(n233), .Y(n206) );
  INVX1 U52 ( .A(n275), .Y(n193) );
  NAND2X1 U53 ( .A(n276), .B(n286), .Y(n284) );
  OAI2BB1X1 U54 ( .A0N(n287), .A1N(n272), .B0(n263), .Y(n286) );
  INVX1 U55 ( .A(n269), .Y(n199) );
  AND3X2 U56 ( .A(n193), .B(n263), .C(n264), .Y(n259) );
  INVX1 U57 ( .A(n294), .Y(n200) );
  INVX1 U59 ( .A(n232), .Y(n203) );
  INVX1 U60 ( .A(n268), .Y(n197) );
  INVX1 U61 ( .A(n277), .Y(n194) );
  INVX1 U62 ( .A(n280), .Y(n191) );
  OAI21XL U63 ( .A0(B[7]), .A1(n202), .B0(n229), .Y(n226) );
  AOI21X1 U64 ( .A0(n228), .A1(n204), .B0(n203), .Y(n227) );
  OAI21XL U65 ( .A0(n244), .A1(n245), .B0(n246), .Y(n241) );
  AOI21X1 U66 ( .A0(A[3]), .A1(n217), .B0(n243), .Y(n242) );
  XNOR2X1 U67 ( .A(n278), .B(n279), .Y(DIFF[15]) );
  AOI21X1 U68 ( .A0(B[15]), .A1(n190), .B0(n253), .Y(n279) );
  AOI221X1 U69 ( .A0(n280), .A1(n281), .B0(n280), .B1(n194), .C0(n273), .Y(
        n278) );
  OAI211X1 U70 ( .A0(B[3]), .A1(n208), .B0(n257), .C0(n271), .Y(n239) );
  XOR2X1 U71 ( .A(n239), .B(n240), .Y(DIFF[4]) );
  AOI21X1 U72 ( .A0(B[4]), .A1(n207), .B0(n238), .Y(n240) );
  XOR2X1 U73 ( .A(n248), .B(n249), .Y(DIFF[1]) );
  AOI21X1 U74 ( .A0(A[1]), .A1(n219), .B0(n250), .Y(n249) );
  XOR2X1 U75 ( .A(n251), .B(n252), .Y(DIFF[16]) );
  XNOR2X1 U76 ( .A(B[16]), .B(A[16]), .Y(n252) );
  NAND4BXL U77 ( .AN(n253), .B(n254), .C(n255), .D(n256), .Y(n251) );
  OAI21XL U78 ( .A0(n273), .A1(n274), .B0(n264), .Y(n254) );
  NOR2X1 U79 ( .A(n213), .B(A[9]), .Y(n269) );
  AOI22X1 U80 ( .A0(n219), .A1(A[1]), .B0(n210), .B1(n248), .Y(n245) );
  NOR2X1 U81 ( .A(n207), .B(B[4]), .Y(n238) );
  NOR2X1 U82 ( .A(n216), .B(A[5]), .Y(n233) );
  NAND2X1 U83 ( .A(B[0]), .B(n211), .Y(n248) );
  NAND2X1 U84 ( .A(B[7]), .B(n202), .Y(n229) );
  NOR2X1 U85 ( .A(n198), .B(B[10]), .Y(n292) );
  NOR2X1 U86 ( .A(n215), .B(A[6]), .Y(n231) );
  NOR2BX1 U87 ( .AN(n237), .B(n238), .Y(n234) );
  OAI2BB1X1 U88 ( .A0N(n207), .A1N(B[4]), .B0(n239), .Y(n237) );
  NOR2X1 U89 ( .A(n192), .B(B[14]), .Y(n273) );
  AOI21X1 U90 ( .A0(n207), .A1(B[4]), .B0(n233), .Y(n261) );
  INVX1 U91 ( .A(B[1]), .Y(n219) );
  INVX1 U92 ( .A(A[4]), .Y(n207) );
  NOR2X1 U93 ( .A(n217), .B(A[3]), .Y(n243) );
  NAND2X1 U94 ( .A(B[10]), .B(n198), .Y(n268) );
  NAND2X1 U95 ( .A(B[11]), .B(n196), .Y(n267) );
  NOR2X1 U96 ( .A(n218), .B(A[2]), .Y(n244) );
  NOR2X1 U97 ( .A(n212), .B(A[13]), .Y(n275) );
  NAND2X1 U98 ( .A(A[2]), .B(n218), .Y(n246) );
  NOR2X1 U99 ( .A(n219), .B(A[1]), .Y(n250) );
  AOI21X1 U100 ( .A0(n190), .A1(B[15]), .B0(n191), .Y(n264) );
  INVX1 U101 ( .A(A[15]), .Y(n190) );
  NAND2X1 U102 ( .A(A[13]), .B(n212), .Y(n277) );
  NAND2X1 U103 ( .A(A[5]), .B(n216), .Y(n235) );
  NAND2X1 U104 ( .A(A[9]), .B(n213), .Y(n222) );
  NOR2X1 U105 ( .A(n214), .B(A[8]), .Y(n225) );
  NOR2X1 U106 ( .A(n190), .B(B[15]), .Y(n253) );
  NAND2BX1 U107 ( .AN(B[12]), .B(A[12]), .Y(n276) );
  NAND3BX1 U108 ( .AN(n243), .B(n209), .C(n300), .Y(n271) );
  OAI2BB1X1 U109 ( .A0N(n219), .A1N(A[1]), .B0(n246), .Y(n300) );
  INVX1 U110 ( .A(A[7]), .Y(n202) );
  NAND2X1 U111 ( .A(B[14]), .B(n192), .Y(n280) );
  NAND2X1 U112 ( .A(n301), .B(n229), .Y(n266) );
  OAI221XL U113 ( .A0(n231), .A1(n302), .B0(B[7]), .B1(n202), .C0(n232), .Y(
        n301) );
  AOI21X1 U114 ( .A0(n238), .A1(n206), .B0(n205), .Y(n302) );
  INVX1 U115 ( .A(n235), .Y(n205) );
  NOR2X1 U116 ( .A(n196), .B(B[11]), .Y(n291) );
  NAND2BX1 U117 ( .AN(A[12]), .B(B[12]), .Y(n263) );
  OAI21XL U118 ( .A0(B[3]), .A1(n208), .B0(n271), .Y(n270) );
  INVX1 U119 ( .A(B[3]), .Y(n217) );
  NAND2X1 U120 ( .A(A[8]), .B(n214), .Y(n294) );
  INVX1 U121 ( .A(A[0]), .Y(n211) );
  NAND2X1 U122 ( .A(A[6]), .B(n215), .Y(n232) );
  INVX1 U123 ( .A(B[2]), .Y(n218) );
  INVX1 U124 ( .A(B[5]), .Y(n216) );
  INVX1 U125 ( .A(B[6]), .Y(n215) );
  INVX1 U126 ( .A(B[8]), .Y(n214) );
  INVX1 U127 ( .A(B[9]), .Y(n213) );
  INVX1 U128 ( .A(A[10]), .Y(n198) );
  INVX1 U129 ( .A(A[11]), .Y(n196) );
  INVX1 U130 ( .A(A[14]), .Y(n192) );
  INVX1 U131 ( .A(B[13]), .Y(n212) );
  INVX1 U132 ( .A(A[3]), .Y(n208) );
endmodule


module butterfly_DW01_sub_21 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301;

  AOI21X1 U3 ( .A0(n201), .A1(n202), .B0(n200), .Y(n273) );
  XOR2X1 U4 ( .A(n241), .B(n239), .Y(DIFF[5]) );
  NAND2X1 U5 ( .A(n211), .B(n240), .Y(n241) );
  OAI21XL U6 ( .A0(n267), .A1(n279), .B0(n281), .Y(DIFF[12]) );
  OAI21XL U7 ( .A0(n200), .A1(n267), .B0(n202), .Y(n281) );
  OAI21XL U8 ( .A0(n238), .A1(n239), .B0(n240), .Y(n233) );
  XOR2X1 U9 ( .A(n292), .B(n293), .Y(DIFF[11]) );
  OAI2BB1X1 U10 ( .A0N(n294), .A1N(n205), .B0(n287), .Y(n292) );
  NOR2X1 U11 ( .A(n285), .B(n204), .Y(n293) );
  AOI31X1 U12 ( .A0(n287), .A1(n227), .A2(n288), .B0(n204), .Y(n286) );
  AOI21X1 U13 ( .A0(n207), .A1(n206), .B0(n285), .Y(n288) );
  OAI21XL U14 ( .A0(n226), .A1(n289), .B0(n227), .Y(n294) );
  INVX1 U15 ( .A(n268), .Y(n202) );
  NAND2X1 U16 ( .A(n268), .B(n269), .Y(n279) );
  XNOR2X1 U17 ( .A(n295), .B(n294), .Y(DIFF[10]) );
  NAND2X1 U18 ( .A(n287), .B(n205), .Y(n295) );
  XOR2X1 U19 ( .A(n225), .B(n226), .Y(DIFF[9]) );
  NAND2X1 U20 ( .A(n206), .B(n227), .Y(n225) );
  XOR2X1 U21 ( .A(n276), .B(n277), .Y(DIFF[14]) );
  NOR2X1 U22 ( .A(n275), .B(n278), .Y(n276) );
  NOR2X1 U23 ( .A(n261), .B(n266), .Y(n277) );
  AOI21X1 U24 ( .A0(n279), .A1(n201), .B0(n198), .Y(n278) );
  INVX1 U25 ( .A(n291), .Y(n205) );
  INVX1 U26 ( .A(n267), .Y(n201) );
  INVX1 U27 ( .A(n238), .Y(n211) );
  INVX1 U28 ( .A(n289), .Y(n206) );
  XNOR2X1 U29 ( .A(n237), .B(n233), .Y(DIFF[6]) );
  NAND2X1 U30 ( .A(n234), .B(n210), .Y(n237) );
  XOR2X1 U31 ( .A(n249), .B(n253), .Y(DIFF[2]) );
  NOR2BX1 U32 ( .AN(n248), .B(n250), .Y(n253) );
  XOR2X1 U33 ( .A(n280), .B(n273), .Y(DIFF[13]) );
  NAND2X1 U34 ( .A(n199), .B(n274), .Y(n280) );
  INVX1 U35 ( .A(n269), .Y(n200) );
  INVX1 U36 ( .A(n290), .Y(n208) );
  INVX1 U37 ( .A(n230), .Y(n207) );
  INVX1 U38 ( .A(n275), .Y(n199) );
  INVX1 U39 ( .A(n235), .Y(n210) );
  INVX1 U40 ( .A(n274), .Y(n198) );
  INVX1 U41 ( .A(n283), .Y(n204) );
  XOR2X1 U42 ( .A(n259), .B(n260), .Y(DIFF[16]) );
  AOI31X1 U43 ( .A0(n282), .A1(n283), .A2(n229), .B0(n203), .Y(n268) );
  INVX1 U44 ( .A(n284), .Y(n203) );
  NOR3X1 U45 ( .A(n290), .B(n289), .C(n291), .Y(n282) );
  OAI21XL U46 ( .A0(n285), .A1(n205), .B0(n286), .Y(n284) );
  NOR2X1 U47 ( .A(n218), .B(A[12]), .Y(n267) );
  OAI31X1 U48 ( .A0(n261), .A1(n262), .A2(n263), .B0(n264), .Y(n259) );
  AOI211X1 U49 ( .A0(n265), .A1(n199), .B0(n198), .C0(n266), .Y(n263) );
  OAI21XL U50 ( .A0(n267), .A1(n268), .B0(n269), .Y(n265) );
  NOR2BX1 U51 ( .AN(A[14]), .B(B[14]), .Y(n266) );
  NOR2BX1 U52 ( .AN(A[11]), .B(B[11]), .Y(n285) );
  NOR2BX1 U53 ( .AN(A[2]), .B(B[2]), .Y(n250) );
  AOI21X1 U54 ( .A0(n214), .A1(n213), .B0(n299), .Y(n243) );
  INVX1 U55 ( .A(n254), .Y(n214) );
  INVX1 U56 ( .A(n301), .Y(n213) );
  OAI21XL U57 ( .A0(n300), .A1(n301), .B0(n252), .Y(n299) );
  NAND2X1 U58 ( .A(B[0]), .B(n215), .Y(n257) );
  NOR2X1 U59 ( .A(n220), .B(A[9]), .Y(n289) );
  AOI21X1 U60 ( .A0(n208), .A1(n229), .B0(n207), .Y(n226) );
  NAND2BX1 U61 ( .AN(A[6]), .B(B[6]), .Y(n234) );
  NOR2X1 U62 ( .A(n223), .B(A[5]), .Y(n238) );
  NOR2X1 U63 ( .A(n217), .B(A[13]), .Y(n275) );
  NOR2BX1 U64 ( .AN(B[14]), .B(A[14]), .Y(n261) );
  OAI211X1 U65 ( .A0(n245), .A1(n238), .B0(n240), .C0(n210), .Y(n298) );
  AOI2BB1X1 U66 ( .A0N(n242), .A1N(n243), .B0(n212), .Y(n239) );
  XOR2X1 U67 ( .A(n246), .B(n247), .Y(DIFF[3]) );
  NAND2X1 U68 ( .A(n251), .B(n252), .Y(n246) );
  AOI21X1 U69 ( .A0(n248), .A1(n249), .B0(n250), .Y(n247) );
  NAND2BX1 U70 ( .AN(A[2]), .B(B[2]), .Y(n248) );
  NAND2X1 U71 ( .A(A[13]), .B(n217), .Y(n274) );
  NAND2X1 U72 ( .A(A[10]), .B(n219), .Y(n287) );
  INVX1 U73 ( .A(B[5]), .Y(n223) );
  NOR2X1 U74 ( .A(n221), .B(A[8]), .Y(n290) );
  NAND2X1 U75 ( .A(A[9]), .B(n220), .Y(n227) );
  NOR2X1 U76 ( .A(n219), .B(A[10]), .Y(n291) );
  NOR2BX1 U77 ( .AN(A[6]), .B(B[6]), .Y(n235) );
  NAND2X1 U78 ( .A(A[12]), .B(n218), .Y(n269) );
  NAND2X1 U79 ( .A(A[5]), .B(n223), .Y(n240) );
  INVX1 U80 ( .A(B[15]), .Y(n216) );
  INVX1 U81 ( .A(B[9]), .Y(n220) );
  XNOR2X1 U82 ( .A(n256), .B(n257), .Y(DIFF[1]) );
  NAND2X1 U83 ( .A(n258), .B(n255), .Y(n256) );
  XNOR2X1 U84 ( .A(n228), .B(n229), .Y(DIFF[8]) );
  NAND2X1 U85 ( .A(n230), .B(n208), .Y(n228) );
  INVX1 U86 ( .A(B[8]), .Y(n221) );
  XNOR2X1 U87 ( .A(n243), .B(n244), .Y(DIFF[4]) );
  NOR2X1 U88 ( .A(n212), .B(n242), .Y(n244) );
  INVX1 U89 ( .A(B[13]), .Y(n217) );
  INVX1 U90 ( .A(B[10]), .Y(n219) );
  INVX1 U91 ( .A(B[4]), .Y(n224) );
  INVX1 U92 ( .A(B[12]), .Y(n218) );
  NAND2X1 U93 ( .A(n254), .B(n255), .Y(n249) );
  NAND2X1 U94 ( .A(A[8]), .B(n221), .Y(n230) );
  XOR2X1 U95 ( .A(n270), .B(n271), .Y(DIFF[15]) );
  NAND2BX1 U96 ( .AN(n262), .B(n264), .Y(n270) );
  NOR2X1 U97 ( .A(n266), .B(n272), .Y(n271) );
  AOI211X1 U98 ( .A0(n273), .A1(n274), .B0(n275), .C0(n261), .Y(n272) );
  NAND2BX1 U99 ( .AN(A[11]), .B(B[11]), .Y(n283) );
  NAND2X1 U100 ( .A(n248), .B(n251), .Y(n301) );
  OAI21XL U101 ( .A0(B[0]), .A1(n215), .B0(n257), .Y(DIFF[0]) );
  NAND2X1 U102 ( .A(n257), .B(n258), .Y(n254) );
  NOR2BX1 U103 ( .AN(n255), .B(n250), .Y(n300) );
  INVX1 U104 ( .A(n245), .Y(n212) );
  OAI21XL U105 ( .A0(n243), .A1(n296), .B0(n297), .Y(n229) );
  NAND4BXL U106 ( .AN(n242), .B(n236), .C(n234), .D(n211), .Y(n296) );
  AOI32X1 U107 ( .A0(n298), .A1(n234), .A2(n236), .B0(n222), .B1(A[7]), .Y(
        n297) );
  INVX1 U108 ( .A(B[7]), .Y(n222) );
  NOR2X1 U109 ( .A(n224), .B(A[4]), .Y(n242) );
  INVX1 U110 ( .A(A[7]), .Y(n209) );
  INVX1 U111 ( .A(A[0]), .Y(n215) );
  NAND2X1 U112 ( .A(B[7]), .B(n209), .Y(n236) );
  XOR2X1 U113 ( .A(n231), .B(n232), .Y(DIFF[7]) );
  OAI21XL U114 ( .A0(B[7]), .A1(n209), .B0(n236), .Y(n231) );
  AOI21X1 U115 ( .A0(n233), .A1(n234), .B0(n235), .Y(n232) );
  NAND2BX1 U116 ( .AN(B[1]), .B(A[1]), .Y(n255) );
  NAND2BX1 U117 ( .AN(B[3]), .B(A[3]), .Y(n252) );
  NAND2BX1 U118 ( .AN(A[3]), .B(B[3]), .Y(n251) );
  NOR2X1 U119 ( .A(n216), .B(A[15]), .Y(n262) );
  NAND2BX1 U120 ( .AN(A[1]), .B(B[1]), .Y(n258) );
  NAND2X1 U121 ( .A(A[15]), .B(n216), .Y(n264) );
  NAND2X1 U122 ( .A(A[4]), .B(n224), .Y(n245) );
  XNOR2X1 U123 ( .A(B[16]), .B(A[16]), .Y(n260) );
endmodule


module butterfly_DW01_sub_13 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n173, n174, n175, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n176, n278, n279, n280, n281, n282,
         n283, n284, n285, n286;

  AND2X2 U35 ( .A(n248), .B(n249), .Y(n236) );
  NAND2X2 U3 ( .A(n283), .B(n284), .Y(DIFF[13]) );
  INVX1 U4 ( .A(n238), .Y(n175) );
  INVX2 U5 ( .A(n256), .Y(n281) );
  NAND2BX2 U6 ( .AN(A[11]), .B(B[11]), .Y(n260) );
  NOR2BX1 U7 ( .AN(A[11]), .B(B[11]), .Y(n262) );
  NAND2X2 U8 ( .A(n174), .B(n285), .Y(n256) );
  INVX1 U9 ( .A(n267), .Y(n176) );
  AOI2BB1XL U10 ( .A0N(n201), .A1N(n266), .B0(n182), .Y(n269) );
  INVX1 U11 ( .A(A[10]), .Y(n181) );
  INVX1 U12 ( .A(n202), .Y(n182) );
  NOR2X1 U13 ( .A(n196), .B(A[5]), .Y(n212) );
  NOR2X1 U14 ( .A(n192), .B(A[13]), .Y(n239) );
  INVX1 U15 ( .A(A[8]), .Y(n184) );
  INVX1 U16 ( .A(n266), .Y(n183) );
  AND2X2 U17 ( .A(n245), .B(n246), .Y(n216) );
  INVX1 U18 ( .A(n212), .Y(n188) );
  NAND2BX1 U19 ( .AN(A[14]), .B(B[14]), .Y(n249) );
  NAND2X1 U20 ( .A(n286), .B(n258), .Y(DIFF[12]) );
  NAND2X1 U21 ( .A(n281), .B(n257), .Y(n284) );
  INVX1 U22 ( .A(n257), .Y(n282) );
  NAND2X2 U23 ( .A(n279), .B(n280), .Y(DIFF[11]) );
  NAND2X1 U24 ( .A(n267), .B(n278), .Y(n279) );
  NAND2X1 U25 ( .A(n176), .B(n268), .Y(n280) );
  XNOR2X1 U26 ( .A(B[16]), .B(A[16]), .Y(n230) );
  OAI31X1 U27 ( .A0(n254), .A1(n255), .A2(n239), .B0(n237), .Y(n252) );
  AOI211XL U28 ( .A0(n219), .A1(n214), .B0(n212), .C0(n211), .Y(n274) );
  OAI21XL U29 ( .A0(n212), .A1(n213), .B0(n214), .Y(n208) );
  INVXL U30 ( .A(n268), .Y(n278) );
  NOR2BXL U31 ( .AN(n260), .B(n262), .Y(n268) );
  NAND2X1 U32 ( .A(A[5]), .B(n196), .Y(n214) );
  OAI32X1 U33 ( .A0(n273), .A1(n209), .A2(n274), .B0(A[7]), .B1(n195), .Y(n272) );
  NAND2X1 U34 ( .A(n256), .B(n282), .Y(n283) );
  NAND2XL U36 ( .A(n173), .B(n237), .Y(n257) );
  OAI21XL U37 ( .A0(n234), .A1(n235), .B0(n236), .Y(n233) );
  NOR2X1 U38 ( .A(n193), .B(A[12]), .Y(n255) );
  NAND2X1 U39 ( .A(A[4]), .B(n197), .Y(n219) );
  NOR2XL U40 ( .A(n197), .B(A[4]), .Y(n217) );
  NAND2X1 U41 ( .A(B[0]), .B(n191), .Y(n226) );
  NAND2BXL U42 ( .AN(B[15]), .B(A[15]), .Y(n232) );
  NAND2X1 U43 ( .A(n285), .B(n254), .Y(n286) );
  INVXL U44 ( .A(n255), .Y(n285) );
  INVX1 U45 ( .A(n254), .Y(n174) );
  INVXL U46 ( .A(n264), .Y(n179) );
  AOI21XL U47 ( .A0(n252), .A1(n249), .B0(n235), .Y(n251) );
  NOR2BX2 U48 ( .AN(A[14]), .B(B[14]), .Y(n235) );
  NAND2BX1 U49 ( .AN(A[15]), .B(B[15]), .Y(n248) );
  OAI21X2 U50 ( .A0(n204), .A1(n244), .B0(n241), .Y(n259) );
  INVXL U51 ( .A(n244), .Y(n177) );
  NAND2BXL U52 ( .AN(n222), .B(n224), .Y(n225) );
  XOR2X2 U53 ( .A(n250), .B(n251), .Y(DIFF[15]) );
  AOI2BB1X2 U54 ( .A0N(n216), .A1N(n247), .B0(n185), .Y(n204) );
  NOR2BX2 U55 ( .AN(B[6]), .B(A[6]), .Y(n211) );
  AOI31X2 U56 ( .A0(n180), .A1(n260), .A2(n261), .B0(n262), .Y(n241) );
  INVX2 U57 ( .A(n263), .Y(n180) );
  AOI211X2 U58 ( .A0(n205), .A1(n183), .B0(n182), .C0(n264), .Y(n263) );
  XNOR2XL U59 ( .A(n203), .B(n204), .Y(DIFF[8]) );
  AOI21XL U60 ( .A0(n184), .A1(B[8]), .B0(n205), .Y(n203) );
  NAND2XL U61 ( .A(A[13]), .B(n192), .Y(n237) );
  NAND3XL U62 ( .A(n190), .B(n226), .C(n276), .Y(n246) );
  AOI21XL U63 ( .A0(A[1]), .A1(n199), .B0(n228), .Y(n227) );
  AOI22XL U64 ( .A0(n199), .A1(A[1]), .B0(n190), .B1(n226), .Y(n223) );
  INVX2 U65 ( .A(n272), .Y(n185) );
  XOR2X2 U66 ( .A(n229), .B(n230), .Y(DIFF[16]) );
  NOR2X1 U67 ( .A(n259), .B(n175), .Y(n254) );
  OAI21XL U68 ( .A0(n175), .A1(n255), .B0(n259), .Y(n258) );
  XNOR2X1 U69 ( .A(n253), .B(n252), .Y(DIFF[14]) );
  NAND2BX1 U70 ( .AN(n235), .B(n249), .Y(n253) );
  XOR2X1 U71 ( .A(n200), .B(n201), .Y(DIFF[9]) );
  NAND2X1 U72 ( .A(n183), .B(n202), .Y(n200) );
  XOR2X1 U73 ( .A(n270), .B(n269), .Y(DIFF[10]) );
  NAND2X1 U74 ( .A(n261), .B(n179), .Y(n270) );
  INVX1 U75 ( .A(n211), .Y(n187) );
  AOI21X1 U76 ( .A0(n237), .A1(n238), .B0(n239), .Y(n234) );
  XOR2X1 U77 ( .A(n208), .B(n210), .Y(DIFF[6]) );
  NOR2X1 U78 ( .A(n209), .B(n211), .Y(n210) );
  XOR2X1 U79 ( .A(n215), .B(n213), .Y(DIFF[5]) );
  NAND2X1 U80 ( .A(n188), .B(n214), .Y(n215) );
  AOI2BB1X1 U81 ( .A0N(n216), .A1N(n217), .B0(n189), .Y(n213) );
  INVX1 U82 ( .A(n228), .Y(n190) );
  INVX1 U83 ( .A(n239), .Y(n173) );
  XNOR2X1 U84 ( .A(n216), .B(n218), .Y(DIFF[4]) );
  NOR2X1 U85 ( .A(n217), .B(n189), .Y(n218) );
  XOR2X1 U86 ( .A(n225), .B(n223), .Y(DIFF[2]) );
  INVX1 U87 ( .A(n219), .Y(n189) );
  OAI21XL U88 ( .A0(n178), .A1(n269), .B0(n179), .Y(n267) );
  INVX1 U89 ( .A(n261), .Y(n178) );
  NAND2X1 U90 ( .A(n232), .B(n248), .Y(n250) );
  NAND4X1 U91 ( .A(n265), .B(n261), .C(n183), .D(n260), .Y(n244) );
  NAND2X1 U92 ( .A(B[8]), .B(n184), .Y(n265) );
  NOR2X1 U93 ( .A(n184), .B(B[8]), .Y(n205) );
  NOR2BX1 U94 ( .AN(A[6]), .B(B[6]), .Y(n209) );
  NAND2X1 U95 ( .A(B[10]), .B(n181), .Y(n261) );
  AOI2BB1X1 U96 ( .A0N(n204), .A1N(n271), .B0(n205), .Y(n201) );
  NOR2BX1 U97 ( .AN(B[8]), .B(A[8]), .Y(n271) );
  NAND4X1 U98 ( .A(n236), .B(n240), .C(n173), .D(n285), .Y(n231) );
  NAND2X1 U99 ( .A(n241), .B(n242), .Y(n240) );
  OAI21XL U100 ( .A0(n243), .A1(n185), .B0(n177), .Y(n242) );
  AOI21X1 U101 ( .A0(n245), .A1(n246), .B0(n247), .Y(n243) );
  NOR2X1 U102 ( .A(n181), .B(B[10]), .Y(n264) );
  NOR2X1 U103 ( .A(n194), .B(A[9]), .Y(n266) );
  NAND2X1 U104 ( .A(A[12]), .B(n193), .Y(n238) );
  NAND2X1 U105 ( .A(A[9]), .B(n194), .Y(n202) );
  NOR2BX1 U106 ( .AN(B[2]), .B(A[2]), .Y(n222) );
  NAND2BX1 U107 ( .AN(B[2]), .B(A[2]), .Y(n224) );
  NOR2X1 U108 ( .A(n199), .B(A[1]), .Y(n228) );
  XOR2X1 U109 ( .A(n226), .B(n227), .Y(DIFF[1]) );
  INVX1 U110 ( .A(B[13]), .Y(n192) );
  INVX1 U111 ( .A(B[12]), .Y(n193) );
  INVX1 U112 ( .A(B[9]), .Y(n194) );
  INVX1 U113 ( .A(B[5]), .Y(n196) );
  NAND3X1 U114 ( .A(n231), .B(n232), .C(n233), .Y(n229) );
  AOI22X1 U115 ( .A0(n198), .A1(A[3]), .B0(n277), .B1(n276), .Y(n245) );
  OAI2BB1X1 U116 ( .A0N(A[1]), .A1N(n199), .B0(n224), .Y(n277) );
  AOI2BB1X1 U117 ( .A0N(A[3]), .A1N(n198), .B0(n222), .Y(n276) );
  NAND4BXL U118 ( .AN(n217), .B(n275), .C(n187), .D(n188), .Y(n247) );
  NAND2X1 U119 ( .A(B[7]), .B(n186), .Y(n275) );
  NOR2X1 U120 ( .A(B[7]), .B(n186), .Y(n273) );
  INVX1 U121 ( .A(A[7]), .Y(n186) );
  XOR2X1 U122 ( .A(n206), .B(n207), .Y(DIFF[7]) );
  XNOR2X1 U123 ( .A(n195), .B(A[7]), .Y(n207) );
  AOI21X1 U124 ( .A0(n208), .A1(n187), .B0(n209), .Y(n206) );
  XOR2X1 U125 ( .A(n220), .B(n221), .Y(DIFF[3]) );
  XNOR2X1 U126 ( .A(A[3]), .B(B[3]), .Y(n221) );
  OAI21XL U127 ( .A0(n222), .A1(n223), .B0(n224), .Y(n220) );
  OAI21X1 U128 ( .A0(B[0]), .A1(n191), .B0(n226), .Y(DIFF[0]) );
  INVX1 U129 ( .A(B[1]), .Y(n199) );
  INVX1 U130 ( .A(B[4]), .Y(n197) );
  INVX1 U131 ( .A(B[7]), .Y(n195) );
  INVX1 U132 ( .A(B[3]), .Y(n198) );
  INVX1 U133 ( .A(A[0]), .Y(n191) );
endmodule


module butterfly_DW01_add_25 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n223, n245, n246, n247, n248, n249, n250;

  AND2X2 U37 ( .A(B[14]), .B(A[14]), .Y(n212) );
  AND2X2 U41 ( .A(B[13]), .B(A[13]), .Y(n213) );
  NAND4BX1 U2 ( .AN(n185), .B(n170), .C(n194), .D(n241), .Y(n240) );
  NOR2X2 U3 ( .A(B[6]), .B(A[6]), .Y(n185) );
  XOR2X2 U4 ( .A(n218), .B(n219), .Y(SUM[15]) );
  AOI2BB1X2 U5 ( .A0N(n220), .A1N(n210), .B0(n212), .Y(n219) );
  NOR2X1 U6 ( .A(B[9]), .B(A[9]), .Y(n233) );
  NAND2X1 U7 ( .A(B[8]), .B(A[8]), .Y(n181) );
  NAND2X1 U8 ( .A(B[0]), .B(A[0]), .Y(n202) );
  NAND2X1 U9 ( .A(B[4]), .B(A[4]), .Y(n193) );
  OAI2BB1X1 U10 ( .A0N(A[3]), .A1N(B[3]), .B0(n242), .Y(n194) );
  OAI221XL U11 ( .A0(B[3]), .A1(A[3]), .B0(n199), .B1(n198), .C0(n173), .Y(
        n242) );
  NAND2X1 U12 ( .A(n246), .B(n224), .Y(SUM[13]) );
  XOR2X1 U13 ( .A(A[13]), .B(B[13]), .Y(n223) );
  NAND2X1 U14 ( .A(n223), .B(n245), .Y(n246) );
  INVXL U15 ( .A(n222), .Y(n245) );
  OAI21X4 U16 ( .A0(n215), .A1(n214), .B0(n217), .Y(n222) );
  NAND2X4 U17 ( .A(n206), .B(n248), .Y(n249) );
  NAND2X2 U18 ( .A(n247), .B(n207), .Y(n250) );
  NAND2X4 U19 ( .A(n249), .B(n250), .Y(SUM[16]) );
  INVXL U20 ( .A(n206), .Y(n247) );
  INVXL U21 ( .A(n207), .Y(n248) );
  AOI21X2 U22 ( .A0(B[15]), .A1(A[15]), .B0(n208), .Y(n207) );
  INVXL U23 ( .A(n190), .Y(n170) );
  NAND2XL U24 ( .A(B[9]), .B(A[9]), .Y(n177) );
  OR2XL U25 ( .A(B[8]), .B(A[8]), .Y(n180) );
  XNOR2X1 U26 ( .A(n214), .B(n225), .Y(SUM[12]) );
  OAI21X2 U27 ( .A0(n238), .A1(n239), .B0(n240), .Y(n179) );
  XNOR2X1 U28 ( .A(B[16]), .B(A[16]), .Y(n206) );
  AOI21X2 U29 ( .A0(n165), .A1(n222), .B0(n213), .Y(n220) );
  AOI21XL U30 ( .A0(n170), .A1(n188), .B0(n171), .Y(n184) );
  NOR2XL U31 ( .A(n199), .B(n201), .Y(n200) );
  INVXL U32 ( .A(n191), .Y(n171) );
  NAND2X2 U33 ( .A(n226), .B(n227), .Y(n214) );
  AND2X1 U34 ( .A(B[6]), .B(A[6]), .Y(n186) );
  AOI21XL U35 ( .A0(n180), .A1(n179), .B0(n169), .Y(n176) );
  AND2X1 U36 ( .A(B[2]), .B(A[2]), .Y(n199) );
  NAND2BXL U38 ( .AN(n204), .B(n205), .Y(n203) );
  NOR2XL U39 ( .A(A[7]), .B(B[7]), .Y(n239) );
  NAND2XL U40 ( .A(B[1]), .B(A[1]), .Y(n205) );
  OR2XL U42 ( .A(A[11]), .B(B[11]), .Y(n227) );
  AOI21XL U43 ( .A0(n198), .A1(n173), .B0(n199), .Y(n197) );
  INVX1 U44 ( .A(n233), .Y(n168) );
  INVX1 U45 ( .A(n177), .Y(n167) );
  OAI32X1 U46 ( .A0(n214), .A1(n215), .A2(n216), .B0(n216), .B1(n217), .Y(n211) );
  XOR2X1 U47 ( .A(n221), .B(n220), .Y(SUM[14]) );
  OR2X2 U48 ( .A(n212), .B(n210), .Y(n221) );
  AOI211X1 U49 ( .A0(n193), .A1(n191), .B0(n190), .C0(n185), .Y(n243) );
  INVX1 U50 ( .A(n216), .Y(n165) );
  NOR2BX1 U51 ( .AN(n217), .B(n215), .Y(n225) );
  XNOR2X1 U52 ( .A(n237), .B(n236), .Y(SUM[10]) );
  NAND2X1 U53 ( .A(n232), .B(n231), .Y(n237) );
  XOR2X1 U54 ( .A(n175), .B(n176), .Y(SUM[9]) );
  NAND2X1 U55 ( .A(n168), .B(n177), .Y(n175) );
  OAI21XL U56 ( .A0(n176), .A1(n233), .B0(n177), .Y(n236) );
  INVX1 U57 ( .A(n201), .Y(n173) );
  INVX1 U58 ( .A(n181), .Y(n169) );
  XOR2X1 U59 ( .A(n188), .B(n189), .Y(SUM[5]) );
  NOR2X1 U60 ( .A(n171), .B(n190), .Y(n189) );
  XOR2X1 U61 ( .A(n187), .B(n184), .Y(SUM[6]) );
  OR2X2 U62 ( .A(n186), .B(n185), .Y(n187) );
  XOR2X1 U63 ( .A(n198), .B(n200), .Y(SUM[2]) );
  XNOR2X1 U64 ( .A(A[15]), .B(B[15]), .Y(n218) );
  AOI211X1 U65 ( .A0(n164), .A1(n174), .B0(n209), .C0(n210), .Y(n208) );
  INVX1 U66 ( .A(B[15]), .Y(n174) );
  INVX1 U67 ( .A(A[15]), .Y(n164) );
  NOR3X1 U68 ( .A(n211), .B(n212), .C(n213), .Y(n209) );
  NOR2X1 U69 ( .A(B[13]), .B(A[13]), .Y(n216) );
  NOR2X1 U70 ( .A(A[5]), .B(B[5]), .Y(n190) );
  OR2X2 U71 ( .A(A[10]), .B(B[10]), .Y(n232) );
  NAND4X1 U72 ( .A(n228), .B(n229), .C(n230), .D(n231), .Y(n226) );
  OAI211X1 U73 ( .A0(n169), .A1(n167), .B0(n168), .C0(n232), .Y(n228) );
  NAND4X1 U74 ( .A(n168), .B(n179), .C(n180), .D(n232), .Y(n229) );
  NAND2X1 U75 ( .A(B[5]), .B(A[5]), .Y(n191) );
  OAI21XL U76 ( .A0(n213), .A1(n216), .B0(n222), .Y(n224) );
  XNOR2X1 U77 ( .A(n178), .B(n179), .Y(SUM[8]) );
  NAND2X1 U78 ( .A(n180), .B(n181), .Y(n178) );
  XOR2X1 U79 ( .A(n234), .B(n235), .Y(SUM[11]) );
  NAND2X1 U80 ( .A(n227), .B(n230), .Y(n234) );
  AOI21X1 U81 ( .A0(n236), .A1(n232), .B0(n166), .Y(n235) );
  INVX1 U82 ( .A(n231), .Y(n166) );
  OAI21XL U83 ( .A0(n204), .A1(n202), .B0(n205), .Y(n198) );
  NOR2X1 U84 ( .A(B[12]), .B(A[12]), .Y(n215) );
  NOR2X1 U85 ( .A(B[4]), .B(A[4]), .Y(n192) );
  NOR2X1 U86 ( .A(A[14]), .B(B[14]), .Y(n210) );
  NOR2X1 U87 ( .A(B[2]), .B(A[2]), .Y(n201) );
  NAND2X1 U88 ( .A(B[10]), .B(A[10]), .Y(n231) );
  NAND2X1 U89 ( .A(B[12]), .B(A[12]), .Y(n217) );
  XNOR2X1 U90 ( .A(n195), .B(n194), .Y(SUM[4]) );
  NAND2BX1 U91 ( .AN(n192), .B(n193), .Y(n195) );
  OAI21XL U92 ( .A0(n172), .A1(n192), .B0(n193), .Y(n188) );
  INVX1 U93 ( .A(n194), .Y(n172) );
  XOR2X1 U94 ( .A(n202), .B(n203), .Y(SUM[1]) );
  AOI211X1 U95 ( .A0(B[7]), .A1(A[7]), .B0(n186), .C0(n243), .Y(n238) );
  AOI2BB1X1 U96 ( .A0N(A[7]), .A1N(B[7]), .B0(n192), .Y(n241) );
  NAND2X1 U97 ( .A(B[11]), .B(A[11]), .Y(n230) );
  NOR2X1 U98 ( .A(B[1]), .B(A[1]), .Y(n204) );
  XOR2X1 U99 ( .A(n182), .B(n183), .Y(SUM[7]) );
  XNOR2X1 U100 ( .A(A[7]), .B(B[7]), .Y(n182) );
  AOI2BB1X1 U101 ( .A0N(n184), .A1N(n185), .B0(n186), .Y(n183) );
  XOR2X1 U102 ( .A(n196), .B(n197), .Y(SUM[3]) );
  XNOR2X1 U103 ( .A(A[3]), .B(B[3]), .Y(n196) );
  INVX1 U104 ( .A(n244), .Y(SUM[0]) );
  OAI21XL U105 ( .A0(B[0]), .A1(A[0]), .B0(n202), .Y(n244) );
endmodule


module butterfly_DW01_add_36 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248;

  AND2X2 U13 ( .A(n181), .B(n183), .Y(n185) );
  AND2X2 U41 ( .A(B[14]), .B(A[14]), .Y(n209) );
  XOR2X4 U43 ( .A(n226), .B(n227), .Y(SUM[13]) );
  OAI21X4 U53 ( .A0(n230), .A1(n231), .B0(n217), .Y(n229) );
  AOI211X2 U54 ( .A0(n220), .A1(n221), .B0(n160), .C0(n161), .Y(n231) );
  AOI21X4 U78 ( .A0(A[3]), .A1(B[3]), .B0(n166), .Y(n186) );
  AND2X2 U84 ( .A(B[2]), .B(A[2]), .Y(n193) );
  NAND2XL U2 ( .A(B[4]), .B(A[4]), .Y(n188) );
  NOR2XL U3 ( .A(B[4]), .B(A[4]), .Y(n187) );
  INVX1 U4 ( .A(n196), .Y(n247) );
  OAI21X1 U5 ( .A0(n170), .A1(n232), .B0(n171), .Y(n235) );
  AOI21X2 U6 ( .A0(n173), .A1(n174), .B0(n163), .Y(n170) );
  BUFX3 U7 ( .A(n182), .Y(n245) );
  OAI2BB1X4 U8 ( .A0N(n181), .A1N(n245), .B0(n183), .Y(n178) );
  NAND4X4 U9 ( .A(n221), .B(n162), .C(n174), .D(n173), .Y(n218) );
  OAI32X4 U10 ( .A0(n238), .A1(n186), .A2(n187), .B0(n239), .B1(n240), .Y(n173) );
  NOR2X1 U11 ( .A(B[9]), .B(A[9]), .Y(n232) );
  INVXL U12 ( .A(n175), .Y(n163) );
  INVX2 U14 ( .A(n198), .Y(n246) );
  NOR2X2 U15 ( .A(n206), .B(n156), .Y(n227) );
  XOR2X1 U16 ( .A(n210), .B(n211), .Y(SUM[15]) );
  OAI21XL U17 ( .A0(n225), .A1(n224), .B0(n228), .Y(SUM[12]) );
  OR2X2 U18 ( .A(B[6]), .B(A[6]), .Y(n179) );
  XNOR2X1 U19 ( .A(n237), .B(n235), .Y(SUM[10]) );
  NAND2X1 U20 ( .A(B[0]), .B(A[0]), .Y(n196) );
  XOR2X1 U21 ( .A(n190), .B(n191), .Y(SUM[3]) );
  AOI21X1 U22 ( .A0(n192), .A1(n167), .B0(n193), .Y(n191) );
  NAND2X1 U23 ( .A(B[1]), .B(A[1]), .Y(n199) );
  NAND2X4 U24 ( .A(n248), .B(n199), .Y(n192) );
  XOR2X1 U25 ( .A(n192), .B(n194), .Y(SUM[2]) );
  CLKINVX4 U26 ( .A(n243), .Y(n166) );
  OAI221X2 U27 ( .A0(B[3]), .A1(A[3]), .B0(n193), .B1(n192), .C0(n167), .Y(
        n243) );
  NAND2X1 U28 ( .A(n246), .B(n247), .Y(n248) );
  INVX1 U29 ( .A(n236), .Y(n161) );
  NAND2XL U30 ( .A(n162), .B(n171), .Y(n169) );
  XOR2X1 U31 ( .A(n222), .B(n223), .Y(SUM[14]) );
  NOR2XL U32 ( .A(B[2]), .B(A[2]), .Y(n195) );
  NAND2X1 U33 ( .A(n159), .B(n217), .Y(n233) );
  NAND2X2 U34 ( .A(n158), .B(n213), .Y(n224) );
  OR2X2 U35 ( .A(n204), .B(n209), .Y(n222) );
  AOI31XL U36 ( .A0(n157), .A1(n208), .A2(n224), .B0(n155), .Y(n223) );
  NOR2XL U37 ( .A(n225), .B(n158), .Y(n206) );
  INVX1 U38 ( .A(n213), .Y(n156) );
  INVX1 U39 ( .A(n230), .Y(n159) );
  INVXL U40 ( .A(n229), .Y(n158) );
  XOR2X2 U42 ( .A(n233), .B(n234), .Y(SUM[11]) );
  AOI21XL U44 ( .A0(n221), .A1(n235), .B0(n161), .Y(n234) );
  XOR2XL U45 ( .A(n169), .B(n170), .Y(SUM[9]) );
  XOR2XL U46 ( .A(n189), .B(n186), .Y(SUM[4]) );
  NAND2BXL U47 ( .AN(n187), .B(n188), .Y(n189) );
  XNOR2XL U48 ( .A(n172), .B(n173), .Y(SUM[8]) );
  NAND2XL U49 ( .A(n174), .B(n175), .Y(n172) );
  NOR2XL U50 ( .A(n193), .B(n195), .Y(n194) );
  NAND3XL U51 ( .A(n217), .B(n218), .C(n219), .Y(n216) );
  AOI21XL U52 ( .A0(n220), .A1(n221), .B0(n161), .Y(n219) );
  AOI211XL U55 ( .A0(n156), .A1(n208), .B0(n209), .C0(n155), .Y(n205) );
  INVXL U56 ( .A(n225), .Y(n157) );
  NOR2X4 U57 ( .A(B[1]), .B(A[1]), .Y(n198) );
  NAND2XL U58 ( .A(B[6]), .B(A[6]), .Y(n184) );
  INVX1 U59 ( .A(n242), .Y(n165) );
  OAI21XL U60 ( .A0(n225), .A1(n156), .B0(n229), .Y(n228) );
  CLKINVX3 U61 ( .A(n218), .Y(n160) );
  OAI21XL U62 ( .A0(n186), .A1(n187), .B0(n188), .Y(n182) );
  NAND2X1 U63 ( .A(n236), .B(n221), .Y(n237) );
  NAND2X1 U64 ( .A(n208), .B(n214), .Y(n226) );
  XNOR2X1 U65 ( .A(n180), .B(n178), .Y(SUM[6]) );
  NAND2X1 U66 ( .A(n179), .B(n184), .Y(n180) );
  XOR2X1 U67 ( .A(n245), .B(n185), .Y(SUM[5]) );
  NAND2X1 U68 ( .A(n179), .B(n181), .Y(n242) );
  AOI21X1 U69 ( .A0(n183), .A1(n188), .B0(n242), .Y(n241) );
  INVX1 U70 ( .A(n195), .Y(n167) );
  OAI21XL U71 ( .A0(n232), .A1(n175), .B0(n171), .Y(n220) );
  OAI21XL U72 ( .A0(n154), .A1(n168), .B0(n203), .Y(n210) );
  AOI21X1 U73 ( .A0(n207), .A1(n212), .B0(n209), .Y(n211) );
  NAND3X1 U74 ( .A(n213), .B(n214), .C(n215), .Y(n212) );
  XOR2X1 U75 ( .A(n196), .B(n197), .Y(SUM[1]) );
  NAND2BX1 U76 ( .AN(n198), .B(n199), .Y(n197) );
  INVX1 U77 ( .A(n232), .Y(n162) );
  NAND3X1 U79 ( .A(n159), .B(n157), .C(n216), .Y(n215) );
  INVX1 U80 ( .A(n184), .Y(n164) );
  NOR2BX1 U81 ( .AN(n208), .B(n204), .Y(n207) );
  NAND2X1 U82 ( .A(n168), .B(n154), .Y(n203) );
  INVX1 U83 ( .A(n214), .Y(n155) );
  INVX1 U85 ( .A(B[15]), .Y(n168) );
  NOR2X1 U86 ( .A(A[7]), .B(B[7]), .Y(n240) );
  AOI211X1 U87 ( .A0(B[7]), .A1(A[7]), .B0(n164), .C0(n241), .Y(n239) );
  OAI21XL U88 ( .A0(B[7]), .A1(A[7]), .B0(n165), .Y(n238) );
  XOR2X1 U89 ( .A(n176), .B(n177), .Y(SUM[7]) );
  XNOR2X1 U90 ( .A(A[7]), .B(B[7]), .Y(n176) );
  AOI21X1 U91 ( .A0(n178), .A1(n179), .B0(n164), .Y(n177) );
  NAND2X1 U92 ( .A(B[5]), .B(A[5]), .Y(n183) );
  XOR2X1 U93 ( .A(n200), .B(n201), .Y(SUM[16]) );
  XNOR2X1 U94 ( .A(B[16]), .B(A[16]), .Y(n200) );
  AOI22X1 U95 ( .A0(n202), .A1(n203), .B0(B[15]), .B1(A[15]), .Y(n201) );
  OAI2BB2X1 U96 ( .B0(n204), .B1(n205), .A0N(n206), .A1N(n207), .Y(n202) );
  OR2X2 U97 ( .A(B[5]), .B(A[5]), .Y(n181) );
  OR2X2 U98 ( .A(B[10]), .B(A[10]), .Y(n221) );
  XNOR2X1 U99 ( .A(A[3]), .B(B[3]), .Y(n190) );
  NAND2X1 U100 ( .A(B[8]), .B(A[8]), .Y(n175) );
  NAND2X1 U101 ( .A(B[10]), .B(A[10]), .Y(n236) );
  OR2X2 U102 ( .A(B[8]), .B(A[8]), .Y(n174) );
  INVX1 U103 ( .A(n244), .Y(SUM[0]) );
  OAI21XL U104 ( .A0(B[0]), .A1(A[0]), .B0(n196), .Y(n244) );
  NOR2X1 U105 ( .A(B[12]), .B(A[12]), .Y(n225) );
  NAND2X1 U106 ( .A(B[11]), .B(A[11]), .Y(n217) );
  NOR2X1 U107 ( .A(B[11]), .B(A[11]), .Y(n230) );
  NAND2X1 U108 ( .A(B[12]), .B(A[12]), .Y(n213) );
  NAND2X1 U109 ( .A(B[9]), .B(A[9]), .Y(n171) );
  OR2X2 U110 ( .A(B[13]), .B(A[13]), .Y(n208) );
  NOR2X1 U111 ( .A(A[14]), .B(B[14]), .Y(n204) );
  INVX1 U112 ( .A(A[15]), .Y(n154) );
  NAND2X1 U113 ( .A(B[13]), .B(A[13]), .Y(n214) );
endmodule


module butterfly_DW01_add_34 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249;

  AND2X2 U80 ( .A(B[2]), .B(A[2]), .Y(n198) );
  AND2X2 U88 ( .A(B[6]), .B(A[6]), .Y(n185) );
  INVX1 U2 ( .A(n234), .Y(n165) );
  OAI211X1 U3 ( .A0(n235), .A1(n223), .B0(n236), .C0(n222), .Y(n234) );
  OAI211X1 U4 ( .A0(n167), .A1(n225), .B0(n226), .C0(n166), .Y(n236) );
  OAI21XL U5 ( .A0(n175), .A1(n237), .B0(n176), .Y(n240) );
  AOI31X1 U6 ( .A0(n217), .A1(n218), .A2(n219), .B0(n220), .Y(n216) );
  NAND3X1 U7 ( .A(n166), .B(n164), .C(n221), .Y(n218) );
  NAND3X1 U8 ( .A(n222), .B(n223), .C(n224), .Y(n221) );
  AOI21X1 U9 ( .A0(n225), .A1(n226), .B0(n167), .Y(n224) );
  OAI21XL U10 ( .A0(n230), .A1(n229), .B0(n233), .Y(SUM[12]) );
  OAI21XL U11 ( .A0(n230), .A1(n163), .B0(n234), .Y(n233) );
  AOI21X1 U12 ( .A0(n170), .A1(n187), .B0(n171), .Y(n183) );
  OAI21XL U13 ( .A0(n237), .A1(n180), .B0(n176), .Y(n225) );
  NOR2X1 U14 ( .A(n230), .B(n165), .Y(n212) );
  INVX1 U15 ( .A(n213), .Y(n161) );
  INVX1 U16 ( .A(n219), .Y(n163) );
  XOR2X1 U17 ( .A(n174), .B(n175), .Y(SUM[9]) );
  NAND2X1 U18 ( .A(n168), .B(n176), .Y(n174) );
  XOR2X1 U19 ( .A(n231), .B(n232), .Y(SUM[13]) );
  NAND2X1 U20 ( .A(n217), .B(n161), .Y(n231) );
  NOR2X1 U21 ( .A(n212), .B(n163), .Y(n232) );
  INVX1 U22 ( .A(n235), .Y(n166) );
  INVX1 U23 ( .A(n241), .Y(n167) );
  INVX1 U24 ( .A(n189), .Y(n170) );
  XOR2X1 U25 ( .A(n187), .B(n188), .Y(SUM[5]) );
  NOR2X1 U26 ( .A(n171), .B(n189), .Y(n188) );
  XOR2X1 U27 ( .A(n186), .B(n183), .Y(SUM[6]) );
  OR2X2 U28 ( .A(n185), .B(n184), .Y(n186) );
  XOR2X1 U29 ( .A(n197), .B(n199), .Y(SUM[2]) );
  NOR2X1 U30 ( .A(n198), .B(n200), .Y(n199) );
  XOR2X1 U31 ( .A(n227), .B(n228), .Y(SUM[14]) );
  NAND2X1 U32 ( .A(n160), .B(n208), .Y(n227) );
  AOI31X1 U33 ( .A0(n164), .A1(n161), .A2(n229), .B0(n162), .Y(n228) );
  XNOR2X1 U34 ( .A(n242), .B(n240), .Y(SUM[10]) );
  NAND2X1 U35 ( .A(n241), .B(n226), .Y(n242) );
  NAND2X1 U36 ( .A(n165), .B(n219), .Y(n229) );
  INVX1 U37 ( .A(n230), .Y(n164) );
  INVX1 U38 ( .A(n220), .Y(n160) );
  INVX1 U39 ( .A(n237), .Y(n168) );
  INVX1 U40 ( .A(n190), .Y(n171) );
  XOR2X1 U41 ( .A(n238), .B(n239), .Y(SUM[11]) );
  NAND2X1 U42 ( .A(n166), .B(n222), .Y(n238) );
  AOI21X1 U43 ( .A0(n240), .A1(n226), .B0(n167), .Y(n239) );
  INVX1 U44 ( .A(n200), .Y(n173) );
  INVX1 U45 ( .A(n217), .Y(n162) );
  XOR2X1 U46 ( .A(n205), .B(n206), .Y(SUM[16]) );
  NOR2X1 U47 ( .A(B[12]), .B(A[12]), .Y(n230) );
  OAI21XL U48 ( .A0(n203), .A1(n201), .B0(n204), .Y(n197) );
  NOR2X1 U49 ( .A(B[9]), .B(A[9]), .Y(n237) );
  AOI211X1 U50 ( .A0(n192), .A1(n190), .B0(n189), .C0(n184), .Y(n248) );
  NAND4X1 U51 ( .A(n226), .B(n168), .C(n179), .D(n178), .Y(n223) );
  AOI21X1 U52 ( .A0(n178), .A1(n179), .B0(n169), .Y(n175) );
  INVX1 U53 ( .A(n180), .Y(n169) );
  NOR2X1 U54 ( .A(B[6]), .B(A[6]), .Y(n184) );
  AOI31X1 U55 ( .A0(n207), .A1(n208), .A2(n209), .B0(n210), .Y(n205) );
  OAI21XL U56 ( .A0(n211), .A1(n162), .B0(n160), .Y(n209) );
  AOI2BB1X1 U57 ( .A0N(n163), .A1N(n212), .B0(n213), .Y(n211) );
  OR2X2 U58 ( .A(B[10]), .B(A[10]), .Y(n226) );
  NOR2X1 U59 ( .A(A[5]), .B(B[5]), .Y(n189) );
  OAI21XL U60 ( .A0(n172), .A1(n191), .B0(n192), .Y(n187) );
  INVX1 U61 ( .A(n193), .Y(n172) );
  XOR2X1 U62 ( .A(n214), .B(n215), .Y(SUM[15]) );
  NAND2BX1 U63 ( .AN(n210), .B(n207), .Y(n214) );
  AOI21X1 U64 ( .A0(n216), .A1(n161), .B0(n159), .Y(n215) );
  INVX1 U65 ( .A(n208), .Y(n159) );
  NAND2X1 U66 ( .A(B[8]), .B(A[8]), .Y(n180) );
  NAND2X1 U67 ( .A(B[9]), .B(A[9]), .Y(n176) );
  NAND2X1 U68 ( .A(B[13]), .B(A[13]), .Y(n217) );
  NOR2X1 U69 ( .A(B[13]), .B(A[13]), .Y(n213) );
  NAND2X1 U70 ( .A(B[11]), .B(A[11]), .Y(n222) );
  NAND2X1 U71 ( .A(B[14]), .B(A[14]), .Y(n208) );
  NOR2X1 U72 ( .A(B[2]), .B(A[2]), .Y(n200) );
  NAND2X1 U73 ( .A(B[12]), .B(A[12]), .Y(n219) );
  NOR2X1 U74 ( .A(B[11]), .B(A[11]), .Y(n235) );
  NOR2X1 U75 ( .A(B[14]), .B(A[14]), .Y(n220) );
  XOR2X1 U76 ( .A(n201), .B(n202), .Y(SUM[1]) );
  NAND2BX1 U77 ( .AN(n203), .B(n204), .Y(n202) );
  XNOR2X1 U78 ( .A(n194), .B(n193), .Y(SUM[4]) );
  NAND2BX1 U79 ( .AN(n191), .B(n192), .Y(n194) );
  XNOR2X1 U81 ( .A(n177), .B(n178), .Y(SUM[8]) );
  NAND2X1 U82 ( .A(n179), .B(n180), .Y(n177) );
  OR2X2 U83 ( .A(B[8]), .B(A[8]), .Y(n179) );
  NAND2X1 U84 ( .A(B[10]), .B(A[10]), .Y(n241) );
  NAND2X1 U85 ( .A(B[5]), .B(A[5]), .Y(n190) );
  OAI21XL U86 ( .A0(n243), .A1(n244), .B0(n245), .Y(n178) );
  NAND4BXL U87 ( .AN(n184), .B(n170), .C(n193), .D(n246), .Y(n245) );
  NOR2X1 U89 ( .A(A[7]), .B(B[7]), .Y(n244) );
  AOI211X1 U90 ( .A0(B[7]), .A1(A[7]), .B0(n185), .C0(n248), .Y(n243) );
  XOR2X1 U91 ( .A(n181), .B(n182), .Y(SUM[7]) );
  XNOR2X1 U92 ( .A(A[7]), .B(B[7]), .Y(n181) );
  AOI2BB1X1 U93 ( .A0N(n183), .A1N(n184), .B0(n185), .Y(n182) );
  NOR2X1 U94 ( .A(B[4]), .B(A[4]), .Y(n191) );
  NAND2X1 U95 ( .A(B[0]), .B(A[0]), .Y(n201) );
  XOR2X1 U96 ( .A(n195), .B(n196), .Y(SUM[3]) );
  XNOR2X1 U97 ( .A(A[3]), .B(B[3]), .Y(n195) );
  AOI21X1 U98 ( .A0(n197), .A1(n173), .B0(n198), .Y(n196) );
  OAI2BB1X1 U99 ( .A0N(A[3]), .A1N(B[3]), .B0(n247), .Y(n193) );
  OAI221XL U100 ( .A0(B[3]), .A1(A[3]), .B0(n198), .B1(n197), .C0(n173), .Y(
        n247) );
  NAND2X1 U101 ( .A(B[4]), .B(A[4]), .Y(n192) );
  NOR2X1 U102 ( .A(B[1]), .B(A[1]), .Y(n203) );
  INVX1 U103 ( .A(n249), .Y(SUM[0]) );
  OAI21XL U104 ( .A0(B[0]), .A1(A[0]), .B0(n201), .Y(n249) );
  NAND2X1 U105 ( .A(B[1]), .B(A[1]), .Y(n204) );
  NOR2X1 U106 ( .A(A[15]), .B(B[15]), .Y(n210) );
  NAND2X1 U107 ( .A(B[15]), .B(A[15]), .Y(n207) );
  AOI2BB1X1 U108 ( .A0N(A[7]), .A1N(B[7]), .B0(n191), .Y(n246) );
  XOR2X1 U109 ( .A(B[16]), .B(A[16]), .Y(n206) );
endmodule


module butterfly_DW01_add_37 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n172, n173, n174, n175, n176, n177, n178, n179, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n180, n258, n259;

  AND2X2 U85 ( .A(B[6]), .B(A[6]), .Y(n197) );
  NOR2X1 U2 ( .A(B[10]), .B(A[10]), .Y(n245) );
  XOR2X1 U3 ( .A(n217), .B(n218), .Y(SUM[16]) );
  NOR2X1 U4 ( .A(B[4]), .B(A[4]), .Y(n203) );
  OAI2BB1X1 U5 ( .A0N(n190), .A1N(n259), .B0(n192), .Y(n185) );
  OAI21XL U6 ( .A0(n179), .A1(n188), .B0(n187), .Y(n248) );
  INVX1 U7 ( .A(n185), .Y(n179) );
  NOR2X1 U8 ( .A(B[8]), .B(A[8]), .Y(n191) );
  NAND2X1 U9 ( .A(n242), .B(n243), .Y(n227) );
  OAI21XL U10 ( .A0(n244), .A1(n178), .B0(n230), .Y(n243) );
  XOR2X1 U11 ( .A(n199), .B(n200), .Y(SUM[5]) );
  AOI21X1 U12 ( .A0(n181), .A1(n199), .B0(n182), .Y(n195) );
  OAI31X1 U13 ( .A0(n235), .A1(n228), .A2(n236), .B0(n225), .Y(n233) );
  XOR2X1 U14 ( .A(n207), .B(n208), .Y(SUM[3]) );
  AND2X4 U15 ( .A(B[2]), .B(A[2]), .Y(n210) );
  OR2X4 U16 ( .A(n183), .B(n203), .Y(n180) );
  NAND2X4 U17 ( .A(n180), .B(n204), .Y(n199) );
  CLKINVX3 U18 ( .A(n205), .Y(n183) );
  NAND2X4 U19 ( .A(B[4]), .B(A[4]), .Y(n204) );
  BUFX4 U20 ( .A(n215), .Y(n258) );
  NOR2X1 U21 ( .A(B[1]), .B(A[1]), .Y(n215) );
  NAND2XL U22 ( .A(B[8]), .B(A[8]), .Y(n192) );
  NAND2BXL U23 ( .AN(n258), .B(n216), .Y(n214) );
  AOI21X1 U24 ( .A0(n248), .A1(n177), .B0(n178), .Y(n247) );
  INVX1 U25 ( .A(n191), .Y(n259) );
  OAI21X4 U26 ( .A0(n258), .A1(n213), .B0(n216), .Y(n209) );
  OAI21X4 U27 ( .A0(n251), .A1(n252), .B0(n253), .Y(n190) );
  NOR2BXL U28 ( .AN(n187), .B(n188), .Y(n186) );
  INVXL U29 ( .A(n201), .Y(n181) );
  NAND2XL U30 ( .A(B[1]), .B(A[1]), .Y(n216) );
  OR2X2 U31 ( .A(B[11]), .B(A[11]), .Y(n230) );
  NOR2X1 U32 ( .A(B[13]), .B(A[13]), .Y(n236) );
  NAND3X1 U33 ( .A(n223), .B(n224), .C(n225), .Y(n221) );
  OAI221X2 U34 ( .A0(A[3]), .A1(B[3]), .B0(n210), .B1(n209), .C0(n184), .Y(
        n255) );
  NOR2X1 U35 ( .A(A[12]), .B(B[12]), .Y(n228) );
  OR2XL U36 ( .A(n197), .B(n196), .Y(n198) );
  NOR2XL U37 ( .A(n182), .B(n201), .Y(n200) );
  NAND2BXL U38 ( .AN(n203), .B(n204), .Y(n206) );
  INVXL U39 ( .A(n202), .Y(n182) );
  NOR3XL U40 ( .A(n188), .B(n191), .C(n245), .Y(n229) );
  OAI211XL U41 ( .A0(n226), .A1(n227), .B0(n175), .C0(n176), .Y(n223) );
  AND3X1 U42 ( .A(n229), .B(n190), .C(n230), .Y(n226) );
  NOR2XL U43 ( .A(A[7]), .B(B[7]), .Y(n252) );
  NOR2X2 U44 ( .A(B[2]), .B(A[2]), .Y(n212) );
  OAI2BB1X4 U45 ( .A0N(A[3]), .A1N(B[3]), .B0(n255), .Y(n205) );
  AOI2BB1X2 U46 ( .A0N(A[7]), .A1N(B[7]), .B0(n203), .Y(n254) );
  AOI21XL U47 ( .A0(n209), .A1(n184), .B0(n210), .Y(n208) );
  NAND2XL U48 ( .A(B[10]), .B(A[10]), .Y(n249) );
  INVXL U49 ( .A(n222), .Y(n172) );
  NAND2XL U50 ( .A(B[11]), .B(A[11]), .Y(n242) );
  NAND2XL U51 ( .A(B[13]), .B(A[13]), .Y(n238) );
  AND2X1 U52 ( .A(B[12]), .B(A[12]), .Y(n237) );
  OR2X1 U53 ( .A(B[14]), .B(A[14]), .Y(n220) );
  OR2X1 U54 ( .A(B[15]), .B(A[15]), .Y(n219) );
  XOR2X1 U55 ( .A(n198), .B(n195), .Y(SUM[6]) );
  XNOR2X1 U56 ( .A(n250), .B(n248), .Y(SUM[10]) );
  NAND2X1 U57 ( .A(n249), .B(n177), .Y(n250) );
  XOR2X1 U58 ( .A(n246), .B(n247), .Y(SUM[11]) );
  NAND2X1 U59 ( .A(n230), .B(n242), .Y(n246) );
  AOI31X1 U60 ( .A0(n229), .A1(n190), .A2(n230), .B0(n227), .Y(n235) );
  AOI211X1 U61 ( .A0(n204), .A1(n202), .B0(n201), .C0(n196), .Y(n256) );
  XOR2X1 U62 ( .A(n231), .B(n232), .Y(SUM[15]) );
  NAND2X1 U63 ( .A(n222), .B(n219), .Y(n231) );
  AOI21X1 U64 ( .A0(n233), .A1(n220), .B0(n173), .Y(n232) );
  INVX1 U65 ( .A(n224), .Y(n173) );
  XOR2X1 U66 ( .A(n213), .B(n214), .Y(SUM[1]) );
  XNOR2X1 U67 ( .A(n206), .B(n205), .Y(SUM[4]) );
  XNOR2X1 U68 ( .A(n189), .B(n190), .Y(SUM[8]) );
  NAND2BX1 U69 ( .AN(n191), .B(n192), .Y(n189) );
  XOR2X1 U70 ( .A(n185), .B(n186), .Y(SUM[9]) );
  XOR2X1 U71 ( .A(n239), .B(n240), .Y(SUM[13]) );
  NAND2X1 U72 ( .A(n175), .B(n238), .Y(n239) );
  AOI2BB1X1 U73 ( .A0N(n235), .A1N(n228), .B0(n237), .Y(n240) );
  XNOR2X1 U74 ( .A(n235), .B(n241), .Y(SUM[12]) );
  NOR2X1 U75 ( .A(n228), .B(n237), .Y(n241) );
  XOR2X1 U76 ( .A(n209), .B(n211), .Y(SUM[2]) );
  NOR2X1 U77 ( .A(n210), .B(n212), .Y(n211) );
  XNOR2X1 U78 ( .A(n234), .B(n233), .Y(SUM[14]) );
  NAND2X1 U79 ( .A(n220), .B(n224), .Y(n234) );
  INVX1 U80 ( .A(n212), .Y(n184) );
  AOI211X1 U81 ( .A0(n192), .A1(n187), .B0(n188), .C0(n245), .Y(n244) );
  AOI21X1 U82 ( .A0(n175), .A1(n237), .B0(n174), .Y(n225) );
  INVX1 U83 ( .A(n238), .Y(n174) );
  INVX1 U84 ( .A(n236), .Y(n175) );
  INVX1 U86 ( .A(n245), .Y(n177) );
  INVX1 U87 ( .A(n249), .Y(n178) );
  INVX1 U88 ( .A(n228), .Y(n176) );
  AOI211X1 U89 ( .A0(B[7]), .A1(A[7]), .B0(n197), .C0(n256), .Y(n251) );
  NAND4BXL U90 ( .AN(n196), .B(n181), .C(n205), .D(n254), .Y(n253) );
  NAND2X1 U91 ( .A(B[0]), .B(A[0]), .Y(n213) );
  XOR2X1 U92 ( .A(n193), .B(n194), .Y(SUM[7]) );
  XNOR2X1 U93 ( .A(A[7]), .B(B[7]), .Y(n193) );
  AOI2BB1X1 U94 ( .A0N(n195), .A1N(n196), .B0(n197), .Y(n194) );
  NOR2X1 U95 ( .A(B[9]), .B(A[9]), .Y(n188) );
  NOR2X1 U96 ( .A(B[6]), .B(A[6]), .Y(n196) );
  NOR2X1 U97 ( .A(B[5]), .B(A[5]), .Y(n201) );
  XNOR2X1 U98 ( .A(A[3]), .B(B[3]), .Y(n207) );
  NAND2X1 U99 ( .A(B[9]), .B(A[9]), .Y(n187) );
  INVX1 U100 ( .A(n257), .Y(SUM[0]) );
  OAI21XL U101 ( .A0(B[0]), .A1(A[0]), .B0(n213), .Y(n257) );
  NAND2X1 U102 ( .A(B[5]), .B(A[5]), .Y(n202) );
  XNOR2X1 U103 ( .A(B[16]), .B(A[16]), .Y(n217) );
  AOI31X1 U104 ( .A0(n219), .A1(n220), .A2(n221), .B0(n172), .Y(n218) );
  NAND2X1 U105 ( .A(B[14]), .B(A[14]), .Y(n224) );
  NAND2X1 U106 ( .A(B[15]), .B(A[15]), .Y(n222) );
endmodule


module butterfly_DW01_sub_24 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295;

  AND2X2 U37 ( .A(n248), .B(n252), .Y(n267) );
  CLKINVX3 U3 ( .A(A[4]), .Y(n201) );
  OAI2BB1X1 U4 ( .A0N(n202), .A1N(B[3]), .B0(n239), .Y(n290) );
  NAND2BX1 U5 ( .AN(n281), .B(n215), .Y(n279) );
  NOR3X1 U6 ( .A(n219), .B(n278), .C(n279), .Y(n263) );
  INVX1 U7 ( .A(n292), .Y(n218) );
  INVX1 U8 ( .A(A[2]), .Y(n205) );
  XOR2X1 U9 ( .A(n269), .B(n276), .Y(DIFF[12]) );
  NOR2X1 U10 ( .A(n189), .B(n265), .Y(n276) );
  XOR2X1 U11 ( .A(n285), .B(n284), .Y(DIFF[10]) );
  XOR2X1 U12 ( .A(n266), .B(n267), .Y(DIFF[15]) );
  OAI31X1 U13 ( .A0(n268), .A1(n183), .A2(n186), .B0(n184), .Y(n266) );
  INVX1 U14 ( .A(n253), .Y(n183) );
  NOR2X1 U15 ( .A(n189), .B(n186), .Y(n250) );
  INVX1 U16 ( .A(A[3]), .Y(n202) );
  OAI211X4 U17 ( .A0(n218), .A1(n192), .B0(n255), .C0(n256), .Y(n269) );
  AOI21XL U18 ( .A0(A[1]), .A1(n212), .B0(n243), .Y(n291) );
  NAND2BXL U19 ( .AN(B[9]), .B(A[9]), .Y(n216) );
  XOR2X2 U20 ( .A(n221), .B(n222), .Y(DIFF[7]) );
  OAI2BB1X1 U21 ( .A0N(n234), .A1N(n257), .B0(n286), .Y(n292) );
  NOR2BX4 U22 ( .AN(n232), .B(n233), .Y(n229) );
  OR2XL U23 ( .A(n293), .B(A[2]), .Y(n239) );
  OAI2BB2X1 U24 ( .B0(n291), .B1(n290), .A0N(n295), .A1N(A[3]), .Y(n258) );
  INVXL U25 ( .A(B[3]), .Y(n295) );
  INVX1 U26 ( .A(n286), .Y(n196) );
  NAND2X2 U27 ( .A(n294), .B(n230), .Y(n223) );
  XNOR2XL U28 ( .A(n213), .B(n214), .Y(DIFF[9]) );
  INVX1 U29 ( .A(B[2]), .Y(n293) );
  NOR2XL U30 ( .A(n211), .B(A[5]), .Y(n228) );
  OAI21X1 U31 ( .A0(n281), .A1(n284), .B0(n280), .Y(n282) );
  XOR2X2 U32 ( .A(n223), .B(n227), .Y(DIFF[6]) );
  OR2X2 U33 ( .A(n228), .B(n229), .Y(n294) );
  NAND2XL U34 ( .A(A[5]), .B(n211), .Y(n230) );
  NAND2XL U35 ( .A(n215), .B(n216), .Y(n213) );
  OAI21X2 U36 ( .A0(n219), .A1(n218), .B0(n220), .Y(n214) );
  NAND2X1 U38 ( .A(B[13]), .B(n188), .Y(n273) );
  NOR3BX1 U39 ( .AN(n241), .B(n242), .C(n290), .Y(n262) );
  XOR2X1 U40 ( .A(n240), .B(n238), .Y(DIFF[2]) );
  NAND2XL U41 ( .A(n203), .B(n239), .Y(n240) );
  NAND2X1 U42 ( .A(B[7]), .B(n197), .Y(n226) );
  NAND2X1 U43 ( .A(B[12]), .B(n191), .Y(n264) );
  NOR2X1 U44 ( .A(n191), .B(B[12]), .Y(n265) );
  NOR2X2 U45 ( .A(n201), .B(B[4]), .Y(n233) );
  NOR2X1 U46 ( .A(n188), .B(B[13]), .Y(n270) );
  INVXL U47 ( .A(n243), .Y(n203) );
  AOI21XL U48 ( .A0(n223), .A1(n224), .B0(n225), .Y(n222) );
  INVXL U49 ( .A(n216), .Y(n195) );
  NOR2BXL U50 ( .AN(n256), .B(n278), .Y(n283) );
  NOR2XL U51 ( .A(n198), .B(n225), .Y(n227) );
  NAND2XL U52 ( .A(n199), .B(n230), .Y(n231) );
  NOR2XL U53 ( .A(B[7]), .B(n197), .Y(n287) );
  OR2X4 U54 ( .A(n258), .B(n262), .Y(n234) );
  OAI32XL U55 ( .A0(n269), .A1(n265), .A2(n270), .B0(n270), .B1(n264), .Y(n268) );
  NAND2BXL U56 ( .AN(n281), .B(n280), .Y(n285) );
  INVXL U57 ( .A(n228), .Y(n199) );
  XOR2XL U58 ( .A(n217), .B(n218), .Y(DIFF[8]) );
  NAND2BXL U59 ( .AN(n219), .B(n220), .Y(n217) );
  OAI211XL U60 ( .A0(n254), .A1(n192), .B0(n255), .C0(n256), .Y(n251) );
  AOI21XL U61 ( .A0(n257), .A1(n258), .B0(n196), .Y(n254) );
  AOI31XL U62 ( .A0(n187), .A1(n190), .A2(n261), .B0(n186), .Y(n259) );
  INVXL U63 ( .A(n265), .Y(n190) );
  NAND4XL U64 ( .A(n262), .B(n263), .C(n257), .D(n264), .Y(n261) );
  INVXL U65 ( .A(A[0]), .Y(n207) );
  AOI21XL U66 ( .A0(B[4]), .A1(n201), .B0(n233), .Y(n235) );
  NAND2BXL U67 ( .AN(A[6]), .B(B[6]), .Y(n224) );
  AOI21XL U68 ( .A0(A[1]), .A1(n212), .B0(n242), .Y(n244) );
  NAND2XL U69 ( .A(B[4]), .B(n201), .Y(n289) );
  AOI22XL U70 ( .A0(n212), .A1(A[1]), .B0(n206), .B1(n241), .Y(n238) );
  INVXL U71 ( .A(n242), .Y(n206) );
  NAND2BXL U72 ( .AN(A[15]), .B(B[15]), .Y(n252) );
  NAND2BXL U73 ( .AN(B[15]), .B(A[15]), .Y(n248) );
  INVX1 U74 ( .A(n263), .Y(n192) );
  INVX1 U75 ( .A(n264), .Y(n189) );
  NAND2X1 U76 ( .A(B[0]), .B(n207), .Y(n241) );
  OAI21XL U77 ( .A0(B[7]), .A1(n197), .B0(n226), .Y(n221) );
  AOI21X1 U78 ( .A0(n214), .A1(n215), .B0(n195), .Y(n284) );
  NOR2X1 U79 ( .A(n205), .B(B[2]), .Y(n243) );
  XOR2X1 U80 ( .A(n282), .B(n283), .Y(DIFF[11]) );
  XOR2X1 U81 ( .A(n274), .B(n275), .Y(DIFF[13]) );
  NAND2X1 U82 ( .A(n273), .B(n187), .Y(n274) );
  AOI21X1 U83 ( .A0(n269), .A1(n264), .B0(n265), .Y(n275) );
  XOR2X1 U84 ( .A(n231), .B(n229), .Y(DIFF[5]) );
  OAI31X1 U85 ( .A0(n287), .A1(n225), .A2(n288), .B0(n226), .Y(n286) );
  AOI211X1 U86 ( .A0(n230), .A1(n200), .B0(n198), .C0(n228), .Y(n288) );
  INVX1 U87 ( .A(n233), .Y(n200) );
  OAI21XL U88 ( .A0(B[0]), .A1(n207), .B0(n241), .Y(DIFF[0]) );
  XOR2X1 U89 ( .A(n271), .B(n272), .Y(DIFF[14]) );
  NAND2X1 U90 ( .A(n253), .B(n184), .Y(n271) );
  AOI221X1 U91 ( .A0(n250), .A1(n269), .B0(n265), .B1(n273), .C0(n270), .Y(
        n272) );
  INVX1 U92 ( .A(n224), .Y(n198) );
  OAI21XL U93 ( .A0(n194), .A1(n277), .B0(n193), .Y(n255) );
  INVX1 U94 ( .A(n280), .Y(n194) );
  INVX1 U95 ( .A(n278), .Y(n193) );
  AOI21X1 U96 ( .A0(n216), .A1(n220), .B0(n279), .Y(n277) );
  INVX1 U97 ( .A(n270), .Y(n187) );
  NAND4X1 U98 ( .A(n250), .B(n251), .C(n252), .D(n253), .Y(n249) );
  INVX1 U99 ( .A(n273), .Y(n186) );
  INVX1 U100 ( .A(n260), .Y(n184) );
  INVX1 U101 ( .A(B[5]), .Y(n211) );
  INVX1 U102 ( .A(B[10]), .Y(n209) );
  INVX1 U103 ( .A(B[8]), .Y(n210) );
  NOR2X1 U104 ( .A(n212), .B(A[1]), .Y(n242) );
  OAI2BB1X1 U105 ( .A0N(n201), .A1N(B[4]), .B0(n234), .Y(n232) );
  INVX1 U106 ( .A(A[7]), .Y(n197) );
  NOR2X1 U107 ( .A(n208), .B(A[11]), .Y(n278) );
  NOR2BX1 U108 ( .AN(A[6]), .B(B[6]), .Y(n225) );
  NOR2X1 U109 ( .A(n209), .B(A[10]), .Y(n281) );
  NAND2BX1 U110 ( .AN(A[9]), .B(B[9]), .Y(n215) );
  AND4X2 U111 ( .A(n289), .B(n199), .C(n224), .D(n226), .Y(n257) );
  XOR2X1 U112 ( .A(n241), .B(n244), .Y(DIFF[1]) );
  XOR2X1 U113 ( .A(n234), .B(n235), .Y(DIFF[4]) );
  XOR2X1 U114 ( .A(n236), .B(n237), .Y(DIFF[3]) );
  XOR2X1 U115 ( .A(n202), .B(B[3]), .Y(n237) );
  OAI21XL U116 ( .A0(n204), .A1(n238), .B0(n203), .Y(n236) );
  INVX1 U117 ( .A(n239), .Y(n204) );
  NOR2X1 U118 ( .A(n210), .B(A[8]), .Y(n219) );
  NAND2X1 U119 ( .A(A[10]), .B(n209), .Y(n280) );
  NAND2X1 U120 ( .A(A[8]), .B(n210), .Y(n220) );
  NAND2X1 U121 ( .A(A[11]), .B(n208), .Y(n256) );
  INVX1 U122 ( .A(A[12]), .Y(n191) );
  INVX1 U123 ( .A(A[13]), .Y(n188) );
  XOR2X1 U124 ( .A(n245), .B(n246), .Y(DIFF[16]) );
  XNOR2X1 U125 ( .A(B[16]), .B(A[16]), .Y(n246) );
  NAND3X1 U126 ( .A(n247), .B(n248), .C(n249), .Y(n245) );
  OAI211X1 U127 ( .A0(n259), .A1(n260), .B0(n252), .C0(n253), .Y(n247) );
  NAND2X1 U128 ( .A(B[14]), .B(n185), .Y(n253) );
  INVX1 U129 ( .A(A[14]), .Y(n185) );
  NOR2X1 U130 ( .A(n185), .B(B[14]), .Y(n260) );
  INVX1 U131 ( .A(B[1]), .Y(n212) );
  INVX1 U132 ( .A(B[11]), .Y(n208) );
endmodule


module butterfly_DW01_add_45 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239;

  OAI31X2 U33 ( .A0(n205), .A1(n212), .A2(n204), .B0(n213), .Y(SUM[14]) );
  AND2X2 U38 ( .A(B[14]), .B(A[14]), .Y(n209) );
  AND2X2 U41 ( .A(n211), .B(n158), .Y(n218) );
  AND2X2 U70 ( .A(B[6]), .B(A[6]), .Y(n178) );
  AND2X2 U74 ( .A(B[4]), .B(A[4]), .Y(n189) );
  AND2X2 U79 ( .A(B[2]), .B(A[2]), .Y(n195) );
  OAI21X1 U2 ( .A0(n193), .A1(n192), .B0(n194), .Y(SUM[2]) );
  AOI21X1 U3 ( .A0(n168), .A1(n167), .B0(n197), .Y(SUM[0]) );
  OAI21X1 U4 ( .A0(n181), .A1(n184), .B0(n163), .Y(SUM[5]) );
  XOR2X1 U5 ( .A(n206), .B(n207), .Y(SUM[15]) );
  XOR2X1 U6 ( .A(n190), .B(n191), .Y(SUM[3]) );
  XOR2X1 U7 ( .A(n175), .B(n176), .Y(SUM[7]) );
  NOR2X1 U8 ( .A(n231), .B(n161), .Y(n169) );
  OAI22X1 U9 ( .A0(n204), .A1(n214), .B0(n209), .B1(n212), .Y(n213) );
  OAI21XL U10 ( .A0(n193), .A1(n195), .B0(n196), .Y(n194) );
  INVX1 U11 ( .A(n185), .Y(n163) );
  AOI21X1 U12 ( .A0(n183), .A1(n164), .B0(n182), .Y(n185) );
  NAND2X1 U13 ( .A(n201), .B(n203), .Y(n206) );
  AOI31X1 U14 ( .A0(n158), .A1(n157), .A2(n208), .B0(n209), .Y(n207) );
  NAND2BX1 U15 ( .AN(n210), .B(n211), .Y(n208) );
  OAI31X1 U16 ( .A0(n159), .A1(n224), .A2(n225), .B0(n226), .Y(n220) );
  INVX1 U17 ( .A(n227), .Y(n159) );
  OAI211X1 U18 ( .A0(n228), .A1(n171), .B0(n229), .C0(n230), .Y(n227) );
  XOR2X1 U19 ( .A(n232), .B(n233), .Y(SUM[11]) );
  OAI21XL U20 ( .A0(n234), .A1(n224), .B0(n230), .Y(n232) );
  NOR2BX1 U21 ( .AN(n226), .B(n225), .Y(n233) );
  XNOR2X1 U22 ( .A(n169), .B(n170), .Y(SUM[9]) );
  NOR2X1 U23 ( .A(n160), .B(n171), .Y(n170) );
  XOR2X1 U24 ( .A(n177), .B(n179), .Y(SUM[6]) );
  NOR2X1 U25 ( .A(n180), .B(n178), .Y(n179) );
  XNOR2X1 U26 ( .A(n172), .B(n173), .Y(SUM[8]) );
  NOR2X1 U27 ( .A(n174), .B(n161), .Y(n173) );
  XOR2X1 U28 ( .A(n210), .B(n218), .Y(SUM[13]) );
  NOR4BX1 U29 ( .AN(n231), .B(n225), .C(n171), .D(n224), .Y(n219) );
  XOR2X1 U30 ( .A(n235), .B(n234), .Y(SUM[10]) );
  NAND2BX1 U31 ( .AN(n224), .B(n230), .Y(n235) );
  XOR2X1 U32 ( .A(n186), .B(n187), .Y(SUM[4]) );
  NOR2X1 U34 ( .A(n188), .B(n189), .Y(n187) );
  XOR2X1 U35 ( .A(n222), .B(n223), .Y(SUM[12]) );
  NAND2X1 U36 ( .A(n221), .B(n217), .Y(n222) );
  NOR2X1 U37 ( .A(n219), .B(n220), .Y(n223) );
  NOR2X1 U39 ( .A(n168), .B(n167), .Y(n197) );
  AOI21X1 U40 ( .A0(n165), .A1(n186), .B0(n189), .Y(n182) );
  INVX1 U42 ( .A(n188), .Y(n165) );
  NOR2X1 U43 ( .A(n215), .B(n216), .Y(n204) );
  OAI21XL U44 ( .A0(n181), .A1(n182), .B0(n183), .Y(n177) );
  OAI21XL U45 ( .A0(n219), .A1(n220), .B0(n221), .Y(n215) );
  AOI2BB1X1 U46 ( .A0N(n169), .A1N(n171), .B0(n160), .Y(n234) );
  AOI21X1 U47 ( .A0(n217), .A1(n211), .B0(n216), .Y(n214) );
  NOR2X1 U48 ( .A(n172), .B(n174), .Y(n231) );
  OR2X2 U49 ( .A(n196), .B(n195), .Y(n192) );
  NAND2X1 U50 ( .A(n182), .B(n183), .Y(n184) );
  INVX1 U51 ( .A(n181), .Y(n164) );
  NAND2X1 U52 ( .A(n215), .B(n217), .Y(n210) );
  INVX1 U53 ( .A(n193), .Y(n166) );
  INVX1 U54 ( .A(n229), .Y(n160) );
  INVX1 U55 ( .A(n180), .Y(n162) );
  INVX1 U56 ( .A(n228), .Y(n161) );
  INVX1 U57 ( .A(n212), .Y(n157) );
  INVX1 U58 ( .A(n216), .Y(n158) );
  OR2X2 U59 ( .A(n214), .B(n209), .Y(n205) );
  INVX1 U60 ( .A(n203), .Y(n156) );
  NAND2X1 U61 ( .A(n192), .B(n166), .Y(n190) );
  XNOR2X1 U62 ( .A(A[3]), .B(B[3]), .Y(n191) );
  XNOR2X1 U63 ( .A(A[7]), .B(B[7]), .Y(n175) );
  AOI21X1 U64 ( .A0(n177), .A1(n162), .B0(n178), .Y(n176) );
  XOR2X1 U65 ( .A(n197), .B(n198), .Y(SUM[1]) );
  XOR2X1 U66 ( .A(B[1]), .B(A[1]), .Y(n198) );
  XOR2X1 U67 ( .A(n199), .B(n200), .Y(SUM[16]) );
  XNOR2X1 U68 ( .A(B[16]), .B(A[16]), .Y(n199) );
  AOI31X1 U69 ( .A0(n201), .A1(n157), .A2(n202), .B0(n156), .Y(n200) );
  OR2X2 U71 ( .A(n204), .B(n205), .Y(n202) );
  NOR2X1 U72 ( .A(A[10]), .B(B[10]), .Y(n224) );
  NOR2X1 U73 ( .A(A[9]), .B(B[9]), .Y(n171) );
  NOR2X1 U75 ( .A(A[2]), .B(B[2]), .Y(n193) );
  NOR2X1 U76 ( .A(A[5]), .B(B[5]), .Y(n181) );
  NOR2X1 U77 ( .A(A[11]), .B(B[11]), .Y(n225) );
  NOR2X1 U78 ( .A(A[13]), .B(B[13]), .Y(n216) );
  NOR2X1 U80 ( .A(A[14]), .B(B[14]), .Y(n212) );
  OAI21XL U81 ( .A0(A[7]), .A1(B[7]), .B0(n236), .Y(n172) );
  OAI2BB1X1 U82 ( .A0N(A[7]), .A1N(B[7]), .B0(n237), .Y(n236) );
  AOI31X1 U83 ( .A0(n162), .A1(n164), .A2(n184), .B0(n178), .Y(n237) );
  NAND2X1 U84 ( .A(B[12]), .B(A[12]), .Y(n217) );
  NAND2X1 U85 ( .A(B[5]), .B(A[5]), .Y(n183) );
  NOR2X1 U86 ( .A(B[8]), .B(A[8]), .Y(n174) );
  NOR2X1 U87 ( .A(A[4]), .B(B[4]), .Y(n188) );
  NOR2X1 U88 ( .A(A[6]), .B(B[6]), .Y(n180) );
  NAND2X1 U89 ( .A(B[10]), .B(A[10]), .Y(n230) );
  NAND2X1 U90 ( .A(B[13]), .B(A[13]), .Y(n211) );
  OAI2BB1X1 U91 ( .A0N(A[3]), .A1N(B[3]), .B0(n238), .Y(n186) );
  OAI211X1 U92 ( .A0(B[3]), .A1(A[3]), .B0(n192), .C0(n166), .Y(n238) );
  NAND2X1 U93 ( .A(B[15]), .B(A[15]), .Y(n203) );
  INVX1 U94 ( .A(B[0]), .Y(n168) );
  INVX1 U95 ( .A(A[0]), .Y(n167) );
  OAI2BB1X1 U96 ( .A0N(n197), .A1N(A[1]), .B0(n239), .Y(n196) );
  OAI21XL U97 ( .A0(n197), .A1(A[1]), .B0(B[1]), .Y(n239) );
  OR2X2 U98 ( .A(A[12]), .B(B[12]), .Y(n221) );
  NAND2X1 U99 ( .A(B[8]), .B(A[8]), .Y(n228) );
  NAND2X1 U100 ( .A(B[9]), .B(A[9]), .Y(n229) );
  OR2X2 U101 ( .A(A[15]), .B(B[15]), .Y(n201) );
  NAND2X1 U102 ( .A(B[11]), .B(A[11]), .Y(n226) );
endmodule


module butterfly_DW01_add_42 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226;

  AND2X2 U31 ( .A(B[15]), .B(A[15]), .Y(n191) );
  AND2X2 U42 ( .A(B[13]), .B(A[13]), .Y(n197) );
  AND2X2 U74 ( .A(B[2]), .B(A[2]), .Y(n181) );
  AND2X2 U82 ( .A(B[6]), .B(A[6]), .Y(n167) );
  AND2X2 U85 ( .A(B[10]), .B(A[10]), .Y(n214) );
  OAI21XL U2 ( .A0(n169), .A1(n170), .B0(n171), .Y(n166) );
  XNOR2X1 U3 ( .A(n218), .B(n217), .Y(SUM[10]) );
  OR2X2 U4 ( .A(n214), .B(n211), .Y(n218) );
  XNOR2X1 U5 ( .A(n208), .B(n206), .Y(SUM[12]) );
  NAND2X1 U6 ( .A(n194), .B(n207), .Y(n208) );
  NAND2X1 U7 ( .A(n206), .B(n207), .Y(n193) );
  NAND2X1 U8 ( .A(n193), .B(n194), .Y(n204) );
  XNOR2X1 U9 ( .A(n168), .B(n166), .Y(SUM[6]) );
  OR2X2 U10 ( .A(n167), .B(n172), .Y(n168) );
  XOR2X1 U11 ( .A(n173), .B(n170), .Y(SUM[5]) );
  NAND2X1 U12 ( .A(n153), .B(n171), .Y(n173) );
  XOR2X1 U13 ( .A(n180), .B(n182), .Y(SUM[2]) );
  NOR2X1 U14 ( .A(n181), .B(n183), .Y(n182) );
  INVX1 U15 ( .A(n172), .Y(n152) );
  INVX1 U16 ( .A(n169), .Y(n153) );
  INVX1 U17 ( .A(n183), .Y(n156) );
  XOR2X1 U18 ( .A(n188), .B(n189), .Y(SUM[16]) );
  OAI31X1 U19 ( .A0(n209), .A1(n210), .A2(n211), .B0(n212), .Y(n206) );
  NOR3BX1 U20 ( .AN(n160), .B(n213), .C(n214), .Y(n209) );
  OAI32X1 U21 ( .A0(n159), .A1(n151), .A2(n162), .B0(n159), .B1(n163), .Y(n213) );
  AOI31X1 U22 ( .A0(n146), .A1(n147), .A2(n190), .B0(n191), .Y(n189) );
  INVX1 U23 ( .A(n198), .Y(n146) );
  OAI221XL U24 ( .A0(n192), .A1(n193), .B0(n192), .B1(n194), .C0(n195), .Y(
        n190) );
  NOR2BX1 U25 ( .AN(n196), .B(n197), .Y(n195) );
  OAI21XL U26 ( .A0(n186), .A1(n184), .B0(n187), .Y(n180) );
  OAI21XL U27 ( .A0(n150), .A1(n159), .B0(n160), .Y(n217) );
  INVX1 U28 ( .A(n158), .Y(n150) );
  AOI21X1 U29 ( .A0(n204), .A1(n148), .B0(n197), .Y(n202) );
  INVX1 U30 ( .A(n192), .Y(n148) );
  NAND2X1 U32 ( .A(B[12]), .B(A[12]), .Y(n194) );
  AOI21X1 U33 ( .A0(n174), .A1(n154), .B0(n155), .Y(n170) );
  INVX1 U34 ( .A(n175), .Y(n155) );
  NOR2X1 U35 ( .A(A[5]), .B(B[5]), .Y(n169) );
  OAI21XL U36 ( .A0(n151), .A1(n162), .B0(n163), .Y(n158) );
  NOR2X1 U37 ( .A(B[8]), .B(A[8]), .Y(n162) );
  NOR2X1 U38 ( .A(B[6]), .B(A[6]), .Y(n172) );
  NOR2X1 U39 ( .A(B[10]), .B(A[10]), .Y(n211) );
  NAND2X1 U40 ( .A(B[8]), .B(A[8]), .Y(n163) );
  NOR2X1 U41 ( .A(B[2]), .B(A[2]), .Y(n183) );
  NAND2X1 U43 ( .A(B[5]), .B(A[5]), .Y(n171) );
  NOR2X1 U44 ( .A(B[15]), .B(A[15]), .Y(n198) );
  XNOR2X1 U45 ( .A(n176), .B(n174), .Y(SUM[4]) );
  NAND2X1 U46 ( .A(n175), .B(n154), .Y(n176) );
  XNOR2X1 U47 ( .A(n157), .B(n158), .Y(SUM[9]) );
  NAND2BX1 U48 ( .AN(n159), .B(n160), .Y(n157) );
  XOR2X1 U49 ( .A(n184), .B(n185), .Y(SUM[1]) );
  NAND2BX1 U50 ( .AN(n186), .B(n187), .Y(n185) );
  XOR2X1 U51 ( .A(n204), .B(n205), .Y(SUM[13]) );
  NOR2X1 U52 ( .A(n197), .B(n192), .Y(n205) );
  XOR2X1 U53 ( .A(n215), .B(n216), .Y(SUM[11]) );
  NAND2BX1 U54 ( .AN(n210), .B(n212), .Y(n215) );
  AOI21X1 U55 ( .A0(n217), .A1(n149), .B0(n214), .Y(n216) );
  INVX1 U56 ( .A(n211), .Y(n149) );
  XOR2X1 U57 ( .A(n199), .B(n200), .Y(SUM[15]) );
  OAI21XL U58 ( .A0(n201), .A1(n202), .B0(n196), .Y(n199) );
  NOR2X1 U59 ( .A(n198), .B(n191), .Y(n200) );
  XOR2X1 U60 ( .A(n161), .B(n151), .Y(SUM[8]) );
  NAND2BX1 U61 ( .AN(n162), .B(n163), .Y(n161) );
  XOR2X1 U62 ( .A(n203), .B(n202), .Y(SUM[14]) );
  NAND2X1 U63 ( .A(n147), .B(n196), .Y(n203) );
  INVX1 U64 ( .A(n177), .Y(n154) );
  OR2X2 U65 ( .A(B[12]), .B(A[12]), .Y(n207) );
  INVX1 U66 ( .A(n201), .Y(n147) );
  AOI211X1 U67 ( .A0(B[7]), .A1(A[7]), .B0(n167), .C0(n225), .Y(n220) );
  AOI211X1 U68 ( .A0(n175), .A1(n171), .B0(n169), .C0(n172), .Y(n225) );
  NOR2X1 U69 ( .A(A[13]), .B(B[13]), .Y(n192) );
  XOR2X1 U70 ( .A(n164), .B(n165), .Y(SUM[7]) );
  XNOR2X1 U71 ( .A(A[7]), .B(B[7]), .Y(n164) );
  AOI21X1 U72 ( .A0(n166), .A1(n152), .B0(n167), .Y(n165) );
  NOR2X1 U73 ( .A(B[9]), .B(A[9]), .Y(n159) );
  XOR2X1 U75 ( .A(n178), .B(n179), .Y(SUM[3]) );
  XNOR2X1 U76 ( .A(A[3]), .B(B[3]), .Y(n178) );
  AOI21X1 U77 ( .A0(n156), .A1(n180), .B0(n181), .Y(n179) );
  NAND2X1 U78 ( .A(B[0]), .B(A[0]), .Y(n184) );
  OAI2BB1X1 U79 ( .A0N(A[3]), .A1N(B[3]), .B0(n224), .Y(n174) );
  OAI221XL U80 ( .A0(n181), .A1(n180), .B0(B[3]), .B1(A[3]), .C0(n156), .Y(
        n224) );
  NOR2X1 U81 ( .A(B[14]), .B(A[14]), .Y(n201) );
  NOR2X1 U83 ( .A(B[4]), .B(A[4]), .Y(n177) );
  INVX1 U84 ( .A(n219), .Y(n151) );
  OAI21XL U86 ( .A0(n220), .A1(n221), .B0(n222), .Y(n219) );
  NOR2X1 U87 ( .A(A[7]), .B(B[7]), .Y(n221) );
  NAND4X1 U88 ( .A(n174), .B(n153), .C(n152), .D(n223), .Y(n222) );
  NAND2X1 U89 ( .A(B[4]), .B(A[4]), .Y(n175) );
  NAND2X1 U90 ( .A(B[14]), .B(A[14]), .Y(n196) );
  NAND2X1 U91 ( .A(B[9]), .B(A[9]), .Y(n160) );
  NOR2X1 U92 ( .A(B[1]), .B(A[1]), .Y(n186) );
  INVX1 U93 ( .A(n226), .Y(SUM[0]) );
  OAI21XL U94 ( .A0(B[0]), .A1(A[0]), .B0(n184), .Y(n226) );
  NAND2X1 U95 ( .A(B[1]), .B(A[1]), .Y(n187) );
  NOR2X1 U96 ( .A(A[11]), .B(B[11]), .Y(n210) );
  NAND2X1 U97 ( .A(B[11]), .B(A[11]), .Y(n212) );
  AOI2BB1X1 U98 ( .A0N(A[7]), .A1N(B[7]), .B0(n177), .Y(n223) );
  XNOR2X1 U99 ( .A(B[16]), .B(A[16]), .Y(n188) );
endmodule


module butterfly_DW01_sub_44 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262;

  AOI211X1 U3 ( .A0(n234), .A1(n172), .B0(n235), .C0(n173), .Y(n233) );
  INVX1 U4 ( .A(n236), .Y(n173) );
  XNOR2X1 U5 ( .A(n240), .B(n239), .Y(DIFF[14]) );
  NAND2BX1 U6 ( .AN(n235), .B(n231), .Y(n240) );
  AOI21X1 U7 ( .A0(n208), .A1(n209), .B0(n210), .Y(n205) );
  OAI21XL U8 ( .A0(n241), .A1(n242), .B0(n236), .Y(n239) );
  OAI21XL U9 ( .A0(n248), .A1(n192), .B0(n193), .Y(n256) );
  OAI21XL U10 ( .A0(n204), .A1(n205), .B0(n206), .Y(n200) );
  NAND3X1 U11 ( .A(n231), .B(n232), .C(n172), .Y(n229) );
  INVX1 U12 ( .A(n204), .Y(n180) );
  XNOR2X1 U13 ( .A(n211), .B(n209), .Y(DIFF[4]) );
  NAND2BX1 U14 ( .AN(n210), .B(n208), .Y(n211) );
  XNOR2X1 U15 ( .A(n258), .B(n256), .Y(DIFF[10]) );
  NAND2X1 U16 ( .A(n253), .B(n175), .Y(n258) );
  INVX1 U17 ( .A(n241), .Y(n172) );
  XOR2X1 U18 ( .A(n243), .B(n242), .Y(DIFF[13]) );
  NAND2X1 U19 ( .A(n236), .B(n172), .Y(n243) );
  XOR2X1 U20 ( .A(n191), .B(n192), .Y(DIFF[9]) );
  NAND2X1 U21 ( .A(n176), .B(n193), .Y(n191) );
  XOR2X1 U22 ( .A(n254), .B(n255), .Y(DIFF[11]) );
  OR2X2 U23 ( .A(n247), .B(n252), .Y(n254) );
  AOI21X1 U24 ( .A0(n256), .A1(n253), .B0(n257), .Y(n255) );
  XNOR2X1 U25 ( .A(n203), .B(n200), .Y(DIFF[6]) );
  NAND2BX1 U26 ( .AN(n202), .B(n201), .Y(n203) );
  XOR2X1 U27 ( .A(n207), .B(n205), .Y(DIFF[5]) );
  NAND2X1 U28 ( .A(n180), .B(n206), .Y(n207) );
  XOR2X1 U29 ( .A(n215), .B(n219), .Y(DIFF[2]) );
  NOR2X1 U30 ( .A(n216), .B(n183), .Y(n219) );
  INVX1 U31 ( .A(n257), .Y(n175) );
  INVX1 U32 ( .A(n248), .Y(n176) );
  INVX1 U33 ( .A(n214), .Y(n183) );
  NAND2X1 U34 ( .A(n175), .B(n193), .Y(n251) );
  INVX1 U35 ( .A(n206), .Y(n179) );
  XOR2X1 U36 ( .A(n225), .B(n226), .Y(DIFF[16]) );
  OAI33X1 U37 ( .A0(n246), .A1(n247), .A2(n248), .B0(n249), .B1(n247), .B2(
        n250), .Y(n232) );
  NOR2X1 U38 ( .A(n252), .B(n253), .Y(n249) );
  NAND3X1 U39 ( .A(n195), .B(n253), .C(n197), .Y(n246) );
  AOI211X1 U40 ( .A0(n196), .A1(n176), .B0(n251), .C0(n252), .Y(n250) );
  OAI31X1 U41 ( .A0(n262), .A1(n217), .A2(n183), .B0(n218), .Y(n209) );
  AND3X2 U42 ( .A(n182), .B(n220), .C(n221), .Y(n262) );
  INVX1 U43 ( .A(n216), .Y(n182) );
  AOI211X1 U44 ( .A0(A[15]), .A1(n186), .B0(n227), .C0(n228), .Y(n225) );
  NOR3X1 U45 ( .A(n233), .B(n170), .C(n230), .Y(n227) );
  AOI211X1 U46 ( .A0(B[12]), .A1(n174), .B0(n229), .C0(n230), .Y(n228) );
  INVX1 U47 ( .A(n231), .Y(n170) );
  INVX1 U48 ( .A(A[14]), .Y(n171) );
  NOR2X1 U49 ( .A(n174), .B(B[12]), .Y(n234) );
  AOI21X1 U50 ( .A0(n232), .A1(n244), .B0(n234), .Y(n242) );
  NAND2X1 U51 ( .A(B[12]), .B(n174), .Y(n244) );
  NOR2X1 U52 ( .A(n184), .B(B[2]), .Y(n216) );
  AOI21X1 U53 ( .A0(n195), .A1(n197), .B0(n196), .Y(n192) );
  NAND2BX1 U54 ( .AN(A[10]), .B(B[10]), .Y(n253) );
  NOR2X1 U55 ( .A(n188), .B(A[9]), .Y(n248) );
  NAND2X1 U56 ( .A(B[14]), .B(n171), .Y(n231) );
  INVX1 U57 ( .A(A[12]), .Y(n174) );
  XOR2X1 U58 ( .A(n212), .B(n213), .Y(DIFF[3]) );
  NAND2BX1 U59 ( .AN(n217), .B(n218), .Y(n212) );
  AOI21X1 U60 ( .A0(n214), .A1(n215), .B0(n216), .Y(n213) );
  NOR2BX1 U61 ( .AN(A[8]), .B(B[8]), .Y(n196) );
  NOR2BX1 U62 ( .AN(A[11]), .B(B[11]), .Y(n252) );
  NOR2X1 U63 ( .A(n181), .B(B[4]), .Y(n210) );
  NOR2X1 U64 ( .A(n171), .B(B[14]), .Y(n235) );
  NOR2X1 U65 ( .A(n178), .B(B[6]), .Y(n202) );
  INVX1 U66 ( .A(A[0]), .Y(n185) );
  NOR2BX1 U67 ( .AN(B[11]), .B(A[11]), .Y(n247) );
  NAND2BX1 U68 ( .AN(A[8]), .B(B[8]), .Y(n197) );
  NAND2X1 U69 ( .A(A[5]), .B(n189), .Y(n206) );
  NAND2X1 U70 ( .A(B[4]), .B(n181), .Y(n208) );
  INVX1 U71 ( .A(B[15]), .Y(n186) );
  NOR2X1 U72 ( .A(n189), .B(A[5]), .Y(n204) );
  INVX1 U73 ( .A(A[2]), .Y(n184) );
  NAND2X1 U74 ( .A(A[9]), .B(n188), .Y(n193) );
  NAND2X1 U75 ( .A(B[6]), .B(n178), .Y(n201) );
  NOR2X1 U76 ( .A(n187), .B(A[13]), .Y(n241) );
  NOR2BX1 U77 ( .AN(A[10]), .B(B[10]), .Y(n257) );
  NAND2X1 U78 ( .A(A[13]), .B(n187), .Y(n236) );
  NOR2X1 U79 ( .A(n186), .B(A[15]), .Y(n230) );
  INVX1 U80 ( .A(B[5]), .Y(n189) );
  XNOR2X1 U81 ( .A(n222), .B(n223), .Y(DIFF[1]) );
  NAND2X1 U82 ( .A(n224), .B(n221), .Y(n222) );
  INVX1 U83 ( .A(A[6]), .Y(n178) );
  XOR2X1 U84 ( .A(n245), .B(n232), .Y(DIFF[12]) );
  AOI21X1 U85 ( .A0(n174), .A1(B[12]), .B0(n234), .Y(n245) );
  INVX1 U86 ( .A(B[13]), .Y(n187) );
  INVX1 U87 ( .A(B[9]), .Y(n188) );
  INVX1 U88 ( .A(A[4]), .Y(n181) );
  NAND2X1 U89 ( .A(n220), .B(n221), .Y(n215) );
  NAND2X1 U90 ( .A(B[2]), .B(n184), .Y(n214) );
  XNOR2X1 U91 ( .A(n194), .B(n195), .Y(DIFF[8]) );
  NAND2BX1 U92 ( .AN(n196), .B(n197), .Y(n194) );
  XOR2X1 U93 ( .A(n237), .B(n238), .Y(DIFF[15]) );
  XNOR2X1 U94 ( .A(n186), .B(A[15]), .Y(n238) );
  AOI21X1 U95 ( .A0(n239), .A1(n231), .B0(n235), .Y(n237) );
  NAND2X1 U96 ( .A(n223), .B(n224), .Y(n220) );
  OAI221XL U97 ( .A0(n259), .A1(n260), .B0(B[7]), .B1(n177), .C0(n261), .Y(
        n195) );
  NAND4BXL U98 ( .AN(n260), .B(n209), .C(n208), .D(n180), .Y(n261) );
  AOI211X1 U99 ( .A0(n210), .A1(n180), .B0(n179), .C0(n202), .Y(n259) );
  OAI2BB1X1 U100 ( .A0N(n177), .A1N(B[7]), .B0(n201), .Y(n260) );
  OAI21XL U101 ( .A0(B[0]), .A1(n185), .B0(n223), .Y(DIFF[0]) );
  XOR2X1 U102 ( .A(n198), .B(n199), .Y(DIFF[7]) );
  XNOR2X1 U103 ( .A(B[7]), .B(n177), .Y(n199) );
  AOI21X1 U104 ( .A0(n200), .A1(n201), .B0(n202), .Y(n198) );
  NAND2X1 U105 ( .A(B[0]), .B(n185), .Y(n223) );
  INVX1 U106 ( .A(A[7]), .Y(n177) );
  NAND2BX1 U107 ( .AN(B[1]), .B(A[1]), .Y(n221) );
  INVX1 U108 ( .A(B[3]), .Y(n190) );
  NOR2X1 U109 ( .A(n190), .B(A[3]), .Y(n217) );
  NAND2BX1 U110 ( .AN(A[1]), .B(B[1]), .Y(n224) );
  NAND2X1 U111 ( .A(A[3]), .B(n190), .Y(n218) );
  XOR2X1 U112 ( .A(B[16]), .B(A[16]), .Y(n226) );
endmodule


module butterfly_DW01_sub_43 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302;

  AND2X2 U6 ( .A(n230), .B(n231), .Y(n229) );
  AND2X2 U68 ( .A(n290), .B(n207), .Y(n298) );
  AND2X2 U74 ( .A(n230), .B(n299), .Y(n226) );
  OAI31X1 U3 ( .A0(n279), .A1(n202), .A2(n266), .B0(n201), .Y(n276) );
  AOI211X1 U4 ( .A0(n269), .A1(n228), .B0(n281), .C0(n282), .Y(n279) );
  NAND2X1 U5 ( .A(n284), .B(n264), .Y(n281) );
  AOI21X1 U7 ( .A0(n283), .A1(n207), .B0(n206), .Y(n282) );
  AOI31X1 U8 ( .A0(n284), .A1(n207), .A2(n283), .B0(n206), .Y(n273) );
  OAI21XL U9 ( .A0(n239), .A1(n240), .B0(n241), .Y(n234) );
  AOI21X1 U10 ( .A0(n228), .A1(n269), .B0(n273), .Y(n287) );
  OAI21XL U11 ( .A0(n226), .A1(n292), .B0(n227), .Y(n296) );
  XOR2X1 U12 ( .A(n285), .B(n286), .Y(DIFF[13]) );
  OAI21XL U13 ( .A0(n266), .A1(n287), .B0(n264), .Y(n285) );
  NOR2X1 U14 ( .A(n280), .B(n202), .Y(n286) );
  NAND2X1 U15 ( .A(n235), .B(n214), .Y(n270) );
  XOR2X1 U16 ( .A(n225), .B(n226), .Y(DIFF[9]) );
  NAND2X1 U17 ( .A(n209), .B(n227), .Y(n225) );
  XOR2X1 U18 ( .A(n288), .B(n287), .Y(DIFF[12]) );
  NAND2BX1 U19 ( .AN(n266), .B(n264), .Y(n288) );
  XOR2X1 U20 ( .A(n242), .B(n240), .Y(DIFF[5]) );
  NAND2X1 U21 ( .A(n214), .B(n241), .Y(n242) );
  AND4X2 U22 ( .A(n290), .B(n289), .C(n209), .D(n231), .Y(n269) );
  INVX1 U23 ( .A(n245), .Y(n215) );
  INVX1 U24 ( .A(n297), .Y(n207) );
  XOR2X1 U25 ( .A(n296), .B(n298), .Y(DIFF[10]) );
  XOR2X1 U26 ( .A(n228), .B(n229), .Y(DIFF[8]) );
  XOR2X1 U27 ( .A(n294), .B(n295), .Y(DIFF[11]) );
  NAND2X1 U28 ( .A(n289), .B(n284), .Y(n294) );
  AOI21X1 U29 ( .A0(n296), .A1(n290), .B0(n297), .Y(n295) );
  XOR2X1 U30 ( .A(n276), .B(n278), .Y(DIFF[14]) );
  NOR2X1 U31 ( .A(n200), .B(n277), .Y(n278) );
  XNOR2X1 U32 ( .A(n238), .B(n234), .Y(DIFF[6]) );
  NAND2X1 U33 ( .A(n212), .B(n235), .Y(n238) );
  NAND2X1 U34 ( .A(n290), .B(n291), .Y(n283) );
  OAI21XL U35 ( .A0(n292), .A1(n230), .B0(n227), .Y(n291) );
  INVX1 U36 ( .A(n239), .Y(n214) );
  INVX1 U37 ( .A(n260), .Y(n200) );
  INVX1 U38 ( .A(n292), .Y(n209) );
  INVX1 U39 ( .A(n277), .Y(n199) );
  INVX1 U40 ( .A(n236), .Y(n212) );
  INVX1 U41 ( .A(n289), .Y(n206) );
  INVX1 U42 ( .A(n263), .Y(n202) );
  INVX1 U43 ( .A(n280), .Y(n201) );
  XOR2X1 U44 ( .A(n255), .B(n256), .Y(DIFF[16]) );
  NOR2X1 U45 ( .A(n219), .B(A[12]), .Y(n266) );
  NOR2X1 U46 ( .A(n222), .B(A[4]), .Y(n245) );
  AOI22X1 U47 ( .A0(n222), .A1(A[4]), .B0(n215), .B1(n243), .Y(n240) );
  OAI211X1 U48 ( .A0(n210), .A1(n267), .B0(n231), .C0(n237), .Y(n299) );
  INVX1 U49 ( .A(n293), .Y(n210) );
  NOR2X1 U50 ( .A(n220), .B(A[9]), .Y(n292) );
  NOR2BX1 U51 ( .AN(B[2]), .B(A[2]), .Y(n248) );
  INVX1 U52 ( .A(A[7]), .Y(n211) );
  AOI31X1 U53 ( .A0(n257), .A1(n199), .A2(n258), .B0(n259), .Y(n255) );
  NAND3X1 U54 ( .A(n201), .B(n260), .C(n261), .Y(n258) );
  OAI21XL U55 ( .A0(n262), .A1(n204), .B0(n263), .Y(n261) );
  INVX1 U56 ( .A(n264), .Y(n204) );
  XOR2X1 U57 ( .A(n274), .B(n275), .Y(DIFF[15]) );
  NAND2BX1 U58 ( .AN(n259), .B(n257), .Y(n274) );
  AOI21X1 U59 ( .A0(n276), .A1(n199), .B0(n200), .Y(n275) );
  NAND2X1 U60 ( .A(A[12]), .B(n219), .Y(n264) );
  NAND2X1 U61 ( .A(B[10]), .B(n208), .Y(n290) );
  NAND2BX1 U62 ( .AN(A[6]), .B(B[6]), .Y(n235) );
  NAND2X1 U63 ( .A(A[9]), .B(n220), .Y(n227) );
  NAND2X1 U64 ( .A(n271), .B(n272), .Y(n243) );
  NAND2BX1 U65 ( .AN(B[2]), .B(A[2]), .Y(n250) );
  NAND2BX1 U66 ( .AN(B[11]), .B(A[11]), .Y(n284) );
  NOR2X1 U67 ( .A(n221), .B(A[5]), .Y(n239) );
  AOI2BB1X1 U69 ( .A0N(A[3]), .A1N(n223), .B0(n248), .Y(n301) );
  NOR2X1 U70 ( .A(n203), .B(B[13]), .Y(n280) );
  NOR2X1 U71 ( .A(n218), .B(A[14]), .Y(n277) );
  NOR2X1 U72 ( .A(n208), .B(B[10]), .Y(n297) );
  NOR2BX1 U73 ( .AN(A[6]), .B(B[6]), .Y(n236) );
  NAND2X1 U75 ( .A(A[5]), .B(n221), .Y(n241) );
  OAI2BB1X1 U76 ( .A0N(n237), .A1N(n267), .B0(n293), .Y(n228) );
  NAND2BX1 U77 ( .AN(A[11]), .B(B[11]), .Y(n289) );
  NAND2BX1 U78 ( .AN(B[8]), .B(A[8]), .Y(n230) );
  NAND4BXL U79 ( .AN(n270), .B(n237), .C(n243), .D(n215), .Y(n293) );
  NAND3X1 U80 ( .A(n216), .B(n252), .C(n301), .Y(n272) );
  INVX1 U81 ( .A(B[9]), .Y(n220) );
  XOR2X1 U82 ( .A(n243), .B(n244), .Y(DIFF[4]) );
  AOI21X1 U83 ( .A0(A[4]), .A1(n222), .B0(n245), .Y(n244) );
  INVX1 U84 ( .A(B[14]), .Y(n218) );
  INVX1 U85 ( .A(B[12]), .Y(n219) );
  INVX1 U86 ( .A(B[5]), .Y(n221) );
  INVX1 U87 ( .A(A[13]), .Y(n203) );
  NAND2X1 U88 ( .A(B[13]), .B(n203), .Y(n263) );
  NAND2BX1 U89 ( .AN(A[8]), .B(B[8]), .Y(n231) );
  NAND2X1 U90 ( .A(A[14]), .B(n218), .Y(n260) );
  INVX1 U91 ( .A(A[10]), .Y(n208) );
  AOI21X1 U92 ( .A0(n205), .A1(n265), .B0(n266), .Y(n262) );
  INVX1 U93 ( .A(n273), .Y(n205) );
  OAI211X1 U94 ( .A0(n267), .A1(n268), .B0(n237), .C0(n269), .Y(n265) );
  OAI33X1 U95 ( .A0(n270), .A1(n245), .A2(n271), .B0(n272), .B1(n245), .B2(
        n270), .Y(n268) );
  XOR2X1 U96 ( .A(n251), .B(n249), .Y(DIFF[2]) );
  NAND2BX1 U97 ( .AN(n248), .B(n250), .Y(n251) );
  INVX1 U98 ( .A(n254), .Y(n216) );
  OAI221XL U99 ( .A0(n300), .A1(n270), .B0(B[7]), .B1(n211), .C0(n212), .Y(
        n267) );
  AOI21X1 U100 ( .A0(A[4]), .A1(n222), .B0(n213), .Y(n300) );
  INVX1 U101 ( .A(n241), .Y(n213) );
  NAND2X1 U102 ( .A(B[7]), .B(n211), .Y(n237) );
  OAI21XL U103 ( .A0(B[0]), .A1(n217), .B0(n252), .Y(DIFF[0]) );
  AOI22X1 U104 ( .A0(n224), .A1(A[1]), .B0(n216), .B1(n252), .Y(n249) );
  INVX1 U105 ( .A(B[4]), .Y(n222) );
  NAND2X1 U106 ( .A(B[0]), .B(n217), .Y(n252) );
  XOR2X1 U107 ( .A(n232), .B(n233), .Y(DIFF[7]) );
  OAI21XL U108 ( .A0(B[7]), .A1(n211), .B0(n237), .Y(n232) );
  AOI21X1 U109 ( .A0(n234), .A1(n235), .B0(n236), .Y(n233) );
  INVX1 U110 ( .A(B[1]), .Y(n224) );
  AOI22X1 U111 ( .A0(n223), .A1(A[3]), .B0(n302), .B1(n301), .Y(n271) );
  OAI2BB1X1 U112 ( .A0N(A[1]), .A1N(n224), .B0(n250), .Y(n302) );
  INVX1 U113 ( .A(A[0]), .Y(n217) );
  XOR2X1 U114 ( .A(n246), .B(n247), .Y(DIFF[3]) );
  XNOR2X1 U115 ( .A(A[3]), .B(B[3]), .Y(n247) );
  OAI21XL U116 ( .A0(n248), .A1(n249), .B0(n250), .Y(n246) );
  NOR2X1 U117 ( .A(n224), .B(A[1]), .Y(n254) );
  INVX1 U118 ( .A(B[3]), .Y(n223) );
  XOR2X1 U119 ( .A(n252), .B(n253), .Y(DIFF[1]) );
  AOI21X1 U120 ( .A0(A[1]), .A1(n224), .B0(n254), .Y(n253) );
  NOR2BX1 U121 ( .AN(A[15]), .B(B[15]), .Y(n259) );
  NAND2BX1 U122 ( .AN(A[15]), .B(B[15]), .Y(n257) );
  XOR2X1 U123 ( .A(B[16]), .B(A[16]), .Y(n256) );
endmodule


module butterfly_DW01_add_54 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n324, n323, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n321;

  AND2X2 U14 ( .A(n267), .B(n245), .Y(n263) );
  OR2X4 U42 ( .A(n295), .B(n294), .Y(n289) );
  AND2X2 U70 ( .A(B[6]), .B(A[6]), .Y(n260) );
  AND2X2 U76 ( .A(B[2]), .B(A[2]), .Y(n276) );
  NOR2X4 U81 ( .A(A[6]), .B(B[6]), .Y(n262) );
  BUFX3 U2 ( .A(n324), .Y(SUM[13]) );
  OAI21XL U3 ( .A0(n292), .A1(n289), .B0(n293), .Y(n324) );
  XOR2X4 U4 ( .A(n280), .B(n281), .Y(SUM[16]) );
  AOI31X2 U5 ( .A0(n282), .A1(n235), .A2(n283), .B0(n233), .Y(n281) );
  XOR2X4 U6 ( .A(n287), .B(n288), .Y(SUM[15]) );
  AOI31X4 U7 ( .A0(n235), .A1(n236), .A2(n289), .B0(n234), .Y(n288) );
  CLKINVX4 U8 ( .A(n323), .Y(n321) );
  INVX8 U9 ( .A(n321), .Y(SUM[14]) );
  INVX1 U10 ( .A(n270), .Y(n245) );
  AOI211X1 U11 ( .A0(B[7]), .A1(A[7]), .B0(n260), .C0(n316), .Y(n315) );
  AOI21X1 U12 ( .A0(n245), .A1(n265), .B0(n317), .Y(n316) );
  NOR2X1 U13 ( .A(n250), .B(n248), .Y(n278) );
  INVX1 U15 ( .A(A[4]), .Y(n246) );
  OAI2BB1X1 U16 ( .A0N(A[3]), .A1N(B[3]), .B0(n318), .Y(n268) );
  OAI21XL U17 ( .A0(n300), .A1(n301), .B0(n302), .Y(n298) );
  NAND4X1 U18 ( .A(n241), .B(n239), .C(n242), .D(n303), .Y(n302) );
  NAND2X1 U19 ( .A(n284), .B(n282), .Y(n287) );
  XNOR2X1 U20 ( .A(n285), .B(n291), .Y(n323) );
  XOR2X1 U21 ( .A(n257), .B(n258), .Y(SUM[7]) );
  XNOR2X1 U22 ( .A(B[16]), .B(A[16]), .Y(n280) );
  NOR2XL U23 ( .A(n290), .B(n234), .Y(n291) );
  NAND2X2 U24 ( .A(n285), .B(n286), .Y(n283) );
  INVX1 U25 ( .A(n290), .Y(n235) );
  XNOR2XL U26 ( .A(n299), .B(n298), .Y(SUM[12]) );
  NAND2X2 U27 ( .A(B[5]), .B(A[5]), .Y(n265) );
  OAI21X4 U28 ( .A0(B[5]), .A1(A[5]), .B0(n244), .Y(n317) );
  AND2X2 U29 ( .A(B[13]), .B(A[13]), .Y(n294) );
  INVX2 U30 ( .A(n315), .Y(n243) );
  NAND2XL U31 ( .A(n289), .B(n236), .Y(n285) );
  INVXL U32 ( .A(n253), .Y(n241) );
  INVXL U33 ( .A(n306), .Y(n240) );
  OAI21X2 U34 ( .A0(n296), .A1(n237), .B0(n297), .Y(n295) );
  INVXL U35 ( .A(n307), .Y(n239) );
  INVXL U36 ( .A(n304), .Y(n242) );
  INVXL U37 ( .A(n262), .Y(n244) );
  NAND2BXL U38 ( .AN(n296), .B(n297), .Y(n299) );
  XOR2XL U39 ( .A(n312), .B(n311), .Y(SUM[10]) );
  NAND2XL U40 ( .A(n239), .B(n308), .Y(n312) );
  INVX2 U41 ( .A(n274), .Y(n247) );
  NOR2XL U43 ( .A(n240), .B(n253), .Y(n252) );
  NOR2XL U44 ( .A(A[11]), .B(B[11]), .Y(n301) );
  AOI2BB1X4 U45 ( .A0N(A[11]), .A1N(B[11]), .B0(n255), .Y(n303) );
  NOR2X2 U46 ( .A(A[13]), .B(B[13]), .Y(n292) );
  INVXL U47 ( .A(n284), .Y(n233) );
  NOR2XL U48 ( .A(A[5]), .B(B[5]), .Y(n264) );
  OAI21X1 U49 ( .A0(n278), .A1(A[1]), .B0(B[1]), .Y(n319) );
  AOI32X2 U50 ( .A0(n313), .A1(n268), .A2(n314), .B0(n314), .B1(n243), .Y(n255) );
  AOI21XL U51 ( .A0(n259), .A1(n244), .B0(n260), .Y(n258) );
  NAND2XL U52 ( .A(n273), .B(n247), .Y(n271) );
  XOR2XL U53 ( .A(B[1]), .B(A[1]), .Y(n279) );
  OAI21XL U54 ( .A0(n294), .A1(n292), .B0(n295), .Y(n293) );
  AOI211X1 U55 ( .A0(n256), .A1(n306), .B0(n307), .C0(n253), .Y(n305) );
  INVX1 U56 ( .A(n298), .Y(n237) );
  XOR2X1 U57 ( .A(n251), .B(n252), .Y(SUM[9]) );
  AOI21X1 U58 ( .A0(n251), .A1(n241), .B0(n240), .Y(n311) );
  NOR2X1 U59 ( .A(A[9]), .B(B[9]), .Y(n253) );
  INVX1 U60 ( .A(n292), .Y(n236) );
  NAND2X1 U61 ( .A(B[9]), .B(A[9]), .Y(n306) );
  INVX1 U62 ( .A(n308), .Y(n238) );
  XOR2X1 U63 ( .A(n259), .B(n261), .Y(SUM[6]) );
  NOR2X1 U64 ( .A(n262), .B(n260), .Y(n261) );
  INVX1 U65 ( .A(n286), .Y(n234) );
  NOR2X1 U66 ( .A(A[2]), .B(B[2]), .Y(n274) );
  AOI211X1 U67 ( .A0(B[11]), .A1(A[11]), .B0(n238), .C0(n305), .Y(n300) );
  NOR2X1 U68 ( .A(A[10]), .B(B[10]), .Y(n307) );
  NOR2X1 U69 ( .A(n249), .B(n246), .Y(n270) );
  OR2X2 U71 ( .A(n277), .B(n276), .Y(n273) );
  XOR2X1 U72 ( .A(n254), .B(n255), .Y(SUM[8]) );
  NAND2X1 U73 ( .A(n256), .B(n242), .Y(n254) );
  XOR2X1 U74 ( .A(n309), .B(n310), .Y(SUM[11]) );
  XOR2X1 U75 ( .A(B[11]), .B(A[11]), .Y(n310) );
  OAI21XL U77 ( .A0(n307), .A1(n311), .B0(n308), .Y(n309) );
  OAI21XL U78 ( .A0(n304), .A1(n255), .B0(n256), .Y(n251) );
  NOR2X1 U79 ( .A(A[8]), .B(B[8]), .Y(n304) );
  NAND2X1 U80 ( .A(B[10]), .B(A[10]), .Y(n308) );
  NAND2X1 U82 ( .A(B[8]), .B(A[8]), .Y(n256) );
  NOR2X1 U83 ( .A(A[12]), .B(B[12]), .Y(n296) );
  NAND2X1 U84 ( .A(B[12]), .B(A[12]), .Y(n297) );
  XOR2X1 U85 ( .A(n268), .B(n269), .Y(SUM[4]) );
  AOI21X1 U86 ( .A0(n246), .A1(n249), .B0(n270), .Y(n269) );
  XOR2X1 U87 ( .A(n266), .B(n263), .Y(SUM[5]) );
  OAI21XL U88 ( .A0(B[5]), .A1(A[5]), .B0(n265), .Y(n266) );
  OAI21XL U89 ( .A0(n263), .A1(n264), .B0(n265), .Y(n259) );
  NOR2X1 U90 ( .A(A[14]), .B(B[14]), .Y(n290) );
  NAND2X1 U91 ( .A(B[14]), .B(A[14]), .Y(n286) );
  OAI21X1 U92 ( .A0(n274), .A1(n273), .B0(n275), .Y(SUM[2]) );
  OAI21XL U93 ( .A0(n274), .A1(n276), .B0(n277), .Y(n275) );
  INVX1 U94 ( .A(B[4]), .Y(n249) );
  OR2X2 U95 ( .A(A[7]), .B(B[7]), .Y(n314) );
  OAI211X1 U96 ( .A0(B[3]), .A1(A[3]), .B0(n273), .C0(n247), .Y(n318) );
  NAND2X1 U97 ( .A(B[15]), .B(A[15]), .Y(n284) );
  OAI2BB1X1 U98 ( .A0N(n278), .A1N(A[1]), .B0(n319), .Y(n277) );
  OR2X2 U99 ( .A(B[15]), .B(A[15]), .Y(n282) );
  XNOR2X1 U100 ( .A(A[7]), .B(B[7]), .Y(n257) );
  OAI21XL U101 ( .A0(A[4]), .A1(B[4]), .B0(n268), .Y(n267) );
  XOR2X1 U102 ( .A(n278), .B(n279), .Y(SUM[1]) );
  XOR2X1 U103 ( .A(n271), .B(n272), .Y(SUM[3]) );
  XNOR2X1 U104 ( .A(A[3]), .B(B[3]), .Y(n272) );
  AOI21X1 U105 ( .A0(n250), .A1(n248), .B0(n278), .Y(SUM[0]) );
  INVX1 U106 ( .A(B[0]), .Y(n250) );
  INVX1 U107 ( .A(A[0]), .Y(n248) );
  AOI21XL U108 ( .A0(n249), .A1(n246), .B0(n317), .Y(n313) );
endmodule


module butterfly_DW01_add_58 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258;

  AND2X2 U88 ( .A(B[6]), .B(A[6]), .Y(n195) );
  XOR2X1 U2 ( .A(n242), .B(n243), .Y(SUM[12]) );
  NAND2X1 U3 ( .A(n174), .B(n220), .Y(n242) );
  NOR2X1 U4 ( .A(n220), .B(n236), .Y(n235) );
  NAND2X1 U5 ( .A(n250), .B(n176), .Y(n251) );
  XOR2X1 U6 ( .A(n207), .B(n209), .Y(SUM[2]) );
  XOR2X1 U7 ( .A(n205), .B(n206), .Y(SUM[3]) );
  CLKINVX3 U8 ( .A(n203), .Y(n181) );
  NAND2X1 U9 ( .A(B[0]), .B(A[0]), .Y(n211) );
  NOR2X2 U10 ( .A(B[2]), .B(A[2]), .Y(n210) );
  AND2X2 U11 ( .A(B[2]), .B(A[2]), .Y(n208) );
  OAI21X4 U12 ( .A0(n213), .A1(n211), .B0(n214), .Y(n207) );
  OAI221X2 U13 ( .A0(A[3]), .A1(B[3]), .B0(n208), .B1(n207), .C0(n182), .Y(
        n256) );
  XOR2X1 U14 ( .A(n183), .B(n184), .Y(SUM[9]) );
  OAI21X2 U15 ( .A0(n184), .A1(n185), .B0(n186), .Y(n249) );
  OAI2BB1X4 U16 ( .A0N(A[3]), .A1N(B[3]), .B0(n256), .Y(n203) );
  AOI211X1 U17 ( .A0(n202), .A1(n200), .B0(n199), .C0(n194), .Y(n257) );
  INVX1 U18 ( .A(n224), .Y(n170) );
  AOI2BB1X2 U19 ( .A0N(n193), .A1N(n194), .B0(n195), .Y(n192) );
  AOI211X1 U20 ( .A0(A[11]), .A1(B[11]), .B0(n246), .C0(n177), .Y(n241) );
  AOI211X1 U21 ( .A0(n190), .A1(n186), .B0(n245), .C0(n185), .Y(n246) );
  OAI2BB1X1 U22 ( .A0N(A[11]), .A1N(B[11]), .B0(n175), .Y(n247) );
  OAI21X2 U23 ( .A0(n252), .A1(n253), .B0(n254), .Y(n188) );
  NOR2XL U24 ( .A(n185), .B(n245), .Y(n244) );
  NOR3XL U25 ( .A(n225), .B(n234), .C(n235), .Y(n231) );
  NOR2XL U26 ( .A(n180), .B(n199), .Y(n198) );
  INVXL U27 ( .A(n231), .Y(n172) );
  INVXL U28 ( .A(n199), .Y(n179) );
  INVXL U29 ( .A(n200), .Y(n180) );
  AOI211XL U30 ( .A0(n220), .A1(n174), .B0(n221), .C0(n222), .Y(n218) );
  AOI211XL U31 ( .A0(n225), .A1(n226), .B0(n169), .C0(n171), .Y(n223) );
  NOR2XL U32 ( .A(A[7]), .B(B[7]), .Y(n253) );
  AOI211XL U33 ( .A0(B[7]), .A1(A[7]), .B0(n195), .C0(n257), .Y(n252) );
  XOR2X2 U34 ( .A(n191), .B(n192), .Y(SUM[7]) );
  NOR2XL U35 ( .A(B[1]), .B(A[1]), .Y(n213) );
  AOI21XL U36 ( .A0(n249), .A1(n176), .B0(n177), .Y(n248) );
  NAND2XL U37 ( .A(B[1]), .B(A[1]), .Y(n214) );
  NAND2XL U38 ( .A(B[8]), .B(A[8]), .Y(n190) );
  AOI21XL U39 ( .A0(n207), .A1(n182), .B0(n208), .Y(n206) );
  OR2XL U40 ( .A(B[8]), .B(A[8]), .Y(n189) );
  NOR2XL U41 ( .A(A[11]), .B(B[11]), .Y(n240) );
  NOR2XL U42 ( .A(B[10]), .B(A[10]), .Y(n245) );
  NAND2XL U43 ( .A(B[10]), .B(A[10]), .Y(n250) );
  NOR2XL U44 ( .A(B[12]), .B(A[12]), .Y(n236) );
  NOR2XL U45 ( .A(B[15]), .B(A[15]), .Y(n222) );
  NAND2XL U46 ( .A(B[13]), .B(A[13]), .Y(n230) );
  NAND2XL U47 ( .A(B[14]), .B(A[14]), .Y(n227) );
  OR2XL U48 ( .A(B[13]), .B(A[13]), .Y(n226) );
  AND2X1 U49 ( .A(B[12]), .B(A[12]), .Y(n225) );
  AND2X1 U50 ( .A(B[15]), .B(A[15]), .Y(n219) );
  AOI21X1 U51 ( .A0(n179), .A1(n197), .B0(n180), .Y(n193) );
  INVX1 U52 ( .A(n234), .Y(n174) );
  NAND4X1 U53 ( .A(n188), .B(n175), .C(n189), .D(n244), .Y(n220) );
  AOI21X1 U54 ( .A0(n188), .A1(n189), .B0(n178), .Y(n184) );
  INVX1 U55 ( .A(n190), .Y(n178) );
  XOR2X1 U56 ( .A(n237), .B(n238), .Y(SUM[13]) );
  NAND2X1 U57 ( .A(n226), .B(n230), .Y(n237) );
  NOR3X1 U58 ( .A(n239), .B(n225), .C(n235), .Y(n238) );
  NOR3X1 U59 ( .A(n236), .B(n240), .C(n241), .Y(n239) );
  OAI21XL U60 ( .A0(n181), .A1(n201), .B0(n202), .Y(n197) );
  XNOR2X1 U61 ( .A(n204), .B(n203), .Y(SUM[4]) );
  NAND2BX1 U62 ( .AN(n201), .B(n202), .Y(n204) );
  XOR2X1 U63 ( .A(n197), .B(n198), .Y(SUM[5]) );
  NAND2BX1 U64 ( .AN(n185), .B(n186), .Y(n183) );
  XNOR2X1 U65 ( .A(n187), .B(n188), .Y(SUM[8]) );
  NAND2X1 U66 ( .A(n189), .B(n190), .Y(n187) );
  XOR2X1 U67 ( .A(n228), .B(n229), .Y(SUM[15]) );
  NOR2X1 U68 ( .A(n219), .B(n222), .Y(n229) );
  OAI221XL U69 ( .A0(n224), .A1(n230), .B0(n231), .B1(n221), .C0(n227), .Y(
        n228) );
  XOR2X1 U70 ( .A(n196), .B(n193), .Y(SUM[6]) );
  OR2X2 U71 ( .A(n195), .B(n194), .Y(n196) );
  XNOR2X1 U72 ( .A(n251), .B(n249), .Y(SUM[10]) );
  INVX1 U73 ( .A(n210), .Y(n182) );
  NOR2X1 U74 ( .A(n236), .B(n225), .Y(n243) );
  XOR2X1 U75 ( .A(n232), .B(n233), .Y(SUM[14]) );
  NAND2X1 U76 ( .A(n170), .B(n227), .Y(n232) );
  AOI31X1 U77 ( .A0(n173), .A1(n226), .A2(n172), .B0(n171), .Y(n233) );
  XOR2X1 U78 ( .A(n211), .B(n212), .Y(SUM[1]) );
  NAND2BX1 U79 ( .AN(n213), .B(n214), .Y(n212) );
  NOR2X1 U80 ( .A(n241), .B(n240), .Y(n234) );
  NOR2X1 U81 ( .A(n208), .B(n210), .Y(n209) );
  NAND3X1 U82 ( .A(n226), .B(n170), .C(n173), .Y(n221) );
  INVX1 U83 ( .A(n245), .Y(n176) );
  INVX1 U84 ( .A(n236), .Y(n173) );
  INVX1 U85 ( .A(n240), .Y(n175) );
  INVX1 U86 ( .A(n250), .Y(n177) );
  INVX1 U87 ( .A(n227), .Y(n169) );
  INVX1 U89 ( .A(n230), .Y(n171) );
  NAND4BXL U90 ( .AN(n194), .B(n179), .C(n203), .D(n255), .Y(n254) );
  NOR2X1 U91 ( .A(B[4]), .B(A[4]), .Y(n201) );
  NOR2X1 U92 ( .A(B[6]), .B(A[6]), .Y(n194) );
  NOR2X1 U93 ( .A(A[5]), .B(B[5]), .Y(n199) );
  NAND2X1 U94 ( .A(B[4]), .B(A[4]), .Y(n202) );
  XNOR2X1 U95 ( .A(A[7]), .B(B[7]), .Y(n191) );
  XNOR2X1 U96 ( .A(A[3]), .B(B[3]), .Y(n205) );
  XOR2X1 U97 ( .A(n247), .B(n248), .Y(SUM[11]) );
  NAND2X1 U98 ( .A(B[5]), .B(A[5]), .Y(n200) );
  AOI2BB1X1 U99 ( .A0N(A[7]), .A1N(B[7]), .B0(n201), .Y(n255) );
  NOR2X1 U100 ( .A(B[9]), .B(A[9]), .Y(n185) );
  NAND2X1 U101 ( .A(B[9]), .B(A[9]), .Y(n186) );
  XOR2X1 U102 ( .A(n215), .B(n216), .Y(SUM[16]) );
  XNOR2X1 U103 ( .A(B[16]), .B(A[16]), .Y(n215) );
  NOR3X1 U104 ( .A(n217), .B(n218), .C(n219), .Y(n216) );
  NOR3X1 U105 ( .A(n223), .B(n224), .C(n222), .Y(n217) );
  INVX1 U106 ( .A(n258), .Y(SUM[0]) );
  OAI21XL U107 ( .A0(B[0]), .A1(A[0]), .B0(n211), .Y(n258) );
  NOR2X1 U108 ( .A(B[14]), .B(A[14]), .Y(n224) );
endmodule


module butterfly_DW01_add_62 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251;

  AND2X2 U13 ( .A(n192), .B(n190), .Y(n194) );
  AND2X2 U27 ( .A(n217), .B(n218), .Y(n216) );
  AND2X2 U31 ( .A(B[15]), .B(A[15]), .Y(n212) );
  AND2X2 U82 ( .A(B[2]), .B(A[2]), .Y(n202) );
  INVX1 U2 ( .A(n249), .Y(n175) );
  OAI211X1 U3 ( .A0(n229), .A1(n232), .B0(n239), .C0(n227), .Y(n237) );
  OAI211X1 U4 ( .A0(n171), .A1(n231), .B0(n230), .C0(n169), .Y(n239) );
  OAI21XL U5 ( .A0(n179), .A1(n240), .B0(n180), .Y(n243) );
  OAI21XL U6 ( .A0(n240), .A1(n184), .B0(n180), .Y(n231) );
  AOI31X1 U7 ( .A0(n226), .A1(n227), .A2(n228), .B0(n229), .Y(n224) );
  AOI21X1 U8 ( .A0(n230), .A1(n231), .B0(n170), .Y(n228) );
  INVX1 U9 ( .A(n232), .Y(n170) );
  NAND2X1 U10 ( .A(n214), .B(n215), .Y(n235) );
  OAI2BB1X1 U11 ( .A0N(n190), .A1N(n191), .B0(n192), .Y(n187) );
  XOR2X1 U12 ( .A(n201), .B(n203), .Y(SUM[2]) );
  NOR2X1 U14 ( .A(n202), .B(n204), .Y(n203) );
  XNOR2X1 U15 ( .A(n244), .B(n243), .Y(SUM[10]) );
  NAND2X1 U16 ( .A(n226), .B(n230), .Y(n244) );
  NAND2X1 U17 ( .A(n225), .B(n237), .Y(n214) );
  INVX1 U18 ( .A(n213), .Y(n167) );
  XOR2X1 U19 ( .A(n178), .B(n179), .Y(SUM[9]) );
  NAND2X1 U20 ( .A(n172), .B(n180), .Y(n178) );
  NAND2X1 U21 ( .A(n188), .B(n190), .Y(n249) );
  INVX1 U22 ( .A(n240), .Y(n172) );
  XNOR2X1 U23 ( .A(n189), .B(n187), .Y(SUM[6]) );
  NAND2X1 U24 ( .A(n188), .B(n193), .Y(n189) );
  XNOR2X1 U25 ( .A(n236), .B(n235), .Y(SUM[13]) );
  NAND2X1 U26 ( .A(n167), .B(n218), .Y(n236) );
  XNOR2X1 U28 ( .A(n238), .B(n237), .Y(SUM[12]) );
  NAND2X1 U29 ( .A(n225), .B(n215), .Y(n238) );
  XOR2X1 U30 ( .A(n191), .B(n194), .Y(SUM[5]) );
  XOR2X1 U32 ( .A(n241), .B(n242), .Y(SUM[11]) );
  NAND2X1 U33 ( .A(n227), .B(n169), .Y(n241) );
  AOI21X1 U34 ( .A0(n243), .A1(n230), .B0(n171), .Y(n242) );
  XOR2X1 U35 ( .A(n233), .B(n234), .Y(SUM[14]) );
  NAND2X1 U36 ( .A(n165), .B(n217), .Y(n233) );
  AOI21X1 U37 ( .A0(n167), .A1(n235), .B0(n166), .Y(n234) );
  INVX1 U38 ( .A(n204), .Y(n177) );
  INVX1 U39 ( .A(n229), .Y(n169) );
  INVX1 U40 ( .A(n226), .Y(n171) );
  INVX1 U41 ( .A(n223), .Y(n165) );
  INVX1 U42 ( .A(n218), .Y(n166) );
  INVX1 U43 ( .A(n193), .Y(n174) );
  INVX1 U44 ( .A(n215), .Y(n168) );
  XOR2X1 U45 ( .A(n209), .B(n210), .Y(SUM[16]) );
  AOI31X1 U46 ( .A0(n164), .A1(n165), .A2(n211), .B0(n212), .Y(n210) );
  INVX1 U47 ( .A(n219), .Y(n164) );
  OAI221XL U48 ( .A0(n213), .A1(n214), .B0(n213), .B1(n215), .C0(n216), .Y(
        n211) );
  OAI21XL U49 ( .A0(n207), .A1(n205), .B0(n208), .Y(n201) );
  NAND4X1 U50 ( .A(n230), .B(n172), .C(n183), .D(n182), .Y(n232) );
  NOR2X1 U51 ( .A(B[13]), .B(A[13]), .Y(n213) );
  NOR2X1 U52 ( .A(B[9]), .B(A[9]), .Y(n240) );
  AOI21X1 U53 ( .A0(n182), .A1(n183), .B0(n173), .Y(n179) );
  INVX1 U54 ( .A(n184), .Y(n173) );
  OR2X2 U55 ( .A(B[10]), .B(A[10]), .Y(n230) );
  XOR2X1 U56 ( .A(n220), .B(n221), .Y(SUM[15]) );
  NOR2X1 U57 ( .A(n219), .B(n212), .Y(n221) );
  OAI31X1 U58 ( .A0(n222), .A1(n223), .A2(n213), .B0(n217), .Y(n220) );
  AOI211X1 U59 ( .A0(n224), .A1(n225), .B0(n166), .C0(n168), .Y(n222) );
  XOR2X1 U60 ( .A(n198), .B(n195), .Y(SUM[4]) );
  NAND2BX1 U61 ( .AN(n196), .B(n197), .Y(n198) );
  NAND2X1 U62 ( .A(B[12]), .B(A[12]), .Y(n215) );
  NOR2X1 U63 ( .A(A[11]), .B(B[11]), .Y(n229) );
  NAND2X1 U64 ( .A(B[8]), .B(A[8]), .Y(n184) );
  XNOR2X1 U65 ( .A(n181), .B(n182), .Y(SUM[8]) );
  NAND2X1 U66 ( .A(n183), .B(n184), .Y(n181) );
  NAND2X1 U67 ( .A(B[9]), .B(A[9]), .Y(n180) );
  OAI21XL U68 ( .A0(n195), .A1(n196), .B0(n197), .Y(n191) );
  NAND2X1 U69 ( .A(B[10]), .B(A[10]), .Y(n226) );
  NOR2X1 U70 ( .A(B[2]), .B(A[2]), .Y(n204) );
  NAND2X1 U71 ( .A(B[13]), .B(A[13]), .Y(n218) );
  NAND2X1 U72 ( .A(B[11]), .B(A[11]), .Y(n227) );
  NAND2X1 U73 ( .A(B[5]), .B(A[5]), .Y(n192) );
  NOR2X1 U74 ( .A(A[14]), .B(B[14]), .Y(n223) );
  NAND2X1 U75 ( .A(B[14]), .B(A[14]), .Y(n217) );
  OR2X2 U76 ( .A(B[6]), .B(A[6]), .Y(n188) );
  XOR2X1 U77 ( .A(n205), .B(n206), .Y(SUM[1]) );
  NAND2BX1 U78 ( .AN(n207), .B(n208), .Y(n206) );
  OR2X2 U79 ( .A(B[8]), .B(A[8]), .Y(n183) );
  OR2X2 U80 ( .A(B[12]), .B(A[12]), .Y(n225) );
  NAND2X1 U81 ( .A(B[6]), .B(A[6]), .Y(n193) );
  AOI21X1 U83 ( .A0(n192), .A1(n197), .B0(n249), .Y(n248) );
  OR2X2 U84 ( .A(A[5]), .B(B[5]), .Y(n190) );
  OAI32X1 U85 ( .A0(n245), .A1(n195), .A2(n196), .B0(n246), .B1(n247), .Y(n182) );
  NOR2X1 U86 ( .A(B[7]), .B(A[7]), .Y(n247) );
  OAI21XL U87 ( .A0(B[7]), .A1(A[7]), .B0(n175), .Y(n245) );
  AOI211X1 U88 ( .A0(B[7]), .A1(A[7]), .B0(n248), .C0(n174), .Y(n246) );
  AOI21X1 U89 ( .A0(A[3]), .A1(B[3]), .B0(n176), .Y(n195) );
  INVX1 U90 ( .A(n250), .Y(n176) );
  OAI221XL U91 ( .A0(B[3]), .A1(A[3]), .B0(n202), .B1(n201), .C0(n177), .Y(
        n250) );
  XOR2X1 U92 ( .A(n199), .B(n200), .Y(SUM[3]) );
  XNOR2X1 U93 ( .A(A[3]), .B(B[3]), .Y(n199) );
  AOI21X1 U94 ( .A0(n201), .A1(n177), .B0(n202), .Y(n200) );
  NAND2X1 U95 ( .A(B[0]), .B(A[0]), .Y(n205) );
  NOR2X1 U96 ( .A(B[4]), .B(A[4]), .Y(n196) );
  NAND2X1 U97 ( .A(B[4]), .B(A[4]), .Y(n197) );
  NOR2X1 U98 ( .A(B[15]), .B(A[15]), .Y(n219) );
  NOR2X1 U99 ( .A(B[1]), .B(A[1]), .Y(n207) );
  INVX1 U100 ( .A(n251), .Y(SUM[0]) );
  OAI21XL U101 ( .A0(B[0]), .A1(A[0]), .B0(n205), .Y(n251) );
  NAND2X1 U102 ( .A(B[1]), .B(A[1]), .Y(n208) );
  XOR2X1 U103 ( .A(n185), .B(n186), .Y(SUM[7]) );
  XNOR2X1 U104 ( .A(A[7]), .B(B[7]), .Y(n185) );
  AOI21X1 U105 ( .A0(n187), .A1(n188), .B0(n174), .Y(n186) );
  XNOR2X1 U106 ( .A(B[16]), .B(A[16]), .Y(n209) );
endmodule


module butterfly_DW01_sub_45 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279;

  OAI21XL U3 ( .A0(n261), .A1(n266), .B0(n259), .Y(n247) );
  AOI31X1 U4 ( .A0(n188), .A1(n209), .A2(n262), .B0(n189), .Y(n266) );
  INVX1 U5 ( .A(n258), .Y(n189) );
  XNOR2X1 U6 ( .A(n265), .B(n247), .Y(DIFF[12]) );
  NAND2X1 U7 ( .A(n256), .B(n246), .Y(n265) );
  AOI21X1 U8 ( .A0(n207), .A1(n209), .B0(n210), .Y(n271) );
  AOI211X1 U9 ( .A0(n223), .A1(n194), .B0(n221), .C0(n192), .Y(n279) );
  INVX1 U10 ( .A(n227), .Y(n194) );
  OAI21XL U11 ( .A0(n255), .A1(n250), .B0(n263), .Y(DIFF[13]) );
  OAI2BB1X1 U12 ( .A0N(n187), .A1N(n257), .B0(n264), .Y(n263) );
  XOR2X1 U13 ( .A(n252), .B(n253), .Y(DIFF[14]) );
  NAND2X1 U14 ( .A(n241), .B(n186), .Y(n252) );
  AOI31X1 U15 ( .A0(n246), .A1(n187), .A2(n254), .B0(n244), .Y(n253) );
  AOI31X1 U16 ( .A0(n258), .A1(n259), .A2(n260), .B0(n261), .Y(n254) );
  OAI21XL U17 ( .A0(n221), .A1(n222), .B0(n223), .Y(n217) );
  OAI21XL U18 ( .A0(n213), .A1(n191), .B0(n214), .Y(n207) );
  OAI21XL U19 ( .A0(n191), .A1(n213), .B0(n267), .Y(n262) );
  NOR2BX1 U20 ( .AN(n214), .B(n210), .Y(n267) );
  INVX1 U21 ( .A(n255), .Y(n187) );
  OAI21XL U22 ( .A0(n255), .A1(n256), .B0(n257), .Y(n244) );
  INVX1 U23 ( .A(n270), .Y(n188) );
  XOR2X1 U24 ( .A(n207), .B(n208), .Y(DIFF[9]) );
  NOR2BX1 U25 ( .AN(n209), .B(n210), .Y(n208) );
  INVX1 U26 ( .A(n218), .Y(n192) );
  XOR2X1 U27 ( .A(n272), .B(n271), .Y(DIFF[10]) );
  NAND2X1 U28 ( .A(n258), .B(n188), .Y(n272) );
  XOR2X1 U29 ( .A(n217), .B(n220), .Y(DIFF[6]) );
  NOR2X1 U30 ( .A(n219), .B(n192), .Y(n220) );
  XOR2X1 U31 ( .A(n268), .B(n269), .Y(DIFF[11]) );
  OAI21XL U32 ( .A0(n270), .A1(n271), .B0(n258), .Y(n268) );
  NOR2BX1 U33 ( .AN(n259), .B(n261), .Y(n269) );
  XOR2X1 U34 ( .A(n224), .B(n222), .Y(DIFF[5]) );
  NAND2BX1 U35 ( .AN(n221), .B(n223), .Y(n224) );
  NAND2BX1 U36 ( .AN(n264), .B(n257), .Y(n250) );
  XOR2X1 U37 ( .A(n233), .B(n231), .Y(DIFF[2]) );
  NAND2X1 U38 ( .A(n198), .B(n232), .Y(n233) );
  OAI2BB1X1 U39 ( .A0N(n247), .A1N(n246), .B0(n256), .Y(n264) );
  INVX1 U40 ( .A(n236), .Y(n198) );
  INVX1 U41 ( .A(n251), .Y(n186) );
  NAND3X1 U42 ( .A(n188), .B(n209), .C(n262), .Y(n260) );
  XOR2X1 U43 ( .A(n238), .B(n239), .Y(DIFF[16]) );
  INVX1 U44 ( .A(B[7]), .Y(n205) );
  AOI22X1 U45 ( .A0(n206), .A1(A[1]), .B0(n234), .B1(n235), .Y(n231) );
  NOR2BX1 U46 ( .AN(B[5]), .B(A[5]), .Y(n221) );
  NOR2X1 U47 ( .A(n190), .B(B[9]), .Y(n210) );
  NOR2X1 U48 ( .A(n201), .B(A[13]), .Y(n255) );
  INVX1 U49 ( .A(A[4]), .Y(n195) );
  NOR2X1 U50 ( .A(n195), .B(B[4]), .Y(n227) );
  NOR2X1 U51 ( .A(n204), .B(A[8]), .Y(n213) );
  NOR2X1 U52 ( .A(n202), .B(A[11]), .Y(n261) );
  AOI21X1 U53 ( .A0(n225), .A1(n226), .B0(n227), .Y(n222) );
  NAND2X1 U54 ( .A(n195), .B(B[4]), .Y(n226) );
  AOI211X1 U55 ( .A0(B[4]), .A1(n195), .B0(n221), .C0(n192), .Y(n276) );
  NOR2X1 U56 ( .A(n193), .B(B[6]), .Y(n219) );
  AOI31X1 U57 ( .A0(n240), .A1(n241), .A2(n242), .B0(n243), .Y(n238) );
  NAND3BX1 U58 ( .AN(n244), .B(n245), .C(n186), .Y(n242) );
  NAND3X1 U59 ( .A(n246), .B(n187), .C(n247), .Y(n245) );
  NAND2BX1 U60 ( .AN(B[12]), .B(A[12]), .Y(n256) );
  NAND2X1 U61 ( .A(B[9]), .B(n190), .Y(n209) );
  NAND2X1 U62 ( .A(A[10]), .B(n203), .Y(n258) );
  NAND2BX1 U63 ( .AN(A[12]), .B(B[12]), .Y(n246) );
  NAND2X1 U64 ( .A(B[1]), .B(n199), .Y(n234) );
  NOR2X1 U65 ( .A(n203), .B(A[10]), .Y(n270) );
  NAND2BX1 U66 ( .AN(B[5]), .B(A[5]), .Y(n223) );
  NAND2X1 U67 ( .A(A[8]), .B(n204), .Y(n214) );
  NAND2BX1 U68 ( .AN(A[2]), .B(B[2]), .Y(n232) );
  INVX1 U69 ( .A(A[1]), .Y(n199) );
  NAND2BX1 U70 ( .AN(A[14]), .B(B[14]), .Y(n241) );
  INVX1 U71 ( .A(B[1]), .Y(n206) );
  NAND2X1 U72 ( .A(A[11]), .B(n202), .Y(n259) );
  NAND2X1 U73 ( .A(A[13]), .B(n201), .Y(n257) );
  INVX1 U74 ( .A(B[13]), .Y(n201) );
  NOR2BX1 U75 ( .AN(A[2]), .B(B[2]), .Y(n236) );
  NOR2BX1 U76 ( .AN(A[14]), .B(B[14]), .Y(n251) );
  XOR2X1 U77 ( .A(n225), .B(n228), .Y(DIFF[4]) );
  AOI21X1 U78 ( .A0(B[4]), .A1(n195), .B0(n227), .Y(n228) );
  XNOR2X1 U79 ( .A(n235), .B(n237), .Y(DIFF[1]) );
  OAI21XL U80 ( .A0(n199), .A1(B[1]), .B0(n234), .Y(n237) );
  XNOR2X1 U81 ( .A(n211), .B(n212), .Y(DIFF[8]) );
  NAND2BX1 U82 ( .AN(n213), .B(n214), .Y(n211) );
  INVX1 U83 ( .A(B[8]), .Y(n204) );
  INVX1 U84 ( .A(B[10]), .Y(n203) );
  INVX1 U85 ( .A(A[6]), .Y(n193) );
  INVX1 U86 ( .A(A[9]), .Y(n190) );
  NAND2X1 U87 ( .A(B[6]), .B(n193), .Y(n218) );
  INVX1 U88 ( .A(n212), .Y(n191) );
  XOR2X1 U89 ( .A(n248), .B(n249), .Y(DIFF[15]) );
  NAND2BX1 U90 ( .AN(n243), .B(n240), .Y(n248) );
  AOI31X1 U91 ( .A0(n187), .A1(n250), .A2(n241), .B0(n251), .Y(n249) );
  OAI22X1 U92 ( .A0(B[3]), .A1(n196), .B0(n277), .B1(n278), .Y(n225) );
  OAI2BB1X1 U93 ( .A0N(n196), .A1N(B[3]), .B0(n232), .Y(n278) );
  INVX1 U94 ( .A(A[3]), .Y(n196) );
  AOI221X1 U95 ( .A0(A[1]), .A1(n206), .B0(n235), .B1(n234), .C0(n236), .Y(
        n277) );
  OAI21XL U96 ( .A0(B[0]), .A1(n200), .B0(n235), .Y(DIFF[0]) );
  XOR2X1 U97 ( .A(n215), .B(n216), .Y(DIFF[7]) );
  XNOR2X1 U98 ( .A(n205), .B(A[7]), .Y(n216) );
  AOI21X1 U99 ( .A0(n217), .A1(n218), .B0(n219), .Y(n215) );
  NAND2X1 U100 ( .A(B[0]), .B(n200), .Y(n235) );
  OAI21XL U101 ( .A0(n273), .A1(n274), .B0(n275), .Y(n212) );
  NOR2X1 U102 ( .A(A[7]), .B(n205), .Y(n274) );
  OAI211X1 U103 ( .A0(A[7]), .A1(n205), .B0(n225), .C0(n276), .Y(n275) );
  AOI211X1 U104 ( .A0(A[7]), .A1(n205), .B0(n219), .C0(n279), .Y(n273) );
  XOR2X1 U105 ( .A(n229), .B(n230), .Y(DIFF[3]) );
  XNOR2X1 U106 ( .A(A[3]), .B(B[3]), .Y(n230) );
  OAI21XL U107 ( .A0(n197), .A1(n231), .B0(n198), .Y(n229) );
  INVX1 U108 ( .A(n232), .Y(n197) );
  INVX1 U109 ( .A(A[0]), .Y(n200) );
  INVX1 U110 ( .A(B[11]), .Y(n202) );
  NOR2BX1 U111 ( .AN(A[15]), .B(B[15]), .Y(n243) );
  NAND2BX1 U112 ( .AN(A[15]), .B(B[15]), .Y(n240) );
  XOR2X1 U113 ( .A(B[16]), .B(A[16]), .Y(n239) );
endmodule


module butterfly_DW01_add_68 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255;

  AND2X2 U13 ( .A(n185), .B(n183), .Y(n187) );
  AND2X2 U35 ( .A(B[15]), .B(A[15]), .Y(n207) );
  AND2X2 U68 ( .A(n234), .B(n176), .Y(n170) );
  AND2X2 U86 ( .A(B[2]), .B(A[2]), .Y(n195) );
  AOI22X1 U2 ( .A0(n160), .A1(n218), .B0(B[14]), .B1(A[14]), .Y(n217) );
  NAND3BX1 U3 ( .AN(n211), .B(n220), .C(n221), .Y(n218) );
  NOR2X1 U4 ( .A(B[11]), .B(A[11]), .Y(n235) );
  INVX1 U5 ( .A(n239), .Y(n165) );
  NAND2X1 U6 ( .A(B[4]), .B(A[4]), .Y(n190) );
  OR2X2 U7 ( .A(A[5]), .B(B[5]), .Y(n183) );
  NAND2X1 U8 ( .A(B[5]), .B(A[5]), .Y(n185) );
  NOR2X1 U9 ( .A(A[14]), .B(B[14]), .Y(n209) );
  INVX1 U10 ( .A(n216), .Y(n248) );
  NOR2X1 U11 ( .A(B[13]), .B(A[13]), .Y(n212) );
  NAND2X1 U12 ( .A(B[0]), .B(A[0]), .Y(n198) );
  NAND2X1 U14 ( .A(n252), .B(n253), .Y(n255) );
  XOR2X1 U15 ( .A(n236), .B(n237), .Y(SUM[11]) );
  XOR2X1 U16 ( .A(n184), .B(n187), .Y(SUM[5]) );
  NAND2X2 U17 ( .A(n216), .B(n249), .Y(n250) );
  NAND2XL U18 ( .A(B[13]), .B(A[13]), .Y(n220) );
  INVX1 U19 ( .A(n219), .Y(n252) );
  INVXL U20 ( .A(n218), .Y(n253) );
  OAI21X1 U21 ( .A0(B[7]), .A1(A[7]), .B0(n167), .Y(n241) );
  CLKINVX3 U22 ( .A(n246), .Y(n168) );
  NAND2XL U23 ( .A(B[1]), .B(A[1]), .Y(n201) );
  AOI21XL U24 ( .A0(n223), .A1(n163), .B0(n224), .Y(n222) );
  NOR2BX1 U25 ( .AN(n172), .B(n173), .Y(n171) );
  OAI21XL U26 ( .A0(n170), .A1(n173), .B0(n172), .Y(n238) );
  NOR2X2 U27 ( .A(B[9]), .B(A[9]), .Y(n173) );
  NAND2X1 U28 ( .A(n248), .B(n217), .Y(n251) );
  NAND2X4 U29 ( .A(n250), .B(n251), .Y(SUM[15]) );
  INVX2 U30 ( .A(n217), .Y(n249) );
  AOI211X2 U31 ( .A0(B[7]), .A1(A[7]), .B0(n244), .C0(n166), .Y(n242) );
  NOR2X1 U32 ( .A(B[7]), .B(A[7]), .Y(n243) );
  NAND2XL U33 ( .A(n219), .B(n218), .Y(n254) );
  NAND2X4 U34 ( .A(n254), .B(n255), .Y(SUM[14]) );
  AOI21X1 U36 ( .A0(n185), .A1(n190), .B0(n245), .Y(n244) );
  OAI221X2 U37 ( .A0(B[3]), .A1(A[3]), .B0(n195), .B1(n194), .C0(n169), .Y(
        n246) );
  OAI32X2 U38 ( .A0(n241), .A1(n188), .A2(n189), .B0(n242), .B1(n243), .Y(n175) );
  OR3X2 U39 ( .A(n212), .B(n213), .C(n222), .Y(n221) );
  AOI211X1 U40 ( .A0(n172), .A1(n176), .B0(n173), .C0(n233), .Y(n232) );
  NOR2X1 U41 ( .A(n225), .B(n212), .Y(n211) );
  NAND2XL U42 ( .A(B[6]), .B(A[6]), .Y(n186) );
  OAI21XL U43 ( .A0(n188), .A1(n189), .B0(n190), .Y(n184) );
  XNOR2X1 U44 ( .A(B[16]), .B(A[16]), .Y(n202) );
  NAND2X2 U45 ( .A(n215), .B(n229), .Y(n224) );
  NAND2XL U46 ( .A(n163), .B(n229), .Y(n236) );
  AOI21XL U47 ( .A0(n214), .A1(n215), .B0(n208), .Y(n204) );
  NOR3XL U48 ( .A(n212), .B(n209), .C(n213), .Y(n205) );
  INVXL U49 ( .A(n233), .Y(n164) );
  NOR2XL U50 ( .A(n195), .B(n197), .Y(n196) );
  OR2XL U51 ( .A(n208), .B(n207), .Y(n216) );
  INVXL U52 ( .A(n209), .Y(n160) );
  NAND2X2 U53 ( .A(n175), .B(n177), .Y(n234) );
  OR2X4 U54 ( .A(B[6]), .B(A[6]), .Y(n181) );
  NAND2XL U55 ( .A(B[11]), .B(A[11]), .Y(n229) );
  XOR2XL U56 ( .A(n191), .B(n188), .Y(SUM[4]) );
  NAND2BXL U57 ( .AN(n189), .B(n190), .Y(n191) );
  NAND2BXL U58 ( .AN(n200), .B(n201), .Y(n199) );
  XOR2X2 U59 ( .A(n202), .B(n203), .Y(SUM[16]) );
  AOI21XL U60 ( .A0(n194), .A1(n169), .B0(n195), .Y(n193) );
  INVX1 U61 ( .A(n245), .Y(n167) );
  XOR2X1 U62 ( .A(n226), .B(n227), .Y(SUM[13]) );
  NOR2X1 U63 ( .A(n161), .B(n212), .Y(n227) );
  AOI21X1 U64 ( .A0(n228), .A1(n225), .B0(n213), .Y(n226) );
  OAI21XL U65 ( .A0(n223), .A1(n224), .B0(n163), .Y(n228) );
  AOI21X1 U66 ( .A0(n238), .A1(n164), .B0(n165), .Y(n237) );
  OR4X2 U67 ( .A(n234), .B(n235), .C(n233), .D(n173), .Y(n215) );
  NAND2X1 U69 ( .A(n181), .B(n183), .Y(n245) );
  INVX1 U70 ( .A(n186), .Y(n166) );
  XNOR2X1 U71 ( .A(n170), .B(n171), .Y(SUM[9]) );
  XNOR2X1 U72 ( .A(n240), .B(n238), .Y(SUM[10]) );
  NAND2X1 U73 ( .A(n239), .B(n164), .Y(n240) );
  XOR2X1 U74 ( .A(n230), .B(n231), .Y(SUM[12]) );
  NOR2BX1 U75 ( .AN(n225), .B(n213), .Y(n231) );
  NAND2X1 U76 ( .A(n215), .B(n214), .Y(n230) );
  INVX1 U77 ( .A(n235), .Y(n163) );
  OAI21XL U78 ( .A0(n162), .A1(n223), .B0(n163), .Y(n214) );
  INVX1 U79 ( .A(n229), .Y(n162) );
  OR2X2 U80 ( .A(n232), .B(n165), .Y(n223) );
  INVX1 U81 ( .A(n197), .Y(n169) );
  INVX1 U82 ( .A(n220), .Y(n161) );
  XNOR2X1 U83 ( .A(n182), .B(n180), .Y(SUM[6]) );
  NAND2X1 U84 ( .A(n181), .B(n186), .Y(n182) );
  OAI2BB1X1 U85 ( .A0N(n183), .A1N(n184), .B0(n185), .Y(n180) );
  XOR2X1 U87 ( .A(n194), .B(n196), .Y(SUM[2]) );
  XNOR2X1 U88 ( .A(A[14]), .B(B[14]), .Y(n219) );
  NOR2X1 U89 ( .A(B[10]), .B(A[10]), .Y(n233) );
  NOR3X1 U90 ( .A(n208), .B(n209), .C(n210), .Y(n206) );
  AOI211X1 U91 ( .A0(B[14]), .A1(A[14]), .B0(n161), .C0(n211), .Y(n210) );
  XNOR2X1 U92 ( .A(n174), .B(n175), .Y(SUM[8]) );
  NAND2X1 U93 ( .A(n176), .B(n177), .Y(n174) );
  NOR2X1 U94 ( .A(A[12]), .B(B[12]), .Y(n213) );
  OAI21XL U95 ( .A0(n200), .A1(n198), .B0(n201), .Y(n194) );
  NOR2X1 U96 ( .A(B[15]), .B(A[15]), .Y(n208) );
  NAND2X1 U97 ( .A(B[12]), .B(A[12]), .Y(n225) );
  NOR2X1 U98 ( .A(B[2]), .B(A[2]), .Y(n197) );
  NAND2X1 U99 ( .A(B[9]), .B(A[9]), .Y(n172) );
  NAND2X1 U100 ( .A(B[8]), .B(A[8]), .Y(n176) );
  NAND2X1 U101 ( .A(B[10]), .B(A[10]), .Y(n239) );
  OR2X2 U102 ( .A(B[8]), .B(A[8]), .Y(n177) );
  XOR2X1 U103 ( .A(n198), .B(n199), .Y(SUM[1]) );
  AOI211X1 U104 ( .A0(n204), .A1(n205), .B0(n206), .C0(n207), .Y(n203) );
  AOI21X1 U105 ( .A0(A[3]), .A1(B[3]), .B0(n168), .Y(n188) );
  NOR2X1 U106 ( .A(B[4]), .B(A[4]), .Y(n189) );
  NOR2X1 U107 ( .A(B[1]), .B(A[1]), .Y(n200) );
  XOR2X1 U108 ( .A(n178), .B(n179), .Y(SUM[7]) );
  XNOR2X1 U109 ( .A(A[7]), .B(B[7]), .Y(n178) );
  AOI21X1 U110 ( .A0(n180), .A1(n181), .B0(n166), .Y(n179) );
  XOR2X1 U111 ( .A(n192), .B(n193), .Y(SUM[3]) );
  XNOR2X1 U112 ( .A(A[3]), .B(B[3]), .Y(n192) );
  INVX1 U113 ( .A(n247), .Y(SUM[0]) );
  OAI21XL U114 ( .A0(B[0]), .A1(A[0]), .B0(n198), .Y(n247) );
endmodule


module butterfly_DW01_sub_61 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301;

  OAI21X1 U3 ( .A0(n209), .A1(n230), .B0(n231), .Y(DIFF[8]) );
  XNOR2X1 U4 ( .A(n248), .B(n249), .Y(DIFF[4]) );
  XOR2X1 U5 ( .A(n235), .B(n236), .Y(DIFF[7]) );
  XOR2X1 U6 ( .A(n278), .B(n279), .Y(DIFF[14]) );
  XOR2X1 U7 ( .A(n227), .B(n228), .Y(DIFF[9]) );
  OAI21X1 U8 ( .A0(B[0]), .A1(n219), .B0(n260), .Y(DIFF[0]) );
  XOR2X1 U9 ( .A(n260), .B(n261), .Y(DIFF[1]) );
  NOR2X1 U10 ( .A(n214), .B(n247), .Y(n249) );
  OAI21XL U11 ( .A0(n232), .A1(n209), .B0(n233), .Y(n231) );
  INVX1 U12 ( .A(n234), .Y(n209) );
  OAI31X1 U13 ( .A0(n285), .A1(n205), .A2(n286), .B0(n287), .Y(n280) );
  AOI31X1 U14 ( .A0(n234), .A1(n233), .A2(n288), .B0(n289), .Y(n287) );
  AOI211X1 U15 ( .A0(n232), .A1(n208), .B0(n292), .C0(n207), .Y(n285) );
  NOR3X1 U16 ( .A(n286), .B(n205), .C(n290), .Y(n288) );
  NAND2BX1 U17 ( .AN(n240), .B(n241), .Y(n235) );
  AOI21X1 U18 ( .A0(n237), .A1(n238), .B0(n239), .Y(n236) );
  XOR2X1 U19 ( .A(n251), .B(n252), .Y(DIFF[3]) );
  NAND2X1 U20 ( .A(n254), .B(n255), .Y(n251) );
  AOI21X1 U21 ( .A0(n253), .A1(n216), .B0(n215), .Y(n252) );
  OAI31X1 U22 ( .A0(n297), .A1(n240), .A2(n211), .B0(n241), .Y(n233) );
  NOR3X1 U23 ( .A(n298), .B(n239), .C(n213), .Y(n297) );
  INVX1 U24 ( .A(n245), .Y(n213) );
  OAI32X1 U25 ( .A0(n247), .A1(n248), .A2(n243), .B0(n243), .B1(n250), .Y(n298) );
  NAND2X1 U26 ( .A(n269), .B(n268), .Y(n278) );
  NOR2X1 U27 ( .A(n270), .B(n203), .Y(n279) );
  NAND2X1 U28 ( .A(n208), .B(n229), .Y(n228) );
  XOR2X1 U29 ( .A(n246), .B(n244), .Y(DIFF[5]) );
  NAND2BX1 U30 ( .AN(n243), .B(n245), .Y(n246) );
  XOR2X1 U31 ( .A(n280), .B(n284), .Y(DIFF[12]) );
  NOR2BX1 U32 ( .AN(n281), .B(n276), .Y(n284) );
  XOR2X1 U33 ( .A(n293), .B(n294), .Y(DIFF[11]) );
  OR2X2 U34 ( .A(n286), .B(n289), .Y(n293) );
  AOI21X1 U35 ( .A0(n295), .A1(n291), .B0(n292), .Y(n294) );
  XOR2X1 U36 ( .A(n238), .B(n242), .Y(DIFF[6]) );
  NOR2X1 U37 ( .A(n239), .B(n211), .Y(n242) );
  XOR2X1 U38 ( .A(n253), .B(n256), .Y(DIFF[2]) );
  NOR2X1 U39 ( .A(n215), .B(n257), .Y(n256) );
  XOR2X1 U40 ( .A(n282), .B(n283), .Y(DIFF[13]) );
  NAND2BX1 U41 ( .AN(n275), .B(n277), .Y(n282) );
  AOI21X1 U42 ( .A0(n281), .A1(n280), .B0(n276), .Y(n283) );
  XNOR2X1 U43 ( .A(n296), .B(n295), .Y(DIFF[10]) );
  NAND2BX1 U44 ( .AN(n292), .B(n291), .Y(n296) );
  NAND3X1 U45 ( .A(n277), .B(n280), .C(n281), .Y(n268) );
  OAI21XL U46 ( .A0(n290), .A1(n227), .B0(n229), .Y(n295) );
  OAI21XL U47 ( .A0(n243), .A1(n244), .B0(n245), .Y(n238) );
  AOI2BB1X1 U48 ( .A0N(n247), .A1N(n248), .B0(n214), .Y(n244) );
  AOI21X1 U49 ( .A0(n277), .A1(n276), .B0(n275), .Y(n269) );
  INVX1 U50 ( .A(n257), .Y(n216) );
  NAND2X1 U51 ( .A(n230), .B(n234), .Y(n227) );
  NAND3X1 U52 ( .A(n267), .B(n268), .C(n269), .Y(n266) );
  INVX1 U53 ( .A(n290), .Y(n208) );
  INVX1 U54 ( .A(n258), .Y(n215) );
  INVX1 U55 ( .A(n250), .Y(n214) );
  INVX1 U56 ( .A(n262), .Y(n217) );
  INVX1 U57 ( .A(n267), .Y(n203) );
  OR2X2 U58 ( .A(n233), .B(n232), .Y(n230) );
  INVX1 U59 ( .A(n291), .Y(n205) );
  INVX1 U60 ( .A(n237), .Y(n211) );
  NAND2X1 U61 ( .A(n268), .B(n274), .Y(n273) );
  OAI21XL U62 ( .A0(n275), .A1(n276), .B0(n277), .Y(n274) );
  INVX1 U63 ( .A(n229), .Y(n207) );
  AOI2BB1X1 U64 ( .A0N(n218), .A1N(B[1]), .B0(n217), .Y(n261) );
  XOR2X1 U65 ( .A(n271), .B(n272), .Y(DIFF[15]) );
  XNOR2X1 U66 ( .A(n220), .B(A[15]), .Y(n272) );
  AOI21X1 U67 ( .A0(n273), .A1(n204), .B0(n203), .Y(n271) );
  INVX1 U68 ( .A(n270), .Y(n204) );
  XOR2X1 U69 ( .A(n263), .B(n264), .Y(DIFF[16]) );
  XOR2X1 U70 ( .A(B[16]), .B(A[16]), .Y(n264) );
  AOI22X1 U71 ( .A0(n265), .A1(n266), .B0(A[15]), .B1(n220), .Y(n263) );
  AOI2BB1X1 U72 ( .A0N(n220), .A1N(A[15]), .B0(n270), .Y(n265) );
  NOR2BX1 U73 ( .AN(A[12]), .B(B[12]), .Y(n276) );
  NOR2X1 U74 ( .A(n224), .B(A[5]), .Y(n243) );
  NOR2X1 U75 ( .A(n212), .B(B[6]), .Y(n239) );
  NOR2X1 U76 ( .A(n222), .B(A[9]), .Y(n290) );
  NOR2X1 U77 ( .A(n221), .B(A[14]), .Y(n270) );
  NAND2BX1 U78 ( .AN(A[13]), .B(B[13]), .Y(n277) );
  NOR2BX1 U79 ( .AN(A[13]), .B(B[13]), .Y(n275) );
  NOR2X1 U80 ( .A(n210), .B(B[8]), .Y(n232) );
  NOR2X1 U81 ( .A(n225), .B(A[4]), .Y(n247) );
  NOR2BX1 U82 ( .AN(B[11]), .B(A[11]), .Y(n286) );
  NOR2X1 U83 ( .A(n206), .B(B[10]), .Y(n292) );
  NAND2X1 U84 ( .A(B[0]), .B(n219), .Y(n260) );
  INVX1 U85 ( .A(A[1]), .Y(n218) );
  AOI2BB1X1 U86 ( .A0N(n259), .A1N(n260), .B0(n217), .Y(n253) );
  NOR2X1 U87 ( .A(B[1]), .B(n218), .Y(n259) );
  NAND2X1 U88 ( .A(B[10]), .B(n206), .Y(n291) );
  NAND2X1 U89 ( .A(A[5]), .B(n224), .Y(n245) );
  NAND2X1 U90 ( .A(A[9]), .B(n222), .Y(n229) );
  NOR2X1 U91 ( .A(n226), .B(A[2]), .Y(n257) );
  NAND2BX1 U92 ( .AN(A[3]), .B(B[3]), .Y(n254) );
  NAND2BX1 U93 ( .AN(A[12]), .B(B[12]), .Y(n281) );
  NAND2X1 U94 ( .A(B[8]), .B(n210), .Y(n234) );
  INVX1 U95 ( .A(B[15]), .Y(n220) );
  NOR2X1 U96 ( .A(n223), .B(A[7]), .Y(n240) );
  AND3X2 U97 ( .A(n299), .B(n300), .C(n255), .Y(n248) );
  NAND3X1 U98 ( .A(n216), .B(n254), .C(n301), .Y(n300) );
  NAND4X1 U99 ( .A(n260), .B(n262), .C(n216), .D(n254), .Y(n299) );
  OAI21XL U100 ( .A0(B[1]), .A1(n218), .B0(n258), .Y(n301) );
  NOR2BX1 U101 ( .AN(A[11]), .B(B[11]), .Y(n289) );
  NAND2X1 U102 ( .A(B[6]), .B(n212), .Y(n237) );
  NAND2X1 U103 ( .A(A[2]), .B(n226), .Y(n258) );
  NAND2X1 U104 ( .A(A[14]), .B(n221), .Y(n267) );
  NAND2X1 U105 ( .A(B[1]), .B(n218), .Y(n262) );
  NAND2X1 U106 ( .A(A[7]), .B(n223), .Y(n241) );
  NAND2X1 U107 ( .A(A[4]), .B(n225), .Y(n250) );
  INVX1 U108 ( .A(A[0]), .Y(n219) );
  NAND2BX1 U109 ( .AN(B[3]), .B(A[3]), .Y(n255) );
  INVX1 U110 ( .A(B[2]), .Y(n226) );
  INVX1 U111 ( .A(B[4]), .Y(n225) );
  INVX1 U112 ( .A(B[5]), .Y(n224) );
  INVX1 U113 ( .A(B[9]), .Y(n222) );
  INVX1 U114 ( .A(A[10]), .Y(n206) );
  INVX1 U115 ( .A(A[6]), .Y(n212) );
  INVX1 U116 ( .A(B[7]), .Y(n223) );
  INVX1 U117 ( .A(A[8]), .Y(n210) );
  INVX1 U118 ( .A(B[14]), .Y(n221) );
endmodule


module butterfly_DW01_sub_60 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301;

  NAND2XL U3 ( .A(A[4]), .B(n225), .Y(n247) );
  NAND2XL U4 ( .A(A[5]), .B(n224), .Y(n242) );
  AOI2BB1X1 U5 ( .A0N(n227), .A1N(n206), .B0(n229), .Y(n293) );
  AOI21X1 U6 ( .A0(n232), .A1(n290), .B0(n231), .Y(n227) );
  XOR2X1 U7 ( .A(n277), .B(n278), .Y(DIFF[14]) );
  NAND2X1 U8 ( .A(n199), .B(n267), .Y(n280) );
  XOR2X1 U9 ( .A(n270), .B(n271), .Y(DIFF[15]) );
  OAI21XL U10 ( .A0(n272), .A1(n273), .B0(n266), .Y(n270) );
  NOR3BX1 U11 ( .AN(n238), .B(n237), .C(n298), .Y(n296) );
  AOI211X1 U12 ( .A0(n247), .A1(n242), .B0(n240), .C0(n210), .Y(n298) );
  INVX1 U13 ( .A(n240), .Y(n211) );
  NOR2X1 U14 ( .A(n224), .B(A[5]), .Y(n240) );
  INVX1 U15 ( .A(n247), .Y(n212) );
  OAI21XL U16 ( .A0(n286), .A1(n293), .B0(n288), .Y(n291) );
  INVX1 U17 ( .A(n297), .Y(n209) );
  XOR2X1 U18 ( .A(n236), .B(n239), .Y(DIFF[6]) );
  XOR2X1 U19 ( .A(n269), .B(n284), .Y(DIFF[12]) );
  NAND2X1 U20 ( .A(B[0]), .B(n217), .Y(n255) );
  NOR2X2 U21 ( .A(n226), .B(A[1]), .Y(n258) );
  NAND2BXL U22 ( .AN(A[6]), .B(B[6]), .Y(n300) );
  INVXL U23 ( .A(A[9]), .Y(n207) );
  OR2X4 U24 ( .A(n240), .B(n241), .Y(n301) );
  NAND2X4 U25 ( .A(n301), .B(n242), .Y(n236) );
  AOI21X2 U26 ( .A0(n300), .A1(n236), .B0(n237), .Y(n234) );
  AOI221X2 U27 ( .A0(A[1]), .A1(n226), .B0(n255), .B1(n216), .C0(n256), .Y(
        n299) );
  XOR2X1 U28 ( .A(n294), .B(n293), .Y(DIFF[10]) );
  NAND3XL U29 ( .A(n289), .B(n232), .C(n205), .Y(n282) );
  CLKINVX3 U30 ( .A(n299), .Y(n214) );
  AOI2BB1X2 U31 ( .A0N(n244), .A1N(n245), .B0(n212), .Y(n241) );
  XNOR2X4 U32 ( .A(n280), .B(n279), .Y(DIFF[13]) );
  OAI32XL U33 ( .A0(n295), .A1(n244), .A2(n245), .B0(n296), .B1(n297), .Y(n290) );
  INVX1 U34 ( .A(n264), .Y(n199) );
  INVXL U35 ( .A(n289), .Y(n206) );
  OAI31X2 U36 ( .A0(n276), .A1(n275), .A2(n281), .B0(n268), .Y(n279) );
  INVX1 U37 ( .A(n281), .Y(n201) );
  NOR2BX1 U38 ( .AN(A[2]), .B(B[2]), .Y(n256) );
  NOR2XL U39 ( .A(n229), .B(n206), .Y(n228) );
  XOR2XL U40 ( .A(n243), .B(n241), .Y(DIFF[5]) );
  NAND2XL U41 ( .A(n211), .B(n242), .Y(n243) );
  NOR2XL U42 ( .A(n212), .B(n244), .Y(n246) );
  NAND2BXL U43 ( .AN(n231), .B(n232), .Y(n230) );
  AOI21XL U44 ( .A0(n279), .A1(n199), .B0(n198), .Y(n278) );
  INVXL U45 ( .A(n283), .Y(n203) );
  INVXL U46 ( .A(n268), .Y(n200) );
  INVXL U47 ( .A(n269), .Y(n202) );
  INVXL U48 ( .A(n267), .Y(n198) );
  AOI31X2 U49 ( .A0(n214), .A1(n213), .A2(n250), .B0(n251), .Y(n245) );
  NOR2BXL U50 ( .AN(B[2]), .B(A[2]), .Y(n253) );
  INVXL U51 ( .A(A[0]), .Y(n217) );
  AOI22XL U52 ( .A0(n226), .A1(A[1]), .B0(n216), .B1(n255), .Y(n252) );
  NAND2BXL U53 ( .AN(A[6]), .B(B[6]), .Y(n235) );
  AOI21XL U54 ( .A0(A[1]), .A1(n226), .B0(n258), .Y(n257) );
  NAND2BXL U55 ( .AN(A[15]), .B(B[15]), .Y(n261) );
  INVX1 U56 ( .A(n290), .Y(n208) );
  XNOR2X1 U57 ( .A(n227), .B(n228), .Y(DIFF[9]) );
  NAND3X1 U58 ( .A(n300), .B(n211), .C(n209), .Y(n295) );
  XOR2X1 U59 ( .A(n233), .B(n234), .Y(DIFF[7]) );
  NAND2X1 U60 ( .A(n209), .B(n238), .Y(n233) );
  AOI2BB1X1 U61 ( .A0N(n208), .A1N(n282), .B0(n283), .Y(n276) );
  XNOR2X1 U62 ( .A(n245), .B(n246), .Y(DIFF[4]) );
  NAND2X1 U63 ( .A(n288), .B(n205), .Y(n294) );
  NAND2X1 U64 ( .A(n197), .B(n266), .Y(n277) );
  NOR2X1 U65 ( .A(n210), .B(n237), .Y(n239) );
  INVX1 U66 ( .A(n258), .Y(n216) );
  OAI21XL U67 ( .A0(B[0]), .A1(n217), .B0(n255), .Y(DIFF[0]) );
  NOR2BX1 U68 ( .AN(n261), .B(n263), .Y(n271) );
  AOI31X1 U69 ( .A0(n201), .A1(n199), .A2(n274), .B0(n198), .Y(n273) );
  NAND2X1 U70 ( .A(n201), .B(n268), .Y(n284) );
  XOR2X1 U71 ( .A(n248), .B(n249), .Y(DIFF[3]) );
  NOR2BX1 U72 ( .AN(n250), .B(n251), .Y(n249) );
  OAI21XL U73 ( .A0(n252), .A1(n253), .B0(n215), .Y(n248) );
  XOR2X1 U74 ( .A(n230), .B(n208), .Y(DIFF[8]) );
  OAI21XL U75 ( .A0(n275), .A1(n276), .B0(n268), .Y(n274) );
  XOR2X1 U76 ( .A(n254), .B(n252), .Y(DIFF[2]) );
  NAND2X1 U77 ( .A(n213), .B(n215), .Y(n254) );
  NAND2BX1 U78 ( .AN(n275), .B(n285), .Y(n269) );
  OAI21XL U79 ( .A0(n208), .A1(n282), .B0(n203), .Y(n285) );
  INVX1 U80 ( .A(n256), .Y(n215) );
  AOI21X1 U81 ( .A0(n202), .A1(n201), .B0(n200), .Y(n265) );
  INVX1 U82 ( .A(n235), .Y(n210) );
  INVX1 U83 ( .A(n253), .Y(n213) );
  NOR2X1 U84 ( .A(n207), .B(B[9]), .Y(n229) );
  NAND2X1 U85 ( .A(B[9]), .B(n207), .Y(n289) );
  INVX1 U86 ( .A(n286), .Y(n205) );
  INVX1 U87 ( .A(n272), .Y(n197) );
  INVX1 U88 ( .A(B[14]), .Y(n218) );
  INVX1 U89 ( .A(B[5]), .Y(n224) );
  INVX1 U90 ( .A(B[11]), .Y(n221) );
  INVX1 U91 ( .A(B[13]), .Y(n219) );
  INVX1 U92 ( .A(B[10]), .Y(n222) );
  INVX1 U93 ( .A(B[4]), .Y(n225) );
  INVX1 U94 ( .A(B[12]), .Y(n220) );
  XOR2X1 U95 ( .A(n291), .B(n292), .Y(DIFF[11]) );
  AOI21X1 U96 ( .A0(A[11]), .A1(n221), .B0(n275), .Y(n292) );
  NOR2BX1 U97 ( .AN(A[6]), .B(B[6]), .Y(n237) );
  NOR2X1 U98 ( .A(n225), .B(A[4]), .Y(n244) );
  XOR2X1 U99 ( .A(n259), .B(n260), .Y(DIFF[16]) );
  XOR2X1 U100 ( .A(B[16]), .B(A[16]), .Y(n260) );
  AOI31X1 U101 ( .A0(n261), .A1(n197), .A2(n262), .B0(n263), .Y(n259) );
  OAI211X1 U102 ( .A0(n264), .A1(n265), .B0(n266), .C0(n267), .Y(n262) );
  NAND2X1 U103 ( .A(A[7]), .B(n223), .Y(n238) );
  NOR2BX1 U104 ( .AN(A[3]), .B(B[3]), .Y(n251) );
  NOR2X1 U105 ( .A(n223), .B(A[7]), .Y(n297) );
  XOR2X1 U106 ( .A(n255), .B(n257), .Y(DIFF[1]) );
  NAND2BX1 U107 ( .AN(A[3]), .B(B[3]), .Y(n250) );
  OAI221XL U108 ( .A0(n286), .A1(n287), .B0(B[11]), .B1(n204), .C0(n288), .Y(
        n283) );
  INVX1 U109 ( .A(A[11]), .Y(n204) );
  AOI21X1 U110 ( .A0(n231), .A1(n289), .B0(n229), .Y(n287) );
  NOR2X1 U111 ( .A(n221), .B(A[11]), .Y(n275) );
  NOR2X1 U112 ( .A(n222), .B(A[10]), .Y(n286) );
  NOR2BX1 U113 ( .AN(A[8]), .B(B[8]), .Y(n231) );
  NAND2X1 U114 ( .A(A[10]), .B(n222), .Y(n288) );
  NAND2BX1 U115 ( .AN(A[8]), .B(B[8]), .Y(n232) );
  NOR2X1 U116 ( .A(n220), .B(A[12]), .Y(n281) );
  NAND2X1 U117 ( .A(A[12]), .B(n220), .Y(n268) );
  NAND2X1 U118 ( .A(A[13]), .B(n219), .Y(n267) );
  NAND2X1 U119 ( .A(A[14]), .B(n218), .Y(n266) );
  NOR2X1 U120 ( .A(n218), .B(A[14]), .Y(n272) );
  NOR2BX1 U121 ( .AN(A[15]), .B(B[15]), .Y(n263) );
  NOR2X1 U122 ( .A(n219), .B(A[13]), .Y(n264) );
  INVX1 U123 ( .A(B[1]), .Y(n226) );
  INVX1 U124 ( .A(B[7]), .Y(n223) );
endmodule


module butterfly_DW01_add_69 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n260, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259;

  AND2X2 U13 ( .A(n192), .B(n190), .Y(n194) );
  AND2X2 U37 ( .A(B[14]), .B(A[14]), .Y(n215) );
  NOR2X4 U44 ( .A(B[13]), .B(A[13]), .Y(n218) );
  NAND2X2 U2 ( .A(n251), .B(n252), .Y(SUM[12]) );
  XOR2X4 U3 ( .A(n224), .B(n225), .Y(SUM[14]) );
  OAI21X1 U4 ( .A0(n218), .A1(n168), .B0(n226), .Y(n224) );
  INVX4 U5 ( .A(n253), .Y(SUM[13]) );
  AOI2BB1X2 U6 ( .A0N(n218), .A1N(n222), .B0(n254), .Y(n253) );
  BUFX20 U7 ( .A(n260), .Y(SUM[15]) );
  NAND2X4 U8 ( .A(n257), .B(n258), .Y(n260) );
  INVX1 U9 ( .A(n246), .Y(n175) );
  OAI221XL U10 ( .A0(B[3]), .A1(A[3]), .B0(n202), .B1(n201), .C0(n176), .Y(
        n246) );
  INVX1 U11 ( .A(n220), .Y(n255) );
  AOI211X1 U12 ( .A0(n180), .A1(n183), .B0(n233), .C0(n179), .Y(n235) );
  OAI32X4 U14 ( .A0(n241), .A1(n195), .A2(n196), .B0(n242), .B1(n243), .Y(n182) );
  AOI211X1 U15 ( .A0(B[7]), .A1(A[7]), .B0(n244), .C0(n173), .Y(n242) );
  OR2X2 U16 ( .A(A[5]), .B(B[5]), .Y(n190) );
  NAND2X1 U17 ( .A(B[5]), .B(A[5]), .Y(n192) );
  INVX1 U18 ( .A(n229), .Y(n250) );
  INVX1 U19 ( .A(n204), .Y(n176) );
  OR2X2 U20 ( .A(B[6]), .B(A[6]), .Y(n188) );
  NAND2X1 U21 ( .A(B[0]), .B(A[0]), .Y(n205) );
  XOR2X1 U22 ( .A(n236), .B(n237), .Y(SUM[11]) );
  NAND2X1 U23 ( .A(n216), .B(n229), .Y(n251) );
  NAND2X1 U24 ( .A(n249), .B(n250), .Y(n252) );
  INVX1 U25 ( .A(n216), .Y(n249) );
  INVX1 U26 ( .A(n227), .Y(n254) );
  NAND2X1 U27 ( .A(n220), .B(n256), .Y(n257) );
  INVX4 U28 ( .A(n259), .Y(SUM[16]) );
  XOR2X1 U29 ( .A(n248), .B(n210), .Y(n259) );
  XOR2X1 U30 ( .A(B[16]), .B(A[16]), .Y(n248) );
  NOR2X1 U31 ( .A(A[12]), .B(B[12]), .Y(n217) );
  AOI21X4 U32 ( .A0(n169), .A1(n230), .B0(n231), .Y(n216) );
  NOR2X4 U33 ( .A(B[10]), .B(A[10]), .Y(n233) );
  NAND2XL U34 ( .A(B[10]), .B(A[10]), .Y(n239) );
  NAND2XL U35 ( .A(B[12]), .B(A[12]), .Y(n219) );
  NAND2X1 U36 ( .A(B[13]), .B(A[13]), .Y(n226) );
  OAI21XL U38 ( .A0(B[7]), .A1(A[7]), .B0(n174), .Y(n241) );
  OAI21X2 U39 ( .A0(n178), .A1(n179), .B0(n180), .Y(n238) );
  NAND2X2 U40 ( .A(n168), .B(n226), .Y(n222) );
  INVX2 U41 ( .A(n221), .Y(n256) );
  AOI31XL U42 ( .A0(n167), .A1(n165), .A2(n222), .B0(n215), .Y(n221) );
  INVX2 U43 ( .A(n223), .Y(n165) );
  AOI21X1 U45 ( .A0(n192), .A1(n197), .B0(n245), .Y(n244) );
  OAI21X2 U46 ( .A0(n217), .A1(n216), .B0(n219), .Y(n228) );
  OAI32X4 U47 ( .A0(n216), .A1(n217), .A2(n218), .B0(n218), .B1(n219), .Y(n214) );
  OAI2BB1XL U48 ( .A0N(n190), .A1N(n191), .B0(n192), .Y(n187) );
  XOR2X1 U49 ( .A(n191), .B(n194), .Y(SUM[5]) );
  AND2X2 U50 ( .A(B[2]), .B(A[2]), .Y(n202) );
  NAND2X1 U51 ( .A(B[1]), .B(A[1]), .Y(n208) );
  NAND2XL U52 ( .A(B[6]), .B(A[6]), .Y(n193) );
  NAND2X1 U53 ( .A(n255), .B(n221), .Y(n258) );
  NOR2XL U54 ( .A(n215), .B(n223), .Y(n225) );
  OR3X2 U55 ( .A(n214), .B(n166), .C(n215), .Y(n212) );
  NAND2BXL U56 ( .AN(n179), .B(n180), .Y(n177) );
  NOR2XL U57 ( .A(n202), .B(n204), .Y(n203) );
  AOI211X2 U58 ( .A0(A[11]), .A1(B[11]), .B0(n235), .C0(n170), .Y(n234) );
  NAND2BXL U59 ( .AN(n196), .B(n197), .Y(n198) );
  NAND2BXL U60 ( .AN(n207), .B(n208), .Y(n206) );
  NOR2XL U61 ( .A(B[7]), .B(A[7]), .Y(n243) );
  INVX1 U62 ( .A(n228), .Y(n168) );
  INVX1 U63 ( .A(n245), .Y(n174) );
  OAI21XL U64 ( .A0(n166), .A1(n218), .B0(n228), .Y(n227) );
  NOR2BX1 U65 ( .AN(n219), .B(n217), .Y(n229) );
  NAND2X1 U66 ( .A(n213), .B(n211), .Y(n220) );
  INVX1 U67 ( .A(n218), .Y(n167) );
  NAND2X1 U68 ( .A(n188), .B(n190), .Y(n245) );
  INVX1 U69 ( .A(n226), .Y(n166) );
  INVX1 U70 ( .A(n239), .Y(n170) );
  INVX1 U71 ( .A(n193), .Y(n173) );
  XNOR2X1 U72 ( .A(n240), .B(n238), .Y(SUM[10]) );
  NAND2X1 U73 ( .A(n171), .B(n239), .Y(n240) );
  XOR2X1 U74 ( .A(n177), .B(n178), .Y(SUM[9]) );
  INVX1 U75 ( .A(n233), .Y(n171) );
  INVX1 U76 ( .A(n213), .Y(n164) );
  XNOR2X1 U77 ( .A(n189), .B(n187), .Y(SUM[6]) );
  NAND2X1 U78 ( .A(n188), .B(n193), .Y(n189) );
  XOR2X1 U79 ( .A(n201), .B(n203), .Y(SUM[2]) );
  OAI2BB1X1 U80 ( .A0N(A[11]), .A1N(B[11]), .B0(n230), .Y(n236) );
  AOI21X1 U81 ( .A0(n238), .A1(n171), .B0(n170), .Y(n237) );
  NOR2X1 U82 ( .A(B[9]), .B(A[9]), .Y(n179) );
  AND4X2 U83 ( .A(n182), .B(n230), .C(n184), .D(n232), .Y(n231) );
  INVX1 U84 ( .A(n234), .Y(n169) );
  NOR2X1 U85 ( .A(n179), .B(n233), .Y(n232) );
  AOI21X1 U86 ( .A0(n182), .A1(n184), .B0(n172), .Y(n178) );
  INVX1 U87 ( .A(n183), .Y(n172) );
  NAND2X1 U88 ( .A(B[4]), .B(A[4]), .Y(n197) );
  NAND2X1 U89 ( .A(B[9]), .B(A[9]), .Y(n180) );
  NOR2X1 U90 ( .A(B[14]), .B(A[14]), .Y(n223) );
  NAND2X1 U91 ( .A(B[8]), .B(A[8]), .Y(n183) );
  OR2X2 U92 ( .A(B[8]), .B(A[8]), .Y(n184) );
  OR2X2 U93 ( .A(A[11]), .B(B[11]), .Y(n230) );
  XNOR2X1 U94 ( .A(n181), .B(n182), .Y(SUM[8]) );
  NAND2X1 U95 ( .A(n183), .B(n184), .Y(n181) );
  OAI21XL U96 ( .A0(n207), .A1(n205), .B0(n208), .Y(n201) );
  NOR2X1 U97 ( .A(B[4]), .B(A[4]), .Y(n196) );
  NOR2X1 U98 ( .A(B[2]), .B(A[2]), .Y(n204) );
  NOR2X1 U99 ( .A(B[1]), .B(A[1]), .Y(n207) );
  NAND2X1 U100 ( .A(B[15]), .B(A[15]), .Y(n213) );
  OR2X2 U101 ( .A(B[15]), .B(A[15]), .Y(n211) );
  XOR2X1 U102 ( .A(n198), .B(n195), .Y(SUM[4]) );
  OAI21XL U103 ( .A0(n195), .A1(n196), .B0(n197), .Y(n191) );
  XOR2X1 U104 ( .A(n205), .B(n206), .Y(SUM[1]) );
  AOI31X1 U105 ( .A0(n211), .A1(n165), .A2(n212), .B0(n164), .Y(n210) );
  AOI21X1 U106 ( .A0(A[3]), .A1(B[3]), .B0(n175), .Y(n195) );
  XOR2X1 U107 ( .A(n185), .B(n186), .Y(SUM[7]) );
  XNOR2X1 U108 ( .A(A[7]), .B(B[7]), .Y(n185) );
  AOI21X1 U109 ( .A0(n187), .A1(n188), .B0(n173), .Y(n186) );
  XOR2X1 U110 ( .A(n199), .B(n200), .Y(SUM[3]) );
  XNOR2X1 U111 ( .A(A[3]), .B(B[3]), .Y(n199) );
  AOI21X1 U112 ( .A0(n201), .A1(n176), .B0(n202), .Y(n200) );
  INVX1 U113 ( .A(n247), .Y(SUM[0]) );
  OAI21XL U114 ( .A0(B[0]), .A1(A[0]), .B0(n205), .Y(n247) );
endmodule


module butterfly_DW01_sub_67 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297;

  XOR2X4 U10 ( .A(n224), .B(n229), .Y(DIFF[6]) );
  AOI21X4 U14 ( .A0(n234), .A1(A[4]), .B0(n235), .Y(n231) );
  AOI2BB1X4 U15 ( .A0N(A[4]), .A1N(n234), .B0(B[4]), .Y(n235) );
  NAND2BXL U3 ( .AN(A[4]), .B(B[4]), .Y(n294) );
  AOI2BB1X4 U4 ( .A0N(A[3]), .A1N(n213), .B0(n239), .Y(n295) );
  NOR2BX2 U5 ( .AN(B[2]), .B(A[2]), .Y(n239) );
  INVX1 U6 ( .A(n289), .Y(n199) );
  XOR2X1 U7 ( .A(n269), .B(n270), .Y(DIFF[14]) );
  NAND2X1 U8 ( .A(B[9]), .B(n201), .Y(n283) );
  INVX1 U9 ( .A(n275), .Y(n197) );
  OAI21X1 U11 ( .A0(n205), .A1(n255), .B0(n257), .Y(n219) );
  OAI21XL U12 ( .A0(n263), .A1(n281), .B0(n273), .Y(n280) );
  AND2X2 U13 ( .A(n253), .B(n278), .Y(n281) );
  NAND2BX1 U16 ( .AN(n280), .B(n274), .Y(n268) );
  NAND3X1 U17 ( .A(n206), .B(n243), .C(n295), .Y(n265) );
  XOR2X1 U18 ( .A(n291), .B(n290), .Y(DIFF[10]) );
  OAI21X2 U19 ( .A0(n230), .A1(n231), .B0(n232), .Y(n224) );
  NAND2BX1 U20 ( .AN(A[6]), .B(B[6]), .Y(n225) );
  XOR2X1 U21 ( .A(n233), .B(n231), .Y(DIFF[5]) );
  AND2X2 U22 ( .A(n294), .B(n225), .Y(n297) );
  NAND3X1 U23 ( .A(n297), .B(n228), .C(n204), .Y(n255) );
  INVXL U24 ( .A(n230), .Y(n204) );
  OAI2BB1X1 U25 ( .A0N(A[1]), .A1N(n214), .B0(n241), .Y(n296) );
  INVXL U26 ( .A(A[9]), .Y(n201) );
  NOR2XL U27 ( .A(n226), .B(n203), .Y(n229) );
  INVX1 U28 ( .A(n264), .Y(n195) );
  XNOR2XL U29 ( .A(n218), .B(n219), .Y(DIFF[8]) );
  INVX1 U30 ( .A(n286), .Y(n198) );
  NOR2X1 U31 ( .A(n217), .B(n200), .Y(n216) );
  NAND2BX1 U32 ( .AN(n220), .B(n221), .Y(n218) );
  OAI21XL U33 ( .A0(n289), .A1(n290), .B0(n285), .Y(n287) );
  NOR2XL U34 ( .A(n198), .B(n275), .Y(n288) );
  NAND4X1 U35 ( .A(n199), .B(n197), .C(n283), .D(n221), .Y(n252) );
  NOR2X1 U36 ( .A(n201), .B(B[9]), .Y(n217) );
  AOI211X1 U37 ( .A0(n293), .A1(n232), .B0(n230), .C0(n203), .Y(n292) );
  NAND2BXL U38 ( .AN(B[4]), .B(A[4]), .Y(n293) );
  OAI2BB1XL U39 ( .A0N(n193), .A1N(B[15]), .B0(n258), .Y(n249) );
  NAND2BXL U40 ( .AN(n277), .B(n278), .Y(n271) );
  NAND2X4 U41 ( .A(n256), .B(n265), .Y(n234) );
  AOI21X2 U42 ( .A0(n221), .A1(n219), .B0(n220), .Y(n215) );
  NAND2XL U43 ( .A(n285), .B(n199), .Y(n291) );
  NAND2BXL U44 ( .AN(n227), .B(n228), .Y(n222) );
  XOR2X4 U45 ( .A(n222), .B(n223), .Y(DIFF[7]) );
  XOR2XL U46 ( .A(n282), .B(n281), .Y(DIFF[12]) );
  NAND2XL U47 ( .A(n196), .B(n273), .Y(n282) );
  NOR3XL U48 ( .A(n263), .B(n275), .C(n276), .Y(n272) );
  NAND2XL U49 ( .A(B[14]), .B(n194), .Y(n258) );
  NOR3XL U50 ( .A(n255), .B(n263), .C(n264), .Y(n260) );
  INVXL U51 ( .A(n263), .Y(n196) );
  INVXL U52 ( .A(A[0]), .Y(n207) );
  NOR2XL U53 ( .A(n214), .B(A[1]), .Y(n245) );
  NAND2BXL U54 ( .AN(B[2]), .B(A[2]), .Y(n241) );
  AOI21XL U55 ( .A0(A[1]), .A1(n214), .B0(n245), .Y(n244) );
  AOI22XL U56 ( .A0(n214), .A1(A[1]), .B0(n206), .B1(n243), .Y(n240) );
  AOI211XL U57 ( .A0(n259), .A1(n260), .B0(n261), .C0(n262), .Y(n248) );
  INVXL U58 ( .A(A[15]), .Y(n193) );
  AOI2BB1X1 U59 ( .A0N(n215), .A1N(n200), .B0(n217), .Y(n290) );
  XNOR2X1 U60 ( .A(n215), .B(n216), .Y(DIFF[9]) );
  NAND2BX1 U61 ( .AN(n252), .B(n219), .Y(n278) );
  NOR2X1 U62 ( .A(n199), .B(n198), .Y(n276) );
  NAND3BX1 U63 ( .AN(n276), .B(n277), .C(n197), .Y(n253) );
  INVX1 U64 ( .A(n283), .Y(n200) );
  NOR2X1 U65 ( .A(n252), .B(n265), .Y(n259) );
  INVX1 U66 ( .A(n234), .Y(n205) );
  NAND2X1 U67 ( .A(n204), .B(n232), .Y(n233) );
  XOR2X1 U68 ( .A(n287), .B(n288), .Y(DIFF[11]) );
  INVX1 U69 ( .A(n245), .Y(n206) );
  XOR2X1 U70 ( .A(n242), .B(n240), .Y(DIFF[2]) );
  NAND2BX1 U71 ( .AN(n239), .B(n241), .Y(n242) );
  OAI21XL U72 ( .A0(n264), .A1(n268), .B0(n279), .Y(DIFF[13]) );
  OAI2BB1X1 U73 ( .A0N(n274), .A1N(n195), .B0(n280), .Y(n279) );
  INVX1 U74 ( .A(n225), .Y(n203) );
  NAND4BXL U75 ( .AN(n217), .B(n284), .C(n285), .D(n286), .Y(n277) );
  NAND2X1 U76 ( .A(n220), .B(n283), .Y(n284) );
  NAND2BX1 U77 ( .AN(n262), .B(n258), .Y(n269) );
  AOI31X1 U78 ( .A0(n271), .A1(n195), .A2(n272), .B0(n261), .Y(n270) );
  NAND4BXL U79 ( .AN(n249), .B(n251), .C(n195), .D(n196), .Y(n250) );
  OAI21XL U80 ( .A0(n202), .A1(n252), .B0(n253), .Y(n251) );
  INVX1 U81 ( .A(n254), .Y(n202) );
  NOR2X1 U82 ( .A(n194), .B(B[14]), .Y(n262) );
  OAI21XL U83 ( .A0(n264), .A1(n273), .B0(n274), .Y(n261) );
  INVX1 U84 ( .A(B[3]), .Y(n213) );
  INVX1 U85 ( .A(B[5]), .Y(n212) );
  INVX1 U86 ( .A(B[12]), .Y(n209) );
  INVX1 U87 ( .A(B[11]), .Y(n210) );
  INVX1 U88 ( .A(B[13]), .Y(n208) );
  INVX1 U89 ( .A(B[10]), .Y(n211) );
  NAND2X1 U90 ( .A(B[0]), .B(n207), .Y(n243) );
  AOI22X2 U91 ( .A0(n213), .A1(A[3]), .B0(n296), .B1(n295), .Y(n256) );
  XOR2X1 U92 ( .A(n234), .B(n236), .Y(DIFF[4]) );
  XNOR2X1 U93 ( .A(A[4]), .B(B[4]), .Y(n236) );
  OAI31X1 U94 ( .A0(n226), .A1(n227), .A2(n292), .B0(n228), .Y(n257) );
  NOR2X1 U95 ( .A(n210), .B(A[11]), .Y(n275) );
  NOR2X1 U96 ( .A(n212), .B(A[5]), .Y(n230) );
  XOR2X1 U97 ( .A(n243), .B(n244), .Y(DIFF[1]) );
  XOR2X1 U98 ( .A(n266), .B(n267), .Y(DIFF[15]) );
  XOR2X1 U99 ( .A(B[15]), .B(A[15]), .Y(n267) );
  AOI31X1 U100 ( .A0(n195), .A1(n258), .A2(n268), .B0(n262), .Y(n266) );
  NAND2X1 U101 ( .A(A[5]), .B(n212), .Y(n232) );
  NOR2BX1 U102 ( .AN(A[6]), .B(B[6]), .Y(n226) );
  NOR2X1 U103 ( .A(n211), .B(A[10]), .Y(n289) );
  NAND2BX1 U104 ( .AN(A[7]), .B(B[7]), .Y(n228) );
  NOR2BX1 U105 ( .AN(A[7]), .B(B[7]), .Y(n227) );
  XOR2X1 U106 ( .A(n237), .B(n238), .Y(DIFF[3]) );
  XOR2X1 U107 ( .A(A[3]), .B(n213), .Y(n238) );
  OAI21XL U108 ( .A0(n239), .A1(n240), .B0(n241), .Y(n237) );
  OAI21XL U109 ( .A0(B[0]), .A1(n207), .B0(n243), .Y(DIFF[0]) );
  NAND2X1 U110 ( .A(A[10]), .B(n211), .Y(n285) );
  NOR2BX1 U111 ( .AN(A[8]), .B(B[8]), .Y(n220) );
  NAND2X1 U112 ( .A(A[11]), .B(n210), .Y(n286) );
  NAND2BX1 U113 ( .AN(A[8]), .B(B[8]), .Y(n221) );
  XOR2X1 U114 ( .A(n246), .B(n247), .Y(DIFF[16]) );
  XNOR2X1 U115 ( .A(B[16]), .B(A[16]), .Y(n247) );
  OAI221XL U116 ( .A0(n248), .A1(n249), .B0(B[15]), .B1(n193), .C0(n250), .Y(
        n246) );
  NOR2X1 U117 ( .A(n208), .B(A[13]), .Y(n264) );
  NOR2X1 U118 ( .A(n209), .B(A[12]), .Y(n263) );
  NAND2X1 U119 ( .A(A[12]), .B(n209), .Y(n273) );
  NAND2X1 U120 ( .A(A[13]), .B(n208), .Y(n274) );
  INVX1 U121 ( .A(A[14]), .Y(n194) );
  INVX1 U122 ( .A(B[1]), .Y(n214) );
  OAI21XL U123 ( .A0(n255), .A1(n256), .B0(n257), .Y(n254) );
  AOI21X1 U124 ( .A0(n224), .A1(n225), .B0(n226), .Y(n223) );
endmodule


module butterfly_DW01_add_93 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239;

  AND2X2 U57 ( .A(B[11]), .B(A[11]), .Y(n223) );
  AND2X2 U75 ( .A(B[2]), .B(A[2]), .Y(n193) );
  AND2X2 U83 ( .A(B[6]), .B(A[6]), .Y(n179) );
  AND2X2 U86 ( .A(B[10]), .B(A[10]), .Y(n224) );
  NAND3X1 U2 ( .A(n154), .B(n155), .C(n205), .Y(n211) );
  OAI221XL U3 ( .A0(n168), .A1(n153), .B0(n206), .B1(n207), .C0(n208), .Y(n204) );
  OAI21XL U4 ( .A0(n170), .A1(n171), .B0(n172), .Y(n231) );
  AOI211X1 U5 ( .A0(n187), .A1(n183), .B0(n181), .C0(n184), .Y(n238) );
  OAI21XL U6 ( .A0(n181), .A1(n182), .B0(n183), .Y(n178) );
  NAND2X1 U7 ( .A(n168), .B(n153), .Y(n205) );
  OAI21XL U8 ( .A0(n219), .A1(n220), .B0(n206), .Y(n217) );
  OAI2BB1X1 U9 ( .A0N(n154), .A1N(n217), .B0(n208), .Y(n215) );
  INVX1 U10 ( .A(n227), .Y(n158) );
  XNOR2X1 U11 ( .A(n216), .B(n215), .Y(SUM[14]) );
  OAI21XL U12 ( .A0(n153), .A1(n168), .B0(n205), .Y(n216) );
  XNOR2X1 U13 ( .A(n232), .B(n231), .Y(SUM[10]) );
  OR2X2 U14 ( .A(n224), .B(n227), .Y(n232) );
  NOR2X1 U15 ( .A(n171), .B(n228), .Y(n212) );
  INVX1 U16 ( .A(n207), .Y(n154) );
  XNOR2X1 U17 ( .A(n180), .B(n178), .Y(SUM[6]) );
  OR2X2 U18 ( .A(n179), .B(n184), .Y(n180) );
  INVX1 U19 ( .A(n189), .Y(n164) );
  INVX1 U20 ( .A(n228), .Y(n161) );
  INVX1 U21 ( .A(n219), .Y(n155) );
  XOR2X1 U22 ( .A(n192), .B(n194), .Y(SUM[2]) );
  NOR2X1 U23 ( .A(n193), .B(n195), .Y(n194) );
  INVX1 U24 ( .A(n184), .Y(n162) );
  INVX1 U25 ( .A(n181), .Y(n163) );
  XNOR2X1 U26 ( .A(n218), .B(n217), .Y(SUM[13]) );
  NAND2X1 U27 ( .A(n208), .B(n154), .Y(n218) );
  XOR2X1 U28 ( .A(n221), .B(n220), .Y(SUM[12]) );
  NAND2X1 U29 ( .A(n155), .B(n206), .Y(n221) );
  XOR2X1 U30 ( .A(n169), .B(n170), .Y(SUM[9]) );
  NAND2BX1 U31 ( .AN(n171), .B(n172), .Y(n169) );
  XOR2X1 U32 ( .A(n185), .B(n182), .Y(SUM[5]) );
  NAND2X1 U33 ( .A(n163), .B(n183), .Y(n185) );
  INVX1 U34 ( .A(n195), .Y(n166) );
  XOR2X1 U35 ( .A(n200), .B(n201), .Y(SUM[16]) );
  AOI31X1 U36 ( .A0(n158), .A1(n174), .A2(n222), .B0(n156), .Y(n220) );
  INVX1 U37 ( .A(n209), .Y(n156) );
  NOR2X1 U38 ( .A(n226), .B(n159), .Y(n222) );
  INVX1 U39 ( .A(n212), .Y(n159) );
  OAI31X1 U40 ( .A0(n223), .A1(n224), .A2(n225), .B0(n157), .Y(n209) );
  AOI211X1 U41 ( .A0(n172), .A1(n175), .B0(n171), .C0(n227), .Y(n225) );
  NOR2X1 U42 ( .A(B[9]), .B(A[9]), .Y(n171) );
  OAI21XL U43 ( .A0(n198), .A1(n196), .B0(n199), .Y(n192) );
  XNOR2X1 U44 ( .A(n173), .B(n174), .Y(SUM[8]) );
  NAND2X1 U45 ( .A(n175), .B(n161), .Y(n173) );
  AOI21X1 U46 ( .A0(n174), .A1(n161), .B0(n160), .Y(n170) );
  INVX1 U47 ( .A(n175), .Y(n160) );
  AOI21X1 U48 ( .A0(n186), .A1(n164), .B0(n165), .Y(n182) );
  INVX1 U49 ( .A(n187), .Y(n165) );
  NOR2X1 U50 ( .A(A[5]), .B(B[5]), .Y(n181) );
  NAND2X1 U51 ( .A(B[12]), .B(A[12]), .Y(n206) );
  INVX1 U52 ( .A(B[14]), .Y(n168) );
  INVX1 U53 ( .A(A[14]), .Y(n153) );
  NOR2X1 U54 ( .A(B[10]), .B(A[10]), .Y(n227) );
  NOR2X1 U55 ( .A(B[6]), .B(A[6]), .Y(n184) );
  NOR2X1 U56 ( .A(A[12]), .B(B[12]), .Y(n219) );
  XOR2X1 U58 ( .A(n196), .B(n197), .Y(SUM[1]) );
  NAND2BX1 U59 ( .AN(n198), .B(n199), .Y(n197) );
  NAND2X1 U60 ( .A(B[4]), .B(A[4]), .Y(n187) );
  NAND2X1 U61 ( .A(B[9]), .B(A[9]), .Y(n172) );
  NOR2X1 U62 ( .A(B[4]), .B(A[4]), .Y(n189) );
  NAND2X1 U63 ( .A(B[5]), .B(A[5]), .Y(n183) );
  NOR2X1 U64 ( .A(B[8]), .B(A[8]), .Y(n228) );
  NOR2X1 U65 ( .A(B[2]), .B(A[2]), .Y(n195) );
  NAND2X1 U66 ( .A(B[8]), .B(A[8]), .Y(n175) );
  NOR2X1 U67 ( .A(B[1]), .B(A[1]), .Y(n198) );
  NAND2X1 U68 ( .A(B[13]), .B(A[13]), .Y(n208) );
  NAND2X1 U69 ( .A(B[1]), .B(A[1]), .Y(n199) );
  NOR2X1 U70 ( .A(B[13]), .B(A[13]), .Y(n207) );
  NAND4X1 U71 ( .A(n212), .B(n157), .C(n158), .D(n174), .Y(n210) );
  XOR2X1 U72 ( .A(n229), .B(n230), .Y(SUM[11]) );
  OR2X2 U73 ( .A(n223), .B(n226), .Y(n229) );
  AOI21X1 U74 ( .A0(n231), .A1(n158), .B0(n224), .Y(n230) );
  INVX1 U76 ( .A(A[15]), .Y(n152) );
  XNOR2X1 U77 ( .A(n188), .B(n186), .Y(SUM[4]) );
  NAND2X1 U78 ( .A(n187), .B(n164), .Y(n188) );
  INVX1 U79 ( .A(n226), .Y(n157) );
  AOI211X1 U80 ( .A0(B[15]), .A1(A[15]), .B0(n202), .C0(n151), .Y(n201) );
  INVX1 U81 ( .A(n203), .Y(n151) );
  AOI221X1 U82 ( .A0(n152), .A1(n167), .B0(n209), .B1(n210), .C0(n211), .Y(
        n202) );
  OAI211X1 U84 ( .A0(A[15]), .A1(B[15]), .B0(n204), .C0(n205), .Y(n203) );
  OAI21XL U85 ( .A0(n233), .A1(n234), .B0(n235), .Y(n174) );
  NOR2X1 U87 ( .A(A[7]), .B(B[7]), .Y(n234) );
  NAND4X1 U88 ( .A(n186), .B(n163), .C(n162), .D(n236), .Y(n235) );
  AOI211X1 U89 ( .A0(B[7]), .A1(A[7]), .B0(n179), .C0(n238), .Y(n233) );
  NAND2X1 U90 ( .A(B[0]), .B(A[0]), .Y(n196) );
  NOR2X1 U91 ( .A(B[11]), .B(A[11]), .Y(n226) );
  XOR2X1 U92 ( .A(n176), .B(n177), .Y(SUM[7]) );
  XNOR2X1 U93 ( .A(A[7]), .B(B[7]), .Y(n176) );
  AOI21X1 U94 ( .A0(n178), .A1(n162), .B0(n179), .Y(n177) );
  OAI2BB1X1 U95 ( .A0N(A[3]), .A1N(B[3]), .B0(n237), .Y(n186) );
  OAI221XL U96 ( .A0(n193), .A1(n192), .B0(B[3]), .B1(A[3]), .C0(n166), .Y(
        n237) );
  XOR2X1 U97 ( .A(n190), .B(n191), .Y(SUM[3]) );
  XNOR2X1 U98 ( .A(A[3]), .B(B[3]), .Y(n190) );
  AOI21X1 U99 ( .A0(n166), .A1(n192), .B0(n193), .Y(n191) );
  INVX1 U100 ( .A(n239), .Y(SUM[0]) );
  OAI21XL U101 ( .A0(B[0]), .A1(A[0]), .B0(n196), .Y(n239) );
  XOR2X1 U102 ( .A(n213), .B(n214), .Y(SUM[15]) );
  XOR2X1 U103 ( .A(n152), .B(B[15]), .Y(n213) );
  AOI22X1 U104 ( .A0(n215), .A1(n205), .B0(B[14]), .B1(A[14]), .Y(n214) );
  INVX1 U105 ( .A(B[15]), .Y(n167) );
  AOI2BB1X1 U106 ( .A0N(A[7]), .A1N(B[7]), .B0(n189), .Y(n236) );
  XNOR2X1 U107 ( .A(B[16]), .B(A[16]), .Y(n200) );
endmodule


module butterfly_DW01_add_87 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n240, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239;

  AND2X2 U13 ( .A(n176), .B(n174), .Y(n178) );
  AND2X2 U44 ( .A(B[13]), .B(A[13]), .Y(n203) );
  OAI21X4 U45 ( .A0(n153), .A1(n161), .B0(n213), .Y(n211) );
  OAI221X2 U46 ( .A0(B[12]), .A1(A[12]), .B0(n214), .B1(n215), .C0(n216), .Y(
        n213) );
  AND2X2 U55 ( .A(n219), .B(n216), .Y(n224) );
  NOR2X4 U87 ( .A(B[10]), .B(A[10]), .Y(n221) );
  AOI32X2 U2 ( .A0(n152), .A1(n151), .A2(n208), .B0(B[14]), .B1(A[14]), .Y(
        n207) );
  OAI2BB1X1 U3 ( .A0N(A[14]), .A1N(B[14]), .B0(n151), .Y(n209) );
  OAI21X1 U4 ( .A0(n221), .A1(n154), .B0(n220), .Y(n223) );
  OAI21X1 U5 ( .A0(n214), .A1(n215), .B0(n216), .Y(n205) );
  NAND3BX2 U6 ( .AN(n218), .B(n219), .C(n220), .Y(n215) );
  NOR2X4 U7 ( .A(B[13]), .B(A[13]), .Y(n204) );
  OAI21X1 U8 ( .A0(n163), .A1(n164), .B0(n165), .Y(n226) );
  AOI211X2 U9 ( .A0(n165), .A1(n168), .B0(n164), .C0(n221), .Y(n218) );
  NOR2X2 U10 ( .A(B[9]), .B(A[9]), .Y(n164) );
  BUFX12 U11 ( .A(n240), .Y(SUM[14]) );
  NAND2X2 U12 ( .A(n237), .B(n238), .Y(n240) );
  INVX1 U14 ( .A(n232), .Y(n159) );
  OAI221XL U15 ( .A0(B[3]), .A1(A[3]), .B0(n186), .B1(n185), .C0(n160), .Y(
        n232) );
  OR2X2 U16 ( .A(B[6]), .B(A[6]), .Y(n172) );
  NAND2X1 U17 ( .A(B[8]), .B(A[8]), .Y(n168) );
  OAI32X4 U18 ( .A0(n227), .A1(n179), .A2(n180), .B0(n228), .B1(n229), .Y(n167) );
  OAI21XL U19 ( .A0(B[7]), .A1(A[7]), .B0(n158), .Y(n227) );
  NAND2X1 U20 ( .A(B[0]), .B(A[0]), .Y(n189) );
  NAND2X1 U21 ( .A(n209), .B(n236), .Y(n237) );
  INVX2 U22 ( .A(n239), .Y(SUM[16]) );
  XOR2X1 U23 ( .A(n234), .B(n194), .Y(n239) );
  XOR2X1 U24 ( .A(n223), .B(n224), .Y(SUM[11]) );
  XOR2X1 U25 ( .A(B[16]), .B(A[16]), .Y(n234) );
  NAND2X1 U26 ( .A(n235), .B(n210), .Y(n238) );
  INVX1 U27 ( .A(n209), .Y(n235) );
  INVX2 U28 ( .A(n210), .Y(n236) );
  AOI21XL U29 ( .A0(n211), .A1(n152), .B0(n203), .Y(n210) );
  XOR2X1 U30 ( .A(n225), .B(n154), .Y(SUM[10]) );
  NOR2XL U31 ( .A(B[8]), .B(A[8]), .Y(n222) );
  INVX4 U32 ( .A(A[12]), .Y(n153) );
  AND2X1 U33 ( .A(B[15]), .B(A[15]), .Y(n198) );
  OAI21X2 U34 ( .A0(n204), .A1(n208), .B0(n212), .Y(SUM[13]) );
  NOR4BX2 U35 ( .AN(n167), .B(n222), .C(n164), .D(n221), .Y(n214) );
  NOR2X4 U36 ( .A(B[15]), .B(A[15]), .Y(n202) );
  INVX4 U37 ( .A(n204), .Y(n152) );
  OR2XL U38 ( .A(n211), .B(n203), .Y(n208) );
  XOR2X4 U39 ( .A(n206), .B(n207), .Y(SUM[15]) );
  AOI21X1 U40 ( .A0(n176), .A1(n181), .B0(n231), .Y(n230) );
  NAND2X1 U41 ( .A(B[11]), .B(A[11]), .Y(n219) );
  NAND2BXL U42 ( .AN(n221), .B(n220), .Y(n225) );
  XOR2XL U43 ( .A(n162), .B(n163), .Y(SUM[9]) );
  NAND2BXL U47 ( .AN(n164), .B(n165), .Y(n162) );
  NOR2XL U48 ( .A(n186), .B(n188), .Y(n187) );
  NOR2X2 U49 ( .A(B[14]), .B(A[14]), .Y(n201) );
  NAND2XL U50 ( .A(B[14]), .B(A[14]), .Y(n200) );
  AOI31X2 U51 ( .A0(A[12]), .A1(n152), .A2(B[12]), .B0(n203), .Y(n199) );
  NAND2XL U52 ( .A(B[1]), .B(A[1]), .Y(n192) );
  NAND2XL U53 ( .A(B[6]), .B(A[6]), .Y(n177) );
  OR2XL U54 ( .A(B[11]), .B(A[11]), .Y(n216) );
  AND2X1 U56 ( .A(B[2]), .B(A[2]), .Y(n186) );
  XOR2XL U57 ( .A(n182), .B(n179), .Y(SUM[4]) );
  NAND2BXL U58 ( .AN(n180), .B(n181), .Y(n182) );
  NAND2BXL U59 ( .AN(n191), .B(n192), .Y(n190) );
  NOR2XL U60 ( .A(B[7]), .B(A[7]), .Y(n229) );
  NOR2XL U61 ( .A(B[4]), .B(A[4]), .Y(n180) );
  AOI21XL U62 ( .A0(n185), .A1(n160), .B0(n186), .Y(n184) );
  INVX1 U63 ( .A(n231), .Y(n158) );
  OAI21XL U64 ( .A0(n204), .A1(n203), .B0(n211), .Y(n212) );
  INVX1 U65 ( .A(n226), .Y(n154) );
  NAND2X1 U66 ( .A(n172), .B(n174), .Y(n231) );
  INVX1 U67 ( .A(n188), .Y(n160) );
  AOI21X1 U68 ( .A0(n153), .A1(n161), .B0(n205), .Y(n195) );
  INVX1 U69 ( .A(n201), .Y(n151) );
  INVX1 U70 ( .A(n177), .Y(n157) );
  XOR2X1 U71 ( .A(n205), .B(n217), .Y(SUM[12]) );
  XOR2X1 U72 ( .A(n153), .B(B[12]), .Y(n217) );
  INVX1 U73 ( .A(n222), .Y(n156) );
  XNOR2X1 U74 ( .A(n173), .B(n171), .Y(SUM[6]) );
  NAND2X1 U75 ( .A(n172), .B(n177), .Y(n173) );
  XOR2X1 U76 ( .A(n175), .B(n178), .Y(SUM[5]) );
  OAI2BB1X1 U77 ( .A0N(n174), .A1N(n175), .B0(n176), .Y(n171) );
  XOR2X1 U78 ( .A(n185), .B(n187), .Y(SUM[2]) );
  INVX1 U79 ( .A(B[12]), .Y(n161) );
  OR2X2 U80 ( .A(n202), .B(n198), .Y(n206) );
  NAND2X1 U81 ( .A(B[10]), .B(A[10]), .Y(n220) );
  OAI21XL U82 ( .A0(n191), .A1(n189), .B0(n192), .Y(n185) );
  AOI21X1 U83 ( .A0(n167), .A1(n156), .B0(n155), .Y(n163) );
  INVX1 U84 ( .A(n168), .Y(n155) );
  AOI211X1 U85 ( .A0(n199), .A1(n200), .B0(n201), .C0(n202), .Y(n197) );
  NOR2X1 U86 ( .A(B[1]), .B(A[1]), .Y(n191) );
  NOR2X1 U88 ( .A(B[2]), .B(A[2]), .Y(n188) );
  NAND2X1 U89 ( .A(B[9]), .B(A[9]), .Y(n165) );
  NAND2X1 U90 ( .A(B[5]), .B(A[5]), .Y(n176) );
  NOR3X1 U91 ( .A(n204), .B(n201), .C(n202), .Y(n196) );
  OR2X2 U92 ( .A(A[5]), .B(B[5]), .Y(n174) );
  XNOR2X1 U93 ( .A(n166), .B(n167), .Y(SUM[8]) );
  NAND2X1 U94 ( .A(n156), .B(n168), .Y(n166) );
  OAI21XL U95 ( .A0(n179), .A1(n180), .B0(n181), .Y(n175) );
  XOR2X1 U96 ( .A(n189), .B(n190), .Y(SUM[1]) );
  AOI211X1 U97 ( .A0(B[7]), .A1(A[7]), .B0(n230), .C0(n157), .Y(n228) );
  AOI211X1 U98 ( .A0(n195), .A1(n196), .B0(n197), .C0(n198), .Y(n194) );
  AOI21X1 U99 ( .A0(A[3]), .A1(B[3]), .B0(n159), .Y(n179) );
  NAND2X1 U100 ( .A(B[4]), .B(A[4]), .Y(n181) );
  XOR2X1 U101 ( .A(n169), .B(n170), .Y(SUM[7]) );
  XNOR2X1 U102 ( .A(A[7]), .B(B[7]), .Y(n169) );
  AOI21X1 U103 ( .A0(n171), .A1(n172), .B0(n157), .Y(n170) );
  XOR2X1 U104 ( .A(n183), .B(n184), .Y(SUM[3]) );
  XNOR2X1 U105 ( .A(A[3]), .B(B[3]), .Y(n183) );
  INVX1 U106 ( .A(n233), .Y(SUM[0]) );
  OAI21XL U107 ( .A0(B[0]), .A1(A[0]), .B0(n189), .Y(n233) );
endmodule


module butterfly_DW01_add_86 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n259, n260, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n255,
         n256, n257, n258;

  AND2X2 U13 ( .A(n193), .B(n191), .Y(n195) );
  XNOR2X2 U2 ( .A(n245), .B(n244), .Y(SUM[10]) );
  XOR2X2 U3 ( .A(n231), .B(n227), .Y(SUM[13]) );
  BUFX16 U4 ( .A(n260), .Y(SUM[11]) );
  XOR2X2 U5 ( .A(n242), .B(n243), .Y(n260) );
  BUFX16 U6 ( .A(n259), .Y(SUM[14]) );
  XOR2X2 U7 ( .A(n229), .B(n230), .Y(n259) );
  XNOR2X4 U8 ( .A(n224), .B(n225), .Y(SUM[15]) );
  AOI21X4 U9 ( .A0(n220), .A1(n226), .B0(n222), .Y(n225) );
  INVX1 U10 ( .A(n251), .Y(n176) );
  NAND2X1 U11 ( .A(B[4]), .B(A[4]), .Y(n198) );
  NOR2X2 U12 ( .A(A[12]), .B(B[12]), .Y(n217) );
  NAND4X1 U14 ( .A(n235), .B(n171), .C(n184), .D(n236), .Y(n219) );
  NOR2X1 U15 ( .A(A[15]), .B(B[15]), .Y(n214) );
  OR2X2 U16 ( .A(A[5]), .B(B[5]), .Y(n191) );
  NAND2X1 U17 ( .A(n258), .B(n235), .Y(n218) );
  NAND3X1 U18 ( .A(n255), .B(n256), .C(n257), .Y(n258) );
  INVX1 U19 ( .A(n239), .Y(n256) );
  NOR2X1 U20 ( .A(n178), .B(n170), .Y(n240) );
  NAND2X1 U21 ( .A(n170), .B(n178), .Y(n235) );
  NOR2X1 U22 ( .A(B[13]), .B(A[13]), .Y(n228) );
  NOR2X1 U23 ( .A(n221), .B(n232), .Y(n227) );
  AOI21X1 U24 ( .A0(n219), .A1(n218), .B0(n217), .Y(n232) );
  NOR2X1 U25 ( .A(B[9]), .B(A[9]), .Y(n181) );
  OR2X2 U26 ( .A(B[6]), .B(A[6]), .Y(n189) );
  OAI21XL U27 ( .A0(n180), .A1(n181), .B0(n182), .Y(n244) );
  NAND2X1 U28 ( .A(B[8]), .B(A[8]), .Y(n185) );
  OAI32X1 U29 ( .A0(n246), .A1(n196), .A2(n197), .B0(n247), .B1(n248), .Y(n184) );
  OAI21XL U30 ( .A0(B[7]), .A1(A[7]), .B0(n175), .Y(n246) );
  NAND2X1 U31 ( .A(B[0]), .B(A[0]), .Y(n206) );
  XOR2X2 U32 ( .A(n210), .B(n211), .Y(SUM[16]) );
  AOI21X1 U33 ( .A0(B[15]), .A1(A[15]), .B0(n212), .Y(n211) );
  CLKINVX3 U34 ( .A(n238), .Y(n255) );
  INVX1 U35 ( .A(n240), .Y(n257) );
  AOI211X2 U36 ( .A0(n182), .A1(n185), .B0(n241), .C0(n181), .Y(n239) );
  OAI2BB1XL U37 ( .A0N(n218), .A1N(n219), .B0(n220), .Y(n216) );
  NAND2XL U38 ( .A(n218), .B(n219), .Y(n233) );
  AOI21XL U39 ( .A0(n184), .A1(n173), .B0(n172), .Y(n180) );
  NAND2XL U40 ( .A(B[13]), .B(A[13]), .Y(n223) );
  NAND2XL U41 ( .A(B[9]), .B(A[9]), .Y(n182) );
  AND2X1 U42 ( .A(B[12]), .B(A[12]), .Y(n221) );
  CLKINVX4 U43 ( .A(A[11]), .Y(n170) );
  AND2X1 U44 ( .A(B[14]), .B(A[14]), .Y(n222) );
  NOR2X2 U45 ( .A(B[14]), .B(A[14]), .Y(n215) );
  AND2X1 U46 ( .A(B[2]), .B(A[2]), .Y(n203) );
  AND2X1 U47 ( .A(B[10]), .B(A[10]), .Y(n238) );
  AOI21X1 U48 ( .A0(n193), .A1(n198), .B0(n250), .Y(n249) );
  OAI2BB1X1 U49 ( .A0N(n191), .A1N(n192), .B0(n193), .Y(n188) );
  NOR2X2 U50 ( .A(A[10]), .B(B[10]), .Y(n241) );
  NAND2XL U51 ( .A(B[5]), .B(A[5]), .Y(n193) );
  NAND2XL U52 ( .A(B[6]), .B(A[6]), .Y(n194) );
  NOR2XL U53 ( .A(B[4]), .B(A[4]), .Y(n197) );
  AOI211XL U54 ( .A0(n221), .A1(n168), .B0(n222), .C0(n169), .Y(n213) );
  NOR2XL U55 ( .A(n203), .B(n205), .Y(n204) );
  NOR2XL U56 ( .A(B[8]), .B(A[8]), .Y(n237) );
  NAND2XL U57 ( .A(B[1]), .B(A[1]), .Y(n209) );
  NAND2BXL U58 ( .AN(n197), .B(n198), .Y(n199) );
  NAND2BXL U59 ( .AN(n208), .B(n209), .Y(n207) );
  NOR2XL U60 ( .A(B[7]), .B(A[7]), .Y(n248) );
  OAI221X1 U61 ( .A0(B[3]), .A1(A[3]), .B0(n203), .B1(n202), .C0(n177), .Y(
        n251) );
  AOI21XL U62 ( .A0(n202), .A1(n177), .B0(n203), .Y(n201) );
  INVX1 U63 ( .A(n250), .Y(n175) );
  NAND2X1 U64 ( .A(n223), .B(n168), .Y(n231) );
  NOR2X1 U65 ( .A(n222), .B(n215), .Y(n230) );
  OAI21XL U66 ( .A0(n228), .A1(n227), .B0(n223), .Y(n229) );
  OAI33X1 U67 ( .A0(n213), .A1(n214), .A2(n215), .B0(n216), .B1(n217), .B2(
        n214), .Y(n212) );
  INVX1 U68 ( .A(n223), .Y(n169) );
  NAND2X1 U69 ( .A(n189), .B(n191), .Y(n250) );
  NAND2BX1 U70 ( .AN(n238), .B(n171), .Y(n245) );
  XOR2X1 U71 ( .A(n233), .B(n234), .Y(SUM[12]) );
  NOR2X1 U72 ( .A(n217), .B(n221), .Y(n234) );
  XOR2X1 U73 ( .A(n179), .B(n180), .Y(SUM[9]) );
  NAND2BX1 U74 ( .AN(n181), .B(n182), .Y(n179) );
  NAND2BX1 U75 ( .AN(n240), .B(n235), .Y(n242) );
  AOI21X1 U76 ( .A0(n244), .A1(n171), .B0(n238), .Y(n243) );
  NOR2X1 U77 ( .A(n228), .B(n215), .Y(n220) );
  INVX1 U78 ( .A(n241), .Y(n171) );
  INVX1 U79 ( .A(n228), .Y(n168) );
  INVX1 U80 ( .A(n205), .Y(n177) );
  INVX1 U81 ( .A(n194), .Y(n174) );
  XNOR2X1 U82 ( .A(n190), .B(n188), .Y(SUM[6]) );
  NAND2X1 U83 ( .A(n189), .B(n194), .Y(n190) );
  XOR2X1 U84 ( .A(n192), .B(n195), .Y(SUM[5]) );
  INVX1 U85 ( .A(n237), .Y(n173) );
  XOR2X1 U86 ( .A(n202), .B(n204), .Y(SUM[2]) );
  AOI21X1 U87 ( .A0(A[15]), .A1(B[15]), .B0(n214), .Y(n224) );
  NAND2X1 U88 ( .A(n227), .B(n223), .Y(n226) );
  NOR2X1 U89 ( .A(n237), .B(n181), .Y(n236) );
  XNOR2X1 U90 ( .A(n183), .B(n184), .Y(SUM[8]) );
  NAND2X1 U91 ( .A(n185), .B(n173), .Y(n183) );
  OAI21XL U92 ( .A0(n208), .A1(n206), .B0(n209), .Y(n202) );
  INVX1 U93 ( .A(n185), .Y(n172) );
  NOR2X1 U94 ( .A(B[2]), .B(A[2]), .Y(n205) );
  NOR2X1 U95 ( .A(B[1]), .B(A[1]), .Y(n208) );
  OAI21XL U96 ( .A0(n196), .A1(n197), .B0(n198), .Y(n192) );
  XOR2X1 U97 ( .A(n199), .B(n196), .Y(SUM[4]) );
  XOR2X1 U98 ( .A(n206), .B(n207), .Y(SUM[1]) );
  INVX1 U99 ( .A(B[11]), .Y(n178) );
  AOI211X1 U100 ( .A0(B[7]), .A1(A[7]), .B0(n249), .C0(n174), .Y(n247) );
  XNOR2X1 U101 ( .A(B[16]), .B(A[16]), .Y(n210) );
  AOI21X1 U102 ( .A0(A[3]), .A1(B[3]), .B0(n176), .Y(n196) );
  XOR2X1 U103 ( .A(n186), .B(n187), .Y(SUM[7]) );
  XNOR2X1 U104 ( .A(A[7]), .B(B[7]), .Y(n186) );
  AOI21X1 U105 ( .A0(n188), .A1(n189), .B0(n174), .Y(n187) );
  XOR2X1 U106 ( .A(n200), .B(n201), .Y(SUM[3]) );
  XNOR2X1 U107 ( .A(A[3]), .B(B[3]), .Y(n200) );
  INVX1 U108 ( .A(n252), .Y(SUM[0]) );
  OAI21XL U109 ( .A0(B[0]), .A1(A[0]), .B0(n206), .Y(n252) );
endmodule


module butterfly_DW01_sub_64 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n197, n198, n199, n200, n201, n202, n203, n204, n205, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n226, n227, n228, n229,
         n230, n231, n232, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n244, n245, n246, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306,
         n307, n308, n309, n310, n311, n312, n313;

  AND2X2 U4 ( .A(n231), .B(n232), .Y(n230) );
  XOR2X2 U3 ( .A(n281), .B(n282), .Y(DIFF[15]) );
  AOI21X1 U5 ( .A0(n214), .A1(B[3]), .B0(n216), .Y(n307) );
  OAI21XL U6 ( .A0(n207), .A1(n292), .B0(n293), .Y(n277) );
  INVX1 U7 ( .A(A[15]), .Y(n197) );
  NAND2BX1 U8 ( .AN(A[9]), .B(B[9]), .Y(n232) );
  NOR2BX2 U9 ( .AN(A[10]), .B(B[10]), .Y(n297) );
  NOR2X1 U10 ( .A(n223), .B(A[11]), .Y(n296) );
  OAI21XL U11 ( .A0(n257), .A1(n259), .B0(n307), .Y(n308) );
  INVX1 U12 ( .A(A[2]), .Y(n217) );
  NOR2X1 U13 ( .A(n227), .B(A[5]), .Y(n245) );
  NOR2X1 U14 ( .A(n220), .B(A[14]), .Y(n280) );
  CLKINVX3 U15 ( .A(n267), .Y(n199) );
  NAND2X2 U16 ( .A(n313), .B(n277), .Y(n284) );
  INVX1 U17 ( .A(n268), .Y(n202) );
  NAND2X1 U18 ( .A(A[8]), .B(n224), .Y(n235) );
  AOI21X2 U19 ( .A0(n213), .A1(n275), .B0(n279), .Y(n234) );
  NAND2X1 U20 ( .A(B[0]), .B(n219), .Y(n256) );
  NOR2X1 U21 ( .A(n278), .B(n276), .Y(n248) );
  NAND2X2 U22 ( .A(n311), .B(n312), .Y(DIFF[11]) );
  NAND2X1 U23 ( .A(n299), .B(n310), .Y(n311) );
  XOR2X2 U24 ( .A(n261), .B(n262), .Y(DIFF[16]) );
  XNOR2X1 U25 ( .A(B[16]), .B(A[16]), .Y(n262) );
  NAND2X1 U26 ( .A(n309), .B(n300), .Y(n312) );
  INVXL U27 ( .A(n299), .Y(n309) );
  INVX2 U28 ( .A(n300), .Y(n310) );
  AOI21XL U29 ( .A0(n301), .A1(n292), .B0(n297), .Y(n300) );
  NAND2BXL U30 ( .AN(A[10]), .B(B[10]), .Y(n292) );
  NOR2X2 U31 ( .A(n284), .B(n202), .Y(n290) );
  NAND2X1 U32 ( .A(A[11]), .B(n223), .Y(n294) );
  OAI21XL U33 ( .A0(n287), .A1(n202), .B0(n284), .Y(n291) );
  OR2X4 U34 ( .A(n234), .B(n273), .Y(n313) );
  AOI31XL U35 ( .A0(n201), .A1(n200), .A2(n203), .B0(n199), .Y(n286) );
  NAND2BX1 U36 ( .AN(B[9]), .B(A[9]), .Y(n231) );
  NAND2X1 U37 ( .A(A[5]), .B(n227), .Y(n247) );
  INVXL U38 ( .A(A[4]), .Y(n212) );
  XOR2X2 U39 ( .A(n285), .B(n286), .Y(DIFF[14]) );
  CLKINVX3 U40 ( .A(n287), .Y(n203) );
  OAI21X1 U41 ( .A0(n198), .A1(n265), .B0(n266), .Y(n264) );
  AOI21XL U42 ( .A0(n267), .A1(n268), .B0(n269), .Y(n265) );
  OAI2BB1X2 U43 ( .A0N(n229), .A1N(n232), .B0(n231), .Y(n301) );
  NAND2BXL U44 ( .AN(n240), .B(n242), .Y(n243) );
  NOR2XL U45 ( .A(n210), .B(n245), .Y(n246) );
  NAND2XL U46 ( .A(n215), .B(n258), .Y(n254) );
  NOR4BX2 U47 ( .AN(n306), .B(n240), .C(n245), .D(n239), .Y(n275) );
  NAND4X2 U48 ( .A(n298), .B(n292), .C(n232), .D(n205), .Y(n273) );
  NOR2XL U49 ( .A(A[8]), .B(n224), .Y(n303) );
  NAND2XL U50 ( .A(A[14]), .B(n220), .Y(n270) );
  AOI21XL U51 ( .A0(n275), .A1(n278), .B0(n279), .Y(n272) );
  AOI31XL U52 ( .A0(n204), .A1(n275), .A2(n276), .B0(n206), .Y(n274) );
  XOR2XL U53 ( .A(n233), .B(n234), .Y(DIFF[8]) );
  NAND2XL U54 ( .A(B[1]), .B(n218), .Y(n255) );
  NAND2BXL U55 ( .AN(n257), .B(n255), .Y(n260) );
  AOI21XL U56 ( .A0(n255), .A1(n256), .B0(n257), .Y(n253) );
  INVX1 U57 ( .A(n290), .Y(n201) );
  OAI21X1 U58 ( .A0(n287), .A1(n201), .B0(n291), .Y(DIFF[12]) );
  XNOR2X1 U59 ( .A(n302), .B(n301), .Y(DIFF[10]) );
  NAND2BX1 U60 ( .AN(n297), .B(n292), .Y(n302) );
  XOR2X1 U61 ( .A(n229), .B(n230), .Y(DIFF[9]) );
  NAND2BX1 U62 ( .AN(n280), .B(n270), .Y(n285) );
  XOR2X1 U63 ( .A(n288), .B(n289), .Y(DIFF[13]) );
  NOR2X1 U64 ( .A(n269), .B(n199), .Y(n289) );
  NOR2X1 U65 ( .A(n287), .B(n290), .Y(n288) );
  INVX1 U66 ( .A(n269), .Y(n200) );
  INVX1 U67 ( .A(n270), .Y(n198) );
  INVX1 U68 ( .A(n273), .Y(n204) );
  INVX1 U69 ( .A(n235), .Y(n208) );
  INVX1 U70 ( .A(n277), .Y(n206) );
  XOR2X1 U71 ( .A(n244), .B(n246), .Y(DIFF[5]) );
  XOR2X1 U72 ( .A(n243), .B(n241), .Y(DIFF[6]) );
  AOI21X1 U73 ( .A0(n211), .A1(n244), .B0(n210), .Y(n241) );
  INVX1 U74 ( .A(n245), .Y(n211) );
  INVX1 U75 ( .A(n248), .Y(n213) );
  INVX1 U76 ( .A(n258), .Y(n216) );
  INVX1 U77 ( .A(n247), .Y(n210) );
  XOR2X1 U78 ( .A(n254), .B(n253), .Y(DIFF[2]) );
  INVX1 U79 ( .A(n259), .Y(n215) );
  NAND2X1 U80 ( .A(B[4]), .B(n212), .Y(n306) );
  AOI31X1 U81 ( .A0(n242), .A1(n238), .A2(n209), .B0(n239), .Y(n279) );
  INVX1 U82 ( .A(n304), .Y(n209) );
  AOI211X1 U83 ( .A0(n305), .A1(n247), .B0(n245), .C0(n240), .Y(n304) );
  NAND2X1 U84 ( .A(A[4]), .B(n228), .Y(n305) );
  OR2X2 U85 ( .A(A[8]), .B(n224), .Y(n298) );
  NAND2X1 U86 ( .A(n294), .B(n205), .Y(n299) );
  NOR2X1 U87 ( .A(n226), .B(A[6]), .Y(n240) );
  NOR2X1 U88 ( .A(n221), .B(A[13]), .Y(n269) );
  INVX1 U89 ( .A(n294), .Y(n207) );
  AOI31X1 U90 ( .A0(n294), .A1(n231), .A2(n295), .B0(n296), .Y(n293) );
  AOI21X1 U91 ( .A0(n208), .A1(n232), .B0(n297), .Y(n295) );
  OAI21XL U92 ( .A0(n234), .A1(n303), .B0(n235), .Y(n229) );
  AOI21X1 U93 ( .A0(n197), .A1(B[15]), .B0(n280), .Y(n266) );
  NAND2X1 U94 ( .A(A[6]), .B(n226), .Y(n242) );
  NAND4X1 U95 ( .A(n266), .B(n271), .C(n203), .D(n200), .Y(n263) );
  OAI21XL U96 ( .A0(n272), .A1(n273), .B0(n274), .Y(n271) );
  NAND2X1 U97 ( .A(A[13]), .B(n221), .Y(n267) );
  INVX1 U98 ( .A(n296), .Y(n205) );
  NOR2X1 U99 ( .A(n222), .B(A[12]), .Y(n287) );
  OAI21XL U100 ( .A0(A[8]), .A1(n224), .B0(n235), .Y(n233) );
  XOR2X1 U101 ( .A(n236), .B(n237), .Y(DIFF[7]) );
  NOR2BX1 U102 ( .AN(n238), .B(n239), .Y(n237) );
  OAI21XL U103 ( .A0(n240), .A1(n241), .B0(n242), .Y(n236) );
  NOR2X1 U104 ( .A(n218), .B(B[1]), .Y(n257) );
  OAI21XL U105 ( .A0(n248), .A1(n212), .B0(n249), .Y(n244) );
  OAI21XL U106 ( .A0(A[4]), .A1(n213), .B0(n228), .Y(n249) );
  NOR2X1 U107 ( .A(n217), .B(B[2]), .Y(n259) );
  NAND2X1 U108 ( .A(A[12]), .B(n222), .Y(n268) );
  NAND2X1 U109 ( .A(B[2]), .B(n217), .Y(n258) );
  AND3X2 U110 ( .A(n256), .B(n255), .C(n307), .Y(n276) );
  XNOR2X1 U111 ( .A(n248), .B(n250), .Y(DIFF[4]) );
  XNOR2X1 U112 ( .A(A[4]), .B(B[4]), .Y(n250) );
  XNOR2X1 U113 ( .A(n260), .B(n256), .Y(DIFF[1]) );
  INVX1 U114 ( .A(B[4]), .Y(n228) );
  INVX1 U115 ( .A(B[6]), .Y(n226) );
  INVX1 U116 ( .A(B[13]), .Y(n221) );
  INVX1 U117 ( .A(B[12]), .Y(n222) );
  INVX1 U118 ( .A(B[5]), .Y(n227) );
  INVX1 U119 ( .A(B[11]), .Y(n223) );
  INVX1 U120 ( .A(B[14]), .Y(n220) );
  XNOR2X1 U121 ( .A(A[15]), .B(B[15]), .Y(n282) );
  OAI31X1 U122 ( .A0(n283), .A1(n269), .A2(n280), .B0(n270), .Y(n281) );
  OAI32X1 U123 ( .A0(n284), .A1(n202), .A2(n199), .B0(n199), .B1(n203), .Y(
        n283) );
  OAI211X1 U124 ( .A0(B[15]), .A1(n197), .B0(n263), .C0(n264), .Y(n261) );
  NOR2X1 U125 ( .A(n225), .B(A[7]), .Y(n239) );
  NAND2X1 U126 ( .A(A[7]), .B(n225), .Y(n238) );
  OAI21XL U127 ( .A0(B[3]), .A1(n214), .B0(n308), .Y(n278) );
  INVX1 U128 ( .A(A[3]), .Y(n214) );
  INVX1 U129 ( .A(A[1]), .Y(n218) );
  XOR2X1 U130 ( .A(n251), .B(n252), .Y(DIFF[3]) );
  XNOR2X1 U131 ( .A(A[3]), .B(B[3]), .Y(n252) );
  OAI21XL U132 ( .A0(n216), .A1(n253), .B0(n215), .Y(n251) );
  OAI21X1 U133 ( .A0(B[0]), .A1(n219), .B0(n256), .Y(DIFF[0]) );
  INVX1 U134 ( .A(B[8]), .Y(n224) );
  INVX1 U135 ( .A(A[0]), .Y(n219) );
  INVX1 U136 ( .A(B[7]), .Y(n225) );
endmodule


module butterfly_DW01_sub_77 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n280, n339, n359, n360;

  OAI31X2 U53 ( .A0(n345), .A1(n272), .A2(n346), .B0(n347), .Y(n343) );
  AND2X2 U57 ( .A(n347), .B(n344), .Y(n353) );
  XOR2X4 U61 ( .A(n355), .B(n339), .Y(DIFF[10]) );
  NAND2X4 U64 ( .A(n345), .B(n351), .Y(n287) );
  NOR2X4 U74 ( .A(n276), .B(n303), .Y(n305) );
  OAI21X4 U76 ( .A0(A[4]), .A1(n306), .B0(n357), .Y(n302) );
  OAI2BB1X4 U77 ( .A0N(n306), .A1N(A[4]), .B0(B[4]), .Y(n357) );
  OAI21X4 U78 ( .A0(B[3]), .A1(n278), .B0(n277), .Y(n306) );
  AOI221X2 U79 ( .A0(n278), .A1(B[3]), .B0(n311), .B1(n279), .C0(n310), .Y(
        n358) );
  CLKINVX4 U100 ( .A(n302), .Y(n276) );
  CLKINVX4 U102 ( .A(A[3]), .Y(n278) );
  NAND2BX2 U3 ( .AN(n292), .B(n290), .Y(n345) );
  AOI31X4 U4 ( .A0(n356), .A1(n299), .A2(n295), .B0(n296), .Y(n290) );
  XOR2X2 U5 ( .A(n336), .B(n337), .Y(DIFF[14]) );
  INVX4 U6 ( .A(n313), .Y(n279) );
  OAI21X4 U7 ( .A0(n316), .A1(n360), .B0(n317), .Y(n313) );
  CLKINVX4 U8 ( .A(n354), .Y(n280) );
  INVX8 U9 ( .A(n280), .Y(n339) );
  AOI21XL U10 ( .A0(n348), .A1(n287), .B0(n289), .Y(n354) );
  XNOR2X4 U11 ( .A(n338), .B(n359), .Y(DIFF[13]) );
  NAND2X1 U12 ( .A(n349), .B(n350), .Y(n342) );
  OAI211X1 U13 ( .A0(n289), .A1(n274), .B0(n271), .C0(n348), .Y(n350) );
  INVX1 U14 ( .A(n348), .Y(n272) );
  INVX2 U15 ( .A(A[0]), .Y(n281) );
  OR3X2 U16 ( .A(n305), .B(n301), .C(n298), .Y(n356) );
  AND2X2 U17 ( .A(B[0]), .B(n281), .Y(n360) );
  AOI21X1 U18 ( .A0(n323), .A1(n340), .B0(n328), .Y(n338) );
  XOR2X1 U19 ( .A(n287), .B(n288), .Y(DIFF[9]) );
  OAI21XL U20 ( .A0(n301), .A1(n275), .B0(n304), .Y(DIFF[5]) );
  NAND2BX1 U21 ( .AN(B[2]), .B(A[2]), .Y(n311) );
  NOR2BX1 U22 ( .AN(B[2]), .B(A[2]), .Y(n310) );
  NOR2X1 U23 ( .A(n286), .B(A[1]), .Y(n316) );
  OR2X2 U24 ( .A(n335), .B(n268), .Y(n359) );
  NOR2X1 U25 ( .A(n289), .B(n272), .Y(n288) );
  XOR2X4 U26 ( .A(n352), .B(n353), .Y(DIFF[11]) );
  OAI21X4 U27 ( .A0(n339), .A1(n346), .B0(n349), .Y(n352) );
  AOI2BB1XL U28 ( .A0N(n301), .A1N(n302), .B0(n303), .Y(n297) );
  NAND2XL U29 ( .A(n271), .B(n349), .Y(n355) );
  INVXL U30 ( .A(n305), .Y(n275) );
  NAND2XL U31 ( .A(n333), .B(n334), .Y(n332) );
  NAND2BX1 U32 ( .AN(A[14]), .B(B[14]), .Y(n326) );
  NAND2X1 U33 ( .A(A[12]), .B(n283), .Y(n340) );
  NAND2BX1 U34 ( .AN(A[13]), .B(B[13]), .Y(n329) );
  NOR2BXL U35 ( .AN(B[10]), .B(A[10]), .Y(n346) );
  OAI21X4 U36 ( .A0(n342), .A1(n343), .B0(n344), .Y(n323) );
  NOR2XL U37 ( .A(n270), .B(n328), .Y(n341) );
  NOR2XL U38 ( .A(n292), .B(n274), .Y(n291) );
  XNOR2XL U39 ( .A(n282), .B(A[15]), .Y(n331) );
  NAND2XL U40 ( .A(A[1]), .B(n286), .Y(n317) );
  NOR2BXL U41 ( .AN(B[7]), .B(A[7]), .Y(n296) );
  NOR2XL U42 ( .A(n284), .B(A[8]), .Y(n292) );
  NAND2BXL U43 ( .AN(B[10]), .B(A[10]), .Y(n349) );
  NAND2XL U44 ( .A(A[8]), .B(n284), .Y(n351) );
  NAND2BXL U45 ( .AN(B[11]), .B(A[11]), .Y(n347) );
  NAND2BXL U46 ( .AN(B[7]), .B(A[7]), .Y(n295) );
  NAND2BXL U47 ( .AN(A[11]), .B(B[11]), .Y(n344) );
  NOR2XL U48 ( .A(n283), .B(A[12]), .Y(n328) );
  NAND2BX1 U49 ( .AN(n316), .B(n317), .Y(n314) );
  NAND2BX1 U50 ( .AN(n310), .B(n311), .Y(n312) );
  XOR2X1 U51 ( .A(n293), .B(n294), .Y(DIFF[7]) );
  NOR2BX1 U52 ( .AN(n295), .B(n296), .Y(n294) );
  OAI21XL U54 ( .A0(n297), .A1(n298), .B0(n299), .Y(n293) );
  OAI21XL U55 ( .A0(n303), .A1(n301), .B0(n276), .Y(n304) );
  NOR2BX1 U56 ( .AN(n326), .B(n325), .Y(n337) );
  NAND2X1 U58 ( .A(n327), .B(n333), .Y(n336) );
  OAI21XL U59 ( .A0(n322), .A1(n323), .B0(n324), .Y(n321) );
  NAND3BX1 U60 ( .AN(n328), .B(n329), .C(n326), .Y(n322) );
  OAI21XL U62 ( .A0(n325), .A1(n269), .B0(n326), .Y(n324) );
  INVX1 U63 ( .A(n327), .Y(n269) );
  NAND2X1 U65 ( .A(B[0]), .B(n281), .Y(n315) );
  XNOR2X1 U66 ( .A(n323), .B(n341), .Y(DIFF[12]) );
  XOR2X1 U67 ( .A(n290), .B(n291), .Y(DIFF[8]) );
  XOR2X1 U68 ( .A(n300), .B(n297), .Y(DIFF[6]) );
  NAND2BX1 U69 ( .AN(n298), .B(n299), .Y(n300) );
  OR3XL U70 ( .A(n323), .B(n268), .C(n328), .Y(n333) );
  INVX1 U71 ( .A(n329), .Y(n268) );
  INVX1 U72 ( .A(n346), .Y(n271) );
  INVX1 U73 ( .A(n351), .Y(n274) );
  AOI21X1 U75 ( .A0(n329), .A1(n270), .B0(n335), .Y(n327) );
  INVX1 U80 ( .A(n340), .Y(n270) );
  OAI21XL U81 ( .A0(n270), .A1(n335), .B0(n329), .Y(n334) );
  INVX1 U82 ( .A(B[6]), .Y(n285) );
  INVX1 U83 ( .A(B[12]), .Y(n283) );
  INVX1 U84 ( .A(B[15]), .Y(n282) );
  INVX1 U85 ( .A(B[8]), .Y(n284) );
  XOR2X1 U86 ( .A(n330), .B(n331), .Y(DIFF[15]) );
  AOI21X1 U87 ( .A0(n332), .A1(n326), .B0(n325), .Y(n330) );
  XOR2X1 U88 ( .A(n318), .B(n319), .Y(DIFF[16]) );
  XOR2X1 U89 ( .A(B[16]), .B(A[16]), .Y(n319) );
  AOI22X1 U90 ( .A0(n320), .A1(n282), .B0(A[15]), .B1(n321), .Y(n318) );
  OR2X2 U91 ( .A(n321), .B(A[15]), .Y(n320) );
  NOR2BX1 U92 ( .AN(B[5]), .B(A[5]), .Y(n301) );
  NOR2BX1 U93 ( .AN(A[5]), .B(B[5]), .Y(n303) );
  NOR2X1 U94 ( .A(n285), .B(A[6]), .Y(n298) );
  NAND2X1 U95 ( .A(A[6]), .B(n285), .Y(n299) );
  XOR2X1 U96 ( .A(n308), .B(n309), .Y(DIFF[3]) );
  XNOR2X1 U97 ( .A(A[3]), .B(B[3]), .Y(n309) );
  OAI21XL U98 ( .A0(n279), .A1(n310), .B0(n311), .Y(n308) );
  XNOR2X1 U99 ( .A(n306), .B(n307), .Y(DIFF[4]) );
  XOR2X1 U101 ( .A(B[4]), .B(A[4]), .Y(n307) );
  NOR2BX1 U103 ( .AN(A[13]), .B(B[13]), .Y(n335) );
  NOR2X1 U104 ( .A(n273), .B(B[9]), .Y(n289) );
  INVX1 U105 ( .A(A[9]), .Y(n273) );
  NAND2X1 U106 ( .A(B[9]), .B(n273), .Y(n348) );
  NOR2BX1 U107 ( .AN(A[14]), .B(B[14]), .Y(n325) );
  INVX1 U108 ( .A(B[1]), .Y(n286) );
  XNOR2XL U109 ( .A(n312), .B(n313), .Y(DIFF[2]) );
  OAI21XL U110 ( .A0(B[0]), .A1(n281), .B0(n315), .Y(DIFF[0]) );
  XNOR2XL U111 ( .A(n314), .B(n315), .Y(DIFF[1]) );
  INVX4 U112 ( .A(n358), .Y(n277) );
endmodule


module butterfly_DW01_add_99 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255;

  AND2X2 U82 ( .A(B[6]), .B(A[6]), .Y(n196) );
  BUFX3 U2 ( .A(n214), .Y(n254) );
  BUFX4 U3 ( .A(n212), .Y(n255) );
  AND2X2 U4 ( .A(B[2]), .B(A[2]), .Y(n209) );
  XOR2X1 U5 ( .A(n197), .B(n194), .Y(SUM[6]) );
  OAI2BB1X2 U6 ( .A0N(A[3]), .A1N(B[3]), .B0(n251), .Y(n204) );
  XOR2X1 U7 ( .A(n206), .B(n207), .Y(SUM[3]) );
  NOR2X2 U8 ( .A(B[2]), .B(A[2]), .Y(n211) );
  OAI21X4 U9 ( .A0(n254), .A1(n255), .B0(n215), .Y(n208) );
  NOR2XL U10 ( .A(B[10]), .B(A[10]), .Y(n240) );
  AOI21XL U11 ( .A0(n244), .A1(n176), .B0(n177), .Y(n243) );
  AOI21X2 U12 ( .A0(n179), .A1(n198), .B0(n180), .Y(n194) );
  OAI21X1 U13 ( .A0(n227), .A1(n232), .B0(n229), .Y(n230) );
  XOR2X1 U14 ( .A(n233), .B(n232), .Y(SUM[13]) );
  OAI2BB1X1 U15 ( .A0N(A[11]), .A1N(B[11]), .B0(n175), .Y(n242) );
  NOR2XL U16 ( .A(B[1]), .B(A[1]), .Y(n214) );
  NOR2XL U17 ( .A(A[11]), .B(B[11]), .Y(n237) );
  NAND2XL U18 ( .A(B[10]), .B(A[10]), .Y(n245) );
  NAND2XL U19 ( .A(B[8]), .B(A[8]), .Y(n191) );
  AOI211X1 U20 ( .A0(n203), .A1(n201), .B0(n200), .C0(n195), .Y(n252) );
  NOR2XL U21 ( .A(n209), .B(n211), .Y(n210) );
  OAI21X2 U22 ( .A0(n247), .A1(n248), .B0(n249), .Y(n189) );
  AOI2BB1X1 U23 ( .A0N(n194), .A1N(n195), .B0(n196), .Y(n193) );
  NOR2X1 U24 ( .A(B[13]), .B(A[13]), .Y(n227) );
  INVXL U25 ( .A(n221), .Y(n172) );
  OAI21X2 U26 ( .A0(n184), .A1(n187), .B0(n186), .Y(n244) );
  NAND2BXL U27 ( .AN(n202), .B(n203), .Y(n205) );
  AOI21XL U28 ( .A0(n174), .A1(n222), .B0(n173), .Y(n232) );
  NOR2XL U29 ( .A(n234), .B(n173), .Y(n235) );
  NAND2XL U30 ( .A(n229), .B(n171), .Y(n233) );
  OR2XL U31 ( .A(n196), .B(n195), .Y(n197) );
  NOR2BXL U32 ( .AN(n186), .B(n187), .Y(n185) );
  INVXL U33 ( .A(n200), .Y(n179) );
  AOI31XL U34 ( .A0(n222), .A1(n174), .A2(n171), .B0(n170), .Y(n219) );
  INVXL U35 ( .A(n201), .Y(n180) );
  NOR2XL U36 ( .A(n187), .B(n240), .Y(n239) );
  NOR2XL U37 ( .A(A[7]), .B(B[7]), .Y(n248) );
  AOI211XL U38 ( .A0(B[7]), .A1(A[7]), .B0(n196), .C0(n252), .Y(n247) );
  OAI221X1 U39 ( .A0(B[3]), .A1(A[3]), .B0(n209), .B1(n208), .C0(n182), .Y(
        n251) );
  NAND2XL U40 ( .A(B[0]), .B(A[0]), .Y(n212) );
  XOR2X2 U41 ( .A(n192), .B(n193), .Y(SUM[7]) );
  NAND2XL U42 ( .A(B[1]), .B(A[1]), .Y(n215) );
  AOI21XL U43 ( .A0(n208), .A1(n182), .B0(n209), .Y(n207) );
  OR2XL U44 ( .A(B[8]), .B(A[8]), .Y(n190) );
  NOR2XL U45 ( .A(B[14]), .B(A[14]), .Y(n220) );
  NAND2XL U46 ( .A(B[13]), .B(A[13]), .Y(n229) );
  NOR2XL U47 ( .A(A[12]), .B(B[12]), .Y(n234) );
  NAND2XL U48 ( .A(B[14]), .B(A[14]), .Y(n226) );
  NAND2XL U49 ( .A(B[12]), .B(A[12]), .Y(n228) );
  INVXL U50 ( .A(A[15]), .Y(n169) );
  XNOR2X1 U51 ( .A(n205), .B(n204), .Y(SUM[4]) );
  XNOR2X1 U52 ( .A(n188), .B(n189), .Y(SUM[8]) );
  NAND2X1 U53 ( .A(n190), .B(n191), .Y(n188) );
  OAI21XL U54 ( .A0(n181), .A1(n202), .B0(n203), .Y(n198) );
  INVX1 U55 ( .A(n204), .Y(n181) );
  AOI21X1 U56 ( .A0(n189), .A1(n190), .B0(n178), .Y(n184) );
  INVX1 U57 ( .A(n191), .Y(n178) );
  XOR2X1 U58 ( .A(n198), .B(n199), .Y(SUM[5]) );
  NOR2X1 U59 ( .A(n180), .B(n200), .Y(n199) );
  XOR2X1 U60 ( .A(n230), .B(n231), .Y(SUM[14]) );
  NOR2X1 U61 ( .A(n170), .B(n220), .Y(n231) );
  XNOR2X1 U62 ( .A(n184), .B(n185), .Y(SUM[9]) );
  XNOR2X1 U63 ( .A(n246), .B(n244), .Y(SUM[10]) );
  NAND2X1 U64 ( .A(n245), .B(n176), .Y(n246) );
  INVX1 U65 ( .A(n211), .Y(n182) );
  XOR2X1 U66 ( .A(n222), .B(n235), .Y(SUM[12]) );
  XOR2X1 U67 ( .A(n208), .B(n210), .Y(SUM[2]) );
  INVX1 U68 ( .A(n240), .Y(n176) );
  XOR2X1 U69 ( .A(n255), .B(n213), .Y(SUM[1]) );
  NAND2BX1 U70 ( .AN(n254), .B(n215), .Y(n213) );
  INVX1 U71 ( .A(n245), .Y(n177) );
  INVX1 U72 ( .A(n237), .Y(n175) );
  OAI21XL U73 ( .A0(n227), .A1(n228), .B0(n229), .Y(n221) );
  INVX1 U74 ( .A(n227), .Y(n171) );
  INVX1 U75 ( .A(n234), .Y(n174) );
  INVX1 U76 ( .A(n228), .Y(n173) );
  INVX1 U77 ( .A(n226), .Y(n170) );
  OAI21XL U78 ( .A0(n236), .A1(n237), .B0(n238), .Y(n222) );
  AOI211X1 U79 ( .A0(A[11]), .A1(B[11]), .B0(n241), .C0(n177), .Y(n236) );
  NAND4X1 U80 ( .A(n189), .B(n175), .C(n190), .D(n239), .Y(n238) );
  AOI211X1 U81 ( .A0(n191), .A1(n186), .B0(n240), .C0(n187), .Y(n241) );
  NAND4BXL U83 ( .AN(n195), .B(n179), .C(n204), .D(n250), .Y(n249) );
  NOR2X1 U84 ( .A(B[4]), .B(A[4]), .Y(n202) );
  NOR2X1 U85 ( .A(B[6]), .B(A[6]), .Y(n195) );
  NOR2X1 U86 ( .A(B[5]), .B(A[5]), .Y(n200) );
  NAND2X1 U87 ( .A(B[4]), .B(A[4]), .Y(n203) );
  XOR2X1 U88 ( .A(n242), .B(n243), .Y(SUM[11]) );
  NAND2X1 U89 ( .A(B[5]), .B(A[5]), .Y(n201) );
  XNOR2X1 U90 ( .A(A[7]), .B(B[7]), .Y(n192) );
  XOR2X1 U91 ( .A(n223), .B(n224), .Y(SUM[15]) );
  XNOR2X1 U92 ( .A(n183), .B(A[15]), .Y(n224) );
  OAI21XL U93 ( .A0(n220), .A1(n225), .B0(n226), .Y(n223) );
  AOI31X1 U94 ( .A0(n171), .A1(n174), .A2(n222), .B0(n221), .Y(n225) );
  AOI2BB1X1 U95 ( .A0N(A[7]), .A1N(B[7]), .B0(n202), .Y(n250) );
  NOR2X1 U96 ( .A(B[9]), .B(A[9]), .Y(n187) );
  NAND2X1 U97 ( .A(B[9]), .B(A[9]), .Y(n186) );
  XNOR2X1 U98 ( .A(A[3]), .B(B[3]), .Y(n206) );
  XOR2X1 U99 ( .A(n216), .B(n217), .Y(SUM[16]) );
  XNOR2X1 U100 ( .A(B[16]), .B(A[16]), .Y(n216) );
  AOI21X1 U101 ( .A0(B[15]), .A1(A[15]), .B0(n218), .Y(n217) );
  AOI221X1 U102 ( .A0(n219), .A1(n172), .B0(n169), .B1(n183), .C0(n220), .Y(
        n218) );
  INVX1 U103 ( .A(n253), .Y(SUM[0]) );
  OAI21XL U104 ( .A0(B[0]), .A1(A[0]), .B0(n255), .Y(n253) );
  INVX1 U105 ( .A(B[15]), .Y(n183) );
endmodule


module butterfly ( calc_in, rotation, calc_out );
  input [135:0] calc_in;
  input [2:0] rotation;
  output [135:0] calc_out;
  wire   N42, n45, n193, n194, n70, n71, temp_3_real_9_, temp_3_real_8_,
         temp_3_real_7_, temp_3_real_6_, temp_3_real_5_, temp_3_real_4_,
         temp_3_real_3_, temp_3_real_2_, temp_3_real_1_, temp_3_real_16_,
         temp_3_real_15_, temp_3_real_14_, temp_3_real_13_, temp_3_real_12_,
         temp_3_real_11_, temp_3_real_10_, temp_3_real_0_, temp_3_imag_9_,
         temp_3_imag_8_, temp_3_imag_7_, temp_3_imag_6_, temp_3_imag_5_,
         temp_3_imag_4_, temp_3_imag_3_, temp_3_imag_2_, temp_3_imag_1_,
         temp_3_imag_16_, temp_3_imag_15_, temp_3_imag_14_, temp_3_imag_13_,
         temp_3_imag_12_, temp_3_imag_11_, temp_3_imag_10_, temp_3_imag_0_,
         temp_2_real_9_, temp_2_real_8_, temp_2_real_7_, temp_2_real_6_,
         temp_2_real_5_, temp_2_real_4_, temp_2_real_3_, temp_2_real_2_,
         temp_2_real_1_, temp_2_real_16_, temp_2_real_15_, temp_2_real_14_,
         temp_2_real_13_, temp_2_real_12_, temp_2_real_11_, temp_2_real_10_,
         temp_2_real_0_, temp_2_imag_9_, temp_2_imag_8_, temp_2_imag_7_,
         temp_2_imag_6_, temp_2_imag_5_, temp_2_imag_4_, temp_2_imag_3_,
         temp_2_imag_2_, temp_2_imag_1_, temp_2_imag_16_, temp_2_imag_15_,
         temp_2_imag_14_, temp_2_imag_13_, temp_2_imag_12_, temp_2_imag_11_,
         temp_2_imag_10_, temp_2_imag_0_, temp_1_real_9_, temp_1_real_8_,
         temp_1_real_7_, temp_1_real_6_, temp_1_real_5_, temp_1_real_4_,
         temp_1_real_3_, temp_1_real_2_, temp_1_real_1_, temp_1_real_16_,
         temp_1_real_15_, temp_1_real_14_, temp_1_real_13_, temp_1_real_12_,
         temp_1_real_11_, temp_1_real_10_, temp_1_real_0_, temp_1_imag_9_,
         temp_1_imag_8_, temp_1_imag_7_, temp_1_imag_6_, temp_1_imag_5_,
         temp_1_imag_4_, temp_1_imag_3_, temp_1_imag_2_, temp_1_imag_1_,
         temp_1_imag_16_, temp_1_imag_15_, temp_1_imag_14_, temp_1_imag_13_,
         temp_1_imag_12_, temp_1_imag_11_, temp_1_imag_10_, temp_1_imag_0_,
         N99, N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86,
         N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73, N72,
         N71, N70, N69, N340, N339, N338, N337, N336, N335, N334, N333, N332,
         N331, N330, N329, N328, N327, N326, N325, N324, N323, N322, N321,
         N320, N319, N318, N317, N316, N315, N314, N313, N312, N311, N310,
         N309, N308, N307, N306, N305, N304, N303, N302, N301, N300, N299,
         N298, N297, N296, N295, N294, N293, N292, N291, N290, N289, N288,
         N287, N286, N285, N284, N283, N282, N281, N280, N279, N278, N277,
         N276, N275, N274, N273, N272, N271, N270, N269, N268, N267, N266,
         N265, N264, N263, N262, N261, N260, N259, N258, N257, N256, N255,
         N254, N253, N252, N251, N250, N249, N248, N247, N246, N245, N244,
         N243, N242, N241, N240, N239, N238, N237, N236, N235, N234, N233,
         N232, N231, N230, N229, N228, N227, N226, N225, N224, N223, N222,
         N221, N220, N219, N218, N217, N216, N215, N214, N213, N212, N211,
         N210, N209, N208, N207, N206, N205, N204, N203, N202, N201, N200,
         N199, N198, N197, N196, N195, N194, N193, N192, N191, N190, N189,
         N188, N187, N186, N185, N184, N183, N182, N181, N180, N179, N178,
         N177, N176, N175, N174, N173, N172, N171, N170, N169, N168, N167,
         N166, N165, N164, N163, N162, N161, N160, N159, N158, N157, N156,
         N155, N154, N153, N152, N151, N150, N149, N148, N147, N146, N145,
         N144, N143, N142, N141, N140, N139, N138, N137, N136, N135, N134,
         N133, N132, N131, N130, N129, N128, N127, N126, N125, N124, N123,
         N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112,
         N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, N101,
         N100, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [16:0] temp_2_1_real;
  wire   [16:0] temp_2_2_real;
  wire   [16:0] temp_2_1_imag;
  wire   [16:0] temp_2_2_imag;
  wire   [16:0] temp_3_1_real;
  wire   [16:0] temp_3_2_real;
  wire   [16:0] temp_3_1_imag;
  wire   [16:0] temp_3_2_imag;
  wire   [16:0] temp_4_1_real;
  wire   [16:0] temp_4_2_real;
  wire   [16:0] temp_4_1_imag;
  wire   [16:0] temp_4_2_imag;

  multi16_11 multiBRR ( .in_17bit(calc_in[67:51]), .in_8bit({1'b0, n6, n3, 
        1'b1, n193, n194, n6, n45}), .out(temp_2_1_real) );
  multi16_10 multiBII ( .in_17bit(calc_in[50:34]), .in_8bit({n7, n70, n71, 
        1'b0, n4, n1, n7, n70}), .out(temp_2_2_real) );
  multi16_9 multiBRI ( .in_17bit(calc_in[67:51]), .in_8bit({n7, n70, n71, 1'b0, 
        n4, n1, n7, n70}), .out(temp_2_1_imag) );
  multi16_8 multiBIR ( .in_17bit(calc_in[50:34]), .in_8bit({1'b0, n6, n3, 1'b1, 
        n193, n194, n6, n45}), .out(temp_2_2_imag) );
  multi16_7 multiCRR ( .in_17bit(calc_in[101:85]), .in_8bit({n10, n194, n45, 
        n194, n194, n45, n3, N42}), .out(temp_3_1_real) );
  multi16_6 multiCII ( .in_17bit(calc_in[84:68]), .in_8bit({n7, 1'b0, n4, 1'b0, 
        1'b0, n4, n4, n71}), .out(temp_3_2_real) );
  multi16_5 multiCRI ( .in_17bit(calc_in[101:85]), .in_8bit({n7, 1'b0, n4, 
        1'b0, 1'b0, n4, n4, n71}), .out(temp_3_1_imag) );
  multi16_4 multiCIR ( .in_17bit(calc_in[84:68]), .in_8bit({n10, n194, n45, 
        n194, n194, n45, n3, N42}), .out(temp_3_2_imag) );
  multi16_3 multiDRR ( .in_17bit(calc_in[135:119]), .in_8bit({n2, N42, n6, 
        n194, n45, n193, n5, n194}), .out(temp_4_1_real) );
  multi16_2 multiDII ( .in_17bit(calc_in[118:102]), .in_8bit({n1, 1'b0, n2, 
        n10, n70, n71, n1, n10}), .out(temp_4_2_real) );
  multi16_1 multiDRI ( .in_17bit(calc_in[135:119]), .in_8bit({n1, 1'b0, n2, 
        n10, n70, n71, n1, n10}), .out(temp_4_1_imag) );
  multi16_0 multiDIR ( .in_17bit(calc_in[118:102]), .in_8bit({n2, N42, n6, 
        n194, n45, n193, n5, n194}), .out(temp_4_2_imag) );
  butterfly_DW01_sub_10 sub_278 ( .A(temp_3_1_real), .B(temp_3_2_real), .DIFF(
        {temp_2_real_16_, temp_2_real_15_, temp_2_real_14_, temp_2_real_13_, 
        temp_2_real_12_, temp_2_real_11_, temp_2_real_10_, temp_2_real_9_, 
        temp_2_real_8_, temp_2_real_7_, temp_2_real_6_, temp_2_real_5_, 
        temp_2_real_4_, temp_2_real_3_, temp_2_real_2_, temp_2_real_1_, 
        temp_2_real_0_}) );
  butterfly_DW01_add_16 add_282 ( .A(temp_4_1_imag), .B(temp_4_2_imag), .SUM({
        temp_3_imag_16_, temp_3_imag_15_, temp_3_imag_14_, temp_3_imag_13_, 
        temp_3_imag_12_, temp_3_imag_11_, temp_3_imag_10_, temp_3_imag_9_, 
        temp_3_imag_8_, temp_3_imag_7_, temp_3_imag_6_, temp_3_imag_5_, 
        temp_3_imag_4_, temp_3_imag_3_, temp_3_imag_2_, temp_3_imag_1_, 
        temp_3_imag_0_}) );
  butterfly_DW01_add_15 add_276 ( .A(temp_2_1_imag), .B(temp_2_2_imag), .SUM({
        temp_1_imag_16_, temp_1_imag_15_, temp_1_imag_14_, temp_1_imag_13_, 
        temp_1_imag_12_, temp_1_imag_11_, temp_1_imag_10_, temp_1_imag_9_, 
        temp_1_imag_8_, temp_1_imag_7_, temp_1_imag_6_, temp_1_imag_5_, 
        temp_1_imag_4_, temp_1_imag_3_, temp_1_imag_2_, temp_1_imag_1_, 
        temp_1_imag_0_}) );
  butterfly_DW01_sub_12 sub_281 ( .A(temp_4_1_real), .B(temp_4_2_real), .DIFF(
        {temp_3_real_16_, temp_3_real_15_, temp_3_real_14_, temp_3_real_13_, 
        temp_3_real_12_, temp_3_real_11_, temp_3_real_10_, temp_3_real_9_, 
        temp_3_real_8_, temp_3_real_7_, temp_3_real_6_, temp_3_real_5_, 
        temp_3_real_4_, temp_3_real_3_, temp_3_real_2_, temp_3_real_1_, 
        temp_3_real_0_}) );
  butterfly_DW01_sub_21 sub_1_root_sub_0_root_add_301 ( .A({temp_3_real_16_, 
        temp_3_real_15_, temp_3_real_14_, temp_3_real_13_, temp_3_real_12_, 
        temp_3_real_11_, temp_3_real_10_, temp_3_real_9_, temp_3_real_8_, 
        temp_3_real_7_, temp_3_real_6_, temp_3_real_5_, temp_3_real_4_, 
        temp_3_real_3_, temp_3_real_2_, temp_3_real_1_, temp_3_real_0_}), .B({
        temp_2_imag_16_, temp_2_imag_15_, temp_2_imag_14_, temp_2_imag_13_, 
        temp_2_imag_12_, temp_2_imag_11_, temp_2_imag_10_, temp_2_imag_9_, 
        temp_2_imag_8_, temp_2_imag_7_, temp_2_imag_6_, temp_2_imag_5_, 
        temp_2_imag_4_, temp_2_imag_3_, temp_2_imag_2_, temp_2_imag_1_, 
        temp_2_imag_0_}), .DIFF({N323, N322, N321, N320, N319, N318, N317, 
        N316, N315, N314, N313, N312, N311, N310, N309, N308, N307}) );
  butterfly_DW01_sub_13 sub_0_root_sub_0_root_sub_300_2 ( .A({N306, N305, N304, 
        N303, N302, N301, N300, N299, N298, N297, N296, N295, N294, N293, N292, 
        N291, N290}), .B({N289, N288, N287, N286, N285, N284, N283, N282, N281, 
        N280, N279, N278, N277, N276, N275, N274, N273}), .DIFF(
        calc_out[67:51]) );
  butterfly_DW01_add_25 add_0_root_sub_0_root_sub_299_2 ( .A({N272, N271, N270, 
        N269, N268, N267, N266, N265, N264, N263, N262, N261, N260, N259, N258, 
        N257, N256}), .B({N255, N254, N253, N252, N251, N250, N249, N248, N247, 
        N246, N245, N244, N243, N242, N241, N240, N239}), .SUM(
        calc_out[118:102]) );
  butterfly_DW01_add_36 add_2_root_add_0_root_add_293_3 ( .A(calc_in[16:0]), 
        .B({temp_2_imag_16_, temp_2_imag_15_, temp_2_imag_14_, temp_2_imag_13_, 
        temp_2_imag_12_, temp_2_imag_11_, temp_2_imag_10_, temp_2_imag_9_, 
        temp_2_imag_8_, temp_2_imag_7_, temp_2_imag_6_, temp_2_imag_5_, 
        temp_2_imag_4_, temp_2_imag_3_, temp_2_imag_2_, temp_2_imag_1_, 
        temp_2_imag_0_}), .SUM({N136, N135, N134, N133, N132, N131, N130, N129, 
        N128, N127, N126, N125, N124, N123, N122, N121, N120}) );
  butterfly_DW01_add_34 add_1_root_add_0_root_add_292_3 ( .A({temp_1_real_16_, 
        temp_1_real_15_, temp_1_real_14_, temp_1_real_13_, temp_1_real_12_, 
        temp_1_real_11_, temp_1_real_10_, temp_1_real_9_, temp_1_real_8_, 
        temp_1_real_7_, temp_1_real_6_, temp_1_real_5_, temp_1_real_4_, 
        temp_1_real_3_, temp_1_real_2_, temp_1_real_1_, temp_1_real_0_}), .B({
        temp_3_real_16_, temp_3_real_15_, temp_3_real_14_, temp_3_real_13_, 
        temp_3_real_12_, temp_3_real_11_, temp_3_real_10_, temp_3_real_9_, 
        temp_3_real_8_, temp_3_real_7_, temp_3_real_6_, temp_3_real_5_, 
        temp_3_real_4_, temp_3_real_3_, temp_3_real_2_, temp_3_real_1_, 
        temp_3_real_0_}), .SUM({N85, N84, N83, N82, N81, N80, N79, N78, N77, 
        N76, N75, N74, N73, N72, N71, N70, N69}) );
  butterfly_DW01_add_37 add_2_root_add_0_root_add_292_3 ( .A(calc_in[33:17]), 
        .B({temp_2_real_16_, temp_2_real_15_, temp_2_real_14_, temp_2_real_13_, 
        temp_2_real_12_, temp_2_real_11_, temp_2_real_10_, temp_2_real_9_, 
        temp_2_real_8_, temp_2_real_7_, temp_2_real_6_, temp_2_real_5_, 
        temp_2_real_4_, temp_2_real_3_, temp_2_real_2_, temp_2_real_1_, 
        temp_2_real_0_}), .SUM({N102, N101, N100, N99, N98, N97, N96, N95, N94, 
        N93, N92, N91, N90, N89, N88, N87, N86}) );
  butterfly_DW01_sub_24 sub_2_root_sub_0_root_sub_296_2 ( .A(calc_in[16:0]), 
        .B({temp_1_imag_16_, temp_1_imag_15_, temp_1_imag_14_, temp_1_imag_13_, 
        temp_1_imag_12_, temp_1_imag_11_, temp_1_imag_10_, temp_1_imag_9_, 
        temp_1_imag_8_, temp_1_imag_7_, temp_1_imag_6_, temp_1_imag_5_, 
        temp_1_imag_4_, temp_1_imag_3_, temp_1_imag_2_, temp_1_imag_1_, 
        temp_1_imag_0_}), .DIFF({N204, N203, N202, N201, N200, N199, N198, 
        N197, N196, N195, N194, N193, N192, N191, N190, N189, N188}) );
  butterfly_DW01_add_45 add_279 ( .A(temp_3_1_imag), .B(temp_3_2_imag), .SUM({
        temp_2_imag_16_, temp_2_imag_15_, temp_2_imag_14_, temp_2_imag_13_, 
        temp_2_imag_12_, temp_2_imag_11_, temp_2_imag_10_, temp_2_imag_9_, 
        temp_2_imag_8_, temp_2_imag_7_, temp_2_imag_6_, temp_2_imag_5_, 
        temp_2_imag_4_, temp_2_imag_3_, temp_2_imag_2_, temp_2_imag_1_, 
        temp_2_imag_0_}) );
  butterfly_DW01_add_42 add_1_root_add_0_root_add_293_3 ( .A({temp_1_imag_16_, 
        temp_1_imag_15_, temp_1_imag_14_, temp_1_imag_13_, temp_1_imag_12_, 
        temp_1_imag_11_, temp_1_imag_10_, temp_1_imag_9_, temp_1_imag_8_, 
        temp_1_imag_7_, temp_1_imag_6_, temp_1_imag_5_, temp_1_imag_4_, 
        temp_1_imag_3_, temp_1_imag_2_, temp_1_imag_1_, temp_1_imag_0_}), .B({
        temp_3_imag_16_, temp_3_imag_15_, temp_3_imag_14_, temp_3_imag_13_, 
        temp_3_imag_12_, temp_3_imag_11_, temp_3_imag_10_, temp_3_imag_9_, 
        temp_3_imag_8_, temp_3_imag_7_, temp_3_imag_6_, temp_3_imag_5_, 
        temp_3_imag_4_, temp_3_imag_3_, temp_3_imag_2_, temp_3_imag_1_, 
        temp_3_imag_0_}), .SUM({N119, N118, N117, N116, N115, N114, N113, N112, 
        N111, N110, N109, N108, N107, N106, N105, N104, N103}) );
  butterfly_DW01_sub_44 sub_1_root_sub_0_root_sub_296_2 ( .A({temp_2_imag_16_, 
        temp_2_imag_15_, temp_2_imag_14_, temp_2_imag_13_, temp_2_imag_12_, 
        temp_2_imag_11_, temp_2_imag_10_, temp_2_imag_9_, temp_2_imag_8_, 
        temp_2_imag_7_, temp_2_imag_6_, temp_2_imag_5_, temp_2_imag_4_, 
        temp_2_imag_3_, temp_2_imag_2_, temp_2_imag_1_, temp_2_imag_0_}), .B({
        temp_3_imag_16_, temp_3_imag_15_, temp_3_imag_14_, temp_3_imag_13_, 
        temp_3_imag_12_, temp_3_imag_11_, temp_3_imag_10_, temp_3_imag_9_, 
        temp_3_imag_8_, temp_3_imag_7_, temp_3_imag_6_, temp_3_imag_5_, 
        temp_3_imag_4_, temp_3_imag_3_, temp_3_imag_2_, temp_3_imag_1_, 
        temp_3_imag_0_}), .DIFF({N187, N186, N185, N184, N183, N182, N181, 
        N180, N179, N178, N177, N176, N175, N174, N173, N172, N171}) );
  butterfly_DW01_sub_43 sub_1_root_sub_0_root_sub_299_2 ( .A({temp_1_real_16_, 
        temp_1_real_15_, temp_1_real_14_, temp_1_real_13_, temp_1_real_12_, 
        temp_1_real_11_, temp_1_real_10_, temp_1_real_9_, temp_1_real_8_, 
        temp_1_real_7_, temp_1_real_6_, temp_1_real_5_, temp_1_real_4_, 
        temp_1_real_3_, temp_1_real_2_, temp_1_real_1_, temp_1_real_0_}), .B({
        temp_3_real_16_, temp_3_real_15_, temp_3_real_14_, temp_3_real_13_, 
        temp_3_real_12_, temp_3_real_11_, temp_3_real_10_, temp_3_real_9_, 
        temp_3_real_8_, temp_3_real_7_, temp_3_real_6_, temp_3_real_5_, 
        temp_3_real_4_, temp_3_real_3_, temp_3_real_2_, temp_3_real_1_, 
        temp_3_real_0_}), .DIFF({N255, N254, N253, N252, N251, N250, N249, 
        N248, N247, N246, N245, N244, N243, N242, N241, N240, N239}) );
  butterfly_DW01_add_54 add_0_root_sub_0_root_add_301 ( .A({N340, N339, N338, 
        N337, N336, N335, N334, N333, N332, N331, N330, N329, N328, N327, N326, 
        N325, N324}), .B({N323, N322, N321, N320, N319, N318, N317, N316, N315, 
        N314, N313, N312, N311, N310, N309, N308, N307}), .SUM(calc_out[50:34]) );
  butterfly_DW01_add_58 add_2_root_sub_0_root_sub_300_2 ( .A(calc_in[33:17]), 
        .B({temp_1_imag_16_, temp_1_imag_15_, temp_1_imag_14_, temp_1_imag_13_, 
        temp_1_imag_12_, temp_1_imag_11_, temp_1_imag_10_, temp_1_imag_9_, 
        temp_1_imag_8_, temp_1_imag_7_, temp_1_imag_6_, temp_1_imag_5_, 
        temp_1_imag_4_, temp_1_imag_3_, temp_1_imag_2_, temp_1_imag_1_, 
        temp_1_imag_0_}), .SUM({N306, N305, N304, N303, N302, N301, N300, N299, 
        N298, N297, N296, N295, N294, N293, N292, N291, N290}) );
  butterfly_DW01_add_62 add_1_root_sub_0_root_sub_295_2 ( .A({temp_1_real_16_, 
        temp_1_real_15_, temp_1_real_14_, temp_1_real_13_, temp_1_real_12_, 
        temp_1_real_11_, temp_1_real_10_, temp_1_real_9_, temp_1_real_8_, 
        temp_1_real_7_, temp_1_real_6_, temp_1_real_5_, temp_1_real_4_, 
        temp_1_real_3_, temp_1_real_2_, temp_1_real_1_, temp_1_real_0_}), .B({
        temp_3_real_16_, temp_3_real_15_, temp_3_real_14_, temp_3_real_13_, 
        temp_3_real_12_, temp_3_real_11_, temp_3_real_10_, temp_3_real_9_, 
        temp_3_real_8_, temp_3_real_7_, temp_3_real_6_, temp_3_real_5_, 
        temp_3_real_4_, temp_3_real_3_, temp_3_real_2_, temp_3_real_1_, 
        temp_3_real_0_}), .SUM({N153, N152, N151, N150, N149, N148, N147, N146, 
        N145, N144, N143, N142, N141, N140, N139, N138, N137}) );
  butterfly_DW01_sub_45 sub_1_root_sub_0_root_add_298 ( .A({temp_3_imag_16_, 
        temp_3_imag_15_, temp_3_imag_14_, temp_3_imag_13_, temp_3_imag_12_, 
        temp_3_imag_11_, temp_3_imag_10_, temp_3_imag_9_, temp_3_imag_8_, 
        temp_3_imag_7_, temp_3_imag_6_, temp_3_imag_5_, temp_3_imag_4_, 
        temp_3_imag_3_, temp_3_imag_2_, temp_3_imag_1_, temp_3_imag_0_}), .B({
        temp_2_real_16_, temp_2_real_15_, temp_2_real_14_, temp_2_real_13_, 
        temp_2_real_12_, temp_2_real_11_, temp_2_real_10_, temp_2_real_9_, 
        temp_2_real_8_, temp_2_real_7_, temp_2_real_6_, temp_2_real_5_, 
        temp_2_real_4_, temp_2_real_3_, temp_2_real_2_, temp_2_real_1_, 
        temp_2_real_0_}), .DIFF({N221, N220, N219, N218, N217, N216, N215, 
        N214, N213, N212, N211, N210, N209, N208, N207, N206, N205}) );
  butterfly_DW01_add_68 add_0_root_sub_0_root_sub_296_2 ( .A({N204, N203, N202, 
        N201, N200, N199, N198, N197, N196, N195, N194, N193, N192, N191, N190, 
        N189, N188}), .B({N187, N186, N185, N184, N183, N182, N181, N180, N179, 
        N178, N177, N176, N175, N174, N173, N172, N171}), .SUM(calc_out[84:68]) );
  butterfly_DW01_sub_61 sub_275 ( .A(temp_2_1_real), .B(temp_2_2_real), .DIFF(
        {temp_1_real_16_, temp_1_real_15_, temp_1_real_14_, temp_1_real_13_, 
        temp_1_real_12_, temp_1_real_11_, temp_1_real_10_, temp_1_real_9_, 
        temp_1_real_8_, temp_1_real_7_, temp_1_real_6_, temp_1_real_5_, 
        temp_1_real_4_, temp_1_real_3_, temp_1_real_2_, temp_1_real_1_, 
        temp_1_real_0_}) );
  butterfly_DW01_sub_60 sub_2_root_sub_0_root_sub_299_2 ( .A(calc_in[16:0]), 
        .B({temp_2_imag_16_, temp_2_imag_15_, temp_2_imag_14_, temp_2_imag_13_, 
        temp_2_imag_12_, temp_2_imag_11_, temp_2_imag_10_, temp_2_imag_9_, 
        temp_2_imag_8_, temp_2_imag_7_, temp_2_imag_6_, temp_2_imag_5_, 
        temp_2_imag_4_, temp_2_imag_3_, temp_2_imag_2_, temp_2_imag_1_, 
        temp_2_imag_0_}), .DIFF({N272, N271, N270, N269, N268, N267, N266, 
        N265, N264, N263, N262, N261, N260, N259, N258, N257, N256}) );
  butterfly_DW01_add_69 add_0_root_add_0_root_add_293_3 ( .A({N136, N135, N134, 
        N133, N132, N131, N130, N129, N128, N127, N126, N125, N124, N123, N122, 
        N121, N120}), .B({N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110, N109, N108, N107, N106, N105, N104, N103}), .SUM(calc_out[16:0])
         );
  butterfly_DW01_sub_67 sub_2_root_sub_0_root_add_301 ( .A(calc_in[16:0]), .B(
        {temp_1_real_16_, temp_1_real_15_, temp_1_real_14_, temp_1_real_13_, 
        temp_1_real_12_, temp_1_real_11_, temp_1_real_10_, temp_1_real_9_, 
        temp_1_real_8_, temp_1_real_7_, temp_1_real_6_, temp_1_real_5_, 
        temp_1_real_4_, temp_1_real_3_, temp_1_real_2_, temp_1_real_1_, 
        temp_1_real_0_}), .DIFF({N340, N339, N338, N337, N336, N335, N334, 
        N333, N332, N331, N330, N329, N328, N327, N326, N325, N324}) );
  butterfly_DW01_add_93 add_1_root_sub_0_root_sub_300_2 ( .A({temp_3_imag_16_, 
        temp_3_imag_15_, temp_3_imag_14_, temp_3_imag_13_, temp_3_imag_12_, 
        temp_3_imag_11_, temp_3_imag_10_, temp_3_imag_9_, temp_3_imag_8_, 
        temp_3_imag_7_, temp_3_imag_6_, temp_3_imag_5_, temp_3_imag_4_, 
        temp_3_imag_3_, temp_3_imag_2_, temp_3_imag_1_, temp_3_imag_0_}), .B({
        temp_2_real_16_, temp_2_real_15_, temp_2_real_14_, temp_2_real_13_, 
        temp_2_real_12_, temp_2_real_11_, temp_2_real_10_, temp_2_real_9_, 
        temp_2_real_8_, temp_2_real_7_, temp_2_real_6_, temp_2_real_5_, 
        temp_2_real_4_, temp_2_real_3_, temp_2_real_2_, temp_2_real_1_, 
        temp_2_real_0_}), .SUM({N289, N288, N287, N286, N285, N284, N283, N282, 
        N281, N280, N279, N278, N277, N276, N275, N274, N273}) );
  butterfly_DW01_add_87 add_0_root_sub_0_root_add_298 ( .A({N238, N237, N236, 
        N235, N234, N233, N232, N231, N230, N229, N228, N227, N226, N225, N224, 
        N223, N222}), .B({N221, N220, N219, N218, N217, N216, N215, N214, N213, 
        N212, N211, N210, N209, N208, N207, N206, N205}), .SUM(
        calc_out[135:119]) );
  butterfly_DW01_add_86 add_0_root_add_0_root_add_292_3 ( .A({N102, N101, N100, 
        N99, N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86}), 
        .B({N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74, N73, 
        N72, N71, N70, N69}), .SUM(calc_out[33:17]) );
  butterfly_DW01_sub_64 sub_0_root_sub_0_root_sub_295_2 ( .A({N170, N169, N168, 
        N167, N166, N165, N164, N163, N162, N161, N160, N159, N158, N157, N156, 
        N155, N154}), .B({N153, N152, N151, N150, N149, N148, N147, N146, N145, 
        N144, N143, N142, N141, N140, N139, N138, N137}), .DIFF(
        calc_out[101:85]) );
  butterfly_DW01_sub_77 sub_2_root_sub_0_root_add_298 ( .A(calc_in[33:17]), 
        .B({temp_1_imag_16_, temp_1_imag_15_, temp_1_imag_14_, temp_1_imag_13_, 
        temp_1_imag_12_, temp_1_imag_11_, temp_1_imag_10_, temp_1_imag_9_, 
        temp_1_imag_8_, temp_1_imag_7_, temp_1_imag_6_, temp_1_imag_5_, 
        temp_1_imag_4_, temp_1_imag_3_, temp_1_imag_2_, temp_1_imag_1_, 
        temp_1_imag_0_}), .DIFF({N238, N237, N236, N235, N234, N233, N232, 
        N231, N230, N229, N228, N227, N226, N225, N224, N223, N222}) );
  butterfly_DW01_add_99 add_2_root_sub_0_root_sub_295_2 ( .A(calc_in[33:17]), 
        .B({temp_2_real_16_, temp_2_real_15_, temp_2_real_14_, temp_2_real_13_, 
        temp_2_real_12_, temp_2_real_11_, temp_2_real_10_, temp_2_real_9_, 
        temp_2_real_8_, temp_2_real_7_, temp_2_real_6_, temp_2_real_5_, 
        temp_2_real_4_, temp_2_real_3_, temp_2_real_2_, temp_2_real_1_, 
        temp_2_real_0_}), .SUM({N170, N169, N168, N167, N166, N165, N164, N163, 
        N162, N161, N160, N159, N158, N157, N156, N155, N154}) );
  INVX1 U3 ( .A(n10), .Y(n6) );
  NOR2X1 U4 ( .A(n8), .B(n193), .Y(n10) );
  INVX1 U5 ( .A(n193), .Y(n4) );
  INVX1 U6 ( .A(N42), .Y(n7) );
  INVX1 U7 ( .A(n45), .Y(n1) );
  INVX1 U8 ( .A(n71), .Y(n3) );
  INVX1 U9 ( .A(n194), .Y(n2) );
  INVX1 U10 ( .A(n70), .Y(n5) );
  NOR2X1 U11 ( .A(n193), .B(rotation[1]), .Y(n70) );
  NOR2X1 U12 ( .A(n194), .B(rotation[0]), .Y(n71) );
  NAND2X1 U13 ( .A(rotation[0]), .B(rotation[2]), .Y(n193) );
  OAI21XL U14 ( .A0(rotation[1]), .A1(rotation[0]), .B0(rotation[2]), .Y(N42)
         );
  NAND2X1 U15 ( .A(rotation[2]), .B(n9), .Y(n45) );
  XNOR2X1 U16 ( .A(n8), .B(rotation[0]), .Y(n9) );
  INVX1 U17 ( .A(rotation[1]), .Y(n8) );
  NAND2X1 U18 ( .A(rotation[1]), .B(rotation[2]), .Y(n194) );
endmodule


module reg1 ( clk, rst_n, data_in_2, reg_datain_flag, data_out_2 );
  input [135:0] data_in_2;
  output [135:0] data_out_2;
  input clk, rst_n, reg_datain_flag;
  wire   \counter1[1] , reg_flag_mux, N52, N53, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73,
         N74, N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, N87,
         N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N129, N130, N131, N132, N133,
         N134, N135, N136, N137, N138, N139, N140, N141, N142, N143, N144,
         N145, N146, N147, N148, N149, N150, N151, N152, N153, N154, N155,
         N156, N157, N158, N159, N160, N161, N162, N163, N164, N165, N166,
         N167, N168, N169, N170, N171, N172, N173, N174, N175, N176, N177,
         N178, N179, N180, N181, N182, N183, N184, N185, N186, N187, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n739, n740, n741, n742, n743, n744, n745,
         n746, n747, n748, n749, n750, n751, n752, n753, n754, n755, n756,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n773, n774, n775, n776, n777, n778, n779, n780,
         n781, n782, n783, n784, n785, n786, n787, n788, n789, n790, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n822, n823, n824, n825, n826,
         n827, n828, n829, n830, n831, n832, n833, n834, n835, n836, n837,
         n838, n839, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n909, n910, n911, n912, n913, n914, n915, n916, n917,
         n918, n919, n920, n921, n922, n923, n924, n925, n926, n927, n928,
         n929, n930, n931, n932, n933, n934, n935, n936, n937, n938, n939,
         n940, n941, n943, n944, n945, n946, n947, n948, n949, n950, n951,
         n952, n953, n954, n955, n956, n957, n1113, n1114, n1115, n1116, n62,
         n132, n1012, n1253, n1381, n1395, n1397, n1398, n1399, n1400, n1401,
         n1402, n1403, n1404, n1410, n1413, n1417, n1418, n1553, n1912, n1914,
         n1916, n1918, n1940, n2094, n2105, n2201, n2516, n2762, n2763, n2764,
         n2765, n2766, n2767, n2768, n2769, n2770, n2771, n2772, n2773, n2774,
         n2775, n2776, n2777, n2778, n2779, n2780, n2781, n2782, n2783, n2784,
         n2785, n2786, n2829, n646, n648, n649, n650, n655, n656, n666, n679,
         n737, n840, n874, n908, n942, n962, n963, n974, n979, n983, n990,
         n994, n1000, n1001, n1002, n1003, n1004, n1006, n1007, n1009, n1010,
         n1011, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020, n1021,
         n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031,
         n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040, n1041,
         n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050, n1051,
         n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061,
         n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071,
         n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081,
         n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091,
         n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101,
         n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111,
         n1112, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125,
         n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135,
         n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145,
         n1146, n1147, n1148, n1149, n1150, n1151, n2830, n2831, n3507, n3508,
         n3509, n3510, n3511, n3512, n3513, n3514, n3515, n3516, n3517, n3518,
         n3519, n3520, n3521, n3522, n3523, n3524, n3525, n3526, n3527, n3528,
         n3529, n3530, n3531, n3532, n3533, n3534, n3535, n3536, n3537, n3538,
         n3539, n3540, n3541, n3542, n3543, n3544, n3545, n3546, n3547, n3548,
         n3549, n3550, n3551, n3552, n3553, n3554, n3555, n3556;
  wire   [31:0] R0;
  wire   [30:0] R1;
  wire   [31:0] R4;
  wire   [30:0] R5;
  wire   [31:0] R8;
  wire   [30:0] R9;
  wire   [31:0] R12;
  wire   [30:0] R13;
  wire   [1:0] counter2;

  CLKINVX4 U437 ( .A(rst_n), .Y(n1012) );
  EDFFX1 data_out_2_reg_135_ ( .D(N187), .E(n3555), .CK(clk), .Q(
        data_out_2[135]) );
  EDFFX1 data_out_2_reg_118_ ( .D(N170), .E(n3555), .CK(clk), .Q(
        data_out_2[118]) );
  EDFFX1 data_out_2_reg_101_ ( .D(N153), .E(n3553), .CK(clk), .Q(
        data_out_2[101]) );
  EDFFX1 data_out_2_reg_84_ ( .D(N136), .E(n3555), .CK(clk), .Q(data_out_2[84]) );
  EDFFX1 data_out_2_reg_50_ ( .D(N102), .E(n3554), .CK(clk), .Q(data_out_2[50]) );
  EDFFX1 data_out_2_reg_130_ ( .D(N182), .E(n3554), .CK(clk), .Q(
        data_out_2[130]) );
  EDFFX1 data_out_2_reg_129_ ( .D(N181), .E(n3553), .CK(clk), .Q(
        data_out_2[129]) );
  EDFFX1 data_out_2_reg_128_ ( .D(N180), .E(n3555), .CK(clk), .Q(
        data_out_2[128]) );
  EDFFX1 data_out_2_reg_127_ ( .D(N179), .E(n3554), .CK(clk), .Q(
        data_out_2[127]) );
  EDFFX1 data_out_2_reg_126_ ( .D(N178), .E(n3553), .CK(clk), .Q(
        data_out_2[126]) );
  EDFFX1 data_out_2_reg_110_ ( .D(N162), .E(n3554), .CK(clk), .Q(
        data_out_2[110]) );
  EDFFX1 data_out_2_reg_109_ ( .D(N161), .E(n3553), .CK(clk), .Q(
        data_out_2[109]) );
  EDFFX1 data_out_2_reg_102_ ( .D(N154), .E(n3555), .CK(clk), .Q(
        data_out_2[102]) );
  EDFFX1 data_out_2_reg_119_ ( .D(N171), .E(n3554), .CK(clk), .Q(
        data_out_2[119]) );
  EDFFX1 data_out_2_reg_85_ ( .D(N137), .E(n3555), .CK(clk), .Q(data_out_2[85]) );
  EDFFX1 data_out_2_reg_68_ ( .D(N120), .E(n3554), .CK(clk), .Q(data_out_2[68]) );
  EDFFX1 data_out_2_reg_67_ ( .D(N119), .E(n3555), .CK(clk), .Q(data_out_2[67]) );
  EDFFX1 data_out_2_reg_34_ ( .D(N86), .E(n3554), .CK(clk), .Q(data_out_2[34])
         );
  EDFFX1 data_out_2_reg_51_ ( .D(N103), .E(n3555), .CK(clk), .Q(data_out_2[51]) );
  EDFFX1 data_out_2_reg_81_ ( .D(N133), .E(n3554), .CK(clk), .Q(data_out_2[81]) );
  EDFFX1 data_out_2_reg_80_ ( .D(N132), .E(n3555), .CK(clk), .Q(data_out_2[80]) );
  EDFFX1 data_out_2_reg_46_ ( .D(N98), .E(n3555), .CK(clk), .Q(data_out_2[46])
         );
  EDFFX1 data_out_2_reg_63_ ( .D(N115), .E(n3554), .CK(clk), .Q(data_out_2[63]) );
  EDFFX1 data_out_2_reg_98_ ( .D(N150), .E(n3555), .CK(clk), .Q(data_out_2[98]) );
  EDFFX1 data_out_2_reg_79_ ( .D(N131), .E(n3554), .CK(clk), .Q(data_out_2[79]) );
  EDFFX1 data_out_2_reg_45_ ( .D(N97), .E(n3555), .CK(clk), .Q(data_out_2[45])
         );
  EDFFX1 data_out_2_reg_62_ ( .D(N114), .E(n3555), .CK(clk), .Q(data_out_2[62]) );
  EDFFX1 data_out_2_reg_73_ ( .D(N125), .E(n3554), .CK(clk), .Q(data_out_2[73]) );
  EDFFX1 data_out_2_reg_39_ ( .D(N91), .E(n3555), .CK(clk), .Q(data_out_2[39])
         );
  EDFFX1 data_out_2_reg_56_ ( .D(N108), .E(n3555), .CK(clk), .Q(data_out_2[56]) );
  EDFFX1 data_out_2_reg_91_ ( .D(N143), .E(n3554), .CK(clk), .Q(data_out_2[91]) );
  EDFFX1 data_out_2_reg_74_ ( .D(N126), .E(n3555), .CK(clk), .Q(data_out_2[74]) );
  EDFFX1 data_out_2_reg_57_ ( .D(N109), .E(n3554), .CK(clk), .Q(data_out_2[57]) );
  EDFFX1 data_out_2_reg_121_ ( .D(N173), .E(n3555), .CK(clk), .Q(
        data_out_2[121]) );
  EDFFX1 data_out_2_reg_104_ ( .D(N156), .E(n3555), .CK(clk), .Q(
        data_out_2[104]) );
  EDFFX1 data_out_2_reg_105_ ( .D(N157), .E(n3555), .CK(clk), .Q(
        data_out_2[105]) );
  EDFFX1 data_out_2_reg_71_ ( .D(N123), .E(n3555), .CK(clk), .Q(data_out_2[71]) );
  EDFFX1 data_out_2_reg_54_ ( .D(N106), .E(n3555), .CK(clk), .Q(data_out_2[54]) );
  EDFFX1 data_out_2_reg_37_ ( .D(N89), .E(n3555), .CK(clk), .Q(data_out_2[37])
         );
  EDFFX1 data_out_2_reg_89_ ( .D(N141), .E(n3555), .CK(clk), .Q(data_out_2[89]) );
  EDFFX1 data_out_2_reg_72_ ( .D(N124), .E(n3555), .CK(clk), .Q(data_out_2[72]) );
  EDFFX1 data_out_2_reg_55_ ( .D(N107), .E(n3555), .CK(clk), .Q(data_out_2[55]) );
  EDFFX1 data_out_2_reg_38_ ( .D(N90), .E(n3555), .CK(clk), .Q(data_out_2[38])
         );
  EDFFX1 data_out_2_reg_90_ ( .D(N142), .E(n3555), .CK(clk), .Q(data_out_2[90]) );
  EDFFX1 data_out_2_reg_103_ ( .D(N155), .E(n3555), .CK(clk), .Q(
        data_out_2[103]) );
  EDFFX1 data_out_2_reg_123_ ( .D(N175), .E(n3555), .CK(clk), .Q(
        data_out_2[123]) );
  EDFFX1 data_out_2_reg_70_ ( .D(N122), .E(n3555), .CK(clk), .Q(data_out_2[70]) );
  EDFFX1 data_out_2_reg_36_ ( .D(N88), .E(n3555), .CK(clk), .Q(data_out_2[36])
         );
  EDFFX1 data_out_2_reg_120_ ( .D(N172), .E(n3555), .CK(clk), .Q(
        data_out_2[120]) );
  EDFFX1 data_out_2_reg_87_ ( .D(N139), .E(n3555), .CK(clk), .Q(data_out_2[87]) );
  EDFFX1 data_out_2_reg_131_ ( .D(N183), .E(n3555), .CK(clk), .Q(
        data_out_2[131]) );
  EDFFX1 data_out_2_reg_114_ ( .D(N166), .E(n3555), .CK(clk), .Q(
        data_out_2[114]) );
  EDFFX1 data_out_2_reg_97_ ( .D(N149), .E(n3555), .CK(clk), .Q(data_out_2[97]) );
  EDFFX1 data_out_2_reg_44_ ( .D(N96), .E(n3555), .CK(clk), .Q(data_out_2[44])
         );
  EDFFX1 data_out_2_reg_78_ ( .D(N130), .E(n3555), .CK(clk), .Q(data_out_2[78]) );
  EDFFX1 data_out_2_reg_96_ ( .D(N148), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[96]) );
  EDFFX1 data_out_2_reg_61_ ( .D(N113), .E(n3555), .CK(clk), .Q(data_out_2[61]) );
  EDFFX1 data_out_2_reg_60_ ( .D(N112), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[60]) );
  EDFFX1 data_out_2_reg_43_ ( .D(N95), .E(n3555), .CK(clk), .Q(data_out_2[43])
         );
  EDFFX1 data_out_2_reg_77_ ( .D(N129), .E(n3553), .CK(clk), .Q(data_out_2[77]) );
  EDFFX1 data_out_2_reg_76_ ( .D(N128), .E(n3555), .CK(clk), .Q(data_out_2[76]) );
  EDFFX1 data_out_2_reg_59_ ( .D(N111), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[59]) );
  EDFFX1 data_out_2_reg_42_ ( .D(N94), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[42]) );
  EDFFX1 data_out_2_reg_93_ ( .D(N145), .E(n3553), .CK(clk), .Q(data_out_2[93]) );
  EDFFX1 data_out_2_reg_92_ ( .D(N144), .E(n3555), .CK(clk), .Q(data_out_2[92]) );
  EDFFX1 data_out_2_reg_58_ ( .D(N110), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[58]) );
  EDFFX1 data_out_2_reg_75_ ( .D(N127), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[75]) );
  EDFFX1 data_out_2_reg_40_ ( .D(N92), .E(n3555), .CK(clk), .Q(data_out_2[40])
         );
  EDFFX1 data_out_2_reg_106_ ( .D(N158), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[106]) );
  EDFFX1 data_out_2_reg_35_ ( .D(N87), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[35]) );
  EDFFX1 data_out_2_reg_88_ ( .D(N140), .E(n3555), .CK(clk), .Q(data_out_2[88]) );
  EDFFX1 data_out_2_reg_122_ ( .D(N174), .E(n3555), .CK(clk), .Q(
        data_out_2[122]) );
  EDFFX1 data_out_2_reg_69_ ( .D(N121), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[69]) );
  EDFFX1 data_out_2_reg_86_ ( .D(N138), .E(n3555), .CK(clk), .Q(data_out_2[86]) );
  EDFFX1 data_out_2_reg_53_ ( .D(N105), .E(n3555), .CK(clk), .Q(data_out_2[53]) );
  EDFFX1 data_out_2_reg_52_ ( .D(N104), .E(n3555), .CK(clk), .Q(data_out_2[52]) );
  EDFFX1 data_out_2_reg_94_ ( .D(N146), .E(n3554), .CK(clk), .Q(data_out_2[94]) );
  EDFFX1 data_out_2_reg_95_ ( .D(N147), .E(n3555), .CK(clk), .Q(data_out_2[95]) );
  EDFFX1 data_out_2_reg_108_ ( .D(N160), .E(n3554), .CK(clk), .Q(
        data_out_2[108]) );
  EDFFX1 data_out_2_reg_125_ ( .D(N177), .E(n3554), .CK(clk), .Q(
        data_out_2[125]) );
  EDFFX1 data_out_2_reg_124_ ( .D(N176), .E(n3554), .CK(clk), .Q(
        data_out_2[124]) );
  EDFFX1 data_out_2_reg_107_ ( .D(N159), .E(n3554), .CK(clk), .Q(
        data_out_2[107]) );
  EDFFX1 data_out_2_reg_49_ ( .D(N101), .E(n3554), .CK(clk), .Q(data_out_2[49]) );
  EDFFX1 data_out_2_reg_117_ ( .D(N169), .E(n3554), .CK(clk), .Q(
        data_out_2[117]) );
  EDFFX1 data_out_2_reg_83_ ( .D(N135), .E(n3555), .CK(clk), .Q(data_out_2[83]) );
  EDFFX1 data_out_2_reg_132_ ( .D(N184), .E(n3554), .CK(clk), .Q(
        data_out_2[132]) );
  EDFFX1 data_out_2_reg_48_ ( .D(N100), .E(n3554), .CK(clk), .Q(data_out_2[48]) );
  EDFFX1 data_out_2_reg_134_ ( .D(N186), .E(n3554), .CK(clk), .Q(
        data_out_2[134]) );
  EDFFX1 data_out_2_reg_133_ ( .D(N185), .E(n3554), .CK(clk), .Q(
        data_out_2[133]) );
  EDFFX1 data_out_2_reg_116_ ( .D(N168), .E(n3554), .CK(clk), .Q(
        data_out_2[116]) );
  EDFFX1 data_out_2_reg_115_ ( .D(N167), .E(n3554), .CK(clk), .Q(
        data_out_2[115]) );
  EDFFX1 data_out_2_reg_100_ ( .D(N152), .E(n3554), .CK(clk), .Q(
        data_out_2[100]) );
  EDFFX1 data_out_2_reg_99_ ( .D(N151), .E(n3555), .CK(clk), .Q(data_out_2[99]) );
  EDFFX1 data_out_2_reg_82_ ( .D(N134), .E(n3554), .CK(clk), .Q(data_out_2[82]) );
  EDFFX1 data_out_2_reg_66_ ( .D(N118), .E(n3554), .CK(clk), .Q(data_out_2[66]) );
  EDFFX1 data_out_2_reg_65_ ( .D(N117), .E(reg_flag_mux), .CK(clk), .Q(
        data_out_2[65]) );
  EDFFX1 data_out_2_reg_47_ ( .D(N99), .E(n3554), .CK(clk), .Q(data_out_2[47])
         );
  EDFFX1 data_out_2_reg_64_ ( .D(N116), .E(n3554), .CK(clk), .Q(data_out_2[64]) );
  EDFFX1 data_out_2_reg_113_ ( .D(N165), .E(n3554), .CK(clk), .Q(
        data_out_2[113]) );
  EDFFX1 data_out_2_reg_112_ ( .D(N164), .E(n3554), .CK(clk), .Q(
        data_out_2[112]) );
  EDFFX1 data_out_2_reg_111_ ( .D(N163), .E(n3554), .CK(clk), .Q(
        data_out_2[111]) );
  EDFFX1 data_out_2_reg_41_ ( .D(N93), .E(n3554), .CK(clk), .Q(data_out_2[41])
         );
  EDFFX1 R11_reg_18_ ( .D(data_in_2[120]), .E(n3536), .CK(clk), .QN(n701) );
  EDFFX1 R15_reg_20_ ( .D(data_in_2[122]), .E(n3512), .CK(clk), .QN(n801) );
  EDFFX1 R15_reg_19_ ( .D(data_in_2[121]), .E(n3512), .CK(clk), .QN(n802) );
  EDFFX1 R15_reg_18_ ( .D(data_in_2[120]), .E(n3515), .CK(clk), .QN(n803) );
  EDFFX1 R15_reg_4_ ( .D(data_in_2[106]), .E(n3512), .CK(clk), .QN(n817) );
  EDFFX1 R15_reg_3_ ( .D(data_in_2[105]), .E(n3512), .CK(clk), .QN(n818) );
  EDFFX1 R15_reg_2_ ( .D(data_in_2[104]), .E(n3512), .CK(clk), .QN(n819) );
  EDFFX1 R3_reg_25_ ( .D(data_in_2[127]), .E(n3508), .CK(clk), .QN(n864) );
  EDFFX1 R3_reg_23_ ( .D(data_in_2[125]), .E(n3509), .CK(clk), .QN(n866) );
  EDFFX1 R3_reg_22_ ( .D(data_in_2[124]), .E(n3510), .CK(clk), .QN(n867) );
  EDFFX1 R3_reg_21_ ( .D(data_in_2[123]), .E(n3508), .CK(clk), .QN(n868) );
  EDFFX1 R3_reg_20_ ( .D(data_in_2[122]), .E(n3509), .CK(clk), .QN(n869) );
  EDFFX1 R3_reg_19_ ( .D(data_in_2[121]), .E(n3510), .CK(clk), .QN(n870) );
  EDFFX1 R3_reg_18_ ( .D(data_in_2[120]), .E(n3510), .CK(clk), .QN(n871) );
  EDFFX1 R3_reg_4_ ( .D(data_in_2[106]), .E(n3508), .CK(clk), .QN(n885) );
  EDFFX1 R3_reg_3_ ( .D(data_in_2[105]), .E(n3509), .CK(clk), .QN(n886) );
  EDFFX1 R3_reg_2_ ( .D(data_in_2[104]), .E(n3510), .CK(clk), .QN(n887) );
  EDFFX1 R7_reg_25_ ( .D(data_in_2[127]), .E(n840), .CK(clk), .QN(n932) );
  EDFFX1 R7_reg_23_ ( .D(data_in_2[125]), .E(n840), .CK(clk), .QN(n934) );
  EDFFX1 R7_reg_22_ ( .D(data_in_2[124]), .E(n840), .CK(clk), .QN(n935) );
  EDFFX1 R7_reg_21_ ( .D(data_in_2[123]), .E(n840), .CK(clk), .QN(n936) );
  EDFFX1 R7_reg_20_ ( .D(data_in_2[122]), .E(n3535), .CK(clk), .QN(n937) );
  EDFFX1 R7_reg_19_ ( .D(data_in_2[121]), .E(n3535), .CK(clk), .QN(n938) );
  EDFFX1 R7_reg_18_ ( .D(data_in_2[120]), .E(n3533), .CK(clk), .QN(n939) );
  EDFFX1 R7_reg_4_ ( .D(data_in_2[106]), .E(n3533), .CK(clk), .QN(n953) );
  EDFFX1 R7_reg_3_ ( .D(data_in_2[105]), .E(n3534), .CK(clk), .QN(n954) );
  EDFFX1 R7_reg_2_ ( .D(data_in_2[104]), .E(n3533), .CK(clk), .QN(n955) );
  EDFFX1 R7_reg_1_ ( .D(data_in_2[103]), .E(n3533), .CK(clk), .QN(n956) );
  EDFFX1 R15_reg_28_ ( .D(data_in_2[130]), .E(n3514), .CK(clk), .QN(n793) );
  EDFFX1 R3_reg_28_ ( .D(data_in_2[130]), .E(n3508), .CK(clk), .QN(n861) );
  EDFFX1 R7_reg_28_ ( .D(data_in_2[130]), .E(n3535), .CK(clk), .QN(n929) );
  EDFFX1 R15_reg_26_ ( .D(data_in_2[128]), .E(n3515), .CK(clk), .QN(n795) );
  EDFFX1 R7_reg_26_ ( .D(data_in_2[128]), .E(n3535), .CK(clk), .QN(n931) );
  EDFFX1 R11_reg_9_ ( .D(data_in_2[111]), .E(n3537), .CK(clk), .QN(n710) );
  EDFFX1 R15_reg_9_ ( .D(data_in_2[111]), .E(n3514), .CK(clk), .QN(n812) );
  EDFFX1 R11_reg_8_ ( .D(data_in_2[110]), .E(n3536), .CK(clk), .QN(n711) );
  EDFFX1 R15_reg_8_ ( .D(data_in_2[110]), .E(n3515), .CK(clk), .QN(n813) );
  EDFFX1 R15_reg_0_ ( .D(data_in_2[102]), .E(n3515), .CK(clk), .QN(n821) );
  EDFFX1 R11_reg_0_ ( .D(data_in_2[102]), .E(n3538), .CK(clk), .QN(n719) );
  EDFFX1 R7_reg_0_ ( .D(data_in_2[102]), .E(n3535), .CK(clk), .QN(n957) );
  EDFFX1 R3_reg_0_ ( .D(data_in_2[102]), .E(n3508), .CK(clk), .QN(n889) );
  EDFFX1 R15_reg_17_ ( .D(data_in_2[119]), .E(n3514), .CK(clk), .QN(n804) );
  EDFFX1 R11_reg_17_ ( .D(data_in_2[119]), .E(n3537), .CK(clk), .QN(n702) );
  EDFFX1 R7_reg_17_ ( .D(data_in_2[119]), .E(n3534), .CK(clk), .QN(n940) );
  EDFFX1 R3_reg_17_ ( .D(data_in_2[119]), .E(n3510), .CK(clk), .QN(n872) );
  EDFFX1 R15_reg_1_ ( .D(data_in_2[103]), .E(n3515), .CK(clk), .QN(n820) );
  EDFFX1 R11_reg_1_ ( .D(data_in_2[103]), .E(n3537), .CK(clk), .QN(n718) );
  EDFFX1 R3_reg_1_ ( .D(data_in_2[103]), .E(n3510), .CK(clk), .QN(n888) );
  EDFFX1 R3_reg_33_ ( .D(data_in_2[135]), .E(n3510), .CK(clk), .QN(n856) );
  EDFFX1 R3_reg_16_ ( .D(data_in_2[118]), .E(n3510), .CK(clk), .QN(n873) );
  EDFFXL R15_reg_32_ ( .D(data_in_2[134]), .E(n3515), .CK(clk), .QN(n789) );
  EDFFX1 R3_reg_12_ ( .D(data_in_2[114]), .E(n3510), .CK(clk), .QN(n877) );
  EDFFX1 R11_reg_12_ ( .D(data_in_2[114]), .E(n3538), .CK(clk), .QN(n707) );
  EDFFX1 R11_reg_10_ ( .D(data_in_2[112]), .E(n3538), .CK(clk), .QN(n709) );
  EDFFX1 R15_reg_10_ ( .D(data_in_2[112]), .E(n3514), .CK(clk), .QN(n811) );
  EDFFX1 R11_reg_27_ ( .D(data_in_2[129]), .E(n3537), .CK(clk), .QN(n692) );
  EDFFX1 R15_reg_27_ ( .D(data_in_2[129]), .E(n3514), .CK(clk), .QN(n794) );
  EDFFX1 R15_reg_7_ ( .D(data_in_2[109]), .E(n3515), .CK(clk), .QN(n814) );
  EDFFX1 R3_reg_7_ ( .D(data_in_2[109]), .E(n3510), .CK(clk), .QN(n882) );
  EDFFX1 R11_reg_11_ ( .D(data_in_2[113]), .E(n3538), .CK(clk), .QN(n708) );
  EDFFX1 R15_reg_11_ ( .D(data_in_2[113]), .E(n3515), .CK(clk), .QN(n810) );
  EDFFX1 R15_reg_24_ ( .D(data_in_2[126]), .E(n3514), .CK(clk), .QN(n797) );
  EDFFX1 R3_reg_24_ ( .D(data_in_2[126]), .E(n3510), .CK(clk), .QN(n865) );
  EDFFX1 R15_reg_6_ ( .D(data_in_2[108]), .E(n3515), .CK(clk), .QN(n815) );
  EDFFX1 R3_reg_6_ ( .D(data_in_2[108]), .E(n3510), .CK(clk), .QN(n883) );
  EDFFX1 R15_reg_5_ ( .D(data_in_2[107]), .E(n3515), .CK(clk), .QN(n816) );
  EDFFX1 R11_reg_5_ ( .D(data_in_2[107]), .E(n3538), .CK(clk), .QN(n714) );
  EDFFX1 R7_reg_16_ ( .D(data_in_2[118]), .E(n3534), .CK(clk), .QN(n941) );
  EDFFX1 R11_reg_33_ ( .D(data_in_2[135]), .E(n3536), .CK(clk), .QN(n686) );
  EDFFX1 R7_reg_33_ ( .D(data_in_2[135]), .E(n3534), .CK(clk), .QN(n924) );
  EDFFX1 R15_reg_33_ ( .D(data_in_2[135]), .E(n3514), .CK(clk), .QN(n788) );
  EDFFXL R9_reg_16_ ( .D(data_in_2[50]), .E(n3537), .CK(clk), .QN(n2201) );
  EDFFX1 R11_reg_25_ ( .D(data_in_2[127]), .E(n3538), .CK(clk), .QN(n694) );
  EDFFX1 R11_reg_23_ ( .D(data_in_2[125]), .E(n3537), .CK(clk), .QN(n696) );
  EDFFX1 R11_reg_22_ ( .D(data_in_2[124]), .E(n3536), .CK(clk), .QN(n697) );
  EDFFX1 R11_reg_21_ ( .D(data_in_2[123]), .E(n3538), .CK(clk), .QN(n698) );
  EDFFX1 R11_reg_20_ ( .D(data_in_2[122]), .E(n3537), .CK(clk), .QN(n699) );
  EDFFX1 R11_reg_19_ ( .D(data_in_2[121]), .E(n3536), .CK(clk), .QN(n700) );
  EDFFX1 R11_reg_4_ ( .D(data_in_2[106]), .E(n3538), .CK(clk), .QN(n715) );
  EDFFX1 R11_reg_3_ ( .D(data_in_2[105]), .E(n3537), .CK(clk), .QN(n716) );
  EDFFX1 R11_reg_2_ ( .D(data_in_2[104]), .E(n3536), .CK(clk), .QN(n717) );
  EDFFX1 R7_reg_24_ ( .D(data_in_2[126]), .E(n3533), .CK(clk), .QN(n933) );
  EDFFX1 R7_reg_7_ ( .D(data_in_2[109]), .E(n3533), .CK(clk), .QN(n950) );
  EDFFX1 R7_reg_6_ ( .D(data_in_2[108]), .E(n3533), .CK(clk), .QN(n951) );
  EDFFX1 R7_reg_5_ ( .D(data_in_2[107]), .E(n3533), .CK(clk), .QN(n952) );
  EDFFX1 R3_reg_9_ ( .D(data_in_2[111]), .E(n3509), .CK(clk), .QN(n880) );
  EDFFX1 R3_reg_8_ ( .D(data_in_2[110]), .E(n3509), .CK(clk), .QN(n881) );
  EDFFX1 R11_reg_26_ ( .D(data_in_2[128]), .E(n3536), .CK(clk), .QN(n693) );
  EDFFX1 R15_reg_12_ ( .D(data_in_2[114]), .E(n3514), .CK(clk), .QN(n809) );
  EDFFX1 R3_reg_11_ ( .D(data_in_2[113]), .E(n3508), .CK(clk), .QN(n878) );
  EDFFX1 R3_reg_10_ ( .D(data_in_2[112]), .E(n3508), .CK(clk), .QN(n879) );
  EDFFX1 R3_reg_27_ ( .D(data_in_2[129]), .E(n3508), .CK(clk), .QN(n862) );
  EDFFXL R7_reg_32_ ( .D(data_in_2[134]), .E(n3533), .CK(clk), .QN(n925) );
  EDFFXL R11_reg_32_ ( .D(data_in_2[134]), .E(n3536), .CK(clk), .QN(n687) );
  EDFFXL R3_reg_32_ ( .D(data_in_2[134]), .E(n3508), .CK(clk), .QN(n857) );
  EDFFX1 R10_reg_20_ ( .D(data_in_2[88]), .E(n3537), .CK(clk), .QN(n733) );
  EDFFX1 R10_reg_19_ ( .D(data_in_2[87]), .E(n3536), .CK(clk), .QN(n734) );
  EDFFX1 R10_reg_3_ ( .D(data_in_2[71]), .E(n3538), .CK(clk), .QN(n750) );
  EDFFX1 R10_reg_2_ ( .D(data_in_2[70]), .E(n3537), .CK(clk), .QN(n751) );
  EDFFX1 R10_reg_1_ ( .D(data_in_2[69]), .E(n3537), .CK(clk), .QN(n752) );
  EDFFX1 R14_reg_21_ ( .D(data_in_2[89]), .E(n3515), .CK(clk), .QN(n766) );
  EDFFX1 R14_reg_20_ ( .D(data_in_2[88]), .E(n3516), .CK(clk), .QN(n767) );
  EDFFX1 R14_reg_7_ ( .D(data_in_2[75]), .E(n3516), .CK(clk), .QN(n780) );
  EDFFX1 R14_reg_5_ ( .D(data_in_2[73]), .E(n3516), .CK(clk), .QN(n782) );
  EDFFX1 R14_reg_4_ ( .D(data_in_2[72]), .E(n3516), .CK(clk), .QN(n783) );
  EDFFX1 R14_reg_3_ ( .D(data_in_2[71]), .E(n3516), .CK(clk), .QN(n784) );
  EDFFX1 R14_reg_2_ ( .D(data_in_2[70]), .E(n3516), .CK(clk), .QN(n785) );
  EDFFX1 R14_reg_1_ ( .D(data_in_2[69]), .E(n3516), .CK(clk), .QN(n786) );
  EDFFX1 R2_reg_21_ ( .D(data_in_2[89]), .E(n3508), .CK(clk), .QN(n834) );
  EDFFX1 R2_reg_20_ ( .D(data_in_2[88]), .E(n3509), .CK(clk), .QN(n835) );
  EDFFX1 R2_reg_7_ ( .D(data_in_2[75]), .E(n1151), .CK(clk), .QN(n848) );
  EDFFX1 R2_reg_3_ ( .D(data_in_2[71]), .E(n1151), .CK(clk), .QN(n852) );
  EDFFX1 R2_reg_1_ ( .D(data_in_2[69]), .E(n3509), .CK(clk), .QN(n854) );
  EDFFX1 R6_reg_19_ ( .D(data_in_2[87]), .E(n840), .CK(clk), .QN(n904) );
  EDFFX1 R6_reg_18_ ( .D(data_in_2[86]), .E(n3535), .CK(clk), .QN(n905) );
  EDFFX1 R6_reg_5_ ( .D(data_in_2[73]), .E(n3533), .CK(clk), .QN(n918) );
  EDFFX1 R6_reg_4_ ( .D(data_in_2[72]), .E(n3534), .CK(clk), .QN(n919) );
  EDFFX1 R6_reg_2_ ( .D(data_in_2[70]), .E(n3534), .CK(clk), .QN(n921) );
  EDFFX1 R6_reg_1_ ( .D(data_in_2[69]), .E(n3535), .CK(clk), .QN(n922) );
  EDFFX1 R14_reg_23_ ( .D(data_in_2[91]), .E(n3516), .CK(clk), .QN(n764) );
  EDFFX1 R2_reg_23_ ( .D(data_in_2[91]), .E(n1151), .CK(clk), .QN(n832) );
  EDFFX1 R14_reg_25_ ( .D(data_in_2[93]), .E(n3516), .CK(clk), .QN(n762) );
  EDFFX1 R2_reg_25_ ( .D(data_in_2[93]), .E(n1151), .CK(clk), .QN(n830) );
  EDFFX1 R10_reg_8_ ( .D(data_in_2[76]), .E(n3536), .CK(clk), .QN(n745) );
  EDFFX1 R14_reg_8_ ( .D(data_in_2[76]), .E(n3516), .CK(clk), .QN(n779) );
  EDFFX1 R14_reg_17_ ( .D(data_in_2[85]), .E(n3516), .CK(clk), .QN(n770) );
  EDFFX1 R10_reg_17_ ( .D(data_in_2[85]), .E(n3536), .CK(clk), .QN(n736) );
  EDFFX1 R6_reg_17_ ( .D(data_in_2[85]), .E(n3533), .CK(clk), .QN(n906) );
  EDFFX1 R2_reg_17_ ( .D(data_in_2[85]), .E(n3508), .CK(clk), .QN(n838) );
  EDFFX1 R14_reg_0_ ( .D(data_in_2[68]), .E(n3516), .CK(clk), .QN(n787) );
  EDFFX1 R10_reg_0_ ( .D(data_in_2[68]), .E(n3536), .CK(clk), .QN(n753) );
  EDFFX1 R6_reg_0_ ( .D(data_in_2[68]), .E(n3534), .CK(clk), .QN(n923) );
  EDFFX1 R2_reg_0_ ( .D(data_in_2[68]), .E(n3510), .CK(clk), .QN(n855) );
  EDFFX1 R14_reg_18_ ( .D(data_in_2[86]), .E(n3516), .CK(clk), .QN(n769) );
  EDFFX1 R10_reg_18_ ( .D(data_in_2[86]), .E(n3538), .CK(clk), .QN(n735) );
  EDFFX1 R2_reg_18_ ( .D(data_in_2[86]), .E(n3508), .CK(clk), .QN(n837) );
  EDFFX1 R14_reg_19_ ( .D(data_in_2[87]), .E(n3516), .CK(clk), .QN(n768) );
  EDFFX1 R2_reg_29_ ( .D(data_in_2[97]), .E(n1151), .CK(clk), .QN(n826) );
  EDFFX1 R6_reg_29_ ( .D(data_in_2[97]), .E(n3534), .CK(clk), .QN(n894) );
  EDFFX1 R10_reg_31_ ( .D(data_in_2[99]), .E(n3536), .CK(clk), .QN(n722) );
  EDFFX1 R10_reg_30_ ( .D(data_in_2[98]), .E(n3537), .CK(clk), .QN(n723) );
  EDFFX1 R6_reg_30_ ( .D(data_in_2[98]), .E(n3535), .CK(clk), .QN(n893) );
  EDFFX1 R2_reg_31_ ( .D(data_in_2[99]), .E(n1151), .CK(clk), .QN(n824) );
  EDFFX1 R2_reg_32_ ( .D(data_in_2[100]), .E(n1151), .CK(clk), .QN(n823) );
  EDFFX1 R6_reg_32_ ( .D(data_in_2[100]), .E(n3533), .CK(clk), .QN(n891) );
  EDFFX1 R2_reg_16_ ( .D(data_in_2[84]), .E(n3509), .CK(clk), .QN(n839) );
  EDFFX1 R10_reg_10_ ( .D(data_in_2[78]), .E(n3538), .CK(clk), .QN(n743) );
  EDFFX1 R14_reg_10_ ( .D(data_in_2[78]), .E(n3512), .CK(clk), .QN(n777) );
  EDFFX1 R14_reg_6_ ( .D(data_in_2[74]), .E(n3512), .CK(clk), .QN(n781) );
  EDFFX1 R2_reg_6_ ( .D(data_in_2[74]), .E(n3510), .CK(clk), .QN(n849) );
  EDFFX1 R10_reg_27_ ( .D(data_in_2[95]), .E(n3537), .CK(clk), .QN(n726) );
  EDFFX1 R14_reg_27_ ( .D(data_in_2[95]), .E(n3512), .CK(clk), .QN(n760) );
  EDFFX1 R2_reg_12_ ( .D(data_in_2[80]), .E(n3508), .CK(clk), .QN(n843) );
  EDFFX1 R14_reg_12_ ( .D(data_in_2[80]), .E(n3512), .CK(clk), .QN(n775) );
  EDFFX1 R14_reg_26_ ( .D(data_in_2[94]), .E(n3512), .CK(clk), .QN(n761) );
  EDFFX1 R10_reg_26_ ( .D(data_in_2[94]), .E(n3536), .CK(clk), .QN(n727) );
  EDFFX1 R14_reg_11_ ( .D(data_in_2[79]), .E(n3514), .CK(clk), .QN(n776) );
  EDFFX1 R2_reg_11_ ( .D(data_in_2[79]), .E(n3509), .CK(clk), .QN(n844) );
  EDFFX1 R10_reg_24_ ( .D(data_in_2[92]), .E(n3536), .CK(clk), .QN(n729) );
  EDFFX1 R14_reg_24_ ( .D(data_in_2[92]), .E(n3515), .CK(clk), .QN(n763) );
  EDFFX1 R10_reg_9_ ( .D(data_in_2[77]), .E(n3538), .CK(clk), .QN(n744) );
  EDFFX1 R14_reg_9_ ( .D(data_in_2[77]), .E(n3514), .CK(clk), .QN(n778) );
  EDFFX1 R14_reg_22_ ( .D(data_in_2[90]), .E(n3515), .CK(clk), .QN(n765) );
  EDFFX1 R2_reg_22_ ( .D(data_in_2[90]), .E(n3510), .CK(clk), .QN(n833) );
  EDFFX1 R6_reg_16_ ( .D(data_in_2[84]), .E(n3534), .CK(clk), .QN(n907) );
  EDFFX1 R6_reg_33_ ( .D(data_in_2[101]), .E(n3534), .CK(clk), .QN(n890) );
  EDFFX1 R10_reg_33_ ( .D(data_in_2[101]), .E(n3536), .CK(clk), .QN(n720) );
  EDFFX1 R14_reg_33_ ( .D(data_in_2[101]), .E(n3515), .CK(clk), .QN(n754) );
  EDFFX1 R2_reg_19_ ( .D(data_in_2[87]), .E(n3509), .CK(clk), .QN(n836) );
  EDFFX1 R2_reg_5_ ( .D(data_in_2[73]), .E(n3509), .CK(clk), .QN(n850) );
  EDFFX1 R2_reg_4_ ( .D(data_in_2[72]), .E(n3509), .CK(clk), .QN(n851) );
  EDFFX1 R2_reg_2_ ( .D(data_in_2[70]), .E(n3509), .CK(clk), .QN(n853) );
  EDFFX1 R6_reg_26_ ( .D(data_in_2[94]), .E(n3534), .CK(clk), .QN(n897) );
  EDFFX1 R6_reg_25_ ( .D(data_in_2[93]), .E(n3534), .CK(clk), .QN(n898) );
  EDFFX1 R6_reg_23_ ( .D(data_in_2[91]), .E(n3534), .CK(clk), .QN(n900) );
  EDFFX1 R6_reg_22_ ( .D(data_in_2[90]), .E(n3534), .CK(clk), .QN(n901) );
  EDFFX1 R6_reg_21_ ( .D(data_in_2[89]), .E(n3534), .CK(clk), .QN(n902) );
  EDFFX1 R6_reg_20_ ( .D(data_in_2[88]), .E(n3534), .CK(clk), .QN(n903) );
  EDFFX1 R6_reg_7_ ( .D(data_in_2[75]), .E(n3534), .CK(clk), .QN(n916) );
  EDFFX1 R6_reg_6_ ( .D(data_in_2[74]), .E(n3534), .CK(clk), .QN(n917) );
  EDFFX1 R6_reg_3_ ( .D(data_in_2[71]), .E(n3534), .CK(clk), .QN(n920) );
  EDFFX1 R6_reg_8_ ( .D(data_in_2[76]), .E(n3534), .CK(clk), .QN(n915) );
  EDFFX1 R6_reg_10_ ( .D(data_in_2[78]), .E(n3534), .CK(clk), .QN(n913) );
  EDFFX1 R6_reg_12_ ( .D(data_in_2[80]), .E(n3534), .CK(clk), .QN(n911) );
  EDFFX1 R6_reg_11_ ( .D(data_in_2[79]), .E(n3533), .CK(clk), .QN(n912) );
  EDFFX1 R6_reg_24_ ( .D(data_in_2[92]), .E(n3533), .CK(clk), .QN(n899) );
  EDFFX1 R6_reg_9_ ( .D(data_in_2[77]), .E(n3533), .CK(clk), .QN(n914) );
  EDFFX1 R2_reg_27_ ( .D(data_in_2[95]), .E(n3508), .CK(clk), .QN(n828) );
  EDFFX1 R10_reg_29_ ( .D(data_in_2[97]), .E(n3536), .CK(clk), .QN(n724) );
  EDFFX1 R6_reg_31_ ( .D(data_in_2[99]), .E(n3533), .CK(clk), .QN(n892) );
  EDFFX1 R10_reg_13_ ( .D(data_in_2[81]), .E(n3536), .CK(clk), .QN(n740) );
  EDFFX1 R14_reg_13_ ( .D(data_in_2[81]), .E(n3514), .CK(clk), .QN(n774) );
  EDFFX1 R2_reg_13_ ( .D(data_in_2[81]), .E(n3508), .CK(clk), .QN(n842) );
  EDFFX1 R2_reg_30_ ( .D(data_in_2[98]), .E(n3508), .CK(clk), .QN(n825) );
  EDFFX1 R10_reg_32_ ( .D(data_in_2[100]), .E(n3536), .CK(clk), .QN(n721) );
  EDFFX1 R8_reg_16_ ( .D(data_in_2[16]), .E(n3536), .CK(clk), .QN(n2105) );
  EDFFX1 R11_reg_16_ ( .D(data_in_2[118]), .E(n3537), .CK(clk), .Q(n2516) );
  EDFFX1 R9_reg_12_ ( .D(data_in_2[46]), .E(n3536), .CK(clk), .Q(n2763) );
  EDFFX1 R13_reg_12_ ( .D(data_in_2[46]), .E(n3515), .CK(clk), .Q(n2762) );
  EDFFX1 R5_reg_12_ ( .D(data_in_2[46]), .E(n3533), .CK(clk), .Q(n2764) );
  EDFFX1 R1_reg_12_ ( .D(data_in_2[46]), .E(n3508), .CK(clk), .Q(n2765) );
  EDFFX1 R9_reg_13_ ( .D(data_in_2[47]), .E(n3536), .CK(clk), .Q(n2767) );
  EDFFX1 R13_reg_13_ ( .D(data_in_2[47]), .E(n3515), .CK(clk), .Q(n2766) );
  EDFFX1 R5_reg_13_ ( .D(data_in_2[47]), .E(n3534), .CK(clk), .Q(n2768) );
  EDFFX1 R1_reg_13_ ( .D(data_in_2[47]), .E(n3508), .CK(clk), .Q(n2769) );
  EDFFX1 R13_reg_32_ ( .D(data_in_2[66]), .E(n3514), .CK(clk), .Q(n2771) );
  EDFFX1 R9_reg_33_ ( .D(data_in_2[67]), .E(n3536), .CK(clk), .Q(n2781) );
  EDFFX1 R13_reg_33_ ( .D(data_in_2[67]), .E(n3514), .CK(clk), .Q(n2780) );
  EDFFX1 R1_reg_32_ ( .D(data_in_2[66]), .E(n3509), .CK(clk), .Q(n2772) );
  EDFFX1 R1_reg_33_ ( .D(data_in_2[67]), .E(n3509), .CK(clk), .Q(n2782) );
  EDFFXL R13_reg_16_ ( .D(data_in_2[50]), .E(n3515), .CK(clk), .Q(n2774) );
  EDFFXL R1_reg_16_ ( .D(data_in_2[50]), .E(n3508), .CK(clk), .Q(n2775) );
  EDFFX1 R13_reg_24_ ( .D(data_in_2[58]), .E(n3515), .CK(clk), .Q(R13[24]) );
  EDFFX1 R13_reg_23_ ( .D(data_in_2[57]), .E(n3514), .CK(clk), .Q(R13[23]) );
  EDFFX1 R13_reg_22_ ( .D(data_in_2[56]), .E(n3514), .CK(clk), .Q(R13[22]) );
  EDFFX1 R13_reg_21_ ( .D(data_in_2[55]), .E(n3514), .CK(clk), .Q(R13[21]) );
  EDFFX1 R13_reg_20_ ( .D(data_in_2[54]), .E(n3514), .CK(clk), .Q(R13[20]) );
  EDFFX1 R13_reg_19_ ( .D(data_in_2[53]), .E(n3514), .CK(clk), .Q(R13[19]) );
  EDFFX1 R13_reg_8_ ( .D(data_in_2[42]), .E(n3514), .CK(clk), .Q(R13[8]) );
  EDFFX1 R13_reg_7_ ( .D(data_in_2[41]), .E(n3514), .CK(clk), .Q(R13[7]) );
  EDFFX1 R13_reg_6_ ( .D(data_in_2[40]), .E(n3514), .CK(clk), .Q(R13[6]) );
  EDFFX1 R13_reg_5_ ( .D(data_in_2[39]), .E(n3514), .CK(clk), .Q(R13[5]) );
  EDFFX1 R13_reg_4_ ( .D(data_in_2[38]), .E(n3514), .CK(clk), .Q(R13[4]) );
  EDFFX1 R13_reg_3_ ( .D(data_in_2[37]), .E(n3514), .CK(clk), .Q(R13[3]) );
  EDFFX1 R13_reg_2_ ( .D(data_in_2[36]), .E(n3514), .CK(clk), .Q(R13[2]) );
  EDFFX1 R13_reg_1_ ( .D(data_in_2[35]), .E(n3514), .CK(clk), .Q(R13[1]) );
  EDFFX1 R9_reg_24_ ( .D(data_in_2[58]), .E(n3537), .CK(clk), .Q(R9[24]) );
  EDFFX1 R9_reg_23_ ( .D(data_in_2[57]), .E(n3537), .CK(clk), .Q(R9[23]) );
  EDFFX1 R9_reg_22_ ( .D(data_in_2[56]), .E(n3537), .CK(clk), .Q(R9[22]) );
  EDFFX1 R9_reg_21_ ( .D(data_in_2[55]), .E(n3537), .CK(clk), .Q(R9[21]) );
  EDFFX1 R9_reg_20_ ( .D(data_in_2[54]), .E(n3537), .CK(clk), .Q(R9[20]) );
  EDFFX1 R9_reg_19_ ( .D(data_in_2[53]), .E(n3537), .CK(clk), .Q(R9[19]) );
  EDFFX1 R9_reg_8_ ( .D(data_in_2[42]), .E(n3537), .CK(clk), .Q(R9[8]) );
  EDFFX1 R9_reg_7_ ( .D(data_in_2[41]), .E(n3537), .CK(clk), .Q(R9[7]) );
  EDFFX1 R9_reg_6_ ( .D(data_in_2[40]), .E(n3537), .CK(clk), .Q(R9[6]) );
  EDFFX1 R9_reg_5_ ( .D(data_in_2[39]), .E(n3537), .CK(clk), .Q(R9[5]) );
  EDFFX1 R9_reg_4_ ( .D(data_in_2[38]), .E(n3537), .CK(clk), .Q(R9[4]) );
  EDFFX1 R9_reg_3_ ( .D(data_in_2[37]), .E(n3537), .CK(clk), .Q(R9[3]) );
  EDFFX1 R9_reg_2_ ( .D(data_in_2[36]), .E(n3537), .CK(clk), .Q(R9[2]) );
  EDFFX1 R9_reg_1_ ( .D(data_in_2[35]), .E(n3537), .CK(clk), .Q(R9[1]) );
  EDFFX1 R1_reg_24_ ( .D(data_in_2[58]), .E(n3509), .CK(clk), .Q(R1[24]) );
  EDFFX1 R1_reg_23_ ( .D(data_in_2[57]), .E(n3510), .CK(clk), .Q(R1[23]) );
  EDFFX1 R1_reg_22_ ( .D(data_in_2[56]), .E(n3508), .CK(clk), .Q(R1[22]) );
  EDFFX1 R1_reg_21_ ( .D(data_in_2[55]), .E(n3510), .CK(clk), .Q(R1[21]) );
  EDFFX1 R1_reg_20_ ( .D(data_in_2[54]), .E(n3509), .CK(clk), .Q(R1[20]) );
  EDFFX1 R1_reg_19_ ( .D(data_in_2[53]), .E(n3510), .CK(clk), .Q(R1[19]) );
  EDFFX1 R1_reg_8_ ( .D(data_in_2[42]), .E(n3508), .CK(clk), .Q(R1[8]) );
  EDFFX1 R1_reg_7_ ( .D(data_in_2[41]), .E(n3508), .CK(clk), .Q(R1[7]) );
  EDFFX1 R1_reg_6_ ( .D(data_in_2[40]), .E(n3509), .CK(clk), .Q(R1[6]) );
  EDFFX1 R1_reg_5_ ( .D(data_in_2[39]), .E(n3509), .CK(clk), .Q(R1[5]) );
  EDFFX1 R1_reg_4_ ( .D(data_in_2[38]), .E(n3509), .CK(clk), .Q(R1[4]) );
  EDFFX1 R1_reg_3_ ( .D(data_in_2[37]), .E(n3509), .CK(clk), .Q(R1[3]) );
  EDFFX1 R1_reg_2_ ( .D(data_in_2[36]), .E(n3509), .CK(clk), .Q(R1[2]) );
  EDFFX1 R1_reg_1_ ( .D(data_in_2[35]), .E(n3509), .CK(clk), .Q(R1[1]) );
  EDFFX1 R5_reg_27_ ( .D(data_in_2[61]), .E(n3535), .CK(clk), .Q(R5[27]) );
  EDFFX1 R5_reg_26_ ( .D(data_in_2[60]), .E(n3535), .CK(clk), .Q(R5[26]) );
  EDFFX1 R5_reg_25_ ( .D(data_in_2[59]), .E(n3535), .CK(clk), .Q(R5[25]) );
  EDFFX1 R5_reg_24_ ( .D(data_in_2[58]), .E(n3535), .CK(clk), .Q(R5[24]) );
  EDFFX1 R5_reg_23_ ( .D(data_in_2[57]), .E(n3535), .CK(clk), .Q(R5[23]) );
  EDFFX1 R5_reg_22_ ( .D(data_in_2[56]), .E(n3535), .CK(clk), .Q(R5[22]) );
  EDFFX1 R5_reg_21_ ( .D(data_in_2[55]), .E(n3535), .CK(clk), .Q(R5[21]) );
  EDFFX1 R5_reg_20_ ( .D(data_in_2[54]), .E(n3535), .CK(clk), .Q(R5[20]) );
  EDFFX1 R5_reg_19_ ( .D(data_in_2[53]), .E(n3535), .CK(clk), .Q(R5[19]) );
  EDFFX1 R5_reg_10_ ( .D(data_in_2[44]), .E(n3535), .CK(clk), .Q(R5[10]) );
  EDFFX1 R5_reg_9_ ( .D(data_in_2[43]), .E(n3535), .CK(clk), .Q(R5[9]) );
  EDFFX1 R5_reg_8_ ( .D(data_in_2[42]), .E(n3535), .CK(clk), .Q(R5[8]) );
  EDFFX1 R5_reg_7_ ( .D(data_in_2[41]), .E(n3535), .CK(clk), .Q(R5[7]) );
  EDFFX1 R5_reg_6_ ( .D(data_in_2[40]), .E(n3535), .CK(clk), .Q(R5[6]) );
  EDFFX1 R5_reg_5_ ( .D(data_in_2[39]), .E(n3535), .CK(clk), .Q(R5[5]) );
  EDFFX1 R5_reg_4_ ( .D(data_in_2[38]), .E(n3535), .CK(clk), .Q(R5[4]) );
  EDFFX1 R5_reg_3_ ( .D(data_in_2[37]), .E(n3535), .CK(clk), .Q(R5[3]) );
  EDFFX1 R5_reg_2_ ( .D(data_in_2[36]), .E(n3535), .CK(clk), .Q(R5[2]) );
  EDFFX1 R13_reg_9_ ( .D(data_in_2[43]), .E(n3514), .CK(clk), .Q(R13[9]) );
  EDFFX1 R9_reg_9_ ( .D(data_in_2[43]), .E(n3538), .CK(clk), .Q(R9[9]) );
  EDFFX1 R1_reg_9_ ( .D(data_in_2[43]), .E(n3509), .CK(clk), .Q(R1[9]) );
  EDFFX1 R13_reg_0_ ( .D(data_in_2[34]), .E(n3514), .CK(clk), .Q(R13[0]) );
  EDFFX1 R9_reg_0_ ( .D(data_in_2[34]), .E(n3537), .CK(clk), .Q(R9[0]) );
  EDFFX1 R5_reg_0_ ( .D(data_in_2[34]), .E(n3535), .CK(clk), .Q(R5[0]) );
  EDFFX1 R1_reg_0_ ( .D(data_in_2[34]), .E(n3509), .CK(clk), .Q(R1[0]) );
  EDFFX1 R13_reg_17_ ( .D(data_in_2[51]), .E(n3514), .CK(clk), .Q(R13[17]) );
  EDFFX1 R9_reg_17_ ( .D(data_in_2[51]), .E(n3536), .CK(clk), .Q(R9[17]) );
  EDFFX1 R5_reg_17_ ( .D(data_in_2[51]), .E(n3535), .CK(clk), .Q(R5[17]) );
  EDFFX1 R1_reg_17_ ( .D(data_in_2[51]), .E(n3509), .CK(clk), .Q(R1[17]) );
  EDFFX1 R13_reg_18_ ( .D(data_in_2[52]), .E(n3514), .CK(clk), .Q(R13[18]) );
  EDFFX1 R9_reg_18_ ( .D(data_in_2[52]), .E(n3538), .CK(clk), .Q(R9[18]) );
  EDFFX1 R1_reg_18_ ( .D(data_in_2[52]), .E(n3509), .CK(clk), .Q(R1[18]) );
  EDFFX1 R5_reg_18_ ( .D(data_in_2[52]), .E(n3535), .CK(clk), .Q(R5[18]) );
  EDFFX1 R5_reg_1_ ( .D(data_in_2[35]), .E(n3534), .CK(clk), .Q(R5[1]) );
  EDFFX1 R1_reg_31_ ( .D(data_in_2[65]), .E(n3509), .CK(clk), .Q(n1404) );
  EDFFX1 R9_reg_31_ ( .D(data_in_2[65]), .E(n3537), .CK(clk), .Q(n1402) );
  EDFFX1 R13_reg_31_ ( .D(data_in_2[65]), .E(n3514), .CK(clk), .Q(n1401) );
  EDFFX1 R5_reg_31_ ( .D(data_in_2[65]), .E(n3534), .CK(clk), .Q(n1400) );
  EDFFX1 R13_reg_10_ ( .D(data_in_2[44]), .E(n3514), .CK(clk), .Q(R13[10]) );
  EDFFX1 R9_reg_10_ ( .D(data_in_2[44]), .E(n3536), .CK(clk), .Q(R9[10]) );
  EDFFX1 R1_reg_10_ ( .D(data_in_2[44]), .E(n3509), .CK(clk), .Q(R1[10]) );
  EDFFX1 R13_reg_27_ ( .D(data_in_2[61]), .E(n3514), .CK(clk), .Q(R13[27]) );
  EDFFX1 R9_reg_27_ ( .D(data_in_2[61]), .E(n3538), .CK(clk), .Q(R9[27]) );
  EDFFX1 R1_reg_27_ ( .D(data_in_2[61]), .E(n3509), .CK(clk), .Q(R1[27]) );
  EDFFX1 R13_reg_25_ ( .D(data_in_2[59]), .E(n3515), .CK(clk), .Q(R13[25]) );
  EDFFX1 R9_reg_25_ ( .D(data_in_2[59]), .E(n3537), .CK(clk), .Q(R9[25]) );
  EDFFX1 R1_reg_25_ ( .D(data_in_2[59]), .E(n3509), .CK(clk), .Q(R1[25]) );
  EDFFX1 R13_reg_26_ ( .D(data_in_2[60]), .E(n3515), .CK(clk), .Q(R13[26]) );
  EDFFX1 R9_reg_26_ ( .D(data_in_2[60]), .E(n3536), .CK(clk), .Q(R9[26]) );
  EDFFX1 R1_reg_26_ ( .D(data_in_2[60]), .E(n3509), .CK(clk), .Q(R1[26]) );
  EDFFXL R5_reg_16_ ( .D(data_in_2[50]), .E(n3534), .CK(clk), .Q(n1395) );
  EDFFX1 R9_reg_32_ ( .D(data_in_2[66]), .E(n3536), .CK(clk), .Q(n1398) );
  EDFFX1 R5_reg_32_ ( .D(data_in_2[66]), .E(n3533), .CK(clk), .Q(n1397) );
  EDFFX1 R5_reg_33_ ( .D(data_in_2[67]), .E(n3533), .CK(clk), .Q(n1381) );
  EDFFX1 R13_reg_11_ ( .D(data_in_2[45]), .E(n3514), .CK(clk), .Q(R13[11]) );
  EDFFX1 R9_reg_11_ ( .D(data_in_2[45]), .E(n3536), .CK(clk), .Q(R9[11]) );
  EDFFX1 R5_reg_11_ ( .D(data_in_2[45]), .E(n3533), .CK(clk), .Q(R5[11]) );
  EDFFX1 R1_reg_11_ ( .D(data_in_2[45]), .E(n3508), .CK(clk), .Q(R1[11]) );
  EDFFX1 R0_reg_16_ ( .D(data_in_2[16]), .E(n3508), .CK(clk), .Q(n2773) );
  EDFFX1 R10_reg_16_ ( .D(data_in_2[84]), .E(n3536), .CK(clk), .Q(n2094) );
  EDFFX1 R8_reg_23_ ( .D(data_in_2[23]), .E(n3538), .CK(clk), .Q(R8[23]) );
  EDFFX1 R8_reg_21_ ( .D(data_in_2[21]), .E(n3538), .CK(clk), .Q(R8[21]) );
  EDFFX1 R8_reg_20_ ( .D(data_in_2[20]), .E(n3538), .CK(clk), .Q(R8[20]) );
  EDFFX1 R8_reg_19_ ( .D(data_in_2[19]), .E(n3538), .CK(clk), .Q(R8[19]) );
  EDFFX1 R8_reg_5_ ( .D(data_in_2[5]), .E(n3538), .CK(clk), .Q(R8[5]) );
  EDFFX1 R8_reg_3_ ( .D(data_in_2[3]), .E(n3538), .CK(clk), .Q(R8[3]) );
  EDFFX1 R8_reg_2_ ( .D(data_in_2[2]), .E(n3538), .CK(clk), .Q(R8[2]) );
  EDFFX1 R12_reg_23_ ( .D(data_in_2[23]), .E(n3515), .CK(clk), .Q(R12[23]) );
  EDFFX1 R12_reg_21_ ( .D(data_in_2[21]), .E(n3514), .CK(clk), .Q(R12[21]) );
  EDFFX1 R12_reg_20_ ( .D(data_in_2[20]), .E(n3514), .CK(clk), .Q(R12[20]) );
  EDFFX1 R12_reg_19_ ( .D(data_in_2[19]), .E(n3514), .CK(clk), .Q(R12[19]) );
  EDFFX1 R12_reg_5_ ( .D(data_in_2[5]), .E(n3515), .CK(clk), .Q(R12[5]) );
  EDFFX1 R12_reg_3_ ( .D(data_in_2[3]), .E(n3515), .CK(clk), .Q(R12[3]) );
  EDFFX1 R12_reg_2_ ( .D(data_in_2[2]), .E(n3515), .CK(clk), .Q(R12[2]) );
  EDFFX1 R0_reg_23_ ( .D(data_in_2[23]), .E(n3510), .CK(clk), .Q(R0[23]) );
  EDFFX1 R0_reg_21_ ( .D(data_in_2[21]), .E(n3510), .CK(clk), .Q(R0[21]) );
  EDFFX1 R0_reg_20_ ( .D(data_in_2[20]), .E(n3510), .CK(clk), .Q(R0[20]) );
  EDFFX1 R0_reg_19_ ( .D(data_in_2[19]), .E(n3510), .CK(clk), .Q(R0[19]) );
  EDFFX1 R0_reg_18_ ( .D(data_in_2[18]), .E(n3510), .CK(clk), .Q(R0[18]) );
  EDFFX1 R0_reg_5_ ( .D(data_in_2[5]), .E(n3510), .CK(clk), .Q(R0[5]) );
  EDFFX1 R0_reg_3_ ( .D(data_in_2[3]), .E(n3510), .CK(clk), .Q(R0[3]) );
  EDFFX1 R0_reg_2_ ( .D(data_in_2[2]), .E(n3510), .CK(clk), .Q(R0[2]) );
  EDFFX1 R4_reg_23_ ( .D(data_in_2[23]), .E(n3533), .CK(clk), .Q(R4[23]) );
  EDFFX1 R4_reg_22_ ( .D(data_in_2[22]), .E(n3534), .CK(clk), .Q(R4[22]) );
  EDFFX1 R4_reg_21_ ( .D(data_in_2[21]), .E(n3534), .CK(clk), .Q(R4[21]) );
  EDFFX1 R4_reg_20_ ( .D(data_in_2[20]), .E(n3535), .CK(clk), .Q(R4[20]) );
  EDFFX1 R4_reg_19_ ( .D(data_in_2[19]), .E(n3533), .CK(clk), .Q(R4[19]) );
  EDFFX1 R4_reg_18_ ( .D(data_in_2[18]), .E(n3534), .CK(clk), .Q(R4[18]) );
  EDFFX1 R4_reg_9_ ( .D(data_in_2[9]), .E(n3535), .CK(clk), .Q(R4[9]) );
  EDFFX1 R4_reg_7_ ( .D(data_in_2[7]), .E(n3533), .CK(clk), .Q(R4[7]) );
  EDFFX1 R4_reg_6_ ( .D(data_in_2[6]), .E(n3534), .CK(clk), .Q(R4[6]) );
  EDFFX1 R4_reg_5_ ( .D(data_in_2[5]), .E(n3535), .CK(clk), .Q(R4[5]) );
  EDFFX1 R4_reg_4_ ( .D(data_in_2[4]), .E(n3533), .CK(clk), .Q(R4[4]) );
  EDFFX1 R4_reg_2_ ( .D(data_in_2[2]), .E(n3534), .CK(clk), .Q(R4[2]) );
  EDFFX1 R8_reg_18_ ( .D(data_in_2[18]), .E(n3538), .CK(clk), .Q(R8[18]) );
  EDFFX1 R8_reg_27_ ( .D(data_in_2[27]), .E(n3538), .CK(clk), .Q(R8[27]) );
  EDFFX1 R0_reg_26_ ( .D(data_in_2[26]), .E(n3510), .CK(clk), .Q(R0[26]) );
  EDFFX1 R0_reg_29_ ( .D(data_in_2[29]), .E(n3510), .CK(clk), .Q(R0[29]) );
  EDFFX1 R0_reg_25_ ( .D(data_in_2[25]), .E(n3510), .CK(clk), .Q(R0[25]) );
  EDFFX1 R0_reg_28_ ( .D(data_in_2[28]), .E(n3510), .CK(clk), .Q(R0[28]) );
  EDFFX1 R0_reg_8_ ( .D(data_in_2[8]), .E(n3510), .CK(clk), .Q(R0[8]) );
  EDFFX1 R0_reg_10_ ( .D(data_in_2[10]), .E(n3508), .CK(clk), .Q(R0[10]) );
  EDFFX1 R12_reg_24_ ( .D(data_in_2[24]), .E(n3515), .CK(clk), .Q(R12[24]) );
  EDFFX1 R4_reg_8_ ( .D(data_in_2[8]), .E(n3535), .CK(clk), .Q(R4[8]) );
  EDFFX1 R8_reg_8_ ( .D(data_in_2[8]), .E(n3538), .CK(clk), .Q(R8[8]) );
  EDFFX1 R12_reg_8_ ( .D(data_in_2[8]), .E(n3515), .CK(clk), .Q(R12[8]) );
  EDFFX1 R4_reg_29_ ( .D(data_in_2[29]), .E(n3533), .CK(clk), .Q(R4[29]) );
  EDFFX1 R8_reg_29_ ( .D(data_in_2[29]), .E(n3538), .CK(clk), .Q(R8[29]) );
  EDFFX1 R12_reg_29_ ( .D(data_in_2[29]), .E(n3515), .CK(clk), .Q(R12[29]) );
  EDFFX1 R4_reg_25_ ( .D(data_in_2[25]), .E(n3534), .CK(clk), .Q(R4[25]) );
  EDFFX1 R8_reg_25_ ( .D(data_in_2[25]), .E(n3538), .CK(clk), .Q(R8[25]) );
  EDFFX1 R12_reg_25_ ( .D(data_in_2[25]), .E(n3515), .CK(clk), .Q(R12[25]) );
  EDFFX1 R4_reg_27_ ( .D(data_in_2[27]), .E(n3535), .CK(clk), .Q(R4[27]) );
  EDFFX1 R0_reg_27_ ( .D(data_in_2[27]), .E(n3509), .CK(clk), .Q(R0[27]) );
  EDFFX1 R12_reg_27_ ( .D(data_in_2[27]), .E(n3515), .CK(clk), .Q(R12[27]) );
  EDFFX1 R12_reg_17_ ( .D(data_in_2[17]), .E(n3515), .CK(clk), .Q(R12[17]) );
  EDFFX1 R8_reg_17_ ( .D(data_in_2[17]), .E(n3538), .CK(clk), .Q(R8[17]) );
  EDFFX1 R4_reg_17_ ( .D(data_in_2[17]), .E(n3533), .CK(clk), .Q(R4[17]) );
  EDFFX1 R0_reg_17_ ( .D(data_in_2[17]), .E(n3509), .CK(clk), .Q(R0[17]) );
  EDFFX1 R12_reg_0_ ( .D(data_in_2[0]), .E(n3515), .CK(clk), .Q(R12[0]) );
  EDFFX1 R8_reg_0_ ( .D(data_in_2[0]), .E(n3538), .CK(clk), .Q(R8[0]) );
  EDFFX1 R4_reg_0_ ( .D(data_in_2[0]), .E(n3534), .CK(clk), .Q(R4[0]) );
  EDFFX1 R0_reg_0_ ( .D(data_in_2[0]), .E(n3510), .CK(clk), .Q(R0[0]) );
  EDFFX1 R12_reg_1_ ( .D(data_in_2[1]), .E(n3515), .CK(clk), .Q(R12[1]) );
  EDFFX1 R8_reg_1_ ( .D(data_in_2[1]), .E(n3538), .CK(clk), .Q(R8[1]) );
  EDFFX1 R0_reg_1_ ( .D(data_in_2[1]), .E(n3508), .CK(clk), .Q(R0[1]) );
  EDFFX1 R4_reg_1_ ( .D(data_in_2[1]), .E(n3535), .CK(clk), .Q(R4[1]) );
  EDFFX1 R4_reg_3_ ( .D(data_in_2[3]), .E(n3533), .CK(clk), .Q(R4[3]) );
  EDFFX1 R12_reg_18_ ( .D(data_in_2[18]), .E(n3515), .CK(clk), .Q(R12[18]) );
  EDFFX1 R8_reg_9_ ( .D(data_in_2[9]), .E(n3538), .CK(clk), .Q(R8[9]) );
  EDFFX1 R12_reg_9_ ( .D(data_in_2[9]), .E(n3515), .CK(clk), .Q(R12[9]) );
  EDFFX1 R0_reg_9_ ( .D(data_in_2[9]), .E(n3510), .CK(clk), .Q(R0[9]) );
  EDFFX1 R4_reg_28_ ( .D(data_in_2[28]), .E(n3534), .CK(clk), .Q(R4[28]) );
  EDFFX1 R8_reg_28_ ( .D(data_in_2[28]), .E(n3538), .CK(clk), .Q(R8[28]) );
  EDFFX1 R12_reg_28_ ( .D(data_in_2[28]), .E(n3515), .CK(clk), .Q(R12[28]) );
  EDFFX1 R4_reg_10_ ( .D(data_in_2[10]), .E(n3535), .CK(clk), .Q(R4[10]) );
  EDFFX1 R8_reg_10_ ( .D(data_in_2[10]), .E(n3537), .CK(clk), .Q(R8[10]) );
  EDFFX1 R12_reg_10_ ( .D(data_in_2[10]), .E(n3515), .CK(clk), .Q(R12[10]) );
  EDFFX1 R4_reg_24_ ( .D(data_in_2[24]), .E(n3533), .CK(clk), .Q(R4[24]) );
  EDFFX1 R0_reg_24_ ( .D(data_in_2[24]), .E(n3509), .CK(clk), .Q(R0[24]) );
  EDFFX1 R8_reg_24_ ( .D(data_in_2[24]), .E(n3537), .CK(clk), .Q(R8[24]) );
  EDFFX1 R8_reg_4_ ( .D(data_in_2[4]), .E(n3537), .CK(clk), .Q(R8[4]) );
  EDFFX1 R12_reg_4_ ( .D(data_in_2[4]), .E(n3515), .CK(clk), .Q(R12[4]) );
  EDFFX1 R0_reg_4_ ( .D(data_in_2[4]), .E(n3510), .CK(clk), .Q(R0[4]) );
  EDFFX1 R4_reg_26_ ( .D(data_in_2[26]), .E(n3534), .CK(clk), .Q(R4[26]) );
  EDFFX1 R8_reg_26_ ( .D(data_in_2[26]), .E(n3537), .CK(clk), .Q(R8[26]) );
  EDFFX1 R12_reg_26_ ( .D(data_in_2[26]), .E(n3515), .CK(clk), .Q(R12[26]) );
  EDFFX1 R8_reg_22_ ( .D(data_in_2[22]), .E(n3537), .CK(clk), .Q(R8[22]) );
  EDFFX1 R12_reg_22_ ( .D(data_in_2[22]), .E(n3515), .CK(clk), .Q(R12[22]) );
  EDFFX1 R0_reg_22_ ( .D(data_in_2[22]), .E(n3508), .CK(clk), .Q(R0[22]) );
  EDFFX1 R0_reg_6_ ( .D(data_in_2[6]), .E(n3508), .CK(clk), .Q(R0[6]) );
  EDFFX1 R8_reg_6_ ( .D(data_in_2[6]), .E(n3537), .CK(clk), .Q(R8[6]) );
  EDFFX1 R12_reg_6_ ( .D(data_in_2[6]), .E(n3515), .CK(clk), .Q(R12[6]) );
  EDFFX1 R8_reg_7_ ( .D(data_in_2[7]), .E(n3537), .CK(clk), .Q(R8[7]) );
  EDFFX1 R12_reg_7_ ( .D(data_in_2[7]), .E(n3515), .CK(clk), .Q(R12[7]) );
  EDFFX1 R0_reg_7_ ( .D(data_in_2[7]), .E(n3509), .CK(clk), .Q(R0[7]) );
  EDFFX1 R4_reg_16_ ( .D(data_in_2[16]), .E(n3533), .CK(clk), .Q(R4[16]) );
  DFFHQX1 R5_reg_15_ ( .D(n737), .CK(clk), .Q(R5[15]) );
  DFFHQX1 R1_reg_15_ ( .D(n679), .CK(clk), .Q(R1[15]) );
  DFFHQX1 R9_reg_15_ ( .D(n666), .CK(clk), .Q(R9[15]) );
  DFFHQX1 R13_reg_15_ ( .D(n655), .CK(clk), .Q(R13[15]) );
  DFFHQX1 R12_reg_16_ ( .D(n656), .CK(clk), .Q(R12[16]) );
  DFFHQX1 counter2_reg_1_ ( .D(n1113), .CK(clk), .Q(counter2[1]) );
  DFFHQX1 counter2_reg_0_ ( .D(n1114), .CK(clk), .Q(counter2[0]) );
  DFFHQX1 counter1_reg_1_ ( .D(n1115), .CK(clk), .Q(\counter1[1] ) );
  EDFFX1 data_out_2_reg_33_ ( .D(N85), .E(n3554), .CK(clk), .Q(data_out_2[33])
         );
  EDFFX1 data_out_2_reg_16_ ( .D(N68), .E(n3554), .CK(clk), .Q(data_out_2[16])
         );
  EDFFX1 data_out_2_reg_15_ ( .D(N67), .E(n3554), .CK(clk), .Q(data_out_2[15])
         );
  EDFFX1 data_out_2_reg_32_ ( .D(N84), .E(n3554), .CK(clk), .Q(data_out_2[32])
         );
  EDFFX1 data_out_2_reg_31_ ( .D(N83), .E(n3554), .CK(clk), .Q(data_out_2[31])
         );
  EDFFX1 data_out_2_reg_30_ ( .D(N82), .E(n3554), .CK(clk), .Q(data_out_2[30])
         );
  EDFFX1 data_out_2_reg_14_ ( .D(N66), .E(n3554), .CK(clk), .Q(data_out_2[14])
         );
  EDFFX1 data_out_2_reg_13_ ( .D(N65), .E(n3554), .CK(clk), .Q(data_out_2[13])
         );
  EDFFX1 data_out_2_reg_12_ ( .D(N64), .E(n3554), .CK(clk), .Q(data_out_2[12])
         );
  EDFFX1 data_out_2_reg_29_ ( .D(N81), .E(n3554), .CK(clk), .Q(data_out_2[29])
         );
  EDFFX1 data_out_2_reg_28_ ( .D(N80), .E(n3554), .CK(clk), .Q(data_out_2[28])
         );
  EDFFX1 data_out_2_reg_27_ ( .D(N79), .E(n3554), .CK(clk), .Q(data_out_2[27])
         );
  EDFFX1 data_out_2_reg_26_ ( .D(N78), .E(n3554), .CK(clk), .Q(data_out_2[26])
         );
  EDFFX1 data_out_2_reg_25_ ( .D(N77), .E(n3554), .CK(clk), .Q(data_out_2[25])
         );
  EDFFX1 data_out_2_reg_11_ ( .D(N63), .E(n3554), .CK(clk), .Q(data_out_2[11])
         );
  EDFFX1 data_out_2_reg_10_ ( .D(N62), .E(n3553), .CK(clk), .Q(data_out_2[10])
         );
  EDFFX1 data_out_2_reg_9_ ( .D(N61), .E(n3553), .CK(clk), .Q(data_out_2[9])
         );
  EDFFX1 data_out_2_reg_8_ ( .D(N60), .E(n3553), .CK(clk), .Q(data_out_2[8])
         );
  EDFFX1 data_out_2_reg_24_ ( .D(N76), .E(n3554), .CK(clk), .Q(data_out_2[24])
         );
  EDFFX1 data_out_2_reg_23_ ( .D(N75), .E(n3553), .CK(clk), .Q(data_out_2[23])
         );
  EDFFX1 data_out_2_reg_21_ ( .D(N73), .E(n3553), .CK(clk), .Q(data_out_2[21])
         );
  EDFFX1 data_out_2_reg_7_ ( .D(N59), .E(n3553), .CK(clk), .Q(data_out_2[7])
         );
  EDFFX1 data_out_2_reg_22_ ( .D(N74), .E(n3553), .CK(clk), .Q(data_out_2[22])
         );
  EDFFX1 data_out_2_reg_4_ ( .D(N56), .E(n3553), .CK(clk), .Q(data_out_2[4])
         );
  EDFFX1 data_out_2_reg_6_ ( .D(N58), .E(n3553), .CK(clk), .Q(data_out_2[6])
         );
  EDFFX1 data_out_2_reg_5_ ( .D(N57), .E(n3553), .CK(clk), .Q(data_out_2[5])
         );
  EDFFX1 data_out_2_reg_20_ ( .D(N72), .E(n3553), .CK(clk), .Q(data_out_2[20])
         );
  EDFFX1 data_out_2_reg_3_ ( .D(N55), .E(n3553), .CK(clk), .Q(data_out_2[3])
         );
  EDFFX1 data_out_2_reg_2_ ( .D(N54), .E(n3553), .CK(clk), .Q(data_out_2[2])
         );
  EDFFX1 data_out_2_reg_17_ ( .D(N69), .E(n3553), .CK(clk), .Q(data_out_2[17])
         );
  EDFFX1 data_out_2_reg_19_ ( .D(N71), .E(n3553), .CK(clk), .Q(data_out_2[19])
         );
  EDFFX1 data_out_2_reg_1_ ( .D(N53), .E(n3553), .CK(clk), .Q(data_out_2[1])
         );
  EDFFX1 data_out_2_reg_0_ ( .D(N52), .E(n3553), .CK(clk), .Q(data_out_2[0])
         );
  EDFFX1 data_out_2_reg_18_ ( .D(N70), .E(n3553), .CK(clk), .Q(data_out_2[18])
         );
  EDFFXL R4_reg_15_ ( .D(data_in_2[15]), .E(n3535), .CK(clk), .Q(n62) );
  EDFFXL R8_reg_15_ ( .D(data_in_2[15]), .E(n3536), .CK(clk), .Q(n1413) );
  EDFFXL R0_reg_15_ ( .D(data_in_2[15]), .E(n3508), .CK(clk), .Q(n1418) );
  EDFFXL R12_reg_15_ ( .D(data_in_2[15]), .E(n3514), .CK(clk), .Q(n1417) );
  EDFFXL R3_reg_30_ ( .D(data_in_2[132]), .E(n3508), .CK(clk), .QN(n859) );
  EDFFXL R15_reg_30_ ( .D(data_in_2[132]), .E(n3515), .CK(clk), .QN(n2770) );
  EDFFXL R2_reg_33_ ( .D(data_in_2[101]), .E(n3510), .CK(clk), .QN(n822) );
  EDFFXL R6_reg_14_ ( .D(data_in_2[82]), .E(n3534), .CK(clk), .QN(n909) );
  EDFFXL R4_reg_33_ ( .D(data_in_2[33]), .E(n3533), .CK(clk), .Q(n2778) );
  EDFFXL R0_reg_33_ ( .D(data_in_2[33]), .E(n3508), .CK(clk), .Q(n2779) );
  EDFFXL R12_reg_14_ ( .D(data_in_2[14]), .E(n3512), .CK(clk), .Q(n1410) );
  EDFFXL R12_reg_33_ ( .D(data_in_2[33]), .E(n3515), .CK(clk), .Q(n132) );
  EDFFXL R8_reg_33_ ( .D(data_in_2[33]), .E(n3536), .CK(clk), .Q(n1403) );
  EDFFX1 R11_reg_7_ ( .D(data_in_2[109]), .E(n3536), .CK(clk), .QN(n712) );
  EDFFX1 R11_reg_15_ ( .D(data_in_2[117]), .E(n3538), .CK(clk), .QN(n2784) );
  EDFFX1 R7_reg_15_ ( .D(data_in_2[117]), .E(n3533), .CK(clk), .QN(n2785) );
  EDFFX1 R10_reg_7_ ( .D(data_in_2[75]), .E(n3538), .CK(clk), .QN(n746) );
  EDFFX1 R15_reg_25_ ( .D(data_in_2[127]), .E(n3514), .CK(clk), .QN(n796) );
  EDFFX1 R15_reg_21_ ( .D(data_in_2[123]), .E(n3515), .CK(clk), .QN(n800) );
  EDFFX1 R7_reg_9_ ( .D(data_in_2[111]), .E(n3533), .CK(clk), .QN(n948) );
  EDFFX1 R7_reg_8_ ( .D(data_in_2[110]), .E(n3534), .CK(clk), .QN(n949) );
  EDFFX1 R7_reg_12_ ( .D(data_in_2[114]), .E(n3535), .CK(clk), .QN(n945) );
  EDFFX1 R7_reg_11_ ( .D(data_in_2[113]), .E(n3535), .CK(clk), .QN(n946) );
  EDFFX1 R11_reg_29_ ( .D(data_in_2[131]), .E(n3536), .CK(clk), .QN(n690) );
  EDFFX1 R7_reg_29_ ( .D(data_in_2[131]), .E(n3533), .CK(clk), .QN(n928) );
  EDFFX1 R7_reg_13_ ( .D(data_in_2[115]), .E(n3533), .CK(clk), .QN(n944) );
  EDFFX1 R11_reg_13_ ( .D(data_in_2[115]), .E(n3536), .CK(clk), .QN(n706) );
  EDFFX1 R15_reg_13_ ( .D(data_in_2[115]), .E(n3515), .CK(clk), .QN(n808) );
  EDFFX1 R3_reg_13_ ( .D(data_in_2[115]), .E(n3508), .CK(clk), .QN(n876) );
  EDFFX1 R11_reg_14_ ( .D(data_in_2[116]), .E(n3536), .CK(clk), .QN(n705) );
  EDFFX1 R7_reg_14_ ( .D(data_in_2[116]), .E(n3533), .CK(clk), .QN(n943) );
  EDFFX1 R3_reg_15_ ( .D(data_in_2[117]), .E(n3510), .CK(clk), .QN(n2786) );
  EDFFX1 R10_reg_21_ ( .D(data_in_2[89]), .E(n3537), .CK(clk), .QN(n732) );
  EDFFX1 R10_reg_5_ ( .D(data_in_2[73]), .E(n3536), .CK(clk), .QN(n748) );
  EDFFX1 R10_reg_4_ ( .D(data_in_2[72]), .E(n3538), .CK(clk), .QN(n749) );
  EDFFX1 R10_reg_25_ ( .D(data_in_2[93]), .E(n3538), .CK(clk), .QN(n728) );
  EDFFX1 R14_reg_29_ ( .D(data_in_2[97]), .E(n3516), .CK(clk), .QN(n758) );
  EDFFX1 R10_reg_6_ ( .D(data_in_2[74]), .E(n3538), .CK(clk), .QN(n747) );
  EDFFX1 R10_reg_22_ ( .D(data_in_2[90]), .E(n3538), .CK(clk), .QN(n731) );
  EDFFX1 R12_reg_32_ ( .D(data_in_2[32]), .E(n3515), .CK(clk), .Q(n2776) );
  EDFFX1 R4_reg_32_ ( .D(data_in_2[32]), .E(n3533), .CK(clk), .Q(n2777) );
  EDFFX1 R0_reg_32_ ( .D(data_in_2[32]), .E(n3508), .CK(clk), .Q(n1553) );
  EDFFX1 R8_reg_32_ ( .D(data_in_2[32]), .E(n3536), .CK(clk), .Q(n1399) );
  EDFFX1 R15_reg_22_ ( .D(data_in_2[124]), .E(n3514), .CK(clk), .QN(n799) );
  EDFFX1 R3_reg_26_ ( .D(data_in_2[128]), .E(n3508), .CK(clk), .QN(n863) );
  EDFFX1 R3_reg_5_ ( .D(data_in_2[107]), .E(n3510), .CK(clk), .QN(n884) );
  EDFFX1 R15_reg_29_ ( .D(data_in_2[131]), .E(n3514), .CK(clk), .QN(n792) );
  EDFFX1 R3_reg_29_ ( .D(data_in_2[131]), .E(n3508), .CK(clk), .QN(n860) );
  EDFFX1 R3_reg_14_ ( .D(data_in_2[116]), .E(n3508), .CK(clk), .QN(n875) );
  EDFFX1 R15_reg_14_ ( .D(data_in_2[116]), .E(n3514), .CK(clk), .QN(n807) );
  EDFFX1 R2_reg_10_ ( .D(data_in_2[78]), .E(n3510), .CK(clk), .QN(n845) );
  EDFFX1 R15_reg_16_ ( .D(data_in_2[118]), .E(n3514), .CK(clk), .QN(n805) );
  EDFFX1 R11_reg_24_ ( .D(data_in_2[126]), .E(n3538), .CK(clk), .QN(n695) );
  EDFFX1 R14_reg_16_ ( .D(data_in_2[84]), .E(n3516), .CK(clk), .QN(n771) );
  EDFFX1 R14_reg_32_ ( .D(data_in_2[100]), .E(n3515), .CK(clk), .QN(n755) );
  EDFFX1 R11_reg_28_ ( .D(data_in_2[130]), .E(n3537), .CK(clk), .QN(n691) );
  EDFFX1 R7_reg_10_ ( .D(data_in_2[112]), .E(n3533), .CK(clk), .QN(n947) );
  EDFFX1 R7_reg_27_ ( .D(data_in_2[129]), .E(n3534), .CK(clk), .QN(n930) );
  EDFFX1 R11_reg_6_ ( .D(data_in_2[108]), .E(n3538), .CK(clk), .QN(n713) );
  EDFFX1 R7_reg_30_ ( .D(data_in_2[132]), .E(n3533), .CK(clk), .QN(n927) );
  EDFFX1 R11_reg_30_ ( .D(data_in_2[132]), .E(n3536), .CK(clk), .QN(n689) );
  EDFFX1 R15_reg_15_ ( .D(data_in_2[117]), .E(n3514), .CK(clk), .QN(n2783) );
  EDFFX1 R10_reg_12_ ( .D(data_in_2[80]), .E(n3537), .CK(clk), .QN(n741) );
  EDFFX1 R10_reg_11_ ( .D(data_in_2[79]), .E(n3536), .CK(clk), .QN(n742) );
  EDFFX1 R10_reg_23_ ( .D(data_in_2[91]), .E(n3537), .CK(clk), .QN(n730) );
  EDFFX1 R2_reg_24_ ( .D(data_in_2[92]), .E(n3508), .CK(clk), .QN(n831) );
  EDFFX1 R2_reg_8_ ( .D(data_in_2[76]), .E(n3509), .CK(clk), .QN(n847) );
  EDFFX1 R14_reg_31_ ( .D(data_in_2[99]), .E(n3516), .CK(clk), .QN(n756) );
  EDFFX1 R6_reg_27_ ( .D(data_in_2[95]), .E(n3534), .CK(clk), .QN(n896) );
  EDFFX1 R6_reg_13_ ( .D(data_in_2[81]), .E(n3534), .CK(clk), .QN(n910) );
  EDFFX1 R14_reg_30_ ( .D(data_in_2[98]), .E(n3514), .CK(clk), .QN(n1940) );
  EDFFX1 R15_reg_23_ ( .D(data_in_2[125]), .E(n3514), .CK(clk), .QN(n798) );
  EDFFX1 R2_reg_9_ ( .D(data_in_2[77]), .E(n3510), .CK(clk), .QN(n846) );
  EDFFX1 R2_reg_26_ ( .D(data_in_2[94]), .E(n3509), .CK(clk), .QN(n829) );
  EDFFXL R2_reg_14_ ( .D(data_in_2[82]), .E(n3508), .CK(clk), .QN(n841) );
  EDFFXL R10_reg_14_ ( .D(data_in_2[82]), .E(n3536), .CK(clk), .QN(n739) );
  EDFFXL R14_reg_14_ ( .D(data_in_2[82]), .E(n3512), .CK(clk), .QN(n773) );
  EDFFXL R14_reg_15_ ( .D(data_in_2[83]), .E(n3514), .CK(clk), .QN(n1918) );
  EDFFXL R6_reg_15_ ( .D(data_in_2[83]), .E(n3533), .CK(clk), .QN(n1914) );
  EDFFXL R2_reg_15_ ( .D(data_in_2[83]), .E(n3508), .CK(clk), .QN(n1912) );
  EDFFXL R10_reg_15_ ( .D(data_in_2[83]), .E(n3538), .CK(clk), .QN(n1916) );
  EDFFXL R14_reg_28_ ( .D(data_in_2[96]), .E(n3512), .CK(clk), .QN(n759) );
  EDFFXL R2_reg_28_ ( .D(data_in_2[96]), .E(n3509), .CK(clk), .QN(n827) );
  EDFFXL R10_reg_28_ ( .D(data_in_2[96]), .E(n3536), .CK(clk), .QN(n725) );
  EDFFXL R6_reg_28_ ( .D(data_in_2[96]), .E(n840), .CK(clk), .QN(n895) );
  EDFFXL R5_reg_28_ ( .D(data_in_2[62]), .E(n3535), .CK(clk), .Q(R5[28]) );
  EDFFXL R13_reg_28_ ( .D(data_in_2[62]), .E(n3514), .CK(clk), .Q(R13[28]) );
  EDFFXL R9_reg_28_ ( .D(data_in_2[62]), .E(n3538), .CK(clk), .Q(R9[28]) );
  EDFFXL R1_reg_28_ ( .D(data_in_2[62]), .E(n3509), .CK(clk), .Q(R1[28]) );
  EDFFXL R7_reg_31_ ( .D(data_in_2[133]), .E(n3533), .CK(clk), .QN(n926) );
  EDFFXL R11_reg_31_ ( .D(data_in_2[133]), .E(n3536), .CK(clk), .QN(n688) );
  EDFFXL R3_reg_31_ ( .D(data_in_2[133]), .E(n3508), .CK(clk), .QN(n858) );
  EDFFXL R15_reg_31_ ( .D(data_in_2[133]), .E(n3515), .CK(clk), .QN(n790) );
  DFFXL counter1_reg_0_ ( .D(n1116), .CK(clk), .Q(n874), .QN(n2829) );
  EDFFXL R8_reg_31_ ( .D(data_in_2[31]), .E(n3537), .CK(clk), .Q(R8[31]) );
  EDFFXL R0_reg_31_ ( .D(data_in_2[31]), .E(n1151), .CK(clk), .Q(R0[31]) );
  EDFFXL R4_reg_31_ ( .D(data_in_2[31]), .E(n840), .CK(clk), .Q(R4[31]) );
  EDFFXL R8_reg_12_ ( .D(data_in_2[12]), .E(n3536), .CK(clk), .Q(R8[12]) );
  EDFFXL R0_reg_12_ ( .D(data_in_2[12]), .E(n1151), .CK(clk), .Q(R0[12]) );
  EDFFXL R4_reg_12_ ( .D(data_in_2[12]), .E(n840), .CK(clk), .Q(R4[12]) );
  EDFFXL R9_reg_30_ ( .D(data_in_2[64]), .E(n3538), .CK(clk), .Q(R9[30]) );
  EDFFXL R1_reg_30_ ( .D(data_in_2[64]), .E(n1151), .CK(clk), .Q(R1[30]) );
  EDFFXL R5_reg_30_ ( .D(data_in_2[64]), .E(n840), .CK(clk), .Q(R5[30]) );
  EDFFXL R9_reg_29_ ( .D(data_in_2[63]), .E(n3537), .CK(clk), .Q(R9[29]) );
  EDFFXL R1_reg_29_ ( .D(data_in_2[63]), .E(n1151), .CK(clk), .Q(R1[29]) );
  EDFFXL R5_reg_29_ ( .D(data_in_2[63]), .E(n840), .CK(clk), .Q(R5[29]) );
  EDFFXL R8_reg_11_ ( .D(data_in_2[11]), .E(n3536), .CK(clk), .Q(R8[11]) );
  EDFFXL R0_reg_11_ ( .D(data_in_2[11]), .E(n1151), .CK(clk), .Q(R0[11]) );
  EDFFXL R4_reg_11_ ( .D(data_in_2[11]), .E(n840), .CK(clk), .Q(R4[11]) );
  EDFFXL R9_reg_14_ ( .D(data_in_2[48]), .E(n3538), .CK(clk), .Q(R9[14]) );
  EDFFXL R1_reg_14_ ( .D(data_in_2[48]), .E(n1151), .CK(clk), .Q(R1[14]) );
  EDFFXL R5_reg_14_ ( .D(data_in_2[48]), .E(n840), .CK(clk), .Q(R5[14]) );
  EDFFXL R8_reg_13_ ( .D(data_in_2[13]), .E(n3537), .CK(clk), .Q(R8[13]) );
  EDFFXL R0_reg_13_ ( .D(data_in_2[13]), .E(n1151), .CK(clk), .Q(R0[13]) );
  EDFFXL R4_reg_13_ ( .D(data_in_2[13]), .E(n840), .CK(clk), .Q(R4[13]) );
  EDFFXL R8_reg_30_ ( .D(data_in_2[30]), .E(n3536), .CK(clk), .Q(R8[30]) );
  EDFFXL R4_reg_30_ ( .D(data_in_2[30]), .E(n840), .CK(clk), .Q(R4[30]) );
  EDFFXL R0_reg_30_ ( .D(data_in_2[30]), .E(n1151), .CK(clk), .Q(R0[30]) );
  EDFFXL R0_reg_14_ ( .D(data_in_2[14]), .E(n1151), .CK(clk), .Q(R0[14]) );
  EDFFXL R8_reg_14_ ( .D(data_in_2[14]), .E(n3538), .CK(clk), .Q(R8[14]) );
  EDFFXL R4_reg_14_ ( .D(data_in_2[14]), .E(n840), .CK(clk), .Q(R4[14]) );
  DFFXL reg_flag_mux_reg ( .D(n1253), .CK(clk), .Q(reg_flag_mux), .QN(n3556)
         );
  EDFFX1 R12_reg_30_ ( .D(data_in_2[30]), .E(n1150), .CK(clk), .Q(R12[30]) );
  EDFFX1 R12_reg_13_ ( .D(data_in_2[13]), .E(n1150), .CK(clk), .Q(R12[13]) );
  EDFFX1 R12_reg_11_ ( .D(data_in_2[11]), .E(n1150), .CK(clk), .Q(R12[11]) );
  EDFFX1 R13_reg_14_ ( .D(data_in_2[48]), .E(n1150), .CK(clk), .Q(R13[14]) );
  EDFFX1 R13_reg_29_ ( .D(data_in_2[63]), .E(n1150), .CK(clk), .Q(R13[29]) );
  EDFFX1 R13_reg_30_ ( .D(data_in_2[64]), .E(n1150), .CK(clk), .Q(R13[30]) );
  EDFFX1 R12_reg_12_ ( .D(data_in_2[12]), .E(n1150), .CK(clk), .Q(R12[12]) );
  EDFFX1 R12_reg_31_ ( .D(data_in_2[31]), .E(n1150), .CK(clk), .Q(R12[31]) );
  OR2X2 U3 ( .A(counter2[1]), .B(counter2[0]), .Y(n2830) );
  OR2X2 U4 ( .A(n648), .B(counter2[1]), .Y(n2831) );
  NOR3X2 U5 ( .A(\counter1[1] ), .B(n2829), .C(n942), .Y(n1151) );
  INVX2 U6 ( .A(n963), .Y(n656) );
  CLKINVX3 U7 ( .A(n3511), .Y(n3508) );
  CLKINVX3 U8 ( .A(n3511), .Y(n3509) );
  CLKINVX3 U9 ( .A(n3513), .Y(n3514) );
  CLKINVX3 U10 ( .A(n3513), .Y(n3515) );
  CLKINVX3 U11 ( .A(n3511), .Y(n3510) );
  INVX1 U12 ( .A(n1109), .Y(n3547) );
  INVX1 U13 ( .A(n1109), .Y(n3552) );
  INVX1 U14 ( .A(n1109), .Y(n3551) );
  INVX1 U15 ( .A(n1109), .Y(n3550) );
  INVX1 U16 ( .A(n1109), .Y(n3549) );
  INVX1 U17 ( .A(n1109), .Y(n3548) );
  INVX1 U18 ( .A(n1109), .Y(n3546) );
  CLKINVX3 U19 ( .A(n3507), .Y(n3536) );
  CLKINVX3 U20 ( .A(n979), .Y(n3533) );
  CLKINVX3 U21 ( .A(n979), .Y(n3534) );
  CLKINVX3 U22 ( .A(n979), .Y(n3535) );
  CLKINVX3 U23 ( .A(n3507), .Y(n3537) );
  CLKINVX3 U24 ( .A(n3507), .Y(n3538) );
  INVX1 U25 ( .A(n3513), .Y(n3516) );
  INVX1 U26 ( .A(n1151), .Y(n3511) );
  INVX1 U27 ( .A(n1006), .Y(n3540) );
  INVX1 U28 ( .A(n1006), .Y(n3539) );
  INVX1 U29 ( .A(n1006), .Y(n3545) );
  INVX1 U30 ( .A(n1006), .Y(n3542) );
  INVX1 U31 ( .A(n1006), .Y(n3544) );
  INVX1 U32 ( .A(n1006), .Y(n3543) );
  INVX1 U33 ( .A(n1006), .Y(n3541) );
  INVX1 U34 ( .A(n3513), .Y(n3512) );
  INVX1 U35 ( .A(n1109), .Y(n646) );
  INVX1 U36 ( .A(n2830), .Y(n3517) );
  INVX1 U37 ( .A(n2830), .Y(n3518) );
  INVX1 U38 ( .A(n2830), .Y(n3523) );
  INVX1 U39 ( .A(n2830), .Y(n3524) );
  INVX1 U40 ( .A(n2830), .Y(n3522) );
  INVX1 U41 ( .A(n2830), .Y(n3520) );
  INVX1 U42 ( .A(n2830), .Y(n3521) );
  INVX1 U43 ( .A(n2830), .Y(n3519) );
  INVX1 U44 ( .A(n2831), .Y(n3525) );
  INVX1 U45 ( .A(n2831), .Y(n3527) );
  INVX1 U46 ( .A(n2831), .Y(n3532) );
  INVX1 U47 ( .A(n2831), .Y(n3526) );
  INVX1 U48 ( .A(n2831), .Y(n3531) );
  INVX1 U49 ( .A(n2831), .Y(n3530) );
  INVX1 U50 ( .A(n2831), .Y(n3529) );
  INVX1 U51 ( .A(n2831), .Y(n3528) );
  INVX1 U52 ( .A(n1003), .Y(n908) );
  INVX1 U53 ( .A(n979), .Y(n840) );
  INVX1 U54 ( .A(n1150), .Y(n3513) );
  INVX1 U55 ( .A(n1006), .Y(n649) );
  NOR2X1 U56 ( .A(n650), .B(n648), .Y(n1109) );
  CLKINVX3 U57 ( .A(n3556), .Y(n3554) );
  CLKINVX3 U58 ( .A(n3556), .Y(n3555) );
  AOI22X1 U59 ( .A0(n3513), .A1(R12[16]), .B0(data_in_2[16]), .B1(n3515), .Y(
        n963) );
  INVX1 U60 ( .A(n962), .Y(n655) );
  AOI22X1 U61 ( .A0(n3513), .A1(R13[15]), .B0(n3514), .B1(data_in_2[49]), .Y(
        n962) );
  INVX1 U62 ( .A(n994), .Y(n666) );
  AOI22X1 U63 ( .A0(n3507), .A1(R9[15]), .B0(data_in_2[49]), .B1(n3537), .Y(
        n994) );
  INVX1 U64 ( .A(n974), .Y(n679) );
  AOI22X1 U65 ( .A0(n3511), .A1(R1[15]), .B0(data_in_2[49]), .B1(n3510), .Y(
        n974) );
  INVX1 U66 ( .A(n983), .Y(n737) );
  AOI22X1 U67 ( .A0(n979), .A1(R5[15]), .B0(data_in_2[49]), .B1(n3535), .Y(
        n983) );
  OAI32X1 U68 ( .A0(n1003), .A1(n1012), .A2(counter2[0]), .B0(n648), .B1(n908), 
        .Y(n1114) );
  OAI22X1 U69 ( .A0(n650), .A1(n908), .B0(n1012), .B1(n1004), .Y(n1113) );
  AOI21X1 U70 ( .A0(n3525), .A1(n908), .B0(n1006), .Y(n1004) );
  NOR2X1 U71 ( .A(n1012), .B(n3553), .Y(n1003) );
  AOI31X1 U72 ( .A0(n979), .A1(n3511), .A2(n1002), .B0(n1012), .Y(n1115) );
  NAND2X1 U73 ( .A(\counter1[1] ), .B(n942), .Y(n1002) );
  NOR2X1 U74 ( .A(n1012), .B(n1000), .Y(n1253) );
  AOI22X1 U75 ( .A0(n3553), .A1(n3546), .B0(\counter1[1] ), .B1(n874), .Y(
        n1000) );
  NOR2X1 U76 ( .A(n1012), .B(n1001), .Y(n1116) );
  XNOR2X1 U77 ( .A(n942), .B(n2829), .Y(n1001) );
  INVX1 U78 ( .A(reg_datain_flag), .Y(n942) );
  NOR3X1 U79 ( .A(n874), .B(\counter1[1] ), .C(n942), .Y(n1150) );
  NAND3X1 U80 ( .A(reg_datain_flag), .B(n2829), .C(\counter1[1] ), .Y(n979) );
  BUFX3 U81 ( .A(n990), .Y(n3507) );
  NAND3X1 U82 ( .A(reg_datain_flag), .B(n874), .C(\counter1[1] ), .Y(n990) );
  NOR2X1 U83 ( .A(n650), .B(counter2[0]), .Y(n1006) );
  OAI221XL U84 ( .A0(n837), .A1(n3540), .B0(n871), .B1(n3547), .C0(n1038), .Y(
        N70) );
  AOI22X1 U85 ( .A0(n3518), .A1(R0[18]), .B0(n3527), .B1(R1[18]), .Y(n1038) );
  OAI221XL U86 ( .A0(n855), .A1(n3541), .B0(n889), .B1(n3548), .C0(n1056), .Y(
        N52) );
  AOI22X1 U87 ( .A0(n3520), .A1(R0[0]), .B0(n3528), .B1(R1[0]), .Y(n1056) );
  OAI221XL U88 ( .A0(n854), .A1(n3542), .B0(n888), .B1(n3548), .C0(n1055), .Y(
        N53) );
  AOI22X1 U89 ( .A0(n3519), .A1(R0[1]), .B0(n3528), .B1(R1[1]), .Y(n1055) );
  OAI221XL U90 ( .A0(n836), .A1(n3540), .B0(n870), .B1(n3547), .C0(n1037), .Y(
        N71) );
  AOI22X1 U91 ( .A0(n3518), .A1(R0[19]), .B0(n3526), .B1(R1[19]), .Y(n1037) );
  OAI221XL U92 ( .A0(n838), .A1(n3540), .B0(n872), .B1(n3547), .C0(n1039), .Y(
        N69) );
  AOI22X1 U93 ( .A0(n3518), .A1(R0[17]), .B0(n3526), .B1(R1[17]), .Y(n1039) );
  OAI221XL U94 ( .A0(n850), .A1(n3541), .B0(n884), .B1(n3548), .C0(n1051), .Y(
        N57) );
  AOI22X1 U95 ( .A0(n3519), .A1(R0[5]), .B0(n3527), .B1(R1[5]), .Y(n1051) );
  OAI221XL U96 ( .A0(n849), .A1(n3541), .B0(n883), .B1(n3548), .C0(n1050), .Y(
        N58) );
  AOI22X1 U97 ( .A0(n3519), .A1(R0[6]), .B0(n3527), .B1(R1[6]), .Y(n1050) );
  OAI221XL U98 ( .A0(n853), .A1(n3541), .B0(n887), .B1(n3548), .C0(n1054), .Y(
        N54) );
  AOI22X1 U99 ( .A0(n3519), .A1(R0[2]), .B0(n3528), .B1(R1[2]), .Y(n1054) );
  OAI221XL U100 ( .A0(n851), .A1(n3541), .B0(n885), .B1(n3548), .C0(n1052), 
        .Y(N56) );
  AOI22X1 U101 ( .A0(n3519), .A1(R0[4]), .B0(n3528), .B1(R1[4]), .Y(n1052) );
  OAI221XL U102 ( .A0(n833), .A1(n3540), .B0(n867), .B1(n3547), .C0(n1034), 
        .Y(N74) );
  AOI22X1 U103 ( .A0(n3518), .A1(R0[22]), .B0(n3527), .B1(R1[22]), .Y(n1034)
         );
  OAI221XL U104 ( .A0(n852), .A1(n3541), .B0(n886), .B1(n3548), .C0(n1053), 
        .Y(N55) );
  AOI22X1 U105 ( .A0(n3519), .A1(R0[3]), .B0(n3528), .B1(R1[3]), .Y(n1053) );
  OAI221XL U106 ( .A0(n848), .A1(n3541), .B0(n882), .B1(n3548), .C0(n1049), 
        .Y(N59) );
  AOI22X1 U107 ( .A0(n3519), .A1(R0[7]), .B0(n3527), .B1(R1[7]), .Y(n1049) );
  OAI221XL U108 ( .A0(n835), .A1(n3540), .B0(n869), .B1(n3547), .C0(n1036), 
        .Y(N72) );
  AOI22X1 U109 ( .A0(n3518), .A1(R0[20]), .B0(n3527), .B1(R1[20]), .Y(n1036)
         );
  OAI221XL U110 ( .A0(n834), .A1(n3540), .B0(n868), .B1(n3547), .C0(n1035), 
        .Y(N73) );
  AOI22X1 U111 ( .A0(n3518), .A1(R0[21]), .B0(n3526), .B1(R1[21]), .Y(n1035)
         );
  OAI221XL U112 ( .A0(n832), .A1(n3540), .B0(n866), .B1(n3547), .C0(n1033), 
        .Y(N75) );
  AOI22X1 U113 ( .A0(n3518), .A1(R0[23]), .B0(n3526), .B1(R1[23]), .Y(n1033)
         );
  OAI221XL U114 ( .A0(n847), .A1(n3541), .B0(n881), .B1(n3548), .C0(n1048), 
        .Y(N60) );
  AOI22X1 U115 ( .A0(n3519), .A1(R0[8]), .B0(n3527), .B1(R1[8]), .Y(n1048) );
  OAI221XL U116 ( .A0(n846), .A1(n3541), .B0(n880), .B1(n3548), .C0(n1047), 
        .Y(N61) );
  AOI22X1 U117 ( .A0(n3519), .A1(R0[9]), .B0(n3527), .B1(R1[9]), .Y(n1047) );
  OAI221XL U118 ( .A0(n845), .A1(n3541), .B0(n879), .B1(n3548), .C0(n1046), 
        .Y(N62) );
  AOI22X1 U119 ( .A0(n3519), .A1(R0[10]), .B0(n3528), .B1(R1[10]), .Y(n1046)
         );
  OAI221XL U120 ( .A0(n844), .A1(n3543), .B0(n878), .B1(n3548), .C0(n1045), 
        .Y(N63) );
  AOI22X1 U121 ( .A0(n3519), .A1(R0[11]), .B0(n3527), .B1(R1[11]), .Y(n1045)
         );
  OAI221XL U122 ( .A0(n831), .A1(n3539), .B0(n865), .B1(n3547), .C0(n1032), 
        .Y(N76) );
  AOI22X1 U123 ( .A0(n3518), .A1(R0[24]), .B0(n3527), .B1(R1[24]), .Y(n1032)
         );
  OAI221XL U124 ( .A0(n830), .A1(n3540), .B0(n864), .B1(n3547), .C0(n1031), 
        .Y(N77) );
  AOI22X1 U125 ( .A0(n3520), .A1(R0[25]), .B0(n3526), .B1(R1[25]), .Y(n1031)
         );
  OAI221XL U126 ( .A0(n829), .A1(n3539), .B0(n863), .B1(n3547), .C0(n1030), 
        .Y(N78) );
  AOI22X1 U127 ( .A0(n3518), .A1(R0[26]), .B0(n3527), .B1(R1[26]), .Y(n1030)
         );
  OAI221XL U128 ( .A0(n828), .A1(n3539), .B0(n862), .B1(n3547), .C0(n1029), 
        .Y(N79) );
  AOI22X1 U129 ( .A0(n3518), .A1(R0[27]), .B0(n3526), .B1(R1[27]), .Y(n1029)
         );
  OAI221XL U130 ( .A0(n827), .A1(n3539), .B0(n861), .B1(n3547), .C0(n1028), 
        .Y(N80) );
  AOI22X1 U131 ( .A0(n3518), .A1(R0[28]), .B0(n3526), .B1(R1[28]), .Y(n1028)
         );
  OAI221XL U132 ( .A0(n826), .A1(n3539), .B0(n860), .B1(n3547), .C0(n1027), 
        .Y(N81) );
  AOI22X1 U133 ( .A0(n3522), .A1(R0[29]), .B0(n3526), .B1(R1[29]), .Y(n1027)
         );
  OAI221XL U134 ( .A0(n843), .A1(n3540), .B0(n877), .B1(n3548), .C0(n1044), 
        .Y(N64) );
  AOI22X1 U135 ( .A0(n3519), .A1(R0[12]), .B0(n2765), .B1(n3528), .Y(n1044) );
  OAI221XL U136 ( .A0(n842), .A1(n3540), .B0(n876), .B1(n3548), .C0(n1043), 
        .Y(N65) );
  AOI22X1 U137 ( .A0(n3518), .A1(R0[13]), .B0(n2769), .B1(n3530), .Y(n1043) );
  OAI221XL U138 ( .A0(n841), .A1(n3540), .B0(n875), .B1(n3547), .C0(n1042), 
        .Y(N66) );
  AOI22X1 U139 ( .A0(n3518), .A1(R0[14]), .B0(n3529), .B1(R1[14]), .Y(n1042)
         );
  OAI221XL U140 ( .A0(n825), .A1(n3540), .B0(n859), .B1(n3547), .C0(n1026), 
        .Y(N82) );
  AOI22X1 U141 ( .A0(n3523), .A1(R0[30]), .B0(n3526), .B1(R1[30]), .Y(n1026)
         );
  OAI221XL U142 ( .A0(n824), .A1(n3539), .B0(n858), .B1(n3547), .C0(n1025), 
        .Y(N83) );
  AOI22X1 U143 ( .A0(n3517), .A1(R0[31]), .B0(n3525), .B1(n1404), .Y(n1025) );
  OAI221XL U144 ( .A0(n3545), .A1(n1912), .B0(n2786), .B1(n3547), .C0(n1041), 
        .Y(N67) );
  AOI22X1 U145 ( .A0(n3518), .A1(n1418), .B0(n3527), .B1(R1[15]), .Y(n1041) );
  OAI221XL U146 ( .A0(n839), .A1(n3540), .B0(n873), .B1(n3547), .C0(n1040), 
        .Y(N68) );
  AOI22X1 U147 ( .A0(n2773), .A1(n3517), .B0(n2775), .B1(n3532), .Y(n1040) );
  OAI221XL U148 ( .A0(n778), .A1(n3543), .B0(n812), .B1(n3550), .C0(n1081), 
        .Y(N163) );
  AOI22X1 U149 ( .A0(n3521), .A1(R12[9]), .B0(n3530), .B1(R13[9]), .Y(n1081)
         );
  OAI221XL U150 ( .A0(n777), .A1(n3543), .B0(n811), .B1(n3550), .C0(n1080), 
        .Y(N164) );
  AOI22X1 U151 ( .A0(n3522), .A1(R12[10]), .B0(n3529), .B1(R13[10]), .Y(n1080)
         );
  OAI221XL U152 ( .A0(n776), .A1(n3543), .B0(n810), .B1(n3550), .C0(n1079), 
        .Y(N165) );
  AOI22X1 U153 ( .A0(n3519), .A1(R12[11]), .B0(n3529), .B1(R13[11]), .Y(n1079)
         );
  OAI221XL U154 ( .A0(n893), .A1(n3539), .B0(n927), .B1(n3552), .C0(n1133), 
        .Y(N116) );
  AOI22X1 U155 ( .A0(n3524), .A1(R4[30]), .B0(n3529), .B1(R5[30]), .Y(n1133)
         );
  OAI221XL U156 ( .A0(n892), .A1(n3543), .B0(n926), .B1(n3552), .C0(n1132), 
        .Y(N117) );
  AOI22X1 U157 ( .A0(n3524), .A1(R4[31]), .B0(n3531), .B1(n1400), .Y(n1132) );
  OAI221XL U158 ( .A0(n891), .A1(n3541), .B0(n925), .B1(n3552), .C0(n1131), 
        .Y(N118) );
  AOI22X1 U159 ( .A0(n2777), .A1(n3517), .B0(n3529), .B1(n1397), .Y(n1131) );
  OAI221XL U160 ( .A0(n739), .A1(n3545), .B0(n705), .B1(n3551), .C0(n1111), 
        .Y(N134) );
  AOI22X1 U161 ( .A0(n3523), .A1(R8[14]), .B0(n3532), .B1(R9[14]), .Y(n1111)
         );
  OAI221XL U162 ( .A0(n722), .A1(n3544), .B0(n688), .B1(n3550), .C0(n1093), 
        .Y(N151) );
  AOI22X1 U163 ( .A0(n3521), .A1(R8[31]), .B0(n3530), .B1(n1402), .Y(n1093) );
  OAI221XL U164 ( .A0(n721), .A1(n3544), .B0(n687), .B1(n3550), .C0(n1092), 
        .Y(N152) );
  AOI22X1 U165 ( .A0(n3521), .A1(n1399), .B0(n3530), .B1(n1398), .Y(n1092) );
  OAI221XL U166 ( .A0(n774), .A1(n3543), .B0(n808), .B1(n3549), .C0(n1077), 
        .Y(N167) );
  AOI22X1 U167 ( .A0(n3518), .A1(R12[13]), .B0(n2766), .B1(n3529), .Y(n1077)
         );
  OAI221XL U168 ( .A0(n773), .A1(n3543), .B0(n807), .B1(n3549), .C0(n1076), 
        .Y(N168) );
  AOI22X1 U169 ( .A0(n3524), .A1(n1410), .B0(n3529), .B1(R13[14]), .Y(n1076)
         );
  OAI221XL U170 ( .A0(n756), .A1(n3542), .B0(n790), .B1(n3548), .C0(n1059), 
        .Y(N185) );
  AOI22X1 U171 ( .A0(n3520), .A1(R12[31]), .B0(n3528), .B1(n1401), .Y(n1059)
         );
  OAI221XL U172 ( .A0(n755), .A1(n3541), .B0(n789), .B1(n3548), .C0(n1058), 
        .Y(N186) );
  AOI22X1 U173 ( .A0(n2776), .A1(n3517), .B0(n2771), .B1(n3525), .Y(n1058) );
  OAI221XL U174 ( .A0(n3544), .A1(n1940), .B0(n2770), .B1(n3548), .C0(n1060), 
        .Y(N184) );
  AOI22X1 U175 ( .A0(n3520), .A1(R12[30]), .B0(n3528), .B1(R13[30]), .Y(n1060)
         );
  OAI221XL U176 ( .A0(n3544), .A1(n1916), .B0(n2784), .B1(n3551), .C0(n1110), 
        .Y(N135) );
  AOI22X1 U177 ( .A0(n3522), .A1(n1413), .B0(n3532), .B1(R9[15]), .Y(n1110) );
  OAI221XL U178 ( .A0(n3542), .A1(n1918), .B0(n2783), .B1(n3549), .C0(n1075), 
        .Y(N169) );
  AOI22X1 U179 ( .A0(n3523), .A1(n1417), .B0(n3529), .B1(R13[15]), .Y(n1075)
         );
  OAI221XL U180 ( .A0(n782), .A1(n3544), .B0(n816), .B1(n3550), .C0(n1085), 
        .Y(N159) );
  AOI22X1 U181 ( .A0(n3521), .A1(R12[5]), .B0(n3530), .B1(R13[5]), .Y(n1085)
         );
  OAI221XL U182 ( .A0(n765), .A1(n3542), .B0(n799), .B1(n3549), .C0(n1068), 
        .Y(N176) );
  AOI22X1 U183 ( .A0(n3520), .A1(R12[22]), .B0(n3529), .B1(R13[22]), .Y(n1068)
         );
  OAI221XL U184 ( .A0(n764), .A1(n3542), .B0(n798), .B1(n3549), .C0(n1067), 
        .Y(N177) );
  AOI22X1 U185 ( .A0(n3520), .A1(R12[23]), .B0(n3529), .B1(R13[23]), .Y(n1067)
         );
  OAI221XL U186 ( .A0(n781), .A1(n3544), .B0(n815), .B1(n3550), .C0(n1084), 
        .Y(N160) );
  AOI22X1 U187 ( .A0(n3521), .A1(R12[6]), .B0(n3530), .B1(R13[6]), .Y(n1084)
         );
  OAI221XL U188 ( .A0(n726), .A1(n3540), .B0(n692), .B1(n3551), .C0(n1097), 
        .Y(N147) );
  AOI22X1 U189 ( .A0(n3522), .A1(R8[27]), .B0(n3531), .B1(R9[27]), .Y(n1097)
         );
  OAI221XL U190 ( .A0(n727), .A1(n3539), .B0(n693), .B1(n3551), .C0(n1098), 
        .Y(N146) );
  AOI22X1 U191 ( .A0(n3522), .A1(R8[26]), .B0(n3531), .B1(R9[26]), .Y(n1098)
         );
  OAI221XL U192 ( .A0(n735), .A1(n3543), .B0(n701), .B1(n3551), .C0(n1106), 
        .Y(N138) );
  AOI22X1 U193 ( .A0(n3522), .A1(R8[18]), .B0(n3531), .B1(R9[18]), .Y(n1106)
         );
  OAI221XL U194 ( .A0(n752), .A1(n3545), .B0(n718), .B1(n3552), .C0(n1128), 
        .Y(N121) );
  AOI22X1 U195 ( .A0(n3524), .A1(R8[1]), .B0(n3532), .B1(R9[1]), .Y(n1128) );
  OAI221XL U196 ( .A0(n767), .A1(n3542), .B0(n801), .B1(n3549), .C0(n1070), 
        .Y(N174) );
  AOI22X1 U197 ( .A0(n3520), .A1(R12[20]), .B0(n3529), .B1(R13[20]), .Y(n1070)
         );
  OAI221XL U198 ( .A0(n733), .A1(n3541), .B0(n699), .B1(n3551), .C0(n1104), 
        .Y(N140) );
  AOI22X1 U199 ( .A0(n3522), .A1(R8[20]), .B0(n3531), .B1(R9[20]), .Y(n1104)
         );
  OAI221XL U200 ( .A0(n783), .A1(n3544), .B0(n817), .B1(n3550), .C0(n1086), 
        .Y(N158) );
  AOI22X1 U201 ( .A0(n3521), .A1(R12[4]), .B0(n3530), .B1(R13[4]), .Y(n1086)
         );
  OAI221XL U202 ( .A0(n746), .A1(n3545), .B0(n712), .B1(n3552), .C0(n1122), 
        .Y(N127) );
  AOI22X1 U203 ( .A0(n3523), .A1(R8[7]), .B0(n3532), .B1(R9[7]), .Y(n1122) );
  OAI221XL U204 ( .A0(n729), .A1(n3544), .B0(n695), .B1(n3551), .C0(n1100), 
        .Y(N144) );
  AOI22X1 U205 ( .A0(n3522), .A1(R8[24]), .B0(n3531), .B1(R9[24]), .Y(n1100)
         );
  OAI221XL U206 ( .A0(n728), .A1(n3542), .B0(n694), .B1(n3551), .C0(n1099), 
        .Y(N145) );
  AOI22X1 U207 ( .A0(n3522), .A1(R8[25]), .B0(n3531), .B1(R9[25]), .Y(n1099)
         );
  OAI221XL U208 ( .A0(n898), .A1(n3540), .B0(n932), .B1(n3552), .C0(n1138), 
        .Y(N111) );
  AOI22X1 U209 ( .A0(n3524), .A1(R4[25]), .B0(n3526), .B1(R5[25]), .Y(n1138)
         );
  OAI221XL U210 ( .A0(n745), .A1(n3545), .B0(n711), .B1(n3552), .C0(n1121), 
        .Y(N128) );
  AOI22X1 U211 ( .A0(n3523), .A1(R8[8]), .B0(n3532), .B1(R9[8]), .Y(n1121) );
  OAI221XL U212 ( .A0(n744), .A1(n3545), .B0(n710), .B1(n3551), .C0(n1120), 
        .Y(N129) );
  AOI22X1 U213 ( .A0(n3523), .A1(R8[9]), .B0(n3532), .B1(R9[9]), .Y(n1120) );
  OAI221XL U214 ( .A0(n897), .A1(n3545), .B0(n931), .B1(n3552), .C0(n1137), 
        .Y(N112) );
  AOI22X1 U215 ( .A0(n3524), .A1(R4[26]), .B0(n3526), .B1(R5[26]), .Y(n1137)
         );
  OAI221XL U216 ( .A0(n896), .A1(n3545), .B0(n930), .B1(n3552), .C0(n1136), 
        .Y(N113) );
  AOI22X1 U217 ( .A0(n3524), .A1(R4[27]), .B0(n3527), .B1(R5[27]), .Y(n1136)
         );
  OAI221XL U218 ( .A0(n725), .A1(n3544), .B0(n691), .B1(n3550), .C0(n1096), 
        .Y(N148) );
  AOI22X1 U219 ( .A0(n3522), .A1(R8[28]), .B0(n3531), .B1(R9[28]), .Y(n1096)
         );
  OAI221XL U220 ( .A0(n743), .A1(n3545), .B0(n709), .B1(n3551), .C0(n1119), 
        .Y(N130) );
  AOI22X1 U221 ( .A0(n3523), .A1(R8[10]), .B0(n3532), .B1(R9[10]), .Y(n1119)
         );
  OAI221XL U222 ( .A0(n724), .A1(n3544), .B0(n690), .B1(n3550), .C0(n1095), 
        .Y(N149) );
  AOI22X1 U223 ( .A0(n3521), .A1(R8[29]), .B0(n3531), .B1(R9[29]), .Y(n1095)
         );
  OAI221XL U224 ( .A0(n775), .A1(n3543), .B0(n809), .B1(n3549), .C0(n1078), 
        .Y(N166) );
  AOI22X1 U225 ( .A0(n3523), .A1(R12[12]), .B0(n2762), .B1(n3525), .Y(n1078)
         );
  OAI221XL U226 ( .A0(n758), .A1(n3542), .B0(n792), .B1(n3549), .C0(n1061), 
        .Y(N183) );
  AOI22X1 U227 ( .A0(n3520), .A1(R12[29]), .B0(n3528), .B1(R13[29]), .Y(n1061)
         );
  OAI221XL U228 ( .A0(n734), .A1(n649), .B0(n700), .B1(n3551), .C0(n1105), .Y(
        N139) );
  AOI22X1 U229 ( .A0(n3522), .A1(R8[19]), .B0(n3531), .B1(R9[19]), .Y(n1105)
         );
  OAI221XL U230 ( .A0(n769), .A1(n3543), .B0(n803), .B1(n3549), .C0(n1072), 
        .Y(N172) );
  AOI22X1 U231 ( .A0(n3517), .A1(R12[18]), .B0(n3529), .B1(R13[18]), .Y(n1072)
         );
  OAI221XL U232 ( .A0(n751), .A1(n3545), .B0(n717), .B1(n3552), .C0(n1127), 
        .Y(N122) );
  AOI22X1 U233 ( .A0(n3523), .A1(R8[2]), .B0(n3532), .B1(R9[2]), .Y(n1127) );
  OAI221XL U234 ( .A0(n766), .A1(n3542), .B0(n800), .B1(n3549), .C0(n1069), 
        .Y(N175) );
  AOI22X1 U235 ( .A0(n3520), .A1(R12[21]), .B0(n3529), .B1(R13[21]), .Y(n1069)
         );
  OAI221XL U236 ( .A0(n786), .A1(n3544), .B0(n820), .B1(n3550), .C0(n1089), 
        .Y(N155) );
  AOI22X1 U237 ( .A0(n3521), .A1(R12[1]), .B0(n3530), .B1(R13[1]), .Y(n1089)
         );
  OAI221XL U238 ( .A0(n731), .A1(n649), .B0(n697), .B1(n3551), .C0(n1102), .Y(
        N142) );
  AOI22X1 U239 ( .A0(n3522), .A1(R8[22]), .B0(n3531), .B1(R9[22]), .Y(n1102)
         );
  OAI221XL U240 ( .A0(n749), .A1(n3545), .B0(n715), .B1(n3552), .C0(n1125), 
        .Y(N124) );
  AOI22X1 U241 ( .A0(n3523), .A1(R8[4]), .B0(n3532), .B1(R9[4]), .Y(n1125) );
  OAI221XL U242 ( .A0(n732), .A1(n3540), .B0(n698), .B1(n3551), .C0(n1103), 
        .Y(N141) );
  AOI22X1 U243 ( .A0(n3522), .A1(R8[21]), .B0(n3531), .B1(R9[21]), .Y(n1103)
         );
  OAI221XL U244 ( .A0(n750), .A1(n3545), .B0(n716), .B1(n3552), .C0(n1126), 
        .Y(N123) );
  AOI22X1 U245 ( .A0(n3523), .A1(R8[3]), .B0(n3532), .B1(R9[3]), .Y(n1126) );
  OAI221XL U246 ( .A0(n784), .A1(n3544), .B0(n818), .B1(n3550), .C0(n1087), 
        .Y(N157) );
  AOI22X1 U247 ( .A0(n3521), .A1(R12[3]), .B0(n3530), .B1(R13[3]), .Y(n1087)
         );
  OAI221XL U248 ( .A0(n785), .A1(n3544), .B0(n819), .B1(n3550), .C0(n1088), 
        .Y(N156) );
  AOI22X1 U249 ( .A0(n3521), .A1(R12[2]), .B0(n3530), .B1(R13[2]), .Y(n1088)
         );
  OAI221XL U250 ( .A0(n768), .A1(n3542), .B0(n802), .B1(n3549), .C0(n1071), 
        .Y(N173) );
  AOI22X1 U251 ( .A0(n3524), .A1(R12[19]), .B0(n3529), .B1(R13[19]), .Y(n1071)
         );
  OAI221XL U252 ( .A0(n747), .A1(n3545), .B0(n713), .B1(n3552), .C0(n1123), 
        .Y(N126) );
  AOI22X1 U253 ( .A0(n3523), .A1(R8[6]), .B0(n3532), .B1(R9[6]), .Y(n1123) );
  OAI221XL U254 ( .A0(n730), .A1(n3539), .B0(n696), .B1(n3551), .C0(n1101), 
        .Y(N143) );
  AOI22X1 U255 ( .A0(n3522), .A1(R8[23]), .B0(n3531), .B1(R9[23]), .Y(n1101)
         );
  OAI221XL U256 ( .A0(n748), .A1(n3545), .B0(n714), .B1(n3552), .C0(n1124), 
        .Y(N125) );
  AOI22X1 U257 ( .A0(n3523), .A1(R8[5]), .B0(n3532), .B1(R9[5]), .Y(n1124) );
  OAI221XL U258 ( .A0(n895), .A1(n3544), .B0(n929), .B1(n3552), .C0(n1135), 
        .Y(N114) );
  AOI22X1 U259 ( .A0(n3524), .A1(R4[28]), .B0(n3530), .B1(R5[28]), .Y(n1135)
         );
  OAI221XL U260 ( .A0(n742), .A1(n3545), .B0(n708), .B1(n3551), .C0(n1118), 
        .Y(N131) );
  AOI22X1 U261 ( .A0(n3523), .A1(R8[11]), .B0(n3532), .B1(R9[11]), .Y(n1118)
         );
  OAI221XL U262 ( .A0(n723), .A1(n3544), .B0(n689), .B1(n3550), .C0(n1094), 
        .Y(N150) );
  AOI22X1 U263 ( .A0(n3521), .A1(R8[30]), .B0(n3530), .B1(R9[30]), .Y(n1094)
         );
  OAI221XL U264 ( .A0(n894), .A1(n3542), .B0(n928), .B1(n3552), .C0(n1134), 
        .Y(N115) );
  AOI22X1 U265 ( .A0(n3524), .A1(R4[29]), .B0(n3528), .B1(R5[29]), .Y(n1134)
         );
  OAI221XL U266 ( .A0(n741), .A1(n3545), .B0(n707), .B1(n3551), .C0(n1117), 
        .Y(N132) );
  AOI22X1 U267 ( .A0(n3523), .A1(R8[12]), .B0(n2763), .B1(n3525), .Y(n1117) );
  OAI221XL U268 ( .A0(n740), .A1(n3543), .B0(n706), .B1(n3551), .C0(n1112), 
        .Y(N133) );
  AOI22X1 U269 ( .A0(n3523), .A1(R8[13]), .B0(n2767), .B1(n3531), .Y(n1112) );
  OAI221XL U270 ( .A0(n890), .A1(n649), .B0(n924), .B1(n3552), .C0(n1130), .Y(
        N119) );
  AOI22X1 U271 ( .A0(n2778), .A1(n3517), .B0(n3531), .B1(n1381), .Y(n1130) );
  OAI221XL U272 ( .A0(n753), .A1(n3545), .B0(n719), .B1(n3552), .C0(n1129), 
        .Y(N120) );
  AOI22X1 U273 ( .A0(n3524), .A1(R8[0]), .B0(n3525), .B1(R9[0]), .Y(n1129) );
  OAI221XL U274 ( .A0(n736), .A1(n3541), .B0(n702), .B1(n3551), .C0(n1107), 
        .Y(N137) );
  AOI22X1 U275 ( .A0(n3522), .A1(R8[17]), .B0(n3531), .B1(R9[17]), .Y(n1107)
         );
  OAI221XL U276 ( .A0(n770), .A1(n3543), .B0(n804), .B1(n3549), .C0(n1073), 
        .Y(N171) );
  AOI22X1 U277 ( .A0(n3520), .A1(R12[17]), .B0(n3529), .B1(R13[17]), .Y(n1073)
         );
  OAI221XL U278 ( .A0(n787), .A1(n3544), .B0(n821), .B1(n3550), .C0(n1090), 
        .Y(N154) );
  AOI22X1 U279 ( .A0(n3521), .A1(R12[0]), .B0(n3530), .B1(R13[0]), .Y(n1090)
         );
  OAI221XL U280 ( .A0(n780), .A1(n3543), .B0(n814), .B1(n3550), .C0(n1083), 
        .Y(N161) );
  AOI22X1 U281 ( .A0(n3521), .A1(R12[7]), .B0(n3530), .B1(R13[7]), .Y(n1083)
         );
  OAI221XL U282 ( .A0(n779), .A1(n3543), .B0(n813), .B1(n3550), .C0(n1082), 
        .Y(N162) );
  AOI22X1 U283 ( .A0(n3521), .A1(R12[8]), .B0(n3530), .B1(R13[8]), .Y(n1082)
         );
  OAI221XL U284 ( .A0(n763), .A1(n3542), .B0(n797), .B1(n3549), .C0(n1066), 
        .Y(N178) );
  AOI22X1 U285 ( .A0(n3520), .A1(R12[24]), .B0(n3528), .B1(R13[24]), .Y(n1066)
         );
  OAI221XL U286 ( .A0(n762), .A1(n3542), .B0(n796), .B1(n3549), .C0(n1065), 
        .Y(N179) );
  AOI22X1 U287 ( .A0(n3520), .A1(R12[25]), .B0(n3529), .B1(R13[25]), .Y(n1065)
         );
  OAI221XL U288 ( .A0(n761), .A1(n3542), .B0(n795), .B1(n3549), .C0(n1064), 
        .Y(N180) );
  AOI22X1 U289 ( .A0(n3520), .A1(R12[26]), .B0(n3528), .B1(R13[26]), .Y(n1064)
         );
  OAI221XL U290 ( .A0(n760), .A1(n3542), .B0(n794), .B1(n3549), .C0(n1063), 
        .Y(N181) );
  AOI22X1 U291 ( .A0(n3520), .A1(R12[27]), .B0(n3528), .B1(R13[27]), .Y(n1063)
         );
  OAI221XL U292 ( .A0(n759), .A1(n3542), .B0(n793), .B1(n3549), .C0(n1062), 
        .Y(N182) );
  AOI22X1 U293 ( .A0(n3520), .A1(R12[28]), .B0(n3528), .B1(R13[28]), .Y(n1062)
         );
  OAI221XL U294 ( .A0(n720), .A1(n3544), .B0(n686), .B1(n3550), .C0(n1091), 
        .Y(N153) );
  AOI22X1 U295 ( .A0(n3521), .A1(n1403), .B0(n2781), .B1(n3526), .Y(n1091) );
  OAI221XL U296 ( .A0(n771), .A1(n3543), .B0(n805), .B1(n3549), .C0(n1074), 
        .Y(N170) );
  AOI22X1 U297 ( .A0(n3522), .A1(R12[16]), .B0(n2774), .B1(n3525), .Y(n1074)
         );
  OAI221XL U298 ( .A0(n754), .A1(n3541), .B0(n788), .B1(n3548), .C0(n1057), 
        .Y(N187) );
  AOI22X1 U299 ( .A0(n3519), .A1(n132), .B0(n2780), .B1(n3530), .Y(n1057) );
  OAI221XL U300 ( .A0(n823), .A1(n3539), .B0(n857), .B1(n3546), .C0(n1024), 
        .Y(N84) );
  AOI22X1 U301 ( .A0(n3520), .A1(n1553), .B0(n2772), .B1(n3532), .Y(n1024) );
  OAI221XL U302 ( .A0(n822), .A1(n3539), .B0(n856), .B1(n3546), .C0(n1023), 
        .Y(N85) );
  AOI22X1 U303 ( .A0(n2779), .A1(n3517), .B0(n2782), .B1(n3532), .Y(n1023) );
  OAI221XL U304 ( .A0(n916), .A1(n649), .B0(n950), .B1(n3546), .C0(n1015), .Y(
        N93) );
  AOI22X1 U305 ( .A0(n3517), .A1(R4[7]), .B0(n3525), .B1(R5[7]), .Y(n1015) );
  OAI221XL U306 ( .A0(n910), .A1(n3543), .B0(n944), .B1(n3546), .C0(n1007), 
        .Y(N99) );
  AOI22X1 U307 ( .A0(n3518), .A1(R4[13]), .B0(n2768), .B1(n3525), .Y(n1007) );
  OAI221XL U308 ( .A0(n922), .A1(n3539), .B0(n956), .B1(n3546), .C0(n1021), 
        .Y(N87) );
  AOI22X1 U309 ( .A0(n3519), .A1(R4[1]), .B0(n3525), .B1(R5[1]), .Y(n1021) );
  OAI221XL U310 ( .A0(n917), .A1(n3541), .B0(n951), .B1(n3546), .C0(n1016), 
        .Y(N92) );
  AOI22X1 U311 ( .A0(n3521), .A1(R4[6]), .B0(n3526), .B1(R5[6]), .Y(n1016) );
  OAI221XL U312 ( .A0(n915), .A1(n649), .B0(n949), .B1(n3546), .C0(n1014), .Y(
        N94) );
  AOI22X1 U313 ( .A0(n3517), .A1(R4[8]), .B0(n3525), .B1(R5[8]), .Y(n1014) );
  OAI221XL U314 ( .A0(n914), .A1(n649), .B0(n948), .B1(n3546), .C0(n1013), .Y(
        N95) );
  AOI22X1 U315 ( .A0(n3517), .A1(R4[9]), .B0(n3525), .B1(R5[9]), .Y(n1013) );
  OAI221XL U316 ( .A0(n913), .A1(n649), .B0(n947), .B1(n3546), .C0(n1011), .Y(
        N96) );
  AOI22X1 U317 ( .A0(n3517), .A1(R4[10]), .B0(n3526), .B1(R5[10]), .Y(n1011)
         );
  OAI221XL U318 ( .A0(n921), .A1(n3539), .B0(n955), .B1(n3546), .C0(n1020), 
        .Y(N88) );
  AOI22X1 U319 ( .A0(n3517), .A1(R4[2]), .B0(n3526), .B1(R5[2]), .Y(n1020) );
  OAI221XL U320 ( .A0(n919), .A1(n649), .B0(n953), .B1(n3546), .C0(n1018), .Y(
        N90) );
  AOI22X1 U321 ( .A0(n3519), .A1(R4[4]), .B0(n3527), .B1(R5[4]), .Y(n1018) );
  OAI221XL U322 ( .A0(n920), .A1(n3539), .B0(n954), .B1(n3546), .C0(n1019), 
        .Y(N89) );
  AOI22X1 U323 ( .A0(n3520), .A1(R4[3]), .B0(n3525), .B1(R5[3]), .Y(n1019) );
  OAI221XL U324 ( .A0(n918), .A1(n649), .B0(n952), .B1(n3546), .C0(n1017), .Y(
        N91) );
  AOI22X1 U325 ( .A0(n3517), .A1(R4[5]), .B0(n3525), .B1(R5[5]), .Y(n1017) );
  OAI221XL U326 ( .A0(n912), .A1(n3539), .B0(n946), .B1(n3546), .C0(n1010), 
        .Y(N97) );
  AOI22X1 U327 ( .A0(n3519), .A1(R4[11]), .B0(n3525), .B1(R5[11]), .Y(n1010)
         );
  OAI221XL U328 ( .A0(n911), .A1(n3539), .B0(n945), .B1(n3546), .C0(n1009), 
        .Y(N98) );
  AOI22X1 U329 ( .A0(n3517), .A1(R4[12]), .B0(n2764), .B1(n3527), .Y(n1009) );
  OAI221XL U330 ( .A0(n923), .A1(n3539), .B0(n957), .B1(n3546), .C0(n1022), 
        .Y(N86) );
  AOI22X1 U331 ( .A0(n3521), .A1(R4[0]), .B0(n3526), .B1(R5[0]), .Y(n1022) );
  OAI221XL U332 ( .A0(n909), .A1(n3543), .B0(n943), .B1(n3546), .C0(n1149), 
        .Y(N100) );
  AOI22X1 U333 ( .A0(n3517), .A1(R4[14]), .B0(n3525), .B1(R5[14]), .Y(n1149)
         );
  OAI221XL U334 ( .A0(n3545), .A1(n1914), .B0(n2785), .B1(n646), .C0(n1148), 
        .Y(N101) );
  AOI22X1 U335 ( .A0(n62), .A1(n3517), .B0(n3531), .B1(R5[15]), .Y(n1148) );
  OAI221XL U336 ( .A0(n905), .A1(n649), .B0(n939), .B1(n646), .C0(n1145), .Y(
        N104) );
  AOI22X1 U337 ( .A0(n3524), .A1(R4[18]), .B0(n3528), .B1(R5[18]), .Y(n1145)
         );
  OAI221XL U338 ( .A0(n904), .A1(n3541), .B0(n938), .B1(n646), .C0(n1144), .Y(
        N105) );
  AOI22X1 U339 ( .A0(n3524), .A1(R4[19]), .B0(n3527), .B1(R5[19]), .Y(n1144)
         );
  OAI221XL U340 ( .A0(n899), .A1(n649), .B0(n933), .B1(n646), .C0(n1139), .Y(
        N110) );
  AOI22X1 U341 ( .A0(n3524), .A1(R4[24]), .B0(n3527), .B1(R5[24]), .Y(n1139)
         );
  OAI221XL U342 ( .A0(n902), .A1(n649), .B0(n936), .B1(n646), .C0(n1142), .Y(
        N107) );
  AOI22X1 U343 ( .A0(n3524), .A1(R4[21]), .B0(n3528), .B1(R5[21]), .Y(n1142)
         );
  OAI221XL U344 ( .A0(n903), .A1(n649), .B0(n937), .B1(n646), .C0(n1143), .Y(
        N106) );
  AOI22X1 U345 ( .A0(n3518), .A1(R4[20]), .B0(n3530), .B1(R5[20]), .Y(n1143)
         );
  OAI221XL U346 ( .A0(n900), .A1(n649), .B0(n934), .B1(n646), .C0(n1140), .Y(
        N109) );
  AOI22X1 U347 ( .A0(n3524), .A1(R4[23]), .B0(n3532), .B1(R5[23]), .Y(n1140)
         );
  OAI221XL U348 ( .A0(n901), .A1(n649), .B0(n935), .B1(n646), .C0(n1141), .Y(
        N108) );
  AOI22X1 U349 ( .A0(n3524), .A1(R4[22]), .B0(n3525), .B1(R5[22]), .Y(n1141)
         );
  OAI221XL U350 ( .A0(n906), .A1(n3540), .B0(n940), .B1(n646), .C0(n1146), .Y(
        N103) );
  AOI22X1 U351 ( .A0(n3523), .A1(R4[17]), .B0(n3526), .B1(R5[17]), .Y(n1146)
         );
  OAI221XL U352 ( .A0(n907), .A1(n649), .B0(n941), .B1(n646), .C0(n1147), .Y(
        N102) );
  AOI22X1 U353 ( .A0(n3522), .A1(R4[16]), .B0(n3529), .B1(n1395), .Y(n1147) );
  OAI221XL U354 ( .A0(n2105), .A1(n2830), .B0(n2201), .B1(n2831), .C0(n1108), 
        .Y(N136) );
  AOI22X1 U355 ( .A0(n2094), .A1(n1006), .B0(n2516), .B1(n1109), .Y(n1108) );
  INVX1 U356 ( .A(counter2[1]), .Y(n650) );
  INVX1 U357 ( .A(counter2[0]), .Y(n648) );
  CLKINVX3 U358 ( .A(n3556), .Y(n3553) );
endmodule


module p_s ( clk, rst_n, data_in_3, p_s_flag_in, data_out_3 );
  input [135:0] data_in_3;
  output [33:0] data_out_3;
  input clk, rst_n, p_s_flag_in;
  wire   counter_1_1_, N26, N50, N52, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N133, N134, N135, N136,
         N137, N138, N139, N140, N141, N142, N143, N144, N145, N146, N147,
         N148, N149, N150, N151, N152, n585, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n722, n723, n724,
         n725, n726, n727, n728, n729, n730, n731, n732, n733, n734, n735,
         n736, n737, n738, n739, n740, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n862,
         n1396, n1397, n1399, n1407, n1408, n1409, n1414, n1421, n1426, n1427,
         n1434, n1435, n1436, n1438, n1448, n1452, n1860, n1902, n2000, n2001,
         n2032, n2033, n2034, n2035, n2037, n2038, n2039, n2040, n2041, n2042,
         n2043, n2044, n2045, n2051, n2057, n2058, n2062, n2063, n2067, n2068,
         n2071, n2073, n2074, n2077, n2078, n2081, n2082, n2083, n2084, n2085,
         n2086, n2089, n2095, n2096, n2099, n2102, n2103, n2104, n2105, n2106,
         n2113, n2114, n2115, n2116, n2117, n2118, n2119, n2120, n2121, n2124,
         n2127, n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2140,
         n2149, n2163, n2166, n2167, n2169, n2170, n2171, n2172, n2173, n2174,
         n2175, n2176, n2177, n2178, n2179, n2180, n2246, n2247, n2248, n2249,
         n2250, n2251, n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259,
         n2260, n2261, n2262, n2263, n2264, n2265, n2266, n2267, n2270, n2271,
         n2274, n2275, n2277, n2279, n2280, n2281, n2283, n2285, n2287, n2288,
         n2289, n2290, n2291, n2295, n2296, n2297, n2303, n2335, n2336, n2337,
         n2338, n2339, n2340, n2341, n2342, n2343, n2344, n2345, n2347, n2348,
         n2349, n2350, n2351, n2352, n2353, n2354, n2355, n2356, n2357, n2358,
         n2359, n2360, n2361, n2362, n2363, n2364, n2365, n2366, n2367, n2368,
         n2369, n2370, n2371, n2372, n2373, n2374, n2375, n2376, n2377, n2378,
         n2381, n2382, n2383, n2386, n2387, n2409, n2410, n2411, n2412, n2413,
         n2414, n2415, n2416, n2417, n2418, n2419, n2420, n2421, n2422, n2423,
         n2428, n2429, n2434, n2437, n2444, n2447, n2450, n2463, n2470, n2471,
         n2472, n2473, n2477, n2478, n2479, n2480, n2481, n2482, n2483, n2484,
         n2485, n2486, n2487, n2488, n2489, n2490, n2491, n2492, n2525, n2526,
         n2531, n2534, n2535, n2536, n2538, n2542, n2543, n2544, n2545, n2546,
         n2547, n2548, n2549, n2550, n2551, n2552, n2553, n2554, n2555, n2556,
         n2557, n2558, n2559, n2560, n2561, n2562, n2563, n2564, n2565, n2566,
         n2567, n2568, n2569, n2570, n2571, n2572, n2573, n2574, n2575, n2576,
         n2577, n2578, n2579, n2580, n2581, n2582, n2583, n2584, n2585, n2673,
         n2674, n2675, n2676, n2677, n2678, n2679, n2680, n2681, n2682, n2683,
         n2684, n2685, n2686, n2687, n2688, n2689, n2696, n2697, n573, n586,
         n587, n598, n612, n617, n618, n619, n688, n689, n690, n691, n695,
         n697, n710, n715, n717, n718, n799, n800, n801, n802, n803, n804,
         n805, n806, n808, n810, n811, n812, n813, n814, n816, n818, n819,
         n822, n823, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n911,
         n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933,
         n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
         n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955,
         n956, n957, n958, n959, n960, n961, n962, n963, n964, n965, n966,
         n967, n968, n969, n970, n971, n972, n973, n974, n975, n976, n977,
         n978, n979, n980, n981, n982, n983, n984, n985, n986, n987, n988,
         n989, n990, n991, n992, n993, n994, n995, n996, n997, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019,
         n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029,
         n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049,
         n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n2725, n2726, n2727, n2728, n2729, n2730, n2731, n2732,
         n3313, n3314, n3315, n3316, n3317, n3318, n3319, n3320, n3321, n3322,
         n3323, n3324, n3325, n3326, n3327, n3328, n3329, n3330, n3331, n3332,
         n3333, n3334, n3335, n3336, n3337, n3338, n3339, n3340, n3341, n3342,
         n3343, n3344, n3345, n3346, n3347, n3348, n3349, n3350, n3351, n3352,
         n3353, n3354, n3355, n3356, n3357, n3358, n3359, n3360, n3361, n3362,
         n3363, n3364, n3365, n3366, n3367;
  wire   [13:11] R0;
  wire   [29:0] R12;
  wire   [29:0] R1;
  wire   [13:11] R2;
  wire   [28:0] R14;
  wire   [29:0] R3;
  wire   [3:1] counter_2;

  AND2X2 U351 ( .A(n799), .B(counter_2[3]), .Y(n810) );
  EDFFX1 R9_reg_27_ ( .D(data_in_3[95]), .E(n3364), .CK(clk), .QN(n2372) );
  EDFFX1 R9_reg_26_ ( .D(data_in_3[94]), .E(n3366), .CK(clk), .QN(n2371) );
  EDFFX1 R9_reg_25_ ( .D(data_in_3[93]), .E(n3365), .CK(clk), .QN(n2370) );
  EDFFX1 R9_reg_24_ ( .D(data_in_3[92]), .E(n3364), .CK(clk), .QN(n2369) );
  EDFFX1 R9_reg_23_ ( .D(data_in_3[91]), .E(n3366), .CK(clk), .QN(n2368) );
  EDFFX1 R9_reg_22_ ( .D(data_in_3[90]), .E(n3365), .CK(clk), .QN(n2367) );
  EDFFX1 R9_reg_21_ ( .D(data_in_3[89]), .E(n3364), .CK(clk), .QN(n2366) );
  EDFFX1 R9_reg_20_ ( .D(data_in_3[88]), .E(n3366), .CK(clk), .QN(n2365) );
  EDFFX1 R9_reg_11_ ( .D(data_in_3[79]), .E(n3365), .CK(clk), .QN(n2364) );
  EDFFX1 R9_reg_10_ ( .D(data_in_3[78]), .E(n3366), .CK(clk), .QN(n2363) );
  EDFFX1 R9_reg_9_ ( .D(data_in_3[77]), .E(n3366), .CK(clk), .QN(n2362) );
  EDFFX1 R9_reg_8_ ( .D(data_in_3[76]), .E(n3366), .CK(clk), .QN(n2361) );
  EDFFX1 R9_reg_7_ ( .D(data_in_3[75]), .E(n3366), .CK(clk), .QN(n2360) );
  EDFFX1 R9_reg_6_ ( .D(data_in_3[74]), .E(n3366), .CK(clk), .QN(n2359) );
  EDFFX1 R9_reg_5_ ( .D(data_in_3[73]), .E(n3366), .CK(clk), .QN(n2358) );
  EDFFX1 R9_reg_4_ ( .D(data_in_3[72]), .E(n3366), .CK(clk), .QN(n2357) );
  EDFFX1 R9_reg_3_ ( .D(data_in_3[71]), .E(n3366), .CK(clk), .QN(n2356) );
  EDFFX1 R9_reg_2_ ( .D(data_in_3[70]), .E(n3366), .CK(clk), .QN(n2355) );
  EDFFX1 R9_reg_12_ ( .D(data_in_3[80]), .E(n3366), .CK(clk), .QN(n2354) );
  EDFFX1 R9_reg_17_ ( .D(data_in_3[85]), .E(n3366), .CK(clk), .QN(n2353) );
  EDFFX1 R9_reg_0_ ( .D(data_in_3[68]), .E(n3366), .CK(clk), .QN(n2352) );
  EDFFX1 R9_reg_18_ ( .D(data_in_3[86]), .E(n3366), .CK(clk), .QN(n2351) );
  EDFFX1 R9_reg_19_ ( .D(data_in_3[87]), .E(n3366), .CK(clk), .QN(n2350) );
  EDFFX1 R9_reg_1_ ( .D(data_in_3[69]), .E(n3366), .CK(clk), .QN(n2349) );
  EDFFX1 R9_reg_16_ ( .D(data_in_3[84]), .E(n3366), .CK(clk), .QN(n1902) );
  EDFFX1 R10_reg_25_ ( .D(data_in_3[93]), .E(n3350), .CK(clk), .QN(n628) );
  EDFFX1 R10_reg_23_ ( .D(data_in_3[91]), .E(n3350), .CK(clk), .QN(n630) );
  EDFFX1 R10_reg_21_ ( .D(data_in_3[89]), .E(n3350), .CK(clk), .QN(n632) );
  EDFFX1 R10_reg_20_ ( .D(data_in_3[88]), .E(n3350), .CK(clk), .QN(n633) );
  EDFFX1 R10_reg_19_ ( .D(data_in_3[87]), .E(n3349), .CK(clk), .QN(n634) );
  EDFFX1 R10_reg_7_ ( .D(data_in_3[75]), .E(n3348), .CK(clk), .QN(n646) );
  EDFFX1 R10_reg_5_ ( .D(data_in_3[73]), .E(n3349), .CK(clk), .QN(n648) );
  EDFFX1 R10_reg_4_ ( .D(data_in_3[72]), .E(n3348), .CK(clk), .QN(n649) );
  EDFFX1 R10_reg_3_ ( .D(data_in_3[71]), .E(n3349), .CK(clk), .QN(n650) );
  EDFFX1 R10_reg_2_ ( .D(data_in_3[70]), .E(n3348), .CK(clk), .QN(n651) );
  EDFFX1 R10_reg_1_ ( .D(data_in_3[69]), .E(n3350), .CK(clk), .QN(n652) );
  EDFFX1 R8_reg_25_ ( .D(data_in_3[93]), .E(n3353), .CK(clk), .QN(n764) );
  EDFFX1 R8_reg_23_ ( .D(data_in_3[91]), .E(n3353), .CK(clk), .QN(n766) );
  EDFFX1 R8_reg_21_ ( .D(data_in_3[89]), .E(n3352), .CK(clk), .QN(n768) );
  EDFFX1 R8_reg_20_ ( .D(data_in_3[88]), .E(n3351), .CK(clk), .QN(n769) );
  EDFFX1 R8_reg_19_ ( .D(data_in_3[87]), .E(n3353), .CK(clk), .QN(n770) );
  EDFFX1 R8_reg_7_ ( .D(data_in_3[75]), .E(n3353), .CK(clk), .QN(n782) );
  EDFFX1 R8_reg_5_ ( .D(data_in_3[73]), .E(n3352), .CK(clk), .QN(n784) );
  EDFFX1 R8_reg_4_ ( .D(data_in_3[72]), .E(n3352), .CK(clk), .QN(n785) );
  EDFFX1 R8_reg_3_ ( .D(data_in_3[71]), .E(n3351), .CK(clk), .QN(n786) );
  EDFFX1 R8_reg_2_ ( .D(data_in_3[70]), .E(n3352), .CK(clk), .QN(n787) );
  EDFFX1 R8_reg_1_ ( .D(data_in_3[69]), .E(n3353), .CK(clk), .QN(n788) );
  EDFFX1 R10_reg_8_ ( .D(data_in_3[76]), .E(n3348), .CK(clk), .QN(n645) );
  EDFFX1 R8_reg_8_ ( .D(data_in_3[76]), .E(n3351), .CK(clk), .QN(n781) );
  EDFFX1 R10_reg_33_ ( .D(data_in_3[101]), .E(n3349), .CK(clk), .QN(n620) );
  EDFFX1 R10_reg_17_ ( .D(data_in_3[85]), .E(n3350), .CK(clk), .QN(n636) );
  EDFFX1 R8_reg_17_ ( .D(data_in_3[85]), .E(n3353), .CK(clk), .QN(n772) );
  EDFFX1 R10_reg_0_ ( .D(data_in_3[68]), .E(n3350), .CK(clk), .QN(n653) );
  EDFFX1 R8_reg_0_ ( .D(data_in_3[68]), .E(n3353), .CK(clk), .QN(n789) );
  EDFFX1 R10_reg_18_ ( .D(data_in_3[86]), .E(n3350), .CK(clk), .QN(n635) );
  EDFFX1 R8_reg_18_ ( .D(data_in_3[86]), .E(n3353), .CK(clk), .QN(n771) );
  EDFFX1 R10_reg_29_ ( .D(data_in_3[97]), .E(n3349), .CK(clk), .QN(n624) );
  EDFFX1 R8_reg_29_ ( .D(data_in_3[97]), .E(n3352), .CK(clk), .QN(n760) );
  EDFFX1 R10_reg_31_ ( .D(data_in_3[99]), .E(n3350), .CK(clk), .QN(n622) );
  EDFFX1 R8_reg_31_ ( .D(data_in_3[99]), .E(n3351), .CK(clk), .QN(n758) );
  EDFFX1 R10_reg_30_ ( .D(data_in_3[98]), .E(n3350), .CK(clk), .QN(n623) );
  EDFFX1 R8_reg_30_ ( .D(data_in_3[98]), .E(n3352), .CK(clk), .QN(n759) );
  EDFFX1 R10_reg_16_ ( .D(data_in_3[84]), .E(n3349), .CK(clk), .QN(n637) );
  EDFFX1 R10_reg_32_ ( .D(data_in_3[100]), .E(n3348), .CK(clk), .QN(n621) );
  EDFFX1 R8_reg_32_ ( .D(data_in_3[100]), .E(n3353), .CK(clk), .QN(n757) );
  EDFFX1 R8_reg_16_ ( .D(data_in_3[84]), .E(n3353), .CK(clk), .QN(n773) );
  EDFFX1 R10_reg_10_ ( .D(data_in_3[78]), .E(n3350), .CK(clk), .QN(n643) );
  EDFFX1 R8_reg_10_ ( .D(data_in_3[78]), .E(n3353), .CK(clk), .QN(n779) );
  EDFFX1 R8_reg_26_ ( .D(data_in_3[94]), .E(n3353), .CK(clk), .QN(n763) );
  EDFFX1 R10_reg_26_ ( .D(data_in_3[94]), .E(n3350), .CK(clk), .QN(n627) );
  EDFFX1 R10_reg_6_ ( .D(data_in_3[74]), .E(n3349), .CK(clk), .QN(n647) );
  EDFFX1 R8_reg_6_ ( .D(data_in_3[74]), .E(n3353), .CK(clk), .QN(n783) );
  EDFFX1 R10_reg_27_ ( .D(data_in_3[95]), .E(n3348), .CK(clk), .QN(n626) );
  EDFFX1 R8_reg_27_ ( .D(data_in_3[95]), .E(n3353), .CK(clk), .QN(n762) );
  EDFFX1 R10_reg_12_ ( .D(data_in_3[80]), .E(n3350), .CK(clk), .QN(n641) );
  EDFFX1 R8_reg_12_ ( .D(data_in_3[80]), .E(n3353), .CK(clk), .QN(n777) );
  EDFFX1 R8_reg_11_ ( .D(data_in_3[79]), .E(n3353), .CK(clk), .QN(n778) );
  EDFFX1 R10_reg_11_ ( .D(data_in_3[79]), .E(n3350), .CK(clk), .QN(n642) );
  EDFFX1 R10_reg_24_ ( .D(data_in_3[92]), .E(n3349), .CK(clk), .QN(n629) );
  EDFFX1 R8_reg_24_ ( .D(data_in_3[92]), .E(n3353), .CK(clk), .QN(n765) );
  EDFFX1 R10_reg_9_ ( .D(data_in_3[77]), .E(n3348), .CK(clk), .QN(n644) );
  EDFFX1 R8_reg_9_ ( .D(data_in_3[77]), .E(n3353), .CK(clk), .QN(n780) );
  EDFFX1 R10_reg_22_ ( .D(data_in_3[90]), .E(n3350), .CK(clk), .QN(n631) );
  EDFFX1 R8_reg_22_ ( .D(data_in_3[90]), .E(n3353), .CK(clk), .QN(n767) );
  EDFFX1 R9_reg_29_ ( .D(data_in_3[97]), .E(n3366), .CK(clk), .QN(n2348) );
  EDFFX1 R9_reg_32_ ( .D(data_in_3[100]), .E(n3366), .CK(clk), .QN(n2347) );
  EDFFX1 R11_reg_25_ ( .D(data_in_3[93]), .E(n3359), .CK(clk), .QN(n2345) );
  EDFFX1 R11_reg_23_ ( .D(data_in_3[91]), .E(n3359), .CK(clk), .QN(n2344) );
  EDFFX1 R11_reg_21_ ( .D(data_in_3[89]), .E(n3359), .CK(clk), .QN(n2343) );
  EDFFX1 R11_reg_20_ ( .D(data_in_3[88]), .E(n3359), .CK(clk), .QN(n2342) );
  EDFFX1 R11_reg_19_ ( .D(data_in_3[87]), .E(n3359), .CK(clk), .QN(n2341) );
  EDFFX1 R11_reg_7_ ( .D(data_in_3[75]), .E(n3359), .CK(clk), .QN(n2340) );
  EDFFX1 R11_reg_5_ ( .D(data_in_3[73]), .E(n3359), .CK(clk), .QN(n2339) );
  EDFFX1 R11_reg_4_ ( .D(data_in_3[72]), .E(n3359), .CK(clk), .QN(n2338) );
  EDFFX1 R11_reg_3_ ( .D(data_in_3[71]), .E(n3359), .CK(clk), .QN(n2337) );
  EDFFX1 R11_reg_2_ ( .D(data_in_3[70]), .E(n3359), .CK(clk), .QN(n2336) );
  EDFFX1 R11_reg_1_ ( .D(data_in_3[69]), .E(n3359), .CK(clk), .QN(n2335) );
  EDFFX1 R11_reg_8_ ( .D(data_in_3[76]), .E(n3358), .CK(clk), .QN(n2303) );
  EDFFX1 R11_reg_17_ ( .D(data_in_3[85]), .E(n3357), .CK(clk), .QN(n2297) );
  EDFFX1 R11_reg_0_ ( .D(data_in_3[68]), .E(n3357), .CK(clk), .QN(n2296) );
  EDFFX1 R11_reg_18_ ( .D(data_in_3[86]), .E(n3357), .CK(clk), .QN(n2295) );
  EDFFX1 R11_reg_29_ ( .D(data_in_3[97]), .E(n3357), .CK(clk), .QN(n2291) );
  EDFFX1 R11_reg_31_ ( .D(data_in_3[99]), .E(n3357), .CK(clk), .QN(n2290) );
  EDFFX1 R11_reg_30_ ( .D(data_in_3[98]), .E(n3357), .CK(clk), .QN(n2289) );
  EDFFX1 R11_reg_16_ ( .D(data_in_3[84]), .E(n3357), .CK(clk), .QN(n2288) );
  EDFFX1 R11_reg_32_ ( .D(data_in_3[100]), .E(n3357), .CK(clk), .QN(n2287) );
  EDFFX1 R11_reg_10_ ( .D(data_in_3[78]), .E(n3357), .CK(clk), .QN(n2285) );
  EDFFX1 R11_reg_26_ ( .D(data_in_3[94]), .E(n3357), .CK(clk), .QN(n2281) );
  EDFFX1 R11_reg_6_ ( .D(data_in_3[74]), .E(n3357), .CK(clk), .QN(n2280) );
  EDFFX1 R11_reg_27_ ( .D(data_in_3[95]), .E(n3357), .CK(clk), .QN(n2279) );
  EDFFX1 R11_reg_12_ ( .D(data_in_3[80]), .E(n3357), .CK(clk), .QN(n2277) );
  EDFFX1 R11_reg_11_ ( .D(data_in_3[79]), .E(n3357), .CK(clk), .QN(n2275) );
  EDFFX1 R11_reg_24_ ( .D(data_in_3[92]), .E(n3357), .CK(clk), .QN(n2274) );
  EDFFX1 R11_reg_9_ ( .D(data_in_3[77]), .E(n3357), .CK(clk), .QN(n2271) );
  EDFFX1 R11_reg_22_ ( .D(data_in_3[90]), .E(n3357), .CK(clk), .QN(n2270) );
  EDFFX1 R8_reg_33_ ( .D(data_in_3[101]), .E(n3351), .CK(clk), .QN(n756) );
  EDFFX1 R10_reg_13_ ( .D(data_in_3[81]), .E(n3348), .CK(clk), .QN(n640) );
  EDFFX1 R8_reg_13_ ( .D(data_in_3[81]), .E(n3351), .CK(clk), .QN(n776) );
  EDFFX1 R11_reg_13_ ( .D(data_in_3[81]), .E(n3359), .CK(clk), .QN(n2096) );
  EDFFX1 R11_reg_33_ ( .D(data_in_3[101]), .E(n3358), .CK(clk), .QN(n2081) );
  EDFFX1 R9_reg_33_ ( .D(data_in_3[101]), .E(n3365), .CK(clk), .QN(n2687) );
  EDFFX1 R9_reg_13_ ( .D(data_in_3[81]), .E(n3364), .CK(clk), .QN(n2696) );
  EDFFX1 R9_reg_30_ ( .D(data_in_3[98]), .E(n3364), .CK(clk), .QN(n2673) );
  EDFFX1 R9_reg_31_ ( .D(data_in_3[99]), .E(n3365), .CK(clk), .QN(n2679) );
  EDFFX1 R5_reg_20_ ( .D(data_in_3[54]), .E(n3364), .CK(clk), .QN(n2259) );
  EDFFX1 R5_reg_19_ ( .D(data_in_3[53]), .E(n3364), .CK(clk), .QN(n2258) );
  EDFFX1 R5_reg_2_ ( .D(data_in_3[36]), .E(n3364), .CK(clk), .QN(n2250) );
  EDFFX1 R5_reg_0_ ( .D(data_in_3[34]), .E(n3364), .CK(clk), .QN(n2249) );
  EDFFX1 R5_reg_17_ ( .D(data_in_3[51]), .E(n3364), .CK(clk), .QN(n2248) );
  EDFFX1 R5_reg_18_ ( .D(data_in_3[52]), .E(n3364), .CK(clk), .QN(n2247) );
  EDFFX1 R5_reg_1_ ( .D(data_in_3[35]), .E(n3364), .CK(clk), .QN(n2246) );
  EDFFXL R5_reg_16_ ( .D(data_in_3[50]), .E(n3366), .CK(clk), .QN(n1860) );
  EDFFX1 R6_reg_4_ ( .D(data_in_3[38]), .E(n3350), .CK(clk), .QN(n683) );
  EDFFX1 R6_reg_1_ ( .D(data_in_3[35]), .E(n3350), .CK(clk), .QN(n686) );
  EDFFX1 R4_reg_24_ ( .D(data_in_3[58]), .E(n3353), .CK(clk), .QN(n731) );
  EDFFX1 R4_reg_23_ ( .D(data_in_3[57]), .E(n3352), .CK(clk), .QN(n732) );
  EDFFX1 R4_reg_22_ ( .D(data_in_3[56]), .E(n3351), .CK(clk), .QN(n733) );
  EDFFX1 R4_reg_21_ ( .D(data_in_3[55]), .E(n3353), .CK(clk), .QN(n734) );
  EDFFX1 R4_reg_20_ ( .D(data_in_3[54]), .E(n3353), .CK(clk), .QN(n735) );
  EDFFX1 R4_reg_19_ ( .D(data_in_3[53]), .E(n3352), .CK(clk), .QN(n736) );
  EDFFX1 R4_reg_8_ ( .D(data_in_3[42]), .E(n3351), .CK(clk), .QN(n747) );
  EDFFX1 R4_reg_7_ ( .D(data_in_3[41]), .E(n3353), .CK(clk), .QN(n748) );
  EDFFX1 R4_reg_6_ ( .D(data_in_3[40]), .E(n3353), .CK(clk), .QN(n749) );
  EDFFX1 R4_reg_5_ ( .D(data_in_3[39]), .E(n3352), .CK(clk), .QN(n750) );
  EDFFX1 R4_reg_4_ ( .D(data_in_3[38]), .E(n3351), .CK(clk), .QN(n751) );
  EDFFX1 R4_reg_3_ ( .D(data_in_3[37]), .E(n3353), .CK(clk), .QN(n752) );
  EDFFX1 R4_reg_2_ ( .D(data_in_3[36]), .E(n3353), .CK(clk), .QN(n753) );
  EDFFX1 R4_reg_1_ ( .D(data_in_3[35]), .E(n3351), .CK(clk), .QN(n754) );
  EDFFX1 R6_reg_9_ ( .D(data_in_3[43]), .E(n3350), .CK(clk), .QN(n678) );
  EDFFX1 R4_reg_9_ ( .D(data_in_3[43]), .E(n3351), .CK(clk), .QN(n746) );
  EDFFX1 R6_reg_0_ ( .D(data_in_3[34]), .E(n3350), .CK(clk), .QN(n687) );
  EDFFX1 R4_reg_0_ ( .D(data_in_3[34]), .E(n3352), .CK(clk), .QN(n755) );
  EDFFX1 R6_reg_17_ ( .D(data_in_3[51]), .E(n3350), .CK(clk), .QN(n670) );
  EDFFX1 R4_reg_17_ ( .D(data_in_3[51]), .E(n3351), .CK(clk), .QN(n738) );
  EDFFX1 R6_reg_18_ ( .D(data_in_3[52]), .E(n3350), .CK(clk), .QN(n669) );
  EDFFX1 R4_reg_18_ ( .D(data_in_3[52]), .E(n3353), .CK(clk), .QN(n737) );
  EDFFXL R6_reg_15_ ( .D(data_in_3[49]), .E(n3350), .CK(clk), .QN(n672) );
  EDFFX1 R6_reg_31_ ( .D(data_in_3[65]), .E(n3350), .CK(clk), .QN(n656) );
  EDFFX1 R4_reg_31_ ( .D(data_in_3[65]), .E(n3352), .CK(clk), .QN(n724) );
  EDFFXL R6_reg_16_ ( .D(data_in_3[50]), .E(n3350), .CK(clk), .QN(n671) );
  EDFFX1 R4_reg_10_ ( .D(data_in_3[44]), .E(n3351), .CK(clk), .QN(n745) );
  EDFFX1 R6_reg_27_ ( .D(data_in_3[61]), .E(n3350), .CK(clk), .QN(n660) );
  EDFFX1 R4_reg_25_ ( .D(data_in_3[59]), .E(n3352), .CK(clk), .QN(n730) );
  EDFFX1 R6_reg_26_ ( .D(data_in_3[60]), .E(n3350), .CK(clk), .QN(n661) );
  EDFFX1 R7_reg_24_ ( .D(data_in_3[58]), .E(n3360), .CK(clk), .QN(n2421) );
  EDFFX1 R7_reg_23_ ( .D(data_in_3[57]), .E(n3360), .CK(clk), .QN(n2420) );
  EDFFX1 R7_reg_22_ ( .D(data_in_3[56]), .E(n3360), .CK(clk), .QN(n2419) );
  EDFFX1 R7_reg_21_ ( .D(data_in_3[55]), .E(n3360), .CK(clk), .QN(n2418) );
  EDFFX1 R7_reg_20_ ( .D(data_in_3[54]), .E(n3360), .CK(clk), .QN(n2417) );
  EDFFX1 R7_reg_19_ ( .D(data_in_3[53]), .E(n3360), .CK(clk), .QN(n2416) );
  EDFFX1 R7_reg_8_ ( .D(data_in_3[42]), .E(n3360), .CK(clk), .QN(n2415) );
  EDFFX1 R7_reg_7_ ( .D(data_in_3[41]), .E(n3360), .CK(clk), .QN(n2414) );
  EDFFX1 R7_reg_6_ ( .D(data_in_3[40]), .E(n3360), .CK(clk), .QN(n2413) );
  EDFFX1 R7_reg_5_ ( .D(data_in_3[39]), .E(n3360), .CK(clk), .QN(n2412) );
  EDFFX1 R7_reg_3_ ( .D(data_in_3[37]), .E(n3360), .CK(clk), .QN(n2411) );
  EDFFX1 R7_reg_2_ ( .D(data_in_3[36]), .E(n3360), .CK(clk), .QN(n2410) );
  EDFFX1 R7_reg_1_ ( .D(data_in_3[35]), .E(n3360), .CK(clk), .QN(n2409) );
  EDFFX1 R7_reg_9_ ( .D(data_in_3[43]), .E(n3360), .CK(clk), .QN(n2387) );
  EDFFX1 R7_reg_0_ ( .D(data_in_3[34]), .E(n3359), .CK(clk), .QN(n2383) );
  EDFFX1 R7_reg_17_ ( .D(data_in_3[51]), .E(n3359), .CK(clk), .QN(n2382) );
  EDFFX1 R7_reg_18_ ( .D(data_in_3[52]), .E(n3359), .CK(clk), .QN(n2381) );
  EDFFX1 R7_reg_31_ ( .D(data_in_3[65]), .E(n3359), .CK(clk), .QN(n2378) );
  EDFFX1 R7_reg_10_ ( .D(data_in_3[44]), .E(n3359), .CK(clk), .QN(n2377) );
  EDFFX1 R7_reg_27_ ( .D(data_in_3[61]), .E(n3359), .CK(clk), .QN(n2376) );
  EDFFX1 R7_reg_25_ ( .D(data_in_3[59]), .E(n3359), .CK(clk), .QN(n2375) );
  EDFFX1 R7_reg_26_ ( .D(data_in_3[60]), .E(n3359), .CK(clk), .QN(n2374) );
  EDFFX1 R4_reg_33_ ( .D(data_in_3[67]), .E(n3351), .CK(clk), .QN(n722) );
  EDFFXL R4_reg_16_ ( .D(data_in_3[50]), .E(n3351), .CK(clk), .QN(n739) );
  EDFFXL R7_reg_16_ ( .D(data_in_3[50]), .E(n3357), .CK(clk), .QN(n2167) );
  EDFFX1 R6_reg_24_ ( .D(data_in_3[58]), .E(n3348), .CK(clk), .QN(n663) );
  EDFFX1 R6_reg_23_ ( .D(data_in_3[57]), .E(n3350), .CK(clk), .QN(n664) );
  EDFFX1 R6_reg_22_ ( .D(data_in_3[56]), .E(n3349), .CK(clk), .QN(n665) );
  EDFFX1 R6_reg_21_ ( .D(data_in_3[55]), .E(n3349), .CK(clk), .QN(n666) );
  EDFFX1 R6_reg_20_ ( .D(data_in_3[54]), .E(n3349), .CK(clk), .QN(n667) );
  EDFFX1 R6_reg_19_ ( .D(data_in_3[53]), .E(n3349), .CK(clk), .QN(n668) );
  EDFFX1 R6_reg_8_ ( .D(data_in_3[42]), .E(n3349), .CK(clk), .QN(n679) );
  EDFFX1 R6_reg_7_ ( .D(data_in_3[41]), .E(n3349), .CK(clk), .QN(n680) );
  EDFFX1 R6_reg_6_ ( .D(data_in_3[40]), .E(n3349), .CK(clk), .QN(n681) );
  EDFFX1 R6_reg_5_ ( .D(data_in_3[39]), .E(n3349), .CK(clk), .QN(n682) );
  EDFFX1 R6_reg_3_ ( .D(data_in_3[37]), .E(n3349), .CK(clk), .QN(n684) );
  EDFFX1 R6_reg_2_ ( .D(data_in_3[36]), .E(n3349), .CK(clk), .QN(n685) );
  EDFFX1 R4_reg_13_ ( .D(data_in_3[47]), .E(n3351), .CK(clk), .QN(n742) );
  EDFFXL R4_reg_15_ ( .D(data_in_3[49]), .E(n3351), .CK(clk), .QN(n740) );
  EDFFX1 R6_reg_32_ ( .D(data_in_3[66]), .E(n3349), .CK(clk), .QN(n655) );
  EDFFX1 R4_reg_32_ ( .D(data_in_3[66]), .E(n3351), .CK(clk), .QN(n723) );
  EDFFX1 R6_reg_10_ ( .D(data_in_3[44]), .E(n3349), .CK(clk), .QN(n677) );
  EDFFX1 R4_reg_27_ ( .D(data_in_3[61]), .E(n3351), .CK(clk), .QN(n728) );
  EDFFX1 R6_reg_25_ ( .D(data_in_3[59]), .E(n3349), .CK(clk), .QN(n662) );
  EDFFX1 R4_reg_26_ ( .D(data_in_3[60]), .E(n3351), .CK(clk), .QN(n729) );
  EDFFX1 R7_reg_32_ ( .D(data_in_3[66]), .E(n3357), .CK(clk), .QN(n2113) );
  EDFFX1 R7_reg_4_ ( .D(data_in_3[38]), .E(n3360), .CK(clk), .QN(n2106) );
  EDFFX1 R7_reg_13_ ( .D(data_in_3[47]), .E(n3359), .CK(clk), .QN(n2105) );
  EDFFXL R7_reg_15_ ( .D(data_in_3[49]), .E(n3359), .CK(clk), .QN(n2102) );
  EDFFX1 R6_reg_12_ ( .D(data_in_3[46]), .E(n3348), .CK(clk), .QN(n675) );
  EDFFX1 R4_reg_12_ ( .D(data_in_3[46]), .E(n3351), .CK(clk), .QN(n743) );
  EDFFX1 R6_reg_11_ ( .D(data_in_3[45]), .E(n3348), .CK(clk), .QN(n676) );
  EDFFX1 R4_reg_11_ ( .D(data_in_3[45]), .E(n3353), .CK(clk), .QN(n744) );
  EDFFX1 R7_reg_12_ ( .D(data_in_3[46]), .E(n3358), .CK(clk), .QN(n2089) );
  EDFFX1 R7_reg_33_ ( .D(data_in_3[67]), .E(n3357), .CK(clk), .QN(n2086) );
  EDFFX1 R7_reg_11_ ( .D(data_in_3[45]), .E(n3360), .CK(clk), .QN(n2085) );
  EDFFXL R5_reg_15_ ( .D(data_in_3[49]), .E(n3365), .CK(clk), .QN(n2685) );
  EDFFX1 R5_reg_33_ ( .D(data_in_3[67]), .E(n3366), .CK(clk), .QN(n2688) );
  EDFFX1 R5_reg_13_ ( .D(data_in_3[47]), .E(n3364), .CK(clk), .QN(n2675) );
  EDFFX1 R0_reg_23_ ( .D(data_in_3[23]), .E(n3351), .CK(clk), .Q(n2488) );
  EDFFX1 R0_reg_21_ ( .D(data_in_3[21]), .E(n3351), .CK(clk), .Q(n2487) );
  EDFFX1 R0_reg_20_ ( .D(data_in_3[20]), .E(n3352), .CK(clk), .Q(n2486) );
  EDFFX1 R0_reg_19_ ( .D(data_in_3[19]), .E(n3352), .CK(clk), .Q(n2485) );
  EDFFX1 R0_reg_18_ ( .D(data_in_3[18]), .E(n3351), .CK(clk), .Q(n2484) );
  EDFFX1 R0_reg_5_ ( .D(data_in_3[5]), .E(n3352), .CK(clk), .Q(n2483) );
  EDFFX1 R0_reg_3_ ( .D(data_in_3[3]), .E(n3351), .CK(clk), .Q(n2482) );
  EDFFX1 R0_reg_2_ ( .D(data_in_3[2]), .E(n3353), .CK(clk), .Q(n2481) );
  EDFFX1 R0_reg_8_ ( .D(data_in_3[8]), .E(n3353), .CK(clk), .Q(n2480) );
  EDFFX1 R0_reg_29_ ( .D(data_in_3[29]), .E(n3353), .CK(clk), .Q(n2479) );
  EDFFX1 R0_reg_25_ ( .D(data_in_3[25]), .E(n3353), .CK(clk), .Q(n2478) );
  EDFFX1 R0_reg_27_ ( .D(data_in_3[27]), .E(n3353), .CK(clk), .Q(n2477) );
  EDFFX1 R0_reg_17_ ( .D(data_in_3[17]), .E(n3353), .CK(clk), .Q(n2473) );
  EDFFX1 R0_reg_0_ ( .D(data_in_3[0]), .E(n3353), .CK(clk), .Q(n2472) );
  EDFFX1 R0_reg_1_ ( .D(data_in_3[1]), .E(n3353), .CK(clk), .Q(n2471) );
  EDFFX1 R0_reg_9_ ( .D(data_in_3[9]), .E(n3353), .CK(clk), .Q(n2450) );
  EDFFX1 R0_reg_28_ ( .D(data_in_3[28]), .E(n3353), .CK(clk), .Q(n2447) );
  EDFFX1 R0_reg_10_ ( .D(data_in_3[10]), .E(n3353), .CK(clk), .Q(n2444) );
  EDFFX1 R0_reg_24_ ( .D(data_in_3[24]), .E(n3353), .CK(clk), .Q(n2437) );
  EDFFX1 R0_reg_4_ ( .D(data_in_3[4]), .E(n3353), .CK(clk), .Q(n2434) );
  EDFFX1 R0_reg_26_ ( .D(data_in_3[26]), .E(n3353), .CK(clk), .Q(n2429) );
  EDFFX1 R0_reg_22_ ( .D(data_in_3[22]), .E(n3353), .CK(clk), .Q(n2428) );
  EDFFX1 R0_reg_6_ ( .D(data_in_3[6]), .E(n3353), .CK(clk), .Q(n2423) );
  EDFFX1 R0_reg_7_ ( .D(data_in_3[7]), .E(n3352), .CK(clk), .Q(n2422) );
  EDFFX1 R2_reg_26_ ( .D(data_in_3[26]), .E(n3350), .CK(clk), .Q(n2163) );
  EDFFX1 R0_reg_16_ ( .D(data_in_3[16]), .E(n3352), .CK(clk), .Q(n2062) );
  EDFFX1 R1_reg_23_ ( .D(data_in_3[23]), .E(n3366), .CK(clk), .Q(R1[23]) );
  EDFFX1 R1_reg_21_ ( .D(data_in_3[21]), .E(n3366), .CK(clk), .Q(R1[21]) );
  EDFFX1 R1_reg_20_ ( .D(data_in_3[20]), .E(n3366), .CK(clk), .Q(R1[20]) );
  EDFFX1 R1_reg_19_ ( .D(data_in_3[19]), .E(n3366), .CK(clk), .Q(R1[19]) );
  EDFFX1 R1_reg_18_ ( .D(data_in_3[18]), .E(n3366), .CK(clk), .Q(R1[18]) );
  EDFFX1 R1_reg_5_ ( .D(data_in_3[5]), .E(n3365), .CK(clk), .Q(R1[5]) );
  EDFFX1 R1_reg_3_ ( .D(data_in_3[3]), .E(n3365), .CK(clk), .Q(R1[3]) );
  EDFFX1 R1_reg_2_ ( .D(data_in_3[2]), .E(n3365), .CK(clk), .Q(R1[2]) );
  EDFFX1 R1_reg_8_ ( .D(data_in_3[8]), .E(n3365), .CK(clk), .Q(R1[8]) );
  EDFFX1 R1_reg_29_ ( .D(data_in_3[29]), .E(n3365), .CK(clk), .Q(R1[29]) );
  EDFFX1 R1_reg_25_ ( .D(data_in_3[25]), .E(n3365), .CK(clk), .Q(R1[25]) );
  EDFFX1 R1_reg_27_ ( .D(data_in_3[27]), .E(n3365), .CK(clk), .Q(R1[27]) );
  EDFFX1 R1_reg_17_ ( .D(data_in_3[17]), .E(n3365), .CK(clk), .Q(R1[17]) );
  EDFFX1 R1_reg_0_ ( .D(data_in_3[0]), .E(n3365), .CK(clk), .Q(R1[0]) );
  EDFFX1 R1_reg_1_ ( .D(data_in_3[1]), .E(n3365), .CK(clk), .Q(R1[1]) );
  EDFFX1 R1_reg_9_ ( .D(data_in_3[9]), .E(n3365), .CK(clk), .Q(R1[9]) );
  EDFFX1 R1_reg_28_ ( .D(data_in_3[28]), .E(n3365), .CK(clk), .Q(R1[28]) );
  EDFFX1 R1_reg_10_ ( .D(data_in_3[10]), .E(n3365), .CK(clk), .Q(R1[10]) );
  EDFFX1 R1_reg_24_ ( .D(data_in_3[24]), .E(n3365), .CK(clk), .Q(R1[24]) );
  EDFFX1 R1_reg_4_ ( .D(data_in_3[4]), .E(n3365), .CK(clk), .Q(R1[4]) );
  EDFFX1 R1_reg_26_ ( .D(data_in_3[26]), .E(n3365), .CK(clk), .Q(R1[26]) );
  EDFFX1 R1_reg_22_ ( .D(data_in_3[22]), .E(n3365), .CK(clk), .Q(R1[22]) );
  EDFFX1 R1_reg_6_ ( .D(data_in_3[6]), .E(n3365), .CK(clk), .Q(R1[6]) );
  EDFFX1 R1_reg_7_ ( .D(data_in_3[7]), .E(n3365), .CK(clk), .Q(R1[7]) );
  EDFFX1 R15_reg_28_ ( .D(data_in_3[130]), .E(n3361), .CK(clk), .Q(n2562) );
  EDFFX1 R15_reg_27_ ( .D(data_in_3[129]), .E(n3361), .CK(clk), .Q(n2561) );
  EDFFX1 R15_reg_26_ ( .D(data_in_3[128]), .E(n3361), .CK(clk), .Q(n2560) );
  EDFFX1 R15_reg_25_ ( .D(data_in_3[127]), .E(n3361), .CK(clk), .Q(n2559) );
  EDFFX1 R15_reg_24_ ( .D(data_in_3[126]), .E(n3361), .CK(clk), .Q(n2558) );
  EDFFX1 R15_reg_23_ ( .D(data_in_3[125]), .E(n3361), .CK(clk), .Q(n2557) );
  EDFFX1 R15_reg_22_ ( .D(data_in_3[124]), .E(n3361), .CK(clk), .Q(n2556) );
  EDFFX1 R15_reg_21_ ( .D(data_in_3[123]), .E(n3361), .CK(clk), .Q(n2555) );
  EDFFX1 R15_reg_20_ ( .D(data_in_3[122]), .E(n3361), .CK(clk), .Q(n2554) );
  EDFFX1 R15_reg_19_ ( .D(data_in_3[121]), .E(n3361), .CK(clk), .Q(n2553) );
  EDFFX1 R15_reg_12_ ( .D(data_in_3[114]), .E(n3361), .CK(clk), .Q(n2552) );
  EDFFX1 R15_reg_11_ ( .D(data_in_3[113]), .E(n3361), .CK(clk), .Q(n2551) );
  EDFFX1 R15_reg_10_ ( .D(data_in_3[112]), .E(n3361), .CK(clk), .Q(n2550) );
  EDFFX1 R15_reg_9_ ( .D(data_in_3[111]), .E(n3361), .CK(clk), .Q(n2549) );
  EDFFX1 R15_reg_8_ ( .D(data_in_3[110]), .E(n3361), .CK(clk), .Q(n2548) );
  EDFFX1 R15_reg_7_ ( .D(data_in_3[109]), .E(n3361), .CK(clk), .Q(n2547) );
  EDFFX1 R15_reg_6_ ( .D(data_in_3[108]), .E(n3361), .CK(clk), .Q(n2546) );
  EDFFX1 R15_reg_5_ ( .D(data_in_3[107]), .E(n3361), .CK(clk), .Q(n2545) );
  EDFFX1 R15_reg_4_ ( .D(data_in_3[106]), .E(n3361), .CK(clk), .Q(n2544) );
  EDFFX1 R15_reg_3_ ( .D(data_in_3[105]), .E(n3360), .CK(clk), .Q(n2543) );
  EDFFX1 R15_reg_2_ ( .D(data_in_3[104]), .E(n3360), .CK(clk), .Q(n2542) );
  EDFFX1 R15_reg_16_ ( .D(data_in_3[118]), .E(n3360), .CK(clk), .Q(n2538) );
  EDFFX1 R15_reg_0_ ( .D(data_in_3[102]), .E(n3360), .CK(clk), .Q(n2536) );
  EDFFX1 R15_reg_17_ ( .D(data_in_3[119]), .E(n3360), .CK(clk), .Q(n2535) );
  EDFFX1 R15_reg_1_ ( .D(data_in_3[103]), .E(n3360), .CK(clk), .Q(n2526) );
  EDFFX1 R15_reg_18_ ( .D(data_in_3[120]), .E(n3360), .CK(clk), .Q(n2525) );
  EDFFX1 R14_reg_16_ ( .D(data_in_3[118]), .E(n3350), .CK(clk), .Q(n2686) );
  EDFFXL R12_reg_32_ ( .D(data_in_3[134]), .E(n3351), .CK(clk), .Q(n2683) );
  EDFFX1 R12_reg_33_ ( .D(data_in_3[135]), .E(n3352), .CK(clk), .Q(n2681) );
  EDFFX1 R13_reg_28_ ( .D(data_in_3[130]), .E(n3366), .CK(clk), .Q(n2585) );
  EDFFX1 R13_reg_27_ ( .D(data_in_3[129]), .E(n3367), .CK(clk), .Q(n2584) );
  EDFFX1 R13_reg_26_ ( .D(data_in_3[128]), .E(n3367), .CK(clk), .Q(n2583) );
  EDFFX1 R13_reg_25_ ( .D(data_in_3[127]), .E(n3367), .CK(clk), .Q(n2582) );
  EDFFX1 R13_reg_24_ ( .D(data_in_3[126]), .E(n3367), .CK(clk), .Q(n2581) );
  EDFFX1 R13_reg_23_ ( .D(data_in_3[125]), .E(n3367), .CK(clk), .Q(n2580) );
  EDFFX1 R13_reg_22_ ( .D(data_in_3[124]), .E(n3367), .CK(clk), .Q(n2579) );
  EDFFX1 R13_reg_21_ ( .D(data_in_3[123]), .E(n3367), .CK(clk), .Q(n2578) );
  EDFFX1 R13_reg_20_ ( .D(data_in_3[122]), .E(n3367), .CK(clk), .Q(n2577) );
  EDFFX1 R13_reg_19_ ( .D(data_in_3[121]), .E(n3367), .CK(clk), .Q(n2576) );
  EDFFX1 R13_reg_18_ ( .D(data_in_3[120]), .E(n3367), .CK(clk), .Q(n2575) );
  EDFFX1 R13_reg_12_ ( .D(data_in_3[114]), .E(n3367), .CK(clk), .Q(n2574) );
  EDFFX1 R13_reg_11_ ( .D(data_in_3[113]), .E(n3367), .CK(clk), .Q(n2573) );
  EDFFX1 R13_reg_10_ ( .D(data_in_3[112]), .E(n3364), .CK(clk), .Q(n2572) );
  EDFFX1 R13_reg_9_ ( .D(data_in_3[111]), .E(n3366), .CK(clk), .Q(n2571) );
  EDFFX1 R13_reg_8_ ( .D(data_in_3[110]), .E(n3365), .CK(clk), .Q(n2570) );
  EDFFX1 R13_reg_7_ ( .D(data_in_3[109]), .E(n3364), .CK(clk), .Q(n2569) );
  EDFFX1 R13_reg_6_ ( .D(data_in_3[108]), .E(n3366), .CK(clk), .Q(n2568) );
  EDFFX1 R13_reg_5_ ( .D(data_in_3[107]), .E(n3365), .CK(clk), .Q(n2567) );
  EDFFX1 R13_reg_4_ ( .D(data_in_3[106]), .E(n3364), .CK(clk), .Q(n2566) );
  EDFFX1 R13_reg_3_ ( .D(data_in_3[105]), .E(n3366), .CK(clk), .Q(n2565) );
  EDFFX1 R13_reg_2_ ( .D(data_in_3[104]), .E(n3365), .CK(clk), .Q(n2564) );
  EDFFX1 R13_reg_1_ ( .D(data_in_3[103]), .E(n3364), .CK(clk), .Q(n2563) );
  EDFFX1 R13_reg_0_ ( .D(data_in_3[102]), .E(n3366), .CK(clk), .Q(n2534) );
  EDFFX1 R13_reg_17_ ( .D(data_in_3[119]), .E(n3365), .CK(clk), .Q(n2531) );
  EDFFX1 R12_reg_28_ ( .D(data_in_3[130]), .E(n3352), .CK(clk), .Q(R12[28]) );
  EDFFX1 R12_reg_27_ ( .D(data_in_3[129]), .E(n3352), .CK(clk), .Q(R12[27]) );
  EDFFX1 R12_reg_26_ ( .D(data_in_3[128]), .E(n3352), .CK(clk), .Q(R12[26]) );
  EDFFX1 R12_reg_25_ ( .D(data_in_3[127]), .E(n3352), .CK(clk), .Q(R12[25]) );
  EDFFX1 R12_reg_24_ ( .D(data_in_3[126]), .E(n3352), .CK(clk), .Q(R12[24]) );
  EDFFX1 R12_reg_23_ ( .D(data_in_3[125]), .E(n3352), .CK(clk), .Q(R12[23]) );
  EDFFX1 R12_reg_22_ ( .D(data_in_3[124]), .E(n3352), .CK(clk), .Q(R12[22]) );
  EDFFX1 R12_reg_21_ ( .D(data_in_3[123]), .E(n3352), .CK(clk), .Q(R12[21]) );
  EDFFX1 R12_reg_20_ ( .D(data_in_3[122]), .E(n3352), .CK(clk), .Q(R12[20]) );
  EDFFX1 R12_reg_19_ ( .D(data_in_3[121]), .E(n3352), .CK(clk), .Q(R12[19]) );
  EDFFX1 R12_reg_12_ ( .D(data_in_3[114]), .E(n3352), .CK(clk), .Q(R12[12]) );
  EDFFX1 R12_reg_11_ ( .D(data_in_3[113]), .E(n3352), .CK(clk), .Q(R12[11]) );
  EDFFX1 R12_reg_10_ ( .D(data_in_3[112]), .E(n3352), .CK(clk), .Q(R12[10]) );
  EDFFX1 R12_reg_9_ ( .D(data_in_3[111]), .E(n3352), .CK(clk), .Q(R12[9]) );
  EDFFX1 R12_reg_8_ ( .D(data_in_3[110]), .E(n3352), .CK(clk), .Q(R12[8]) );
  EDFFX1 R12_reg_7_ ( .D(data_in_3[109]), .E(n3352), .CK(clk), .Q(R12[7]) );
  EDFFX1 R12_reg_6_ ( .D(data_in_3[108]), .E(n3352), .CK(clk), .Q(R12[6]) );
  EDFFX1 R12_reg_5_ ( .D(data_in_3[107]), .E(n3352), .CK(clk), .Q(R12[5]) );
  EDFFX1 R12_reg_4_ ( .D(data_in_3[106]), .E(n3352), .CK(clk), .Q(R12[4]) );
  EDFFX1 R12_reg_3_ ( .D(data_in_3[105]), .E(n3352), .CK(clk), .Q(R12[3]) );
  EDFFX1 R12_reg_2_ ( .D(data_in_3[104]), .E(n3351), .CK(clk), .Q(R12[2]) );
  EDFFX1 R12_reg_0_ ( .D(data_in_3[102]), .E(n3351), .CK(clk), .Q(R12[0]) );
  EDFFX1 R12_reg_17_ ( .D(data_in_3[119]), .E(n3351), .CK(clk), .Q(R12[17]) );
  EDFFX1 R12_reg_1_ ( .D(data_in_3[103]), .E(n3351), .CK(clk), .Q(R12[1]) );
  EDFFX1 R12_reg_18_ ( .D(data_in_3[120]), .E(n3351), .CK(clk), .Q(R12[18]) );
  EDFFX1 R12_reg_16_ ( .D(data_in_3[118]), .E(n3353), .CK(clk), .Q(R12[16]) );
  EDFFX1 R13_reg_16_ ( .D(data_in_3[118]), .E(n3364), .CK(clk), .Q(n1397) );
  EDFFX1 R13_reg_33_ ( .D(data_in_3[135]), .E(n3365), .CK(clk), .Q(n1399) );
  EDFFXL R13_reg_32_ ( .D(data_in_3[134]), .E(n3364), .CK(clk), .Q(n2140) );
  DFFX1 R15_reg_32_ ( .D(n586), .CK(clk), .Q(n2171) );
  EDFFX1 R2_reg_20_ ( .D(data_in_3[20]), .E(n3350), .CK(clk), .Q(n2492) );
  EDFFX1 R2_reg_18_ ( .D(data_in_3[18]), .E(n3350), .CK(clk), .Q(n2491) );
  EDFFX1 R2_reg_17_ ( .D(data_in_3[17]), .E(n3350), .CK(clk), .Q(n2490) );
  EDFFX1 R2_reg_3_ ( .D(data_in_3[3]), .E(n3350), .CK(clk), .Q(n2489) );
  EDFFX1 R2_reg_0_ ( .D(data_in_3[0]), .E(n3350), .CK(clk), .Q(n2470) );
  EDFFX1 R2_reg_1_ ( .D(data_in_3[1]), .E(n3350), .CK(clk), .Q(n2463) );
  EDFFX1 R3_reg_20_ ( .D(data_in_3[20]), .E(n3358), .CK(clk), .Q(R3[20]) );
  EDFFX1 R3_reg_19_ ( .D(data_in_3[19]), .E(n3358), .CK(clk), .Q(R3[19]) );
  EDFFX1 R3_reg_2_ ( .D(data_in_3[2]), .E(n3358), .CK(clk), .Q(R3[2]) );
  EDFFX1 R3_reg_17_ ( .D(data_in_3[17]), .E(n3358), .CK(clk), .Q(R3[17]) );
  EDFFX1 R3_reg_0_ ( .D(data_in_3[0]), .E(n3358), .CK(clk), .Q(R3[0]) );
  EDFFX1 R3_reg_1_ ( .D(data_in_3[1]), .E(n3357), .CK(clk), .Q(R3[1]) );
  EDFFX1 R3_reg_18_ ( .D(data_in_3[18]), .E(n3357), .CK(clk), .Q(R3[18]) );
  EDFFX1 R2_reg_23_ ( .D(data_in_3[23]), .E(n3349), .CK(clk), .Q(n2135) );
  EDFFX1 R2_reg_21_ ( .D(data_in_3[21]), .E(n3349), .CK(clk), .Q(n2134) );
  EDFFX1 R2_reg_19_ ( .D(data_in_3[19]), .E(n3349), .CK(clk), .Q(n2133) );
  EDFFX1 R2_reg_5_ ( .D(data_in_3[5]), .E(n3349), .CK(clk), .Q(n2132) );
  EDFFX1 R2_reg_2_ ( .D(data_in_3[2]), .E(n3349), .CK(clk), .Q(n2131) );
  EDFFX1 R2_reg_8_ ( .D(data_in_3[8]), .E(n3348), .CK(clk), .Q(n2130) );
  EDFFX1 R2_reg_29_ ( .D(data_in_3[29]), .E(n3348), .CK(clk), .Q(n2129) );
  EDFFX1 R2_reg_25_ ( .D(data_in_3[25]), .E(n3348), .CK(clk), .Q(n2128) );
  EDFFX1 R2_reg_27_ ( .D(data_in_3[27]), .E(n3348), .CK(clk), .Q(n2127) );
  EDFFX1 R2_reg_9_ ( .D(data_in_3[9]), .E(n3348), .CK(clk), .Q(n2121) );
  EDFFX1 R2_reg_28_ ( .D(data_in_3[28]), .E(n3348), .CK(clk), .Q(n2120) );
  EDFFX1 R2_reg_10_ ( .D(data_in_3[10]), .E(n3348), .CK(clk), .Q(n2119) );
  EDFFX1 R2_reg_24_ ( .D(data_in_3[24]), .E(n3348), .CK(clk), .Q(n2118) );
  EDFFX1 R2_reg_4_ ( .D(data_in_3[4]), .E(n3348), .CK(clk), .Q(n2117) );
  EDFFX1 R2_reg_22_ ( .D(data_in_3[22]), .E(n3348), .CK(clk), .Q(n2116) );
  EDFFX1 R2_reg_6_ ( .D(data_in_3[6]), .E(n3348), .CK(clk), .Q(n2115) );
  EDFFX1 R2_reg_7_ ( .D(data_in_3[7]), .E(n3348), .CK(clk), .Q(n2114) );
  EDFFX1 R2_reg_16_ ( .D(data_in_3[16]), .E(n3350), .CK(clk), .Q(n1409) );
  EDFFX1 R14_reg_28_ ( .D(data_in_3[130]), .E(n3350), .CK(clk), .Q(R14[28]) );
  EDFFX1 R14_reg_27_ ( .D(data_in_3[129]), .E(n3349), .CK(clk), .Q(R14[27]) );
  EDFFX1 R14_reg_26_ ( .D(data_in_3[128]), .E(n3348), .CK(clk), .Q(R14[26]) );
  EDFFX1 R14_reg_25_ ( .D(data_in_3[127]), .E(n3350), .CK(clk), .Q(R14[25]) );
  EDFFX1 R14_reg_24_ ( .D(data_in_3[126]), .E(n3350), .CK(clk), .Q(R14[24]) );
  EDFFX1 R14_reg_23_ ( .D(data_in_3[125]), .E(n3349), .CK(clk), .Q(R14[23]) );
  EDFFX1 R14_reg_22_ ( .D(data_in_3[124]), .E(n3348), .CK(clk), .Q(R14[22]) );
  EDFFX1 R14_reg_21_ ( .D(data_in_3[123]), .E(n3349), .CK(clk), .Q(R14[21]) );
  EDFFX1 R14_reg_20_ ( .D(data_in_3[122]), .E(n3348), .CK(clk), .Q(R14[20]) );
  EDFFX1 R14_reg_19_ ( .D(data_in_3[121]), .E(n3350), .CK(clk), .Q(R14[19]) );
  EDFFX1 R14_reg_12_ ( .D(data_in_3[114]), .E(n3350), .CK(clk), .Q(R14[12]) );
  EDFFX1 R14_reg_11_ ( .D(data_in_3[113]), .E(n3349), .CK(clk), .Q(R14[11]) );
  EDFFX1 R14_reg_10_ ( .D(data_in_3[112]), .E(n3348), .CK(clk), .Q(R14[10]) );
  EDFFX1 R14_reg_9_ ( .D(data_in_3[111]), .E(n3350), .CK(clk), .Q(R14[9]) );
  EDFFX1 R14_reg_8_ ( .D(data_in_3[110]), .E(n3348), .CK(clk), .Q(R14[8]) );
  EDFFX1 R14_reg_7_ ( .D(data_in_3[109]), .E(n3349), .CK(clk), .Q(R14[7]) );
  EDFFX1 R14_reg_6_ ( .D(data_in_3[108]), .E(n3348), .CK(clk), .Q(R14[6]) );
  EDFFX1 R14_reg_5_ ( .D(data_in_3[107]), .E(n3350), .CK(clk), .Q(R14[5]) );
  EDFFX1 R14_reg_4_ ( .D(data_in_3[106]), .E(n3349), .CK(clk), .Q(R14[4]) );
  EDFFX1 R14_reg_3_ ( .D(data_in_3[105]), .E(n3348), .CK(clk), .Q(R14[3]) );
  EDFFX1 R14_reg_2_ ( .D(data_in_3[104]), .E(n3349), .CK(clk), .Q(R14[2]) );
  EDFFX1 R14_reg_0_ ( .D(data_in_3[102]), .E(n3348), .CK(clk), .Q(R14[0]) );
  EDFFX1 R14_reg_17_ ( .D(data_in_3[119]), .E(n3349), .CK(clk), .Q(R14[17]) );
  EDFFX1 R14_reg_1_ ( .D(data_in_3[103]), .E(n3350), .CK(clk), .Q(R14[1]) );
  EDFFX1 R14_reg_18_ ( .D(data_in_3[120]), .E(n3350), .CK(clk), .Q(R14[18]) );
  DFFX1 R1_reg_16_ ( .D(n612), .CK(clk), .Q(n2180) );
  DFFX1 R3_reg_16_ ( .D(n587), .CK(clk), .Q(n2037) );
  DFFX1 R14_reg_33_ ( .D(n598), .CK(clk), .Q(n2039) );
  JKFFRXL counter_2_reg_0_ ( .J(1'b1), .K(1'b1), .CK(clk), .RN(rst_n), .Q(
        n2732), .QN(n862) );
  DFFRHQX1 counter_2_reg_3_ ( .D(N52), .CK(clk), .RN(rst_n), .Q(counter_2[3])
         );
  JKFFRXL counter_1_reg_0_ ( .J(1'b1), .K(1'b1), .CK(clk), .RN(rst_n), .QN(
        n585) );
  DFFRHQX1 counter_1_reg_1_ ( .D(N26), .CK(clk), .RN(rst_n), .Q(counter_1_1_)
         );
  DFFRHQX1 counter_2_reg_1_ ( .D(N50), .CK(clk), .RN(rst_n), .Q(counter_2[1])
         );
  DFFRHQX1 counter_2_reg_2_ ( .D(n1091), .CK(clk), .RN(rst_n), .Q(counter_2[2]) );
  EDFFX1 data_out_3_reg_7_ ( .D(N126), .E(n3356), .CK(clk), .Q(data_out_3[7])
         );
  EDFFX1 data_out_3_reg_6_ ( .D(N125), .E(n3356), .CK(clk), .Q(data_out_3[6])
         );
  EDFFX1 data_out_3_reg_5_ ( .D(N124), .E(n3356), .CK(clk), .Q(data_out_3[5])
         );
  EDFFX1 data_out_3_reg_4_ ( .D(N123), .E(n3356), .CK(clk), .Q(data_out_3[4])
         );
  EDFFX1 data_out_3_reg_3_ ( .D(N122), .E(n3356), .CK(clk), .Q(data_out_3[3])
         );
  EDFFX1 data_out_3_reg_2_ ( .D(N121), .E(n3356), .CK(clk), .Q(data_out_3[2])
         );
  EDFFX1 data_out_3_reg_33_ ( .D(N152), .E(n3356), .CK(clk), .Q(data_out_3[33]) );
  EDFFX1 data_out_3_reg_32_ ( .D(N151), .E(n3356), .CK(clk), .Q(data_out_3[32]) );
  EDFFX1 data_out_3_reg_31_ ( .D(N150), .E(n3356), .CK(clk), .Q(data_out_3[31]) );
  EDFFX1 data_out_3_reg_30_ ( .D(N149), .E(n3356), .CK(clk), .Q(data_out_3[30]) );
  EDFFX1 data_out_3_reg_29_ ( .D(N148), .E(n3356), .CK(clk), .Q(data_out_3[29]) );
  EDFFX1 data_out_3_reg_28_ ( .D(N147), .E(n3356), .CK(clk), .Q(data_out_3[28]) );
  EDFFX1 data_out_3_reg_27_ ( .D(N146), .E(n3356), .CK(clk), .Q(data_out_3[27]) );
  EDFFX1 data_out_3_reg_26_ ( .D(N145), .E(n3356), .CK(clk), .Q(data_out_3[26]) );
  EDFFX1 data_out_3_reg_25_ ( .D(N144), .E(n3356), .CK(clk), .Q(data_out_3[25]) );
  EDFFX1 data_out_3_reg_24_ ( .D(N143), .E(n3356), .CK(clk), .Q(data_out_3[24]) );
  EDFFX1 data_out_3_reg_23_ ( .D(N142), .E(n3356), .CK(clk), .Q(data_out_3[23]) );
  EDFFX1 data_out_3_reg_22_ ( .D(N141), .E(n3356), .CK(clk), .Q(data_out_3[22]) );
  EDFFX1 data_out_3_reg_21_ ( .D(N140), .E(n3356), .CK(clk), .Q(data_out_3[21]) );
  EDFFX1 data_out_3_reg_20_ ( .D(N139), .E(n3356), .CK(clk), .Q(data_out_3[20]) );
  EDFFX1 data_out_3_reg_19_ ( .D(N138), .E(n3356), .CK(clk), .Q(data_out_3[19]) );
  EDFFX1 data_out_3_reg_18_ ( .D(N137), .E(n3356), .CK(clk), .Q(data_out_3[18]) );
  EDFFX1 data_out_3_reg_17_ ( .D(N136), .E(n3356), .CK(clk), .Q(data_out_3[17]) );
  EDFFX1 data_out_3_reg_16_ ( .D(N135), .E(n3356), .CK(clk), .Q(data_out_3[16]) );
  EDFFX1 data_out_3_reg_15_ ( .D(N134), .E(n3356), .CK(clk), .Q(data_out_3[15]) );
  EDFFX1 data_out_3_reg_14_ ( .D(N133), .E(n3356), .CK(clk), .Q(data_out_3[14]) );
  EDFFX1 data_out_3_reg_13_ ( .D(N132), .E(n3356), .CK(clk), .Q(data_out_3[13]) );
  EDFFX1 data_out_3_reg_12_ ( .D(N131), .E(n3356), .CK(clk), .Q(data_out_3[12]) );
  EDFFX1 data_out_3_reg_10_ ( .D(N129), .E(n3356), .CK(clk), .Q(data_out_3[10]) );
  EDFFX1 data_out_3_reg_9_ ( .D(N128), .E(n3356), .CK(clk), .Q(data_out_3[9])
         );
  EDFFX1 data_out_3_reg_8_ ( .D(N127), .E(n3356), .CK(clk), .Q(data_out_3[8])
         );
  EDFFX1 data_out_3_reg_1_ ( .D(N120), .E(n3356), .CK(clk), .Q(data_out_3[1])
         );
  EDFFX1 data_out_3_reg_0_ ( .D(N119), .E(n3356), .CK(clk), .Q(data_out_3[0])
         );
  EDFFX1 data_out_3_reg_11_ ( .D(N130), .E(n3356), .CK(clk), .Q(data_out_3[11]) );
  EDFFXL R0_reg_15_ ( .D(data_in_3[15]), .E(n3352), .CK(clk), .Q(n2058) );
  EDFFXL R2_reg_15_ ( .D(data_in_3[15]), .E(n3348), .CK(clk), .Q(n1426) );
  EDFFXL R5_reg_14_ ( .D(data_in_3[48]), .E(n3364), .CK(clk), .QN(n1448) );
  EDFFXL R5_reg_12_ ( .D(data_in_3[46]), .E(n3365), .CK(clk), .QN(n2057) );
  EDFFXL R7_reg_14_ ( .D(data_in_3[48]), .E(n3358), .CK(clk), .QN(n2103) );
  EDFFXL R3_reg_5_ ( .D(data_in_3[5]), .E(n3358), .CK(clk), .Q(R3[5]) );
  EDFFXL R2_reg_33_ ( .D(data_in_3[33]), .E(n3348), .CK(clk), .Q(n1396) );
  EDFFXL R0_reg_33_ ( .D(data_in_3[33]), .E(n3351), .CK(clk), .Q(n2073) );
  EDFFXL R15_reg_30_ ( .D(data_in_3[132]), .E(n3359), .CK(clk), .Q(n2071) );
  EDFFXL R13_reg_30_ ( .D(data_in_3[132]), .E(n3366), .CK(clk), .Q(n1452) );
  EDFFX1 R5_reg_24_ ( .D(data_in_3[58]), .E(n3364), .CK(clk), .QN(n2263) );
  EDFFX1 R5_reg_7_ ( .D(data_in_3[41]), .E(n3364), .CK(clk), .QN(n2255) );
  EDFFX1 R5_reg_3_ ( .D(data_in_3[37]), .E(n3364), .CK(clk), .QN(n2251) );
  EDFFX1 R3_reg_24_ ( .D(data_in_3[24]), .E(n3358), .CK(clk), .Q(R3[24]) );
  EDFFX1 R3_reg_7_ ( .D(data_in_3[7]), .E(n3358), .CK(clk), .Q(R3[7]) );
  EDFFX1 R3_reg_3_ ( .D(data_in_3[3]), .E(n3357), .CK(clk), .Q(R3[3]) );
  EDFFX1 R0_reg_30_ ( .D(data_in_3[30]), .E(n3353), .CK(clk), .Q(n2078) );
  EDFFX1 R0_reg_32_ ( .D(data_in_3[32]), .E(n3351), .CK(clk), .Q(n2077) );
  EDFFX1 R0_reg_31_ ( .D(data_in_3[31]), .E(n3353), .CK(clk), .Q(n2074) );
  EDFFX1 R0_reg_14_ ( .D(data_in_3[14]), .E(n3353), .CK(clk), .Q(n2063) );
  EDFFX1 R12_reg_14_ ( .D(data_in_3[116]), .E(n3352), .CK(clk), .Q(n2682) );
  EDFFX1 R12_reg_13_ ( .D(data_in_3[115]), .E(n3353), .CK(clk), .Q(n2674) );
  EDFFX1 R12_reg_15_ ( .D(data_in_3[117]), .E(n3351), .CK(clk), .Q(n2689) );
  EDFFX1 R5_reg_25_ ( .D(data_in_3[59]), .E(n3364), .CK(clk), .QN(n2264) );
  EDFFX1 R5_reg_8_ ( .D(data_in_3[42]), .E(n3364), .CK(clk), .QN(n2256) );
  EDFFX1 R5_reg_5_ ( .D(data_in_3[39]), .E(n3364), .CK(clk), .QN(n2253) );
  EDFFX1 R5_reg_4_ ( .D(data_in_3[38]), .E(n3364), .CK(clk), .QN(n2252) );
  EDFFX1 R5_reg_11_ ( .D(data_in_3[45]), .E(n3365), .CK(clk), .QN(n2084) );
  EDFFX1 R5_reg_32_ ( .D(data_in_3[66]), .E(n3365), .CK(clk), .QN(n2051) );
  EDFFX1 R6_reg_13_ ( .D(data_in_3[47]), .E(n3349), .CK(clk), .QN(n674) );
  EDFFX1 R4_reg_14_ ( .D(data_in_3[48]), .E(n3351), .CK(clk), .QN(n741) );
  EDFFX1 R3_reg_21_ ( .D(data_in_3[21]), .E(n3358), .CK(clk), .Q(R3[21]) );
  EDFFX1 R3_reg_8_ ( .D(data_in_3[8]), .E(n3358), .CK(clk), .Q(R3[8]) );
  EDFFX1 R3_reg_4_ ( .D(data_in_3[4]), .E(n3358), .CK(clk), .Q(R3[4]) );
  EDFFX1 R2_reg_32_ ( .D(data_in_3[32]), .E(n3348), .CK(clk), .Q(n2124) );
  EDFFX1 R2_reg_30_ ( .D(data_in_3[30]), .E(n3348), .CK(clk), .Q(n1436) );
  EDFFX1 R2_reg_31_ ( .D(data_in_3[31]), .E(n3348), .CK(clk), .Q(n1435) );
  EDFFX1 R2_reg_14_ ( .D(data_in_3[14]), .E(n3348), .CK(clk), .Q(n1421) );
  EDFFX1 R15_reg_13_ ( .D(data_in_3[115]), .E(n3359), .CK(clk), .Q(n2068) );
  EDFFX1 R12_reg_29_ ( .D(data_in_3[131]), .E(n3351), .CK(clk), .Q(R12[29]) );
  EDFFX1 R13_reg_15_ ( .D(data_in_3[117]), .E(n3364), .CK(clk), .Q(n1408) );
  EDFFX1 R13_reg_13_ ( .D(data_in_3[115]), .E(n3366), .CK(clk), .Q(n1434) );
  EDFFX1 R5_reg_27_ ( .D(data_in_3[61]), .E(n3365), .CK(clk), .QN(n2266) );
  EDFFX1 R5_reg_26_ ( .D(data_in_3[60]), .E(n3364), .CK(clk), .QN(n2265) );
  EDFFX1 R5_reg_23_ ( .D(data_in_3[57]), .E(n3364), .CK(clk), .QN(n2262) );
  EDFFX1 R5_reg_22_ ( .D(data_in_3[56]), .E(n3364), .CK(clk), .QN(n2261) );
  EDFFX1 R5_reg_21_ ( .D(data_in_3[55]), .E(n3364), .CK(clk), .QN(n2260) );
  EDFFX1 R5_reg_10_ ( .D(data_in_3[44]), .E(n3364), .CK(clk), .QN(n2257) );
  EDFFX1 R5_reg_6_ ( .D(data_in_3[40]), .E(n3364), .CK(clk), .QN(n2254) );
  EDFFX1 R5_reg_9_ ( .D(data_in_3[43]), .E(n3365), .CK(clk), .QN(n2166) );
  EDFFX1 R5_reg_31_ ( .D(data_in_3[65]), .E(n3365), .CK(clk), .QN(n1414) );
  EDFFX1 R3_reg_28_ ( .D(data_in_3[28]), .E(n3358), .CK(clk), .Q(R3[28]) );
  EDFFX1 R3_reg_27_ ( .D(data_in_3[27]), .E(n3358), .CK(clk), .Q(R3[27]) );
  EDFFX1 R3_reg_23_ ( .D(data_in_3[23]), .E(n3358), .CK(clk), .Q(R3[23]) );
  EDFFX1 R3_reg_22_ ( .D(data_in_3[22]), .E(n3358), .CK(clk), .Q(R3[22]) );
  EDFFX1 R3_reg_10_ ( .D(data_in_3[10]), .E(n3358), .CK(clk), .Q(R3[10]) );
  EDFFX1 R3_reg_9_ ( .D(data_in_3[9]), .E(n3358), .CK(clk), .Q(R3[9]) );
  EDFFX1 R3_reg_30_ ( .D(data_in_3[30]), .E(n3358), .CK(clk), .Q(n2676) );
  EDFFX1 R3_reg_31_ ( .D(data_in_3[31]), .E(n3357), .CK(clk), .Q(n2678) );
  EDFFX1 R15_reg_29_ ( .D(data_in_3[131]), .E(n3360), .CK(clk), .Q(n2067) );
  EDFFX1 R13_reg_29_ ( .D(data_in_3[131]), .E(n3364), .CK(clk), .Q(n2149) );
  EDFFX1 R13_reg_14_ ( .D(data_in_3[116]), .E(n3366), .CK(clk), .Q(n1427) );
  EDFFXL R6_reg_29_ ( .D(data_in_3[63]), .E(n3349), .CK(clk), .QN(n658) );
  EDFFXL R4_reg_29_ ( .D(data_in_3[63]), .E(n3351), .CK(clk), .QN(n726) );
  EDFFXL R7_reg_29_ ( .D(data_in_3[63]), .E(n3357), .CK(clk), .QN(n2104) );
  EDFFXL R5_reg_29_ ( .D(data_in_3[63]), .E(n3366), .CK(clk), .QN(n2099) );
  EDFFX1 R6_reg_33_ ( .D(data_in_3[67]), .E(n3350), .CK(clk), .QN(n654) );
  EDFFX1 R12_reg_30_ ( .D(data_in_3[132]), .E(n3352), .CK(clk), .Q(n2677) );
  EDFFX1 R6_reg_14_ ( .D(data_in_3[48]), .E(n3350), .CK(clk), .QN(n673) );
  EDFFX1 R3_reg_25_ ( .D(data_in_3[25]), .E(n3358), .CK(clk), .Q(R3[25]) );
  EDFFX1 R3_reg_29_ ( .D(data_in_3[29]), .E(n3359), .CK(clk), .Q(R3[29]) );
  EDFFX1 R3_reg_6_ ( .D(data_in_3[6]), .E(n3358), .CK(clk), .Q(R3[6]) );
  EDFFX1 R3_reg_26_ ( .D(data_in_3[26]), .E(n3358), .CK(clk), .Q(R3[26]) );
  EDFFXL R9_reg_14_ ( .D(data_in_3[82]), .E(n3366), .CK(clk), .QN(n2697) );
  EDFFXL R11_reg_14_ ( .D(data_in_3[82]), .E(n3360), .CK(clk), .QN(n2095) );
  EDFFXL R8_reg_14_ ( .D(data_in_3[82]), .E(n3351), .CK(clk), .QN(n775) );
  EDFFXL R10_reg_14_ ( .D(data_in_3[82]), .E(n3349), .CK(clk), .QN(n639) );
  EDFFXL R9_reg_15_ ( .D(data_in_3[83]), .E(n3364), .CK(clk), .QN(n2680) );
  EDFFXL R11_reg_15_ ( .D(data_in_3[83]), .E(n3358), .CK(clk), .QN(n2082) );
  EDFFXL R8_reg_15_ ( .D(data_in_3[83]), .E(n3351), .CK(clk), .QN(n774) );
  EDFFXL R10_reg_15_ ( .D(data_in_3[83]), .E(n3348), .CK(clk), .QN(n638) );
  EDFFXL R5_reg_30_ ( .D(data_in_3[64]), .E(n3364), .CK(clk), .QN(n1438) );
  EDFFXL R4_reg_30_ ( .D(data_in_3[64]), .E(n3351), .CK(clk), .QN(n725) );
  EDFFXL R7_reg_30_ ( .D(data_in_3[64]), .E(n3360), .CK(clk), .QN(n2083) );
  EDFFXL R6_reg_30_ ( .D(data_in_3[64]), .E(n3350), .CK(clk), .QN(n657) );
  EDFFXL R11_reg_28_ ( .D(data_in_3[96]), .E(n3357), .CK(clk), .QN(n2283) );
  EDFFXL R8_reg_28_ ( .D(data_in_3[96]), .E(n3353), .CK(clk), .QN(n761) );
  EDFFXL R10_reg_28_ ( .D(data_in_3[96]), .E(n3348), .CK(clk), .QN(n625) );
  EDFFXL R9_reg_28_ ( .D(data_in_3[96]), .E(n3364), .CK(clk), .QN(n2373) );
  EDFFXL R5_reg_28_ ( .D(data_in_3[62]), .E(n3365), .CK(clk), .QN(n2267) );
  EDFFXL R6_reg_28_ ( .D(data_in_3[62]), .E(n3349), .CK(clk), .QN(n659) );
  EDFFXL R7_reg_28_ ( .D(data_in_3[62]), .E(n3359), .CK(clk), .QN(n2386) );
  EDFFXL R4_reg_28_ ( .D(data_in_3[62]), .E(n3351), .CK(clk), .QN(n727) );
  EDFFXL R12_reg_31_ ( .D(data_in_3[133]), .E(n3352), .CK(clk), .Q(n2684) );
  EDFFXL R13_reg_31_ ( .D(data_in_3[133]), .E(n3365), .CK(clk), .Q(n1407) );
  EDFFXL R0_reg_12_ ( .D(data_in_3[12]), .E(n3351), .CK(clk), .Q(R0[12]) );
  EDFFXL R2_reg_12_ ( .D(data_in_3[12]), .E(n3348), .CK(clk), .Q(R2[12]) );
  EDFFXL R3_reg_12_ ( .D(data_in_3[12]), .E(n2001), .CK(clk), .Q(R3[12]) );
  EDFFXL R1_reg_12_ ( .D(data_in_3[12]), .E(n2000), .CK(clk), .Q(R1[12]) );
  EDFFXL R3_reg_11_ ( .D(data_in_3[11]), .E(n2001), .CK(clk), .Q(R3[11]) );
  EDFFXL R1_reg_13_ ( .D(data_in_3[13]), .E(n2000), .CK(clk), .Q(R1[13]) );
  EDFFXL R0_reg_11_ ( .D(data_in_3[11]), .E(n3352), .CK(clk), .Q(R0[11]) );
  EDFFXL R1_reg_11_ ( .D(data_in_3[11]), .E(n2000), .CK(clk), .Q(R1[11]) );
  EDFFXL R3_reg_13_ ( .D(data_in_3[13]), .E(n2001), .CK(clk), .Q(R3[13]) );
  EDFFXL R2_reg_11_ ( .D(data_in_3[11]), .E(n3349), .CK(clk), .Q(R2[11]) );
  EDFFXL R0_reg_13_ ( .D(data_in_3[13]), .E(n3351), .CK(clk), .Q(R0[13]) );
  EDFFXL R2_reg_13_ ( .D(data_in_3[13]), .E(n3348), .CK(clk), .Q(R2[13]) );
  EDFFXL R1_reg_31_ ( .D(data_in_3[31]), .E(n2000), .CK(clk), .Q(n2178) );
  EDFFXL R14_reg_13_ ( .D(data_in_3[115]), .E(n3349), .CK(clk), .Q(n2043) );
  EDFFXL R15_reg_31_ ( .D(data_in_3[133]), .E(n2001), .CK(clk), .Q(n2170) );
  EDFFXL R3_reg_33_ ( .D(data_in_3[33]), .E(n2001), .CK(clk), .Q(n2033) );
  EDFFXL R1_reg_33_ ( .D(data_in_3[33]), .E(n3367), .CK(clk), .Q(n2174) );
  EDFFXL R15_reg_15_ ( .D(data_in_3[117]), .E(n3361), .CK(clk), .Q(n2169) );
  EDFFXL R14_reg_15_ ( .D(data_in_3[117]), .E(n3348), .CK(clk), .Q(n2038) );
  EDFFXL R14_reg_31_ ( .D(data_in_3[133]), .E(n3349), .CK(clk), .Q(n2042) );
  EDFFXL R15_reg_14_ ( .D(data_in_3[116]), .E(n2001), .CK(clk), .Q(n2172) );
  EDFFXL R14_reg_14_ ( .D(data_in_3[116]), .E(n3348), .CK(clk), .Q(n2040) );
  EDFFXL R3_reg_14_ ( .D(data_in_3[14]), .E(n2001), .CK(clk), .Q(n2034) );
  EDFFXL R1_reg_30_ ( .D(data_in_3[30]), .E(n2000), .CK(clk), .Q(n2179) );
  EDFFXL R1_reg_14_ ( .D(data_in_3[14]), .E(n2000), .CK(clk), .Q(n2176) );
  EDFFXL R3_reg_32_ ( .D(data_in_3[32]), .E(n2001), .CK(clk), .Q(n2035) );
  EDFFXL R1_reg_32_ ( .D(data_in_3[32]), .E(n3367), .CK(clk), .Q(n2175) );
  EDFFXL R14_reg_30_ ( .D(data_in_3[132]), .E(n3349), .CK(clk), .Q(n2041) );
  EDFFXL R15_reg_33_ ( .D(data_in_3[135]), .E(n2001), .CK(clk), .Q(n2173) );
  EDFFXL R14_reg_32_ ( .D(data_in_3[134]), .E(n3348), .CK(clk), .Q(n2045) );
  EDFFXL R14_reg_29_ ( .D(data_in_3[131]), .E(n3349), .CK(clk), .Q(n2044) );
  EDFFXL R3_reg_15_ ( .D(data_in_3[15]), .E(n2001), .CK(clk), .Q(n2032) );
  EDFFXL R1_reg_15_ ( .D(data_in_3[15]), .E(n2000), .CK(clk), .Q(n2177) );
  JKFFRX2 p_s_flag_out_reg ( .J(n689), .K(1'b0), .CK(clk), .RN(rst_n), .Q(
        n3356) );
  INVXL U3 ( .A(n806), .Y(n3347) );
  INVXL U6 ( .A(n816), .Y(n3329) );
  INVXL U7 ( .A(n812), .Y(n3336) );
  AND3X2 U8 ( .A(n573), .B(n2732), .C(n618), .Y(n2725) );
  AND3X2 U9 ( .A(counter_2[3]), .B(n2732), .C(n618), .Y(n2726) );
  AND4X2 U10 ( .A(n862), .B(n688), .C(n619), .D(n573), .Y(n2727) );
  AND3X2 U11 ( .A(n688), .B(n573), .C(n1088), .Y(n2728) );
  OR2X2 U12 ( .A(n690), .B(n573), .Y(n2729) );
  OR3XL U13 ( .A(n573), .B(n619), .C(n801), .Y(n2730) );
  OR2X2 U14 ( .A(n690), .B(counter_2[3]), .Y(n2731) );
  NOR3X2 U15 ( .A(n585), .B(p_s_flag_in), .C(counter_1_1_), .Y(n2001) );
  INVX2 U17 ( .A(n710), .Y(n598) );
  AOI22XL U18 ( .A0(n3367), .A1(data_in_3[16]), .B0(n3363), .B1(n2180), .Y(
        n718) );
  AOI22XL U19 ( .A0(n3361), .A1(data_in_3[16]), .B0(n3362), .B1(n2037), .Y(
        n717) );
  INVX1 U20 ( .A(n800), .Y(n3355) );
  CLKINVX3 U21 ( .A(n3363), .Y(n3364) );
  CLKINVX3 U22 ( .A(n3363), .Y(n3365) );
  CLKINVX3 U23 ( .A(n3363), .Y(n3366) );
  CLKINVX3 U24 ( .A(n3362), .Y(n3357) );
  CLKINVX3 U25 ( .A(n3362), .Y(n3358) );
  CLKINVX3 U26 ( .A(n3362), .Y(n3359) );
  INVX1 U27 ( .A(n2725), .Y(n3327) );
  INVX1 U28 ( .A(n800), .Y(n3354) );
  INVX1 U29 ( .A(n3325), .Y(n3323) );
  INVX1 U30 ( .A(n2730), .Y(n3343) );
  INVX1 U31 ( .A(n3341), .Y(n3340) );
  INVX1 U32 ( .A(n2729), .Y(n3331) );
  CLKINVX3 U33 ( .A(n3313), .Y(n3348) );
  CLKINVX3 U34 ( .A(n3313), .Y(n3349) );
  CLKINVX3 U35 ( .A(n697), .Y(n3351) );
  CLKINVX3 U36 ( .A(n697), .Y(n3352) );
  CLKINVX3 U37 ( .A(n697), .Y(n3353) );
  CLKINVX3 U38 ( .A(n3362), .Y(n3360) );
  INVX1 U39 ( .A(n2731), .Y(n3315) );
  CLKINVX3 U40 ( .A(n3362), .Y(n3361) );
  CLKINVX3 U41 ( .A(n3313), .Y(n3350) );
  INVX1 U42 ( .A(n3339), .Y(n3337) );
  INVX1 U43 ( .A(n3347), .Y(n3346) );
  INVX1 U44 ( .A(n3329), .Y(n3328) );
  INVX1 U45 ( .A(n2727), .Y(n3322) );
  INVX1 U46 ( .A(n3336), .Y(n3335) );
  INVX1 U47 ( .A(n2726), .Y(n3345) );
  INVX1 U48 ( .A(n2728), .Y(n3320) );
  INVX1 U49 ( .A(n3325), .Y(n3324) );
  INVX1 U50 ( .A(n3339), .Y(n3338) );
  INVX1 U51 ( .A(n2001), .Y(n3362) );
  INVX1 U52 ( .A(n2725), .Y(n3326) );
  INVX1 U53 ( .A(n3363), .Y(n3367) );
  NAND2X1 U54 ( .A(n799), .B(n573), .Y(n800) );
  INVX1 U55 ( .A(n3318), .Y(n3316) );
  INVX1 U56 ( .A(n3334), .Y(n3332) );
  INVX1 U57 ( .A(n3334), .Y(n3333) );
  INVX1 U58 ( .A(n3318), .Y(n3317) );
  INVX1 U59 ( .A(n811), .Y(n3339) );
  INVX1 U60 ( .A(n819), .Y(n3325) );
  INVX1 U61 ( .A(n2727), .Y(n3321) );
  INVX1 U62 ( .A(n2728), .Y(n3319) );
  INVX1 U63 ( .A(n2726), .Y(n3344) );
  INVX1 U64 ( .A(n2730), .Y(n3342) );
  INVX1 U65 ( .A(n810), .Y(n3341) );
  INVX1 U66 ( .A(n2731), .Y(n3314) );
  INVX1 U67 ( .A(n2729), .Y(n3330) );
  OAI21XL U68 ( .A0(n799), .A1(n573), .B0(n800), .Y(N52) );
  NOR3X1 U69 ( .A(n619), .B(n862), .C(n688), .Y(n799) );
  NOR3X1 U70 ( .A(n619), .B(counter_2[3]), .C(n801), .Y(n819) );
  NAND4X1 U71 ( .A(counter_2[3]), .B(n862), .C(n688), .D(n619), .Y(n811) );
  INVX1 U72 ( .A(counter_2[3]), .Y(n573) );
  INVX1 U73 ( .A(n691), .Y(n618) );
  NAND3X1 U74 ( .A(counter_2[3]), .B(n862), .C(n618), .Y(n806) );
  NAND3X1 U75 ( .A(n862), .B(n573), .C(n618), .Y(n816) );
  NAND3X1 U76 ( .A(n1088), .B(n688), .C(counter_2[3]), .Y(n812) );
  INVX1 U77 ( .A(n2000), .Y(n3363) );
  INVX1 U78 ( .A(n814), .Y(n3334) );
  INVX1 U79 ( .A(n823), .Y(n3318) );
  OAI211X1 U80 ( .A0(n619), .A1(n2732), .B0(n690), .C0(n691), .Y(n1091) );
  INVX1 U81 ( .A(n717), .Y(n587) );
  INVX1 U82 ( .A(n718), .Y(n612) );
  INVX1 U83 ( .A(n715), .Y(n586) );
  AOI22X1 U84 ( .A0(n3361), .A1(data_in_3[134]), .B0(n3362), .B1(n2171), .Y(
        n715) );
  AOI22X1 U85 ( .A0(n3313), .A1(n2039), .B0(n3350), .B1(data_in_3[135]), .Y(
        n710) );
  NAND3X1 U86 ( .A(counter_1_1_), .B(n689), .C(n585), .Y(n697) );
  INVX1 U87 ( .A(counter_2[2]), .Y(n619) );
  INVX1 U88 ( .A(counter_2[1]), .Y(n688) );
  OAI221XL U89 ( .A0(n676), .A1(n3346), .B0(n642), .B1(n3345), .C0(n998), .Y(
        n997) );
  AOI22X1 U90 ( .A0(n3343), .A1(R14[11]), .B0(n3340), .B1(R3[11]), .Y(n998) );
  OAI221XL U91 ( .A0(n687), .A1(n806), .B0(n653), .B1(n3345), .C0(n1086), .Y(
        n1085) );
  AOI22X1 U92 ( .A0(n3342), .A1(R14[0]), .B0(n810), .B1(R3[0]), .Y(n1086) );
  OAI221XL U93 ( .A0(n686), .A1(n806), .B0(n652), .B1(n3344), .C0(n1078), .Y(
        n1077) );
  AOI22X1 U94 ( .A0(n3342), .A1(R14[1]), .B0(n810), .B1(R3[1]), .Y(n1078) );
  OAI221XL U95 ( .A0(n679), .A1(n3346), .B0(n645), .B1(n3345), .C0(n1022), .Y(
        n1021) );
  AOI22X1 U96 ( .A0(n3343), .A1(R14[8]), .B0(n810), .B1(R3[8]), .Y(n1022) );
  OAI221XL U97 ( .A0(n678), .A1(n3346), .B0(n644), .B1(n3344), .C0(n1014), .Y(
        n1013) );
  AOI22X1 U98 ( .A0(n3343), .A1(R14[9]), .B0(n3340), .B1(R3[9]), .Y(n1014) );
  OAI221XL U99 ( .A0(n677), .A1(n3346), .B0(n643), .B1(n3345), .C0(n1006), .Y(
        n1005) );
  AOI22X1 U100 ( .A0(n3343), .A1(R14[10]), .B0(n3340), .B1(R3[10]), .Y(n1006)
         );
  OAI221XL U101 ( .A0(n675), .A1(n3346), .B0(n641), .B1(n3345), .C0(n990), .Y(
        n989) );
  AOI22X1 U102 ( .A0(n3343), .A1(R14[12]), .B0(n3340), .B1(R3[12]), .Y(n990)
         );
  OAI221XL U103 ( .A0(n674), .A1(n3346), .B0(n640), .B1(n3345), .C0(n982), .Y(
        n981) );
  AOI22X1 U104 ( .A0(n3343), .A1(n2043), .B0(n3340), .B1(R3[13]), .Y(n982) );
  OAI221XL U105 ( .A0(n673), .A1(n3346), .B0(n639), .B1(n3345), .C0(n974), .Y(
        n973) );
  AOI22X1 U106 ( .A0(n3343), .A1(n2040), .B0(n3340), .B1(n2034), .Y(n974) );
  OAI221XL U107 ( .A0(n672), .A1(n3346), .B0(n638), .B1(n3345), .C0(n966), .Y(
        n965) );
  AOI22X1 U108 ( .A0(n3343), .A1(n2038), .B0(n3340), .B1(n2032), .Y(n966) );
  OAI221XL U109 ( .A0(n671), .A1(n3346), .B0(n637), .B1(n3345), .C0(n958), .Y(
        n957) );
  AOI22X1 U110 ( .A0(n2686), .A1(n3342), .B0(n3340), .B1(n2037), .Y(n958) );
  OAI221XL U111 ( .A0(n670), .A1(n3346), .B0(n636), .B1(n3345), .C0(n950), .Y(
        n949) );
  AOI22X1 U112 ( .A0(n3343), .A1(R14[17]), .B0(n3340), .B1(R3[17]), .Y(n950)
         );
  OAI221XL U113 ( .A0(n669), .A1(n3346), .B0(n635), .B1(n3345), .C0(n942), .Y(
        n941) );
  AOI22X1 U114 ( .A0(n3343), .A1(R14[18]), .B0(n3340), .B1(R3[18]), .Y(n942)
         );
  OAI221XL U115 ( .A0(n668), .A1(n3346), .B0(n634), .B1(n3345), .C0(n934), .Y(
        n933) );
  AOI22X1 U116 ( .A0(n3343), .A1(R14[19]), .B0(n3340), .B1(R3[19]), .Y(n934)
         );
  OAI221XL U117 ( .A0(n667), .A1(n3346), .B0(n633), .B1(n3345), .C0(n926), .Y(
        n925) );
  AOI22X1 U118 ( .A0(n3343), .A1(R14[20]), .B0(n3340), .B1(R3[20]), .Y(n926)
         );
  OAI221XL U119 ( .A0(n666), .A1(n806), .B0(n632), .B1(n3345), .C0(n918), .Y(
        n917) );
  AOI22X1 U120 ( .A0(n3342), .A1(R14[21]), .B0(n810), .B1(R3[21]), .Y(n918) );
  OAI221XL U121 ( .A0(n665), .A1(n806), .B0(n631), .B1(n3344), .C0(n910), .Y(
        n909) );
  AOI22X1 U122 ( .A0(n3342), .A1(R14[22]), .B0(n810), .B1(R3[22]), .Y(n910) );
  OAI221XL U123 ( .A0(n664), .A1(n806), .B0(n630), .B1(n3344), .C0(n902), .Y(
        n901) );
  AOI22X1 U124 ( .A0(n3342), .A1(R14[23]), .B0(n810), .B1(R3[23]), .Y(n902) );
  OAI221XL U125 ( .A0(n663), .A1(n806), .B0(n629), .B1(n3344), .C0(n894), .Y(
        n893) );
  AOI22X1 U126 ( .A0(n3343), .A1(R14[24]), .B0(n810), .B1(R3[24]), .Y(n894) );
  OAI221XL U127 ( .A0(n662), .A1(n806), .B0(n628), .B1(n3344), .C0(n886), .Y(
        n885) );
  AOI22X1 U128 ( .A0(n3342), .A1(R14[25]), .B0(n810), .B1(R3[25]), .Y(n886) );
  OAI221XL U129 ( .A0(n661), .A1(n806), .B0(n627), .B1(n3344), .C0(n878), .Y(
        n877) );
  AOI22X1 U130 ( .A0(n3342), .A1(R14[26]), .B0(n810), .B1(R3[26]), .Y(n878) );
  OAI221XL U131 ( .A0(n660), .A1(n806), .B0(n626), .B1(n3344), .C0(n870), .Y(
        n869) );
  AOI22X1 U132 ( .A0(n3342), .A1(R14[27]), .B0(n810), .B1(R3[27]), .Y(n870) );
  OAI221XL U133 ( .A0(n659), .A1(n806), .B0(n625), .B1(n3344), .C0(n861), .Y(
        n860) );
  AOI22X1 U134 ( .A0(n3342), .A1(R14[28]), .B0(n810), .B1(R3[28]), .Y(n861) );
  OAI221XL U135 ( .A0(n658), .A1(n806), .B0(n624), .B1(n3344), .C0(n853), .Y(
        n852) );
  AOI22X1 U136 ( .A0(n3342), .A1(n2044), .B0(n810), .B1(R3[29]), .Y(n853) );
  OAI221XL U137 ( .A0(n657), .A1(n806), .B0(n623), .B1(n3344), .C0(n845), .Y(
        n844) );
  AOI22X1 U138 ( .A0(n3342), .A1(n2041), .B0(n2676), .B1(n810), .Y(n845) );
  OAI221XL U139 ( .A0(n656), .A1(n806), .B0(n622), .B1(n3344), .C0(n837), .Y(
        n836) );
  AOI22X1 U140 ( .A0(n3342), .A1(n2042), .B0(n2678), .B1(n810), .Y(n837) );
  OAI221XL U141 ( .A0(n655), .A1(n3346), .B0(n621), .B1(n3344), .C0(n829), .Y(
        n828) );
  AOI22X1 U142 ( .A0(n3342), .A1(n2045), .B0(n810), .B1(n2035), .Y(n829) );
  OAI221XL U143 ( .A0(n654), .A1(n3346), .B0(n620), .B1(n3344), .C0(n808), .Y(
        n805) );
  AOI22X1 U144 ( .A0(n3343), .A1(n2039), .B0(n3340), .B1(n2033), .Y(n808) );
  OAI221XL U145 ( .A0(n685), .A1(n806), .B0(n651), .B1(n3345), .C0(n1070), .Y(
        n1069) );
  AOI22X1 U146 ( .A0(n3343), .A1(R14[2]), .B0(n810), .B1(R3[2]), .Y(n1070) );
  OAI221XL U147 ( .A0(n684), .A1(n806), .B0(n650), .B1(n3344), .C0(n1062), .Y(
        n1061) );
  AOI22X1 U148 ( .A0(n3342), .A1(R14[3]), .B0(n810), .B1(R3[3]), .Y(n1062) );
  OAI221XL U149 ( .A0(n683), .A1(n806), .B0(n649), .B1(n3345), .C0(n1054), .Y(
        n1053) );
  AOI22X1 U150 ( .A0(n3343), .A1(R14[4]), .B0(n810), .B1(R3[4]), .Y(n1054) );
  OAI221XL U151 ( .A0(n682), .A1(n806), .B0(n648), .B1(n3344), .C0(n1046), .Y(
        n1045) );
  AOI22X1 U152 ( .A0(n3342), .A1(R14[5]), .B0(n810), .B1(R3[5]), .Y(n1046) );
  OAI221XL U153 ( .A0(n681), .A1(n806), .B0(n647), .B1(n3345), .C0(n1038), .Y(
        n1037) );
  AOI22X1 U154 ( .A0(n3343), .A1(R14[6]), .B0(n810), .B1(R3[6]), .Y(n1038) );
  OAI221XL U155 ( .A0(n680), .A1(n806), .B0(n646), .B1(n3344), .C0(n1030), .Y(
        n1029) );
  AOI22X1 U156 ( .A0(n3342), .A1(R14[7]), .B0(n810), .B1(R3[7]), .Y(n1030) );
  NAND2X1 U157 ( .A(n862), .B(counter_2[1]), .Y(n801) );
  NOR3X1 U158 ( .A(n585), .B(p_s_flag_in), .C(n617), .Y(n2000) );
  NOR2X1 U159 ( .A(counter_2[2]), .B(n862), .Y(n1088) );
  NOR3X1 U160 ( .A(n573), .B(counter_2[2]), .C(n801), .Y(n814) );
  NOR3X1 U161 ( .A(counter_2[2]), .B(counter_2[3]), .C(n801), .Y(n823) );
  INVX1 U162 ( .A(p_s_flag_in), .Y(n689) );
  NAND2X1 U163 ( .A(counter_2[1]), .B(n1088), .Y(n690) );
  BUFX3 U164 ( .A(n695), .Y(n3313) );
  NAND3X1 U165 ( .A(n617), .B(n689), .C(n585), .Y(n695) );
  AOI22X1 U166 ( .A0(n3333), .A1(n2583), .B0(n2163), .B1(n3330), .Y(n879) );
  AOI22X1 U167 ( .A0(n2536), .A1(n823), .B0(n2472), .B1(n3314), .Y(n1090) );
  AOI22X1 U168 ( .A0(n2549), .A1(n3316), .B0(n2450), .B1(n3315), .Y(n1017) );
  AOI22X1 U169 ( .A0(n2550), .A1(n3316), .B0(n2444), .B1(n3315), .Y(n1009) );
  AOI22X1 U170 ( .A0(n3317), .A1(n2172), .B0(n2063), .B1(n3315), .Y(n977) );
  AOI22X1 U171 ( .A0(n3317), .A1(n2169), .B0(n2058), .B1(n3315), .Y(n969) );
  AOI22X1 U172 ( .A0(n2538), .A1(n3316), .B0(n2062), .B1(n3315), .Y(n961) );
  AOI22X1 U173 ( .A0(n2535), .A1(n3316), .B0(n2473), .B1(n3315), .Y(n953) );
  AOI22X1 U174 ( .A0(n2525), .A1(n3317), .B0(n2484), .B1(n3315), .Y(n945) );
  AOI22X1 U175 ( .A0(n2553), .A1(n3317), .B0(n2485), .B1(n3315), .Y(n937) );
  AOI22X1 U176 ( .A0(n2554), .A1(n3317), .B0(n2486), .B1(n3315), .Y(n929) );
  AOI22X1 U177 ( .A0(n2555), .A1(n3317), .B0(n2487), .B1(n3315), .Y(n921) );
  AOI22X1 U178 ( .A0(n2556), .A1(n3317), .B0(n2428), .B1(n3314), .Y(n913) );
  AOI22X1 U179 ( .A0(n2557), .A1(n3317), .B0(n2488), .B1(n3314), .Y(n905) );
  AOI22X1 U180 ( .A0(n2558), .A1(n3316), .B0(n2437), .B1(n3314), .Y(n897) );
  AOI22X1 U181 ( .A0(n2559), .A1(n3316), .B0(n2478), .B1(n3314), .Y(n889) );
  AOI22X1 U182 ( .A0(n2560), .A1(n823), .B0(n2429), .B1(n3314), .Y(n881) );
  AOI22X1 U183 ( .A0(n2561), .A1(n823), .B0(n2477), .B1(n3314), .Y(n873) );
  AOI22X1 U184 ( .A0(n2562), .A1(n823), .B0(n2447), .B1(n3314), .Y(n865) );
  AOI22X1 U185 ( .A0(n2067), .A1(n823), .B0(n2479), .B1(n3314), .Y(n856) );
  AOI22X1 U186 ( .A0(n2071), .A1(n823), .B0(n2078), .B1(n3314), .Y(n848) );
  AOI22X1 U187 ( .A0(n3317), .A1(n2170), .B0(n2074), .B1(n3314), .Y(n840) );
  AOI22X1 U188 ( .A0(n3317), .A1(n2171), .B0(n2077), .B1(n3314), .Y(n832) );
  AOI22X1 U189 ( .A0(n3317), .A1(n2173), .B0(n2073), .B1(n3315), .Y(n822) );
  AOI22X1 U190 ( .A0(n2547), .A1(n3316), .B0(n2422), .B1(n3315), .Y(n1033) );
  AOI22X1 U191 ( .A0(n3323), .A1(R12[11]), .B0(n3355), .B1(R1[11]), .Y(n1000)
         );
  AOI22X1 U192 ( .A0(n3333), .A1(n2573), .B0(n3331), .B1(R2[11]), .Y(n999) );
  AOI22X1 U193 ( .A0(n2551), .A1(n3316), .B0(n3314), .B1(R0[11]), .Y(n1001) );
  AOI22X1 U194 ( .A0(n3323), .A1(R12[12]), .B0(n3355), .B1(R1[12]), .Y(n992)
         );
  AOI22X1 U195 ( .A0(n3332), .A1(n2574), .B0(n3331), .B1(R2[12]), .Y(n991) );
  AOI22X1 U196 ( .A0(n2552), .A1(n3316), .B0(n3315), .B1(R0[12]), .Y(n993) );
  AOI22X1 U197 ( .A0(n2674), .A1(n3324), .B0(n3355), .B1(R1[13]), .Y(n984) );
  AOI22X1 U198 ( .A0(n3332), .A1(n1434), .B0(n3331), .B1(R2[13]), .Y(n983) );
  AOI22X1 U199 ( .A0(n2068), .A1(n3316), .B0(n3314), .B1(R0[13]), .Y(n985) );
  AOI22X1 U200 ( .A0(n2682), .A1(n3324), .B0(n3355), .B1(n2176), .Y(n976) );
  AOI22X1 U201 ( .A0(n2689), .A1(n3324), .B0(n3355), .B1(n2177), .Y(n968) );
  AOI22X1 U202 ( .A0(n3323), .A1(R12[16]), .B0(n3355), .B1(n2180), .Y(n960) );
  AOI22X1 U203 ( .A0(n2677), .A1(n3324), .B0(n3354), .B1(n2179), .Y(n847) );
  AOI22X1 U204 ( .A0(n2684), .A1(n3324), .B0(n3354), .B1(n2178), .Y(n839) );
  AOI22X1 U205 ( .A0(n2683), .A1(n819), .B0(n3354), .B1(n2175), .Y(n831) );
  AOI22X1 U206 ( .A0(n2681), .A1(n819), .B0(n3354), .B1(n2174), .Y(n818) );
  AOI22X1 U207 ( .A0(n2526), .A1(n3316), .B0(n2471), .B1(n3314), .Y(n1081) );
  AOI22X1 U208 ( .A0(n2548), .A1(n3316), .B0(n2480), .B1(n3315), .Y(n1025) );
  AOI22X1 U209 ( .A0(n2542), .A1(n3317), .B0(n2481), .B1(n3315), .Y(n1073) );
  AOI22X1 U210 ( .A0(n2543), .A1(n3317), .B0(n2482), .B1(n3314), .Y(n1065) );
  AOI22X1 U211 ( .A0(n2544), .A1(n3317), .B0(n2434), .B1(n3315), .Y(n1057) );
  AOI22X1 U212 ( .A0(n2545), .A1(n3316), .B0(n2483), .B1(n3315), .Y(n1049) );
  AOI22X1 U213 ( .A0(n2546), .A1(n3316), .B0(n2423), .B1(n3314), .Y(n1041) );
  AOI22X1 U214 ( .A0(n819), .A1(R12[0]), .B0(n3354), .B1(R1[0]), .Y(n1089) );
  AOI22X1 U215 ( .A0(n814), .A1(n2534), .B0(n3330), .B1(n2470), .Y(n1087) );
  AOI22X1 U216 ( .A0(n3324), .A1(R12[1]), .B0(n3355), .B1(R1[1]), .Y(n1080) );
  AOI22X1 U217 ( .A0(n814), .A1(n2563), .B0(n3331), .B1(n2463), .Y(n1079) );
  AOI22X1 U218 ( .A0(n3324), .A1(R12[8]), .B0(n3355), .B1(R1[8]), .Y(n1024) );
  AOI22X1 U219 ( .A0(n3333), .A1(n2570), .B0(n3331), .B1(n2130), .Y(n1023) );
  AOI22X1 U220 ( .A0(n3323), .A1(R12[9]), .B0(n3354), .B1(R1[9]), .Y(n1016) );
  AOI22X1 U221 ( .A0(n3332), .A1(n2571), .B0(n3331), .B1(n2121), .Y(n1015) );
  AOI22X1 U222 ( .A0(n3323), .A1(R12[10]), .B0(n3355), .B1(R1[10]), .Y(n1008)
         );
  AOI22X1 U223 ( .A0(n3333), .A1(n2572), .B0(n3331), .B1(n2119), .Y(n1007) );
  AOI22X1 U224 ( .A0(n3332), .A1(n1427), .B0(n3331), .B1(n1421), .Y(n975) );
  AOI22X1 U225 ( .A0(n3332), .A1(n1408), .B0(n3331), .B1(n1426), .Y(n967) );
  AOI22X1 U226 ( .A0(n3332), .A1(n1397), .B0(n3331), .B1(n1409), .Y(n959) );
  AOI22X1 U227 ( .A0(n3323), .A1(R12[17]), .B0(n3355), .B1(R1[17]), .Y(n952)
         );
  AOI22X1 U228 ( .A0(n3332), .A1(n2531), .B0(n3331), .B1(n2490), .Y(n951) );
  AOI22X1 U229 ( .A0(n3323), .A1(R12[18]), .B0(n3355), .B1(R1[18]), .Y(n944)
         );
  AOI22X1 U230 ( .A0(n3332), .A1(n2575), .B0(n3331), .B1(n2491), .Y(n943) );
  AOI22X1 U231 ( .A0(n3323), .A1(R12[19]), .B0(n3355), .B1(R1[19]), .Y(n936)
         );
  AOI22X1 U232 ( .A0(n3332), .A1(n2576), .B0(n3331), .B1(n2133), .Y(n935) );
  AOI22X1 U233 ( .A0(n3323), .A1(R12[20]), .B0(n3355), .B1(R1[20]), .Y(n928)
         );
  AOI22X1 U234 ( .A0(n3332), .A1(n2577), .B0(n3331), .B1(n2492), .Y(n927) );
  AOI22X1 U235 ( .A0(n3323), .A1(R12[21]), .B0(n3355), .B1(R1[21]), .Y(n920)
         );
  AOI22X1 U236 ( .A0(n3332), .A1(n2578), .B0(n3330), .B1(n2134), .Y(n919) );
  AOI22X1 U237 ( .A0(n3323), .A1(R12[22]), .B0(n3354), .B1(R1[22]), .Y(n912)
         );
  AOI22X1 U238 ( .A0(n3332), .A1(n2579), .B0(n3330), .B1(n2116), .Y(n911) );
  AOI22X1 U239 ( .A0(n819), .A1(R12[23]), .B0(n3354), .B1(R1[23]), .Y(n904) );
  AOI22X1 U240 ( .A0(n3332), .A1(n2580), .B0(n3330), .B1(n2135), .Y(n903) );
  AOI22X1 U241 ( .A0(n819), .A1(R12[24]), .B0(n3354), .B1(R1[24]), .Y(n896) );
  AOI22X1 U242 ( .A0(n3333), .A1(n2581), .B0(n3330), .B1(n2118), .Y(n895) );
  AOI22X1 U243 ( .A0(n3323), .A1(R12[25]), .B0(n3354), .B1(R1[25]), .Y(n888)
         );
  AOI22X1 U244 ( .A0(n3333), .A1(n2582), .B0(n3330), .B1(n2128), .Y(n887) );
  AOI22X1 U245 ( .A0(n819), .A1(R12[26]), .B0(n3354), .B1(R1[26]), .Y(n880) );
  AOI22X1 U246 ( .A0(n819), .A1(R12[27]), .B0(n3354), .B1(R1[27]), .Y(n872) );
  AOI22X1 U247 ( .A0(n3333), .A1(n2584), .B0(n3330), .B1(n2127), .Y(n871) );
  AOI22X1 U248 ( .A0(n3323), .A1(R12[28]), .B0(n3354), .B1(R1[28]), .Y(n864)
         );
  AOI22X1 U249 ( .A0(n3333), .A1(n2585), .B0(n3330), .B1(n2120), .Y(n863) );
  AOI22X1 U250 ( .A0(n819), .A1(R12[29]), .B0(n3354), .B1(R1[29]), .Y(n855) );
  AOI22X1 U251 ( .A0(n3333), .A1(n2149), .B0(n3330), .B1(n2129), .Y(n854) );
  AOI22X1 U252 ( .A0(n3333), .A1(n1452), .B0(n3330), .B1(n1436), .Y(n846) );
  AOI22X1 U253 ( .A0(n3333), .A1(n1407), .B0(n3330), .B1(n1435), .Y(n838) );
  AOI22X1 U254 ( .A0(n3333), .A1(n2140), .B0(n3330), .B1(n2124), .Y(n830) );
  AOI22X1 U255 ( .A0(n3333), .A1(n1399), .B0(n3331), .B1(n1396), .Y(n813) );
  AOI22X1 U256 ( .A0(n3324), .A1(R12[2]), .B0(n3354), .B1(R1[2]), .Y(n1072) );
  AOI22X1 U257 ( .A0(n814), .A1(n2564), .B0(n3330), .B1(n2131), .Y(n1071) );
  AOI22X1 U258 ( .A0(n3324), .A1(R12[3]), .B0(n3355), .B1(R1[3]), .Y(n1064) );
  AOI22X1 U259 ( .A0(n814), .A1(n2565), .B0(n3331), .B1(n2489), .Y(n1063) );
  AOI22X1 U260 ( .A0(n3324), .A1(R12[4]), .B0(n3354), .B1(R1[4]), .Y(n1056) );
  AOI22X1 U261 ( .A0(n814), .A1(n2566), .B0(n3330), .B1(n2117), .Y(n1055) );
  AOI22X1 U262 ( .A0(n3324), .A1(R12[5]), .B0(n3355), .B1(R1[5]), .Y(n1048) );
  AOI22X1 U263 ( .A0(n814), .A1(n2567), .B0(n3330), .B1(n2132), .Y(n1047) );
  AOI22X1 U264 ( .A0(n3324), .A1(R12[6]), .B0(n3354), .B1(R1[6]), .Y(n1040) );
  AOI22X1 U265 ( .A0(n814), .A1(n2568), .B0(n3331), .B1(n2115), .Y(n1039) );
  AOI22X1 U266 ( .A0(n3324), .A1(R12[7]), .B0(n3355), .B1(R1[7]), .Y(n1032) );
  AOI22X1 U267 ( .A0(n814), .A1(n2569), .B0(n3330), .B1(n2114), .Y(n1031) );
  INVX1 U268 ( .A(counter_1_1_), .Y(n617) );
  NAND2X1 U269 ( .A(counter_2[2]), .B(n688), .Y(n691) );
  OR4X2 U270 ( .A(n994), .B(n995), .C(n996), .D(n997), .Y(N130) );
  OAI221XL U271 ( .A0(n2085), .A1(n3321), .B0(n2275), .B1(n3320), .C0(n1001), 
        .Y(n994) );
  OAI221XL U272 ( .A0(n3337), .A1(n2084), .B0(n812), .B1(n2364), .C0(n999), 
        .Y(n996) );
  OAI221XL U273 ( .A0(n744), .A1(n3328), .B0(n778), .B1(n3327), .C0(n1000), 
        .Y(n995) );
  OR4X2 U274 ( .A(n1082), .B(n1083), .C(n1084), .D(n1085), .Y(N119) );
  OAI221XL U275 ( .A0(n2383), .A1(n3321), .B0(n2296), .B1(n3320), .C0(n1090), 
        .Y(n1082) );
  OAI221XL U276 ( .A0(n3337), .A1(n2249), .B0(n3335), .B1(n2352), .C0(n1087), 
        .Y(n1084) );
  OAI221XL U277 ( .A0(n755), .A1(n816), .B0(n789), .B1(n3327), .C0(n1089), .Y(
        n1083) );
  OR4X2 U278 ( .A(n1074), .B(n1075), .C(n1076), .D(n1077), .Y(N120) );
  OAI221XL U279 ( .A0(n2409), .A1(n3321), .B0(n2335), .B1(n3319), .C0(n1081), 
        .Y(n1074) );
  OAI221XL U280 ( .A0(n3338), .A1(n2246), .B0(n812), .B1(n2349), .C0(n1079), 
        .Y(n1076) );
  OAI221XL U281 ( .A0(n754), .A1(n816), .B0(n788), .B1(n3326), .C0(n1080), .Y(
        n1075) );
  OR4X2 U282 ( .A(n1018), .B(n1019), .C(n1020), .D(n1021), .Y(N127) );
  OAI221XL U283 ( .A0(n2415), .A1(n3321), .B0(n2303), .B1(n3320), .C0(n1025), 
        .Y(n1018) );
  OAI221XL U284 ( .A0(n3337), .A1(n2256), .B0(n812), .B1(n2361), .C0(n1023), 
        .Y(n1020) );
  OAI221XL U285 ( .A0(n747), .A1(n3328), .B0(n781), .B1(n3327), .C0(n1024), 
        .Y(n1019) );
  OR4X2 U286 ( .A(n1010), .B(n1011), .C(n1012), .D(n1013), .Y(N128) );
  OAI221XL U287 ( .A0(n2387), .A1(n3321), .B0(n2271), .B1(n3319), .C0(n1017), 
        .Y(n1010) );
  OAI221XL U288 ( .A0(n3337), .A1(n2166), .B0(n812), .B1(n2362), .C0(n1015), 
        .Y(n1012) );
  OAI221XL U289 ( .A0(n746), .A1(n3328), .B0(n780), .B1(n3326), .C0(n1016), 
        .Y(n1011) );
  OR4X2 U290 ( .A(n1002), .B(n1003), .C(n1004), .D(n1005), .Y(N129) );
  OAI221XL U291 ( .A0(n2377), .A1(n3321), .B0(n2285), .B1(n3320), .C0(n1009), 
        .Y(n1002) );
  OAI221XL U292 ( .A0(n3337), .A1(n2257), .B0(n812), .B1(n2363), .C0(n1007), 
        .Y(n1004) );
  OAI221XL U293 ( .A0(n745), .A1(n3328), .B0(n779), .B1(n3327), .C0(n1008), 
        .Y(n1003) );
  OR4X2 U294 ( .A(n986), .B(n987), .C(n988), .D(n989), .Y(N131) );
  OAI221XL U295 ( .A0(n2089), .A1(n3321), .B0(n2277), .B1(n3320), .C0(n993), 
        .Y(n986) );
  OAI221XL U296 ( .A0(n3337), .A1(n2057), .B0(n812), .B1(n2354), .C0(n991), 
        .Y(n988) );
  OAI221XL U297 ( .A0(n743), .A1(n3328), .B0(n777), .B1(n3327), .C0(n992), .Y(
        n987) );
  OR4X2 U298 ( .A(n978), .B(n979), .C(n980), .D(n981), .Y(N132) );
  OAI221XL U299 ( .A0(n2105), .A1(n3322), .B0(n2096), .B1(n3320), .C0(n985), 
        .Y(n978) );
  OAI221XL U300 ( .A0(n2675), .A1(n3338), .B0(n2696), .B1(n812), .C0(n983), 
        .Y(n980) );
  OAI221XL U301 ( .A0(n742), .A1(n3328), .B0(n776), .B1(n3327), .C0(n984), .Y(
        n979) );
  OR4X2 U302 ( .A(n970), .B(n971), .C(n972), .D(n973), .Y(N133) );
  OAI221XL U303 ( .A0(n2103), .A1(n3322), .B0(n2095), .B1(n3320), .C0(n977), 
        .Y(n970) );
  OAI221XL U304 ( .A0(n3337), .A1(n1448), .B0(n2697), .B1(n812), .C0(n975), 
        .Y(n972) );
  OAI221XL U305 ( .A0(n741), .A1(n3328), .B0(n775), .B1(n3327), .C0(n976), .Y(
        n971) );
  OR4X2 U306 ( .A(n962), .B(n963), .C(n964), .D(n965), .Y(N134) );
  OAI221XL U307 ( .A0(n2102), .A1(n3322), .B0(n2082), .B1(n3320), .C0(n969), 
        .Y(n962) );
  OAI221XL U308 ( .A0(n2685), .A1(n3338), .B0(n2680), .B1(n812), .C0(n967), 
        .Y(n964) );
  OAI221XL U309 ( .A0(n740), .A1(n3328), .B0(n774), .B1(n3327), .C0(n968), .Y(
        n963) );
  OR4X2 U310 ( .A(n954), .B(n955), .C(n956), .D(n957), .Y(N135) );
  OAI221XL U311 ( .A0(n2167), .A1(n3322), .B0(n2288), .B1(n3320), .C0(n961), 
        .Y(n954) );
  OAI221XL U312 ( .A0(n3337), .A1(n1860), .B0(n3335), .B1(n1902), .C0(n959), 
        .Y(n956) );
  OAI221XL U313 ( .A0(n739), .A1(n3328), .B0(n773), .B1(n3327), .C0(n960), .Y(
        n955) );
  OR4X2 U314 ( .A(n946), .B(n947), .C(n948), .D(n949), .Y(N136) );
  OAI221XL U315 ( .A0(n2382), .A1(n3322), .B0(n2297), .B1(n3320), .C0(n953), 
        .Y(n946) );
  OAI221XL U316 ( .A0(n3337), .A1(n2248), .B0(n3335), .B1(n2353), .C0(n951), 
        .Y(n948) );
  OAI221XL U317 ( .A0(n738), .A1(n3328), .B0(n772), .B1(n3327), .C0(n952), .Y(
        n947) );
  OR4X2 U318 ( .A(n938), .B(n939), .C(n940), .D(n941), .Y(N137) );
  OAI221XL U319 ( .A0(n2381), .A1(n3322), .B0(n2295), .B1(n3320), .C0(n945), 
        .Y(n938) );
  OAI221XL U320 ( .A0(n3337), .A1(n2247), .B0(n3335), .B1(n2351), .C0(n943), 
        .Y(n940) );
  OAI221XL U321 ( .A0(n737), .A1(n3328), .B0(n771), .B1(n3327), .C0(n944), .Y(
        n939) );
  OR4X2 U322 ( .A(n930), .B(n931), .C(n932), .D(n933), .Y(N138) );
  OAI221XL U323 ( .A0(n2416), .A1(n3322), .B0(n2341), .B1(n3320), .C0(n937), 
        .Y(n930) );
  OAI221XL U324 ( .A0(n3338), .A1(n2258), .B0(n3335), .B1(n2350), .C0(n935), 
        .Y(n932) );
  OAI221XL U325 ( .A0(n736), .A1(n3328), .B0(n770), .B1(n3327), .C0(n936), .Y(
        n931) );
  OR4X2 U326 ( .A(n922), .B(n923), .C(n924), .D(n925), .Y(N139) );
  OAI221XL U327 ( .A0(n2417), .A1(n3322), .B0(n2342), .B1(n3320), .C0(n929), 
        .Y(n922) );
  OAI221XL U328 ( .A0(n3338), .A1(n2259), .B0(n3335), .B1(n2365), .C0(n927), 
        .Y(n924) );
  OAI221XL U329 ( .A0(n735), .A1(n3328), .B0(n769), .B1(n3327), .C0(n928), .Y(
        n923) );
  OR4X2 U330 ( .A(n914), .B(n915), .C(n916), .D(n917), .Y(N140) );
  OAI221XL U331 ( .A0(n2418), .A1(n3322), .B0(n2343), .B1(n3320), .C0(n921), 
        .Y(n914) );
  OAI221XL U332 ( .A0(n3338), .A1(n2260), .B0(n3335), .B1(n2366), .C0(n919), 
        .Y(n916) );
  OAI221XL U333 ( .A0(n734), .A1(n816), .B0(n768), .B1(n3327), .C0(n920), .Y(
        n915) );
  OR4X2 U334 ( .A(n906), .B(n907), .C(n908), .D(n909), .Y(N141) );
  OAI221XL U335 ( .A0(n2419), .A1(n3322), .B0(n2270), .B1(n3319), .C0(n913), 
        .Y(n906) );
  OAI221XL U336 ( .A0(n3338), .A1(n2261), .B0(n3335), .B1(n2367), .C0(n911), 
        .Y(n908) );
  OAI221XL U337 ( .A0(n733), .A1(n816), .B0(n767), .B1(n3326), .C0(n912), .Y(
        n907) );
  OR4X2 U338 ( .A(n898), .B(n899), .C(n900), .D(n901), .Y(N142) );
  OAI221XL U339 ( .A0(n2420), .A1(n3322), .B0(n2344), .B1(n3319), .C0(n905), 
        .Y(n898) );
  OAI221XL U340 ( .A0(n3338), .A1(n2262), .B0(n3335), .B1(n2368), .C0(n903), 
        .Y(n900) );
  OAI221XL U341 ( .A0(n732), .A1(n816), .B0(n766), .B1(n3326), .C0(n904), .Y(
        n899) );
  OR4X2 U342 ( .A(n890), .B(n891), .C(n892), .D(n893), .Y(N143) );
  OAI221XL U343 ( .A0(n2421), .A1(n3322), .B0(n2274), .B1(n3319), .C0(n897), 
        .Y(n890) );
  OAI221XL U344 ( .A0(n3338), .A1(n2263), .B0(n3335), .B1(n2369), .C0(n895), 
        .Y(n892) );
  OAI221XL U345 ( .A0(n731), .A1(n816), .B0(n765), .B1(n3326), .C0(n896), .Y(
        n891) );
  OR4X2 U346 ( .A(n882), .B(n883), .C(n884), .D(n885), .Y(N144) );
  OAI221XL U347 ( .A0(n2375), .A1(n3322), .B0(n2345), .B1(n3319), .C0(n889), 
        .Y(n882) );
  OAI221XL U348 ( .A0(n3337), .A1(n2264), .B0(n3335), .B1(n2370), .C0(n887), 
        .Y(n884) );
  OAI221XL U349 ( .A0(n730), .A1(n816), .B0(n764), .B1(n3326), .C0(n888), .Y(
        n883) );
  OR4X2 U350 ( .A(n874), .B(n875), .C(n876), .D(n877), .Y(N145) );
  OAI221XL U352 ( .A0(n2374), .A1(n3321), .B0(n2281), .B1(n3319), .C0(n881), 
        .Y(n874) );
  OAI221XL U353 ( .A0(n811), .A1(n2265), .B0(n812), .B1(n2371), .C0(n879), .Y(
        n876) );
  OAI221XL U354 ( .A0(n729), .A1(n816), .B0(n763), .B1(n3326), .C0(n880), .Y(
        n875) );
  OR4X2 U355 ( .A(n866), .B(n867), .C(n868), .D(n869), .Y(N146) );
  OAI221XL U356 ( .A0(n2376), .A1(n3322), .B0(n2279), .B1(n3319), .C0(n873), 
        .Y(n866) );
  OAI221XL U357 ( .A0(n811), .A1(n2266), .B0(n3335), .B1(n2372), .C0(n871), 
        .Y(n868) );
  OAI221XL U358 ( .A0(n728), .A1(n816), .B0(n762), .B1(n3326), .C0(n872), .Y(
        n867) );
  OR4X2 U359 ( .A(n857), .B(n858), .C(n859), .D(n860), .Y(N147) );
  OAI221XL U360 ( .A0(n2386), .A1(n3321), .B0(n2283), .B1(n3319), .C0(n865), 
        .Y(n857) );
  OAI221XL U361 ( .A0(n811), .A1(n2267), .B0(n812), .B1(n2373), .C0(n863), .Y(
        n859) );
  OAI221XL U362 ( .A0(n727), .A1(n816), .B0(n761), .B1(n3326), .C0(n864), .Y(
        n858) );
  OR4X2 U363 ( .A(n849), .B(n850), .C(n851), .D(n852), .Y(N148) );
  OAI221XL U364 ( .A0(n2104), .A1(n3322), .B0(n2291), .B1(n3319), .C0(n856), 
        .Y(n849) );
  OAI221XL U365 ( .A0(n2099), .A1(n3338), .B0(n2348), .B1(n812), .C0(n854), 
        .Y(n851) );
  OAI221XL U366 ( .A0(n726), .A1(n816), .B0(n760), .B1(n3326), .C0(n855), .Y(
        n850) );
  OR4X2 U367 ( .A(n841), .B(n842), .C(n843), .D(n844), .Y(N149) );
  OAI221XL U368 ( .A0(n2083), .A1(n3321), .B0(n2289), .B1(n3319), .C0(n848), 
        .Y(n841) );
  OAI221XL U369 ( .A0(n811), .A1(n1438), .B0(n2673), .B1(n812), .C0(n846), .Y(
        n843) );
  OAI221XL U370 ( .A0(n725), .A1(n816), .B0(n759), .B1(n3326), .C0(n847), .Y(
        n842) );
  OR4X2 U371 ( .A(n833), .B(n834), .C(n835), .D(n836), .Y(N150) );
  OAI221XL U372 ( .A0(n2378), .A1(n3322), .B0(n2290), .B1(n3319), .C0(n840), 
        .Y(n833) );
  OAI221XL U373 ( .A0(n811), .A1(n1414), .B0(n2679), .B1(n812), .C0(n838), .Y(
        n835) );
  OAI221XL U374 ( .A0(n724), .A1(n816), .B0(n758), .B1(n3326), .C0(n839), .Y(
        n834) );
  OR4X2 U375 ( .A(n825), .B(n826), .C(n827), .D(n828), .Y(N151) );
  OAI221XL U376 ( .A0(n2113), .A1(n3321), .B0(n2287), .B1(n3319), .C0(n832), 
        .Y(n825) );
  OAI221XL U377 ( .A0(n811), .A1(n2051), .B0(n2347), .B1(n812), .C0(n830), .Y(
        n827) );
  OAI221XL U378 ( .A0(n723), .A1(n3328), .B0(n757), .B1(n3326), .C0(n831), .Y(
        n826) );
  OR4X2 U379 ( .A(n802), .B(n803), .C(n804), .D(n805), .Y(N152) );
  OAI221XL U380 ( .A0(n2086), .A1(n3322), .B0(n2081), .B1(n3319), .C0(n822), 
        .Y(n802) );
  OAI221XL U381 ( .A0(n2688), .A1(n3338), .B0(n2687), .B1(n812), .C0(n813), 
        .Y(n804) );
  OAI221XL U382 ( .A0(n722), .A1(n3328), .B0(n756), .B1(n3326), .C0(n818), .Y(
        n803) );
  OR4X2 U383 ( .A(n1066), .B(n1067), .C(n1068), .D(n1069), .Y(N121) );
  OAI221XL U384 ( .A0(n2410), .A1(n3321), .B0(n2336), .B1(n3320), .C0(n1073), 
        .Y(n1066) );
  OAI221XL U385 ( .A0(n3338), .A1(n2250), .B0(n3335), .B1(n2355), .C0(n1071), 
        .Y(n1068) );
  OAI221XL U386 ( .A0(n753), .A1(n816), .B0(n787), .B1(n3327), .C0(n1072), .Y(
        n1067) );
  OR4X2 U387 ( .A(n1058), .B(n1059), .C(n1060), .D(n1061), .Y(N122) );
  OAI221XL U388 ( .A0(n2411), .A1(n3321), .B0(n2337), .B1(n3319), .C0(n1065), 
        .Y(n1058) );
  OAI221XL U389 ( .A0(n3338), .A1(n2251), .B0(n3335), .B1(n2356), .C0(n1063), 
        .Y(n1060) );
  OAI221XL U390 ( .A0(n752), .A1(n816), .B0(n786), .B1(n3326), .C0(n1064), .Y(
        n1059) );
  OR4X2 U391 ( .A(n1050), .B(n1051), .C(n1052), .D(n1053), .Y(N123) );
  OAI221XL U392 ( .A0(n2106), .A1(n3321), .B0(n2338), .B1(n3320), .C0(n1057), 
        .Y(n1050) );
  OAI221XL U393 ( .A0(n3338), .A1(n2252), .B0(n3335), .B1(n2357), .C0(n1055), 
        .Y(n1052) );
  OAI221XL U394 ( .A0(n751), .A1(n816), .B0(n785), .B1(n3327), .C0(n1056), .Y(
        n1051) );
  OR4X2 U395 ( .A(n1042), .B(n1043), .C(n1044), .D(n1045), .Y(N124) );
  OAI221XL U396 ( .A0(n2412), .A1(n3321), .B0(n2339), .B1(n3319), .C0(n1049), 
        .Y(n1042) );
  OAI221XL U397 ( .A0(n3337), .A1(n2253), .B0(n812), .B1(n2358), .C0(n1047), 
        .Y(n1044) );
  OAI221XL U398 ( .A0(n750), .A1(n816), .B0(n784), .B1(n3326), .C0(n1048), .Y(
        n1043) );
  OR4X2 U399 ( .A(n1034), .B(n1035), .C(n1036), .D(n1037), .Y(N125) );
  OAI221XL U400 ( .A0(n2413), .A1(n3321), .B0(n2280), .B1(n3320), .C0(n1041), 
        .Y(n1034) );
  OAI221XL U401 ( .A0(n3337), .A1(n2254), .B0(n812), .B1(n2359), .C0(n1039), 
        .Y(n1036) );
  OAI221XL U402 ( .A0(n749), .A1(n816), .B0(n783), .B1(n3327), .C0(n1040), .Y(
        n1035) );
  OR4X2 U403 ( .A(n1026), .B(n1027), .C(n1028), .D(n1029), .Y(N126) );
  OAI221XL U404 ( .A0(n2414), .A1(n3321), .B0(n2340), .B1(n3319), .C0(n1033), 
        .Y(n1026) );
  OAI221XL U405 ( .A0(n3337), .A1(n2255), .B0(n812), .B1(n2360), .C0(n1031), 
        .Y(n1028) );
  OAI221XL U406 ( .A0(n748), .A1(n816), .B0(n782), .B1(n3326), .C0(n1032), .Y(
        n1027) );
  OAI21XL U407 ( .A0(n862), .A1(counter_2[1]), .B0(n801), .Y(N50) );
  XNOR2X1 U408 ( .A(counter_1_1_), .B(n585), .Y(N26) );
endmodule


module fft ( clk, rst_n, data_in, data_out );
  input [33:0] data_in;
  output [33:0] data_out;
  input clk, rst_n;
  wire   s_p_flag, mux_flag, demux_flag;
  wire   [2:0] rotation;
  wire   [135:0] data_1;
  wire   [135:0] data_2;
  wire   [135:0] data_4;
  wire   [135:0] data_3;

  ctrl ctrl0 ( .clk(clk), .rst_n(rst_n), .s_p_flag_in(s_p_flag), .mux_flag(
        mux_flag), .rotation(rotation), .demux_flag(demux_flag) );
  s_p s_p0 ( .clk(clk), .rst_n(rst_n), .data_in_1(data_in), .data_out_1(data_1), .s_p_flag_out(s_p_flag) );
  mux mux0 ( .mux_flag(mux_flag), .clk(clk), .rst_n(rst_n), .data_in_1(data_2), 
        .data_in_2(data_1), .data_out(data_3), .data_in_3_33_(data_4[33]), 
        .data_in_3_32_(data_4[32]), .data_in_3_31_(data_4[31]), 
        .data_in_3_30_(data_4[30]), .data_in_3_29_(data_4[29]), 
        .data_in_3_28_(data_4[28]), .data_in_3_27_(data_4[27]), 
        .data_in_3_26_(data_4[26]), .data_in_3_25_(data_4[25]), 
        .data_in_3_24_(data_4[24]), .data_in_3_23_(data_4[23]), 
        .data_in_3_22_(data_4[22]), .data_in_3_21_(data_4[21]), 
        .data_in_3_20_(data_4[20]), .data_in_3_19_(data_4[19]), 
        .data_in_3_18_(data_4[18]), .data_in_3_17_(data_4[17]), 
        .data_in_3_16_(data_4[16]), .data_in_3_15_(data_4[15]), 
        .data_in_3_14_(data_4[14]), .data_in_3_13_(data_4[13]), 
        .data_in_3_12_(data_4[12]), .data_in_3_11_(data_4[11]), 
        .data_in_3_10_(data_4[10]), .data_in_3_9_(data_4[9]), .data_in_3_8_(
        data_4[8]), .data_in_3_7_(data_4[7]), .data_in_3_6_(data_4[6]), 
        .data_in_3_5_(data_4[5]), .data_in_3_4_(data_4[4]), .data_in_3_3_(
        data_4[3]), .data_in_3_2_(data_4[2]), .data_in_3_1_(data_4[1]), 
        .data_in_3_0_(data_4[0]) );
  butterfly butterfly0 ( .calc_in(data_3), .rotation(rotation), .calc_out(
        data_4) );
  reg1 reg10 ( .clk(clk), .rst_n(rst_n), .data_in_2(data_4), .reg_datain_flag(
        demux_flag), .data_out_2(data_2) );
  p_s p_s0 ( .clk(clk), .rst_n(rst_n), .data_in_3(data_4), .p_s_flag_in(
        demux_flag), .data_out_3(data_out) );
endmodule


module fft_chip ( clk, rst_n, data_in, data_out );
  input [33:0] data_in;
  output [33:0] data_out;
  input clk, rst_n;
  wire   net_clk, net_rst_n;
  wire   [33:0] net_data_in;
  wire   [33:0] net_data_out;

  PIW PIW_clk ( .PAD(clk), .C(net_clk) );
  PIW PIW_rst_n ( .PAD(rst_n), .C(net_rst_n) );
  PIW PIW_data_in0 ( .PAD(data_in[0]), .C(net_data_in[0]) );
  PIW PIW_data_in1 ( .PAD(data_in[1]), .C(net_data_in[1]) );
  PIW PIW_data_in2 ( .PAD(data_in[2]), .C(net_data_in[2]) );
  PIW PIW_data_in3 ( .PAD(data_in[3]), .C(net_data_in[3]) );
  PIW PIW_data_in4 ( .PAD(data_in[4]), .C(net_data_in[4]) );
  PIW PIW_data_in5 ( .PAD(data_in[5]), .C(net_data_in[5]) );
  PIW PIW_data_in6 ( .PAD(data_in[6]), .C(net_data_in[6]) );
  PIW PIW_data_in7 ( .PAD(data_in[7]), .C(net_data_in[7]) );
  PIW PIW_data_in8 ( .PAD(data_in[8]), .C(net_data_in[8]) );
  PIW PIW_data_in9 ( .PAD(data_in[9]), .C(net_data_in[9]) );
  PIW PIW_data_in10 ( .PAD(data_in[10]), .C(net_data_in[10]) );
  PIW PIW_data_in11 ( .PAD(data_in[11]), .C(net_data_in[11]) );
  PIW PIW_data_in12 ( .PAD(data_in[12]), .C(net_data_in[12]) );
  PIW PIW_data_in13 ( .PAD(data_in[13]), .C(net_data_in[13]) );
  PIW PIW_data_in14 ( .PAD(data_in[14]), .C(net_data_in[14]) );
  PIW PIW_data_in15 ( .PAD(data_in[15]), .C(net_data_in[15]) );
  PIW PIW_data_in16 ( .PAD(data_in[16]), .C(net_data_in[16]) );
  PIW PIW_data_in17 ( .PAD(data_in[17]), .C(net_data_in[17]) );
  PIW PIW_data_in18 ( .PAD(data_in[18]), .C(net_data_in[18]) );
  PIW PIW_data_in19 ( .PAD(data_in[19]), .C(net_data_in[19]) );
  PIW PIW_data_in20 ( .PAD(data_in[20]), .C(net_data_in[20]) );
  PIW PIW_data_in21 ( .PAD(data_in[21]), .C(net_data_in[21]) );
  PIW PIW_data_in22 ( .PAD(data_in[22]), .C(net_data_in[22]) );
  PIW PIW_data_in23 ( .PAD(data_in[23]), .C(net_data_in[23]) );
  PIW PIW_data_in24 ( .PAD(data_in[24]), .C(net_data_in[24]) );
  PIW PIW_data_in25 ( .PAD(data_in[25]), .C(net_data_in[25]) );
  PIW PIW_data_in26 ( .PAD(data_in[26]), .C(net_data_in[26]) );
  PIW PIW_data_in27 ( .PAD(data_in[27]), .C(net_data_in[27]) );
  PIW PIW_data_in28 ( .PAD(data_in[28]), .C(net_data_in[28]) );
  PIW PIW_data_in29 ( .PAD(data_in[29]), .C(net_data_in[29]) );
  PIW PIW_data_in30 ( .PAD(data_in[30]), .C(net_data_in[30]) );
  PIW PIW_data_in31 ( .PAD(data_in[31]), .C(net_data_in[31]) );
  PIW PIW_data_in32 ( .PAD(data_in[32]), .C(net_data_in[32]) );
  PIW PIW_data_in33 ( .PAD(data_in[33]), .C(net_data_in[33]) );
  PO8W PO8W_data_out0 ( .I(net_data_out[0]), .PAD(data_out[0]) );
  PO8W PO8W_data_out1 ( .I(net_data_out[1]), .PAD(data_out[1]) );
  PO8W PO8W_data_out2 ( .I(net_data_out[2]), .PAD(data_out[2]) );
  PO8W PO8W_data_out3 ( .I(net_data_out[3]), .PAD(data_out[3]) );
  PO8W PO8W_data_out4 ( .I(net_data_out[4]), .PAD(data_out[4]) );
  PO8W PO8W_data_out5 ( .I(net_data_out[5]), .PAD(data_out[5]) );
  PO8W PO8W_data_out6 ( .I(net_data_out[6]), .PAD(data_out[6]) );
  PO8W PO8W_data_out7 ( .I(net_data_out[7]), .PAD(data_out[7]) );
  PO8W PO8W_data_out8 ( .I(net_data_out[8]), .PAD(data_out[8]) );
  PO8W PO8W_data_out9 ( .I(net_data_out[9]), .PAD(data_out[9]) );
  PO8W PO8W_data_out10 ( .I(net_data_out[10]), .PAD(data_out[10]) );
  PO8W PO8W_data_out11 ( .I(net_data_out[11]), .PAD(data_out[11]) );
  PO8W PO8W_data_out12 ( .I(net_data_out[12]), .PAD(data_out[12]) );
  PO8W PO8W_data_out13 ( .I(net_data_out[13]), .PAD(data_out[13]) );
  PO8W PO8W_data_out14 ( .I(net_data_out[14]), .PAD(data_out[14]) );
  PO8W PO8W_data_out15 ( .I(net_data_out[15]), .PAD(data_out[15]) );
  PO8W PO8W_data_out16 ( .I(net_data_out[16]), .PAD(data_out[16]) );
  PO8W PO8W_data_out17 ( .I(net_data_out[17]), .PAD(data_out[17]) );
  PO8W PO8W_data_out18 ( .I(net_data_out[18]), .PAD(data_out[18]) );
  PO8W PO8W_data_out19 ( .I(net_data_out[19]), .PAD(data_out[19]) );
  PO8W PO8W_data_out20 ( .I(net_data_out[20]), .PAD(data_out[20]) );
  PO8W PO8W_data_out21 ( .I(net_data_out[21]), .PAD(data_out[21]) );
  PO8W PO8W_data_out22 ( .I(net_data_out[22]), .PAD(data_out[22]) );
  PO8W PO8W_data_out23 ( .I(net_data_out[23]), .PAD(data_out[23]) );
  PO8W PO8W_data_out24 ( .I(net_data_out[24]), .PAD(data_out[24]) );
  PO8W PO8W_data_out25 ( .I(net_data_out[25]), .PAD(data_out[25]) );
  PO8W PO8W_data_out26 ( .I(net_data_out[26]), .PAD(data_out[26]) );
  PO8W PO8W_data_out27 ( .I(net_data_out[27]), .PAD(data_out[27]) );
  PO8W PO8W_data_out28 ( .I(net_data_out[28]), .PAD(data_out[28]) );
  PO8W PO8W_data_out29 ( .I(net_data_out[29]), .PAD(data_out[29]) );
  PO8W PO8W_data_out30 ( .I(net_data_out[30]), .PAD(data_out[30]) );
  PO8W PO8W_data_out31 ( .I(net_data_out[31]), .PAD(data_out[31]) );
  PO8W PO8W_data_out32 ( .I(net_data_out[32]), .PAD(data_out[32]) );
  PO8W PO8W_data_out33 ( .I(net_data_out[33]), .PAD(data_out[33]) );
  fft inst_fft ( .clk(net_clk), .rst_n(net_rst_n), .data_in(net_data_in), 
        .data_out(net_data_out) );
endmodule

