
module ctrl ( clk, rst_n, s_p_flag_in, mux_flag, rotation, demux_flag );
  output [2:0] rotation;
  input clk, rst_n, s_p_flag_in;
  output mux_flag, demux_flag;
  wire   N17, N18, N19, N45, N48, N53, N54, n3, n4, n1, n2;
  wire   [1:0] core_tick;
  tri   clk;
  tri   rst_n;
  tri   demux_flag;

  DFFRHQX1 rotation_reg_1_ ( .D(N53), .CK(clk), .RN(rst_n), .Q(rotation[1]) );
  DFFRHQX1 rotation_reg_0_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(rotation[0]) );
  DFFRHQX1 core_tick_reg_1_ ( .D(N18), .CK(clk), .RN(rst_n), .Q(core_tick[1])
         );
  DFFRHQX1 core_tick_reg_2_ ( .D(N19), .CK(clk), .RN(rst_n), .Q(N45) );
  DFFRHQX1 rotation_reg_2_ ( .D(N48), .CK(clk), .RN(rst_n), .Q(rotation[2]) );
  DFFRHQX1 core_tick_reg_0_ ( .D(N17), .CK(clk), .RN(rst_n), .Q(core_tick[0])
         );
  DFFRHQX1 mux_flag_reg ( .D(N45), .CK(clk), .RN(rst_n), .Q(mux_flag) );
  DFFRHQX1 demux_flag_reg ( .D(n2), .CK(clk), .RN(rst_n), .Q(demux_flag) );
  NOR2X1 U3 ( .A(n2), .B(n3), .Y(N48) );
  NOR2X1 U4 ( .A(n2), .B(core_tick[0]), .Y(N54) );
  NAND2X1 U5 ( .A(core_tick[0]), .B(core_tick[1]), .Y(n3) );
  OAI21XL U6 ( .A0(core_tick[0]), .A1(n4), .B0(n1), .Y(N17) );
  NOR2X1 U7 ( .A(core_tick[1]), .B(s_p_flag_in), .Y(n4) );
  INVX1 U8 ( .A(N54), .Y(n1) );
  INVX1 U9 ( .A(N45), .Y(n2) );
  XOR2X1 U10 ( .A(core_tick[1]), .B(core_tick[0]), .Y(N18) );
  XNOR2X1 U11 ( .A(N45), .B(n3), .Y(N19) );
  AND2X2 U12 ( .A(N18), .B(N45), .Y(N53) );
endmodule


module s_p ( clk, rst_n, data_in_1, data_out_1, s_p_flag_out, s_p_flag_mux );
  input [33:0] data_in_1;
  output [135:0] data_out_1;
  input clk, rst_n;
  output s_p_flag_out, s_p_flag_mux;
  wire   N86, N87, N88, N89, N146, N147, N148, N149, n1, n2, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n605, n606,
         n609, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676,
         n677, n678, n679, n680, n681, n682, n683, n684, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n749, n750, n751, n752, n753, n755, n756,
         n757, n758, n759, n760, n761, n762, n763, n764, n765, n766, n767,
         n768, n769, n770, n771, n772, n773, n774, n775, n776, n777, n778,
         n779, n780, n781, n782, n783, n784, n785, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n796, n797, n798, n799, n800,
         n801, n802, n803, n804, n805, n806, n807, n808, n809, n810, n811,
         n812, n813, n814, n815, n816, n817, n818, n819, n820, n821, n822,
         n823, n824, n825, n826, n827, n828, n829, n830, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1030, n1033, n1035, n1037, n1039, n1041, n1043, n1044, n1045, n1049,
         n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062,
         n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072,
         n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082,
         n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092,
         n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102,
         n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112,
         n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122,
         n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132,
         n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142,
         n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152,
         n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162,
         n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172,
         n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182,
         n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
         n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
         n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222,
         n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242,
         n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252,
         n1253, n1254, n1255, n1256, n1257, n1258, n3, n4, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n18, n19, n20, n21, n22, n603, n604, n607, n608,
         n610, n611, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n754, n1029, n1031, n1032, n1034, n1036,
         n1038, n1040, n1042, n1046, n1047, n1048, n1050, n1051, n1052, n1259,
         n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269,
         n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279,
         n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289,
         n1290, n1291, n1292, n1293, n1294, n1295, n1296;
  wire   [3:0] counter;
  wire   [3:0] next;
  wire   [33:0] R0;
  wire   [33:0] R15;
  wire   [33:0] R11;
  wire   [33:0] R7;
  wire   [33:0] R3;
  wire   [33:0] R2;
  wire   [33:0] R4;
  wire   [33:0] R6;
  wire   [33:0] R8;
  wire   [33:0] R10;
  wire   [33:0] R12;
  wire   [33:0] R14;
  tri   clk;
  tri   rst_n;

  EDFFX1 R13_reg_33_ ( .D(data_in_1[33]), .E(n21), .CK(clk), .QN(n565) );
  EDFFX1 R13_reg_32_ ( .D(data_in_1[32]), .E(n21), .CK(clk), .QN(n566) );
  EDFFX1 R13_reg_31_ ( .D(data_in_1[31]), .E(n21), .CK(clk), .QN(n567) );
  EDFFX1 R13_reg_30_ ( .D(data_in_1[30]), .E(n21), .CK(clk), .QN(n568) );
  EDFFX1 R13_reg_29_ ( .D(data_in_1[29]), .E(n21), .CK(clk), .QN(n569) );
  EDFFX1 R13_reg_28_ ( .D(data_in_1[28]), .E(n21), .CK(clk), .QN(n570) );
  EDFFX1 R13_reg_27_ ( .D(data_in_1[27]), .E(n21), .CK(clk), .QN(n571) );
  EDFFX1 R13_reg_26_ ( .D(data_in_1[26]), .E(n21), .CK(clk), .QN(n572) );
  EDFFX1 R13_reg_25_ ( .D(data_in_1[25]), .E(n21), .CK(clk), .QN(n573) );
  EDFFX1 R13_reg_24_ ( .D(data_in_1[24]), .E(n21), .CK(clk), .QN(n574) );
  EDFFX1 R13_reg_23_ ( .D(data_in_1[23]), .E(n21), .CK(clk), .QN(n575) );
  EDFFX1 R13_reg_22_ ( .D(data_in_1[22]), .E(n21), .CK(clk), .QN(n576) );
  EDFFX1 R13_reg_21_ ( .D(data_in_1[21]), .E(n21), .CK(clk), .QN(n577) );
  EDFFX1 R13_reg_20_ ( .D(data_in_1[20]), .E(n21), .CK(clk), .QN(n578) );
  EDFFX1 R13_reg_19_ ( .D(data_in_1[19]), .E(n21), .CK(clk), .QN(n579) );
  EDFFX1 R13_reg_18_ ( .D(data_in_1[18]), .E(n21), .CK(clk), .QN(n580) );
  EDFFX1 R13_reg_17_ ( .D(data_in_1[17]), .E(n21), .CK(clk), .QN(n581) );
  EDFFX1 R13_reg_16_ ( .D(data_in_1[16]), .E(n21), .CK(clk), .QN(n582) );
  EDFFX1 R13_reg_15_ ( .D(data_in_1[15]), .E(n21), .CK(clk), .QN(n583) );
  EDFFX1 R13_reg_14_ ( .D(data_in_1[14]), .E(n21), .CK(clk), .QN(n584) );
  EDFFX1 R13_reg_13_ ( .D(data_in_1[13]), .E(n21), .CK(clk), .QN(n585) );
  EDFFX1 R13_reg_12_ ( .D(data_in_1[12]), .E(n21), .CK(clk), .QN(n586) );
  EDFFX1 R13_reg_11_ ( .D(data_in_1[11]), .E(n21), .CK(clk), .QN(n587) );
  EDFFX1 R13_reg_10_ ( .D(data_in_1[10]), .E(n21), .CK(clk), .QN(n588) );
  EDFFX1 R13_reg_9_ ( .D(data_in_1[9]), .E(n21), .CK(clk), .QN(n589) );
  EDFFX1 R13_reg_8_ ( .D(data_in_1[8]), .E(n21), .CK(clk), .QN(n590) );
  EDFFX1 R13_reg_7_ ( .D(data_in_1[7]), .E(n21), .CK(clk), .QN(n591) );
  EDFFX1 R13_reg_6_ ( .D(data_in_1[6]), .E(n21), .CK(clk), .QN(n592) );
  EDFFX1 R13_reg_5_ ( .D(data_in_1[5]), .E(n21), .CK(clk), .QN(n593) );
  EDFFX1 R13_reg_4_ ( .D(data_in_1[4]), .E(n21), .CK(clk), .QN(n594) );
  EDFFX1 R13_reg_3_ ( .D(data_in_1[3]), .E(n21), .CK(clk), .QN(n595) );
  EDFFX1 R13_reg_2_ ( .D(data_in_1[2]), .E(n21), .CK(clk), .QN(n596) );
  EDFFX1 R13_reg_1_ ( .D(data_in_1[1]), .E(n21), .CK(clk), .QN(n597) );
  EDFFX1 R13_reg_0_ ( .D(data_in_1[0]), .E(n21), .CK(clk), .QN(n598) );
  EDFFX1 R9_reg_33_ ( .D(data_in_1[33]), .E(n7), .CK(clk), .QN(n680) );
  EDFFX1 R9_reg_32_ ( .D(data_in_1[32]), .E(n7), .CK(clk), .QN(n681) );
  EDFFX1 R9_reg_31_ ( .D(data_in_1[31]), .E(n7), .CK(clk), .QN(n682) );
  EDFFX1 R9_reg_30_ ( .D(data_in_1[30]), .E(n7), .CK(clk), .QN(n683) );
  EDFFX1 R9_reg_29_ ( .D(data_in_1[29]), .E(n7), .CK(clk), .QN(n684) );
  EDFFX1 R9_reg_28_ ( .D(data_in_1[28]), .E(n7), .CK(clk), .QN(n685) );
  EDFFX1 R9_reg_27_ ( .D(data_in_1[27]), .E(n7), .CK(clk), .QN(n686) );
  EDFFX1 R9_reg_26_ ( .D(data_in_1[26]), .E(n7), .CK(clk), .QN(n687) );
  EDFFX1 R9_reg_25_ ( .D(data_in_1[25]), .E(n7), .CK(clk), .QN(n688) );
  EDFFX1 R9_reg_24_ ( .D(data_in_1[24]), .E(n7), .CK(clk), .QN(n689) );
  EDFFX1 R9_reg_23_ ( .D(data_in_1[23]), .E(n7), .CK(clk), .QN(n690) );
  EDFFX1 R9_reg_22_ ( .D(data_in_1[22]), .E(n7), .CK(clk), .QN(n691) );
  EDFFX1 R9_reg_21_ ( .D(data_in_1[21]), .E(n7), .CK(clk), .QN(n692) );
  EDFFX1 R9_reg_20_ ( .D(data_in_1[20]), .E(n7), .CK(clk), .QN(n693) );
  EDFFX1 R9_reg_19_ ( .D(data_in_1[19]), .E(n7), .CK(clk), .QN(n694) );
  EDFFX1 R9_reg_18_ ( .D(data_in_1[18]), .E(n7), .CK(clk), .QN(n695) );
  EDFFX1 R9_reg_17_ ( .D(data_in_1[17]), .E(n7), .CK(clk), .QN(n696) );
  EDFFX1 R9_reg_16_ ( .D(data_in_1[16]), .E(n7), .CK(clk), .QN(n697) );
  EDFFX1 R9_reg_15_ ( .D(data_in_1[15]), .E(n7), .CK(clk), .QN(n698) );
  EDFFX1 R9_reg_14_ ( .D(data_in_1[14]), .E(n7), .CK(clk), .QN(n699) );
  EDFFX1 R9_reg_13_ ( .D(data_in_1[13]), .E(n7), .CK(clk), .QN(n700) );
  EDFFX1 R9_reg_12_ ( .D(data_in_1[12]), .E(n7), .CK(clk), .QN(n701) );
  EDFFX1 R9_reg_11_ ( .D(data_in_1[11]), .E(n7), .CK(clk), .QN(n702) );
  EDFFX1 R9_reg_10_ ( .D(data_in_1[10]), .E(n7), .CK(clk), .QN(n703) );
  EDFFX1 R9_reg_9_ ( .D(data_in_1[9]), .E(n7), .CK(clk), .QN(n704) );
  EDFFX1 R9_reg_8_ ( .D(data_in_1[8]), .E(n7), .CK(clk), .QN(n705) );
  EDFFX1 R9_reg_7_ ( .D(data_in_1[7]), .E(n7), .CK(clk), .QN(n706) );
  EDFFX1 R9_reg_6_ ( .D(data_in_1[6]), .E(n7), .CK(clk), .QN(n707) );
  EDFFX1 R9_reg_5_ ( .D(data_in_1[5]), .E(n7), .CK(clk), .QN(n708) );
  EDFFX1 R9_reg_4_ ( .D(data_in_1[4]), .E(n7), .CK(clk), .QN(n709) );
  EDFFX1 R9_reg_3_ ( .D(data_in_1[3]), .E(n7), .CK(clk), .QN(n710) );
  EDFFX1 R9_reg_2_ ( .D(data_in_1[2]), .E(n7), .CK(clk), .QN(n711) );
  EDFFX1 R9_reg_1_ ( .D(data_in_1[1]), .E(n7), .CK(clk), .QN(n712) );
  EDFFX1 R9_reg_0_ ( .D(data_in_1[0]), .E(n7), .CK(clk), .QN(n713) );
  DFFTRX1 s_p_flag_out_reg ( .D(rst_n), .RN(n1054), .CK(clk), .Q(s_p_flag_out)
         );
  EDFFX1 R11_reg_33_ ( .D(data_in_1[33]), .E(n14), .CK(clk), .Q(R11[33]) );
  EDFFX1 R11_reg_32_ ( .D(data_in_1[32]), .E(n14), .CK(clk), .Q(R11[32]) );
  EDFFX1 R11_reg_31_ ( .D(data_in_1[31]), .E(n14), .CK(clk), .Q(R11[31]) );
  EDFFX1 R11_reg_30_ ( .D(data_in_1[30]), .E(n14), .CK(clk), .Q(R11[30]) );
  EDFFX1 R11_reg_29_ ( .D(data_in_1[29]), .E(n14), .CK(clk), .Q(R11[29]) );
  EDFFX1 R11_reg_28_ ( .D(data_in_1[28]), .E(n14), .CK(clk), .Q(R11[28]) );
  EDFFX1 R11_reg_27_ ( .D(data_in_1[27]), .E(n14), .CK(clk), .Q(R11[27]) );
  EDFFX1 R11_reg_26_ ( .D(data_in_1[26]), .E(n14), .CK(clk), .Q(R11[26]) );
  EDFFX1 R11_reg_25_ ( .D(data_in_1[25]), .E(n14), .CK(clk), .Q(R11[25]) );
  EDFFX1 R11_reg_24_ ( .D(data_in_1[24]), .E(n14), .CK(clk), .Q(R11[24]) );
  EDFFX1 R11_reg_23_ ( .D(data_in_1[23]), .E(n14), .CK(clk), .Q(R11[23]) );
  EDFFX1 R11_reg_22_ ( .D(data_in_1[22]), .E(n14), .CK(clk), .Q(R11[22]) );
  EDFFX1 R11_reg_21_ ( .D(data_in_1[21]), .E(n14), .CK(clk), .Q(R11[21]) );
  EDFFX1 R11_reg_20_ ( .D(data_in_1[20]), .E(n14), .CK(clk), .Q(R11[20]) );
  EDFFX1 R11_reg_19_ ( .D(data_in_1[19]), .E(n14), .CK(clk), .Q(R11[19]) );
  EDFFX1 R11_reg_18_ ( .D(data_in_1[18]), .E(n14), .CK(clk), .Q(R11[18]) );
  EDFFX1 R11_reg_17_ ( .D(data_in_1[17]), .E(n14), .CK(clk), .Q(R11[17]) );
  EDFFX1 R11_reg_16_ ( .D(data_in_1[16]), .E(n14), .CK(clk), .Q(R11[16]) );
  EDFFX1 R11_reg_15_ ( .D(data_in_1[15]), .E(n14), .CK(clk), .Q(R11[15]) );
  EDFFX1 R11_reg_14_ ( .D(data_in_1[14]), .E(n14), .CK(clk), .Q(R11[14]) );
  EDFFX1 R11_reg_13_ ( .D(data_in_1[13]), .E(n14), .CK(clk), .Q(R11[13]) );
  EDFFX1 R11_reg_12_ ( .D(data_in_1[12]), .E(n14), .CK(clk), .Q(R11[12]) );
  EDFFX1 R11_reg_11_ ( .D(data_in_1[11]), .E(n14), .CK(clk), .Q(R11[11]) );
  EDFFX1 R11_reg_10_ ( .D(data_in_1[10]), .E(n14), .CK(clk), .Q(R11[10]) );
  EDFFX1 R11_reg_9_ ( .D(data_in_1[9]), .E(n14), .CK(clk), .Q(R11[9]) );
  EDFFX1 R11_reg_8_ ( .D(data_in_1[8]), .E(n14), .CK(clk), .Q(R11[8]) );
  EDFFX1 R11_reg_7_ ( .D(data_in_1[7]), .E(n14), .CK(clk), .Q(R11[7]) );
  EDFFX1 R11_reg_6_ ( .D(data_in_1[6]), .E(n14), .CK(clk), .Q(R11[6]) );
  EDFFX1 R11_reg_5_ ( .D(data_in_1[5]), .E(n14), .CK(clk), .Q(R11[5]) );
  EDFFX1 R11_reg_4_ ( .D(data_in_1[4]), .E(n14), .CK(clk), .Q(R11[4]) );
  EDFFX1 R11_reg_3_ ( .D(data_in_1[3]), .E(n14), .CK(clk), .Q(R11[3]) );
  EDFFX1 R11_reg_2_ ( .D(data_in_1[2]), .E(n14), .CK(clk), .Q(R11[2]) );
  EDFFX1 R11_reg_1_ ( .D(data_in_1[1]), .E(n14), .CK(clk), .Q(R11[1]) );
  EDFFX1 R11_reg_0_ ( .D(data_in_1[0]), .E(n14), .CK(clk), .Q(R11[0]) );
  EDFFX1 R15_reg_33_ ( .D(data_in_1[33]), .E(n20), .CK(clk), .Q(R15[33]) );
  EDFFX1 R15_reg_32_ ( .D(data_in_1[32]), .E(n20), .CK(clk), .Q(R15[32]) );
  EDFFX1 R15_reg_31_ ( .D(data_in_1[31]), .E(n20), .CK(clk), .Q(R15[31]) );
  EDFFX1 R15_reg_30_ ( .D(data_in_1[30]), .E(n20), .CK(clk), .Q(R15[30]) );
  EDFFX1 R15_reg_29_ ( .D(data_in_1[29]), .E(n20), .CK(clk), .Q(R15[29]) );
  EDFFX1 R15_reg_28_ ( .D(data_in_1[28]), .E(n20), .CK(clk), .Q(R15[28]) );
  EDFFX1 R15_reg_27_ ( .D(data_in_1[27]), .E(n20), .CK(clk), .Q(R15[27]) );
  EDFFX1 R15_reg_26_ ( .D(data_in_1[26]), .E(n20), .CK(clk), .Q(R15[26]) );
  EDFFX1 R15_reg_25_ ( .D(data_in_1[25]), .E(n20), .CK(clk), .Q(R15[25]) );
  EDFFX1 R15_reg_24_ ( .D(data_in_1[24]), .E(n20), .CK(clk), .Q(R15[24]) );
  EDFFX1 R15_reg_23_ ( .D(data_in_1[23]), .E(n20), .CK(clk), .Q(R15[23]) );
  EDFFX1 R15_reg_22_ ( .D(data_in_1[22]), .E(n20), .CK(clk), .Q(R15[22]) );
  EDFFX1 R15_reg_21_ ( .D(data_in_1[21]), .E(n20), .CK(clk), .Q(R15[21]) );
  EDFFX1 R15_reg_20_ ( .D(data_in_1[20]), .E(n20), .CK(clk), .Q(R15[20]) );
  EDFFX1 R15_reg_19_ ( .D(data_in_1[19]), .E(n20), .CK(clk), .Q(R15[19]) );
  EDFFX1 R15_reg_18_ ( .D(data_in_1[18]), .E(n20), .CK(clk), .Q(R15[18]) );
  EDFFX1 R15_reg_17_ ( .D(data_in_1[17]), .E(n20), .CK(clk), .Q(R15[17]) );
  EDFFX1 R15_reg_16_ ( .D(data_in_1[16]), .E(n20), .CK(clk), .Q(R15[16]) );
  EDFFX1 R15_reg_15_ ( .D(data_in_1[15]), .E(n20), .CK(clk), .Q(R15[15]) );
  EDFFX1 R15_reg_14_ ( .D(data_in_1[14]), .E(n20), .CK(clk), .Q(R15[14]) );
  EDFFX1 R15_reg_13_ ( .D(data_in_1[13]), .E(n20), .CK(clk), .Q(R15[13]) );
  EDFFX1 R15_reg_12_ ( .D(data_in_1[12]), .E(n20), .CK(clk), .Q(R15[12]) );
  EDFFX1 R15_reg_11_ ( .D(data_in_1[11]), .E(n20), .CK(clk), .Q(R15[11]) );
  EDFFX1 R15_reg_10_ ( .D(data_in_1[10]), .E(n20), .CK(clk), .Q(R15[10]) );
  EDFFX1 R15_reg_9_ ( .D(data_in_1[9]), .E(n20), .CK(clk), .Q(R15[9]) );
  EDFFX1 R15_reg_8_ ( .D(data_in_1[8]), .E(n20), .CK(clk), .Q(R15[8]) );
  EDFFX1 R15_reg_7_ ( .D(data_in_1[7]), .E(n20), .CK(clk), .Q(R15[7]) );
  EDFFX1 R15_reg_6_ ( .D(data_in_1[6]), .E(n20), .CK(clk), .Q(R15[6]) );
  EDFFX1 R15_reg_5_ ( .D(data_in_1[5]), .E(n20), .CK(clk), .Q(R15[5]) );
  EDFFX1 R15_reg_4_ ( .D(data_in_1[4]), .E(n20), .CK(clk), .Q(R15[4]) );
  EDFFX1 R15_reg_3_ ( .D(data_in_1[3]), .E(n20), .CK(clk), .Q(R15[3]) );
  EDFFX1 R15_reg_2_ ( .D(data_in_1[2]), .E(n20), .CK(clk), .Q(R15[2]) );
  EDFFX1 R15_reg_1_ ( .D(data_in_1[1]), .E(n20), .CK(clk), .Q(R15[1]) );
  EDFFX1 R15_reg_0_ ( .D(data_in_1[0]), .E(n20), .CK(clk), .Q(R15[0]) );
  EDFFX1 R3_reg_33_ ( .D(data_in_1[33]), .E(n12), .CK(clk), .Q(R3[33]) );
  EDFFX1 R3_reg_32_ ( .D(data_in_1[32]), .E(n12), .CK(clk), .Q(R3[32]) );
  EDFFX1 R3_reg_31_ ( .D(data_in_1[31]), .E(n12), .CK(clk), .Q(R3[31]) );
  EDFFX1 R3_reg_30_ ( .D(data_in_1[30]), .E(n12), .CK(clk), .Q(R3[30]) );
  EDFFX1 R3_reg_29_ ( .D(data_in_1[29]), .E(n12), .CK(clk), .Q(R3[29]) );
  EDFFX1 R3_reg_28_ ( .D(data_in_1[28]), .E(n12), .CK(clk), .Q(R3[28]) );
  EDFFX1 R3_reg_27_ ( .D(data_in_1[27]), .E(n12), .CK(clk), .Q(R3[27]) );
  EDFFX1 R3_reg_26_ ( .D(data_in_1[26]), .E(n12), .CK(clk), .Q(R3[26]) );
  EDFFX1 R3_reg_25_ ( .D(data_in_1[25]), .E(n12), .CK(clk), .Q(R3[25]) );
  EDFFX1 R3_reg_24_ ( .D(data_in_1[24]), .E(n12), .CK(clk), .Q(R3[24]) );
  EDFFX1 R3_reg_23_ ( .D(data_in_1[23]), .E(n12), .CK(clk), .Q(R3[23]) );
  EDFFX1 R3_reg_22_ ( .D(data_in_1[22]), .E(n12), .CK(clk), .Q(R3[22]) );
  EDFFX1 R3_reg_21_ ( .D(data_in_1[21]), .E(n12), .CK(clk), .Q(R3[21]) );
  EDFFX1 R3_reg_20_ ( .D(data_in_1[20]), .E(n12), .CK(clk), .Q(R3[20]) );
  EDFFX1 R3_reg_19_ ( .D(data_in_1[19]), .E(n12), .CK(clk), .Q(R3[19]) );
  EDFFX1 R3_reg_18_ ( .D(data_in_1[18]), .E(n12), .CK(clk), .Q(R3[18]) );
  EDFFX1 R3_reg_17_ ( .D(data_in_1[17]), .E(n12), .CK(clk), .Q(R3[17]) );
  EDFFX1 R3_reg_16_ ( .D(data_in_1[16]), .E(n12), .CK(clk), .Q(R3[16]) );
  EDFFX1 R3_reg_15_ ( .D(data_in_1[15]), .E(n12), .CK(clk), .Q(R3[15]) );
  EDFFX1 R3_reg_14_ ( .D(data_in_1[14]), .E(n12), .CK(clk), .Q(R3[14]) );
  EDFFX1 R3_reg_13_ ( .D(data_in_1[13]), .E(n12), .CK(clk), .Q(R3[13]) );
  EDFFX1 R3_reg_12_ ( .D(data_in_1[12]), .E(n12), .CK(clk), .Q(R3[12]) );
  EDFFX1 R3_reg_11_ ( .D(data_in_1[11]), .E(n12), .CK(clk), .Q(R3[11]) );
  EDFFX1 R3_reg_10_ ( .D(data_in_1[10]), .E(n12), .CK(clk), .Q(R3[10]) );
  EDFFX1 R3_reg_9_ ( .D(data_in_1[9]), .E(n12), .CK(clk), .Q(R3[9]) );
  EDFFX1 R3_reg_8_ ( .D(data_in_1[8]), .E(n12), .CK(clk), .Q(R3[8]) );
  EDFFX1 R3_reg_7_ ( .D(data_in_1[7]), .E(n12), .CK(clk), .Q(R3[7]) );
  EDFFX1 R3_reg_6_ ( .D(data_in_1[6]), .E(n12), .CK(clk), .Q(R3[6]) );
  EDFFX1 R3_reg_5_ ( .D(data_in_1[5]), .E(n12), .CK(clk), .Q(R3[5]) );
  EDFFX1 R3_reg_4_ ( .D(data_in_1[4]), .E(n12), .CK(clk), .Q(R3[4]) );
  EDFFX1 R3_reg_3_ ( .D(data_in_1[3]), .E(n12), .CK(clk), .Q(R3[3]) );
  EDFFX1 R3_reg_2_ ( .D(data_in_1[2]), .E(n12), .CK(clk), .Q(R3[2]) );
  EDFFX1 R3_reg_1_ ( .D(data_in_1[1]), .E(n12), .CK(clk), .Q(R3[1]) );
  EDFFX1 R3_reg_0_ ( .D(data_in_1[0]), .E(n12), .CK(clk), .Q(R3[0]) );
  EDFFX1 R7_reg_33_ ( .D(data_in_1[33]), .E(n9), .CK(clk), .Q(R7[33]) );
  EDFFX1 R7_reg_32_ ( .D(data_in_1[32]), .E(n9), .CK(clk), .Q(R7[32]) );
  EDFFX1 R7_reg_31_ ( .D(data_in_1[31]), .E(n9), .CK(clk), .Q(R7[31]) );
  EDFFX1 R7_reg_30_ ( .D(data_in_1[30]), .E(n9), .CK(clk), .Q(R7[30]) );
  EDFFX1 R7_reg_29_ ( .D(data_in_1[29]), .E(n9), .CK(clk), .Q(R7[29]) );
  EDFFX1 R7_reg_28_ ( .D(data_in_1[28]), .E(n9), .CK(clk), .Q(R7[28]) );
  EDFFX1 R7_reg_27_ ( .D(data_in_1[27]), .E(n9), .CK(clk), .Q(R7[27]) );
  EDFFX1 R7_reg_26_ ( .D(data_in_1[26]), .E(n9), .CK(clk), .Q(R7[26]) );
  EDFFX1 R7_reg_25_ ( .D(data_in_1[25]), .E(n9), .CK(clk), .Q(R7[25]) );
  EDFFX1 R7_reg_24_ ( .D(data_in_1[24]), .E(n9), .CK(clk), .Q(R7[24]) );
  EDFFX1 R7_reg_23_ ( .D(data_in_1[23]), .E(n9), .CK(clk), .Q(R7[23]) );
  EDFFX1 R7_reg_22_ ( .D(data_in_1[22]), .E(n9), .CK(clk), .Q(R7[22]) );
  EDFFX1 R7_reg_21_ ( .D(data_in_1[21]), .E(n9), .CK(clk), .Q(R7[21]) );
  EDFFX1 R7_reg_20_ ( .D(data_in_1[20]), .E(n9), .CK(clk), .Q(R7[20]) );
  EDFFX1 R7_reg_19_ ( .D(data_in_1[19]), .E(n9), .CK(clk), .Q(R7[19]) );
  EDFFX1 R7_reg_18_ ( .D(data_in_1[18]), .E(n9), .CK(clk), .Q(R7[18]) );
  EDFFX1 R7_reg_17_ ( .D(data_in_1[17]), .E(n9), .CK(clk), .Q(R7[17]) );
  EDFFX1 R7_reg_16_ ( .D(data_in_1[16]), .E(n9), .CK(clk), .Q(R7[16]) );
  EDFFX1 R7_reg_15_ ( .D(data_in_1[15]), .E(n9), .CK(clk), .Q(R7[15]) );
  EDFFX1 R7_reg_14_ ( .D(data_in_1[14]), .E(n9), .CK(clk), .Q(R7[14]) );
  EDFFX1 R7_reg_13_ ( .D(data_in_1[13]), .E(n9), .CK(clk), .Q(R7[13]) );
  EDFFX1 R7_reg_12_ ( .D(data_in_1[12]), .E(n9), .CK(clk), .Q(R7[12]) );
  EDFFX1 R7_reg_11_ ( .D(data_in_1[11]), .E(n9), .CK(clk), .Q(R7[11]) );
  EDFFX1 R7_reg_10_ ( .D(data_in_1[10]), .E(n9), .CK(clk), .Q(R7[10]) );
  EDFFX1 R7_reg_9_ ( .D(data_in_1[9]), .E(n9), .CK(clk), .Q(R7[9]) );
  EDFFX1 R7_reg_8_ ( .D(data_in_1[8]), .E(n9), .CK(clk), .Q(R7[8]) );
  EDFFX1 R7_reg_7_ ( .D(data_in_1[7]), .E(n9), .CK(clk), .Q(R7[7]) );
  EDFFX1 R7_reg_6_ ( .D(data_in_1[6]), .E(n9), .CK(clk), .Q(R7[6]) );
  EDFFX1 R7_reg_5_ ( .D(data_in_1[5]), .E(n9), .CK(clk), .Q(R7[5]) );
  EDFFX1 R7_reg_4_ ( .D(data_in_1[4]), .E(n9), .CK(clk), .Q(R7[4]) );
  EDFFX1 R7_reg_3_ ( .D(data_in_1[3]), .E(n9), .CK(clk), .Q(R7[3]) );
  EDFFX1 R7_reg_2_ ( .D(data_in_1[2]), .E(n9), .CK(clk), .Q(R7[2]) );
  EDFFX1 R7_reg_1_ ( .D(data_in_1[1]), .E(n9), .CK(clk), .Q(R7[1]) );
  EDFFX1 R7_reg_0_ ( .D(data_in_1[0]), .E(n9), .CK(clk), .Q(R7[0]) );
  EDFFX1 R14_reg_33_ ( .D(data_in_1[33]), .E(n22), .CK(clk), .Q(R14[33]) );
  EDFFX1 R14_reg_32_ ( .D(data_in_1[32]), .E(n22), .CK(clk), .Q(R14[32]) );
  EDFFX1 R14_reg_31_ ( .D(data_in_1[31]), .E(n22), .CK(clk), .Q(R14[31]) );
  EDFFX1 R14_reg_30_ ( .D(data_in_1[30]), .E(n22), .CK(clk), .Q(R14[30]) );
  EDFFX1 R14_reg_29_ ( .D(data_in_1[29]), .E(n22), .CK(clk), .Q(R14[29]) );
  EDFFX1 R14_reg_28_ ( .D(data_in_1[28]), .E(n22), .CK(clk), .Q(R14[28]) );
  EDFFX1 R14_reg_27_ ( .D(data_in_1[27]), .E(n22), .CK(clk), .Q(R14[27]) );
  EDFFX1 R14_reg_26_ ( .D(data_in_1[26]), .E(n22), .CK(clk), .Q(R14[26]) );
  EDFFX1 R14_reg_25_ ( .D(data_in_1[25]), .E(n22), .CK(clk), .Q(R14[25]) );
  EDFFX1 R14_reg_24_ ( .D(data_in_1[24]), .E(n22), .CK(clk), .Q(R14[24]) );
  EDFFX1 R14_reg_23_ ( .D(data_in_1[23]), .E(n22), .CK(clk), .Q(R14[23]) );
  EDFFX1 R14_reg_22_ ( .D(data_in_1[22]), .E(n22), .CK(clk), .Q(R14[22]) );
  EDFFX1 R14_reg_21_ ( .D(data_in_1[21]), .E(n22), .CK(clk), .Q(R14[21]) );
  EDFFX1 R14_reg_20_ ( .D(data_in_1[20]), .E(n22), .CK(clk), .Q(R14[20]) );
  EDFFX1 R14_reg_19_ ( .D(data_in_1[19]), .E(n22), .CK(clk), .Q(R14[19]) );
  EDFFX1 R14_reg_18_ ( .D(data_in_1[18]), .E(n22), .CK(clk), .Q(R14[18]) );
  EDFFX1 R14_reg_17_ ( .D(data_in_1[17]), .E(n22), .CK(clk), .Q(R14[17]) );
  EDFFX1 R14_reg_16_ ( .D(data_in_1[16]), .E(n22), .CK(clk), .Q(R14[16]) );
  EDFFX1 R14_reg_15_ ( .D(data_in_1[15]), .E(n22), .CK(clk), .Q(R14[15]) );
  EDFFX1 R14_reg_14_ ( .D(data_in_1[14]), .E(n22), .CK(clk), .Q(R14[14]) );
  EDFFX1 R14_reg_13_ ( .D(data_in_1[13]), .E(n22), .CK(clk), .Q(R14[13]) );
  EDFFX1 R14_reg_12_ ( .D(data_in_1[12]), .E(n22), .CK(clk), .Q(R14[12]) );
  EDFFX1 R14_reg_11_ ( .D(data_in_1[11]), .E(n22), .CK(clk), .Q(R14[11]) );
  EDFFX1 R14_reg_10_ ( .D(data_in_1[10]), .E(n22), .CK(clk), .Q(R14[10]) );
  EDFFX1 R14_reg_9_ ( .D(data_in_1[9]), .E(n22), .CK(clk), .Q(R14[9]) );
  EDFFX1 R14_reg_8_ ( .D(data_in_1[8]), .E(n22), .CK(clk), .Q(R14[8]) );
  EDFFX1 R14_reg_7_ ( .D(data_in_1[7]), .E(n22), .CK(clk), .Q(R14[7]) );
  EDFFX1 R14_reg_6_ ( .D(data_in_1[6]), .E(n22), .CK(clk), .Q(R14[6]) );
  EDFFX1 R14_reg_5_ ( .D(data_in_1[5]), .E(n22), .CK(clk), .Q(R14[5]) );
  EDFFX1 R14_reg_4_ ( .D(data_in_1[4]), .E(n22), .CK(clk), .Q(R14[4]) );
  EDFFX1 R14_reg_3_ ( .D(data_in_1[3]), .E(n22), .CK(clk), .Q(R14[3]) );
  EDFFX1 R14_reg_2_ ( .D(data_in_1[2]), .E(n22), .CK(clk), .Q(R14[2]) );
  EDFFX1 R14_reg_1_ ( .D(data_in_1[1]), .E(n22), .CK(clk), .Q(R14[1]) );
  EDFFX1 R14_reg_0_ ( .D(data_in_1[0]), .E(n22), .CK(clk), .Q(R14[0]) );
  EDFFX1 R12_reg_33_ ( .D(data_in_1[33]), .E(n18), .CK(clk), .Q(R12[33]) );
  EDFFX1 R12_reg_32_ ( .D(data_in_1[32]), .E(n18), .CK(clk), .Q(R12[32]) );
  EDFFX1 R12_reg_31_ ( .D(data_in_1[31]), .E(n18), .CK(clk), .Q(R12[31]) );
  EDFFX1 R12_reg_30_ ( .D(data_in_1[30]), .E(n18), .CK(clk), .Q(R12[30]) );
  EDFFX1 R12_reg_29_ ( .D(data_in_1[29]), .E(n18), .CK(clk), .Q(R12[29]) );
  EDFFX1 R12_reg_28_ ( .D(data_in_1[28]), .E(n18), .CK(clk), .Q(R12[28]) );
  EDFFX1 R12_reg_27_ ( .D(data_in_1[27]), .E(n18), .CK(clk), .Q(R12[27]) );
  EDFFX1 R12_reg_26_ ( .D(data_in_1[26]), .E(n18), .CK(clk), .Q(R12[26]) );
  EDFFX1 R12_reg_25_ ( .D(data_in_1[25]), .E(n18), .CK(clk), .Q(R12[25]) );
  EDFFX1 R12_reg_24_ ( .D(data_in_1[24]), .E(n18), .CK(clk), .Q(R12[24]) );
  EDFFX1 R12_reg_23_ ( .D(data_in_1[23]), .E(n18), .CK(clk), .Q(R12[23]) );
  EDFFX1 R12_reg_22_ ( .D(data_in_1[22]), .E(n18), .CK(clk), .Q(R12[22]) );
  EDFFX1 R12_reg_21_ ( .D(data_in_1[21]), .E(n18), .CK(clk), .Q(R12[21]) );
  EDFFX1 R12_reg_20_ ( .D(data_in_1[20]), .E(n18), .CK(clk), .Q(R12[20]) );
  EDFFX1 R12_reg_19_ ( .D(data_in_1[19]), .E(n18), .CK(clk), .Q(R12[19]) );
  EDFFX1 R12_reg_18_ ( .D(data_in_1[18]), .E(n18), .CK(clk), .Q(R12[18]) );
  EDFFX1 R12_reg_17_ ( .D(data_in_1[17]), .E(n18), .CK(clk), .Q(R12[17]) );
  EDFFX1 R12_reg_16_ ( .D(data_in_1[16]), .E(n18), .CK(clk), .Q(R12[16]) );
  EDFFX1 R12_reg_15_ ( .D(data_in_1[15]), .E(n18), .CK(clk), .Q(R12[15]) );
  EDFFX1 R12_reg_14_ ( .D(data_in_1[14]), .E(n18), .CK(clk), .Q(R12[14]) );
  EDFFX1 R12_reg_13_ ( .D(data_in_1[13]), .E(n18), .CK(clk), .Q(R12[13]) );
  EDFFX1 R12_reg_12_ ( .D(data_in_1[12]), .E(n18), .CK(clk), .Q(R12[12]) );
  EDFFX1 R12_reg_11_ ( .D(data_in_1[11]), .E(n18), .CK(clk), .Q(R12[11]) );
  EDFFX1 R12_reg_10_ ( .D(data_in_1[10]), .E(n18), .CK(clk), .Q(R12[10]) );
  EDFFX1 R12_reg_9_ ( .D(data_in_1[9]), .E(n18), .CK(clk), .Q(R12[9]) );
  EDFFX1 R12_reg_8_ ( .D(data_in_1[8]), .E(n18), .CK(clk), .Q(R12[8]) );
  EDFFX1 R12_reg_7_ ( .D(data_in_1[7]), .E(n18), .CK(clk), .Q(R12[7]) );
  EDFFX1 R12_reg_6_ ( .D(data_in_1[6]), .E(n18), .CK(clk), .Q(R12[6]) );
  EDFFX1 R12_reg_5_ ( .D(data_in_1[5]), .E(n18), .CK(clk), .Q(R12[5]) );
  EDFFX1 R12_reg_4_ ( .D(data_in_1[4]), .E(n18), .CK(clk), .Q(R12[4]) );
  EDFFX1 R12_reg_3_ ( .D(data_in_1[3]), .E(n18), .CK(clk), .Q(R12[3]) );
  EDFFX1 R12_reg_2_ ( .D(data_in_1[2]), .E(n18), .CK(clk), .Q(R12[2]) );
  EDFFX1 R12_reg_1_ ( .D(data_in_1[1]), .E(n18), .CK(clk), .Q(R12[1]) );
  EDFFX1 R12_reg_0_ ( .D(data_in_1[0]), .E(n18), .CK(clk), .Q(R12[0]) );
  EDFFX1 R0_reg_33_ ( .D(data_in_1[33]), .E(n19), .CK(clk), .Q(R0[33]) );
  EDFFX1 R0_reg_32_ ( .D(data_in_1[32]), .E(n19), .CK(clk), .Q(R0[32]) );
  EDFFX1 R0_reg_31_ ( .D(data_in_1[31]), .E(n19), .CK(clk), .Q(R0[31]) );
  EDFFX1 R0_reg_30_ ( .D(data_in_1[30]), .E(n19), .CK(clk), .Q(R0[30]) );
  EDFFX1 R0_reg_29_ ( .D(data_in_1[29]), .E(n19), .CK(clk), .Q(R0[29]) );
  EDFFX1 R0_reg_28_ ( .D(data_in_1[28]), .E(n19), .CK(clk), .Q(R0[28]) );
  EDFFX1 R0_reg_27_ ( .D(data_in_1[27]), .E(n19), .CK(clk), .Q(R0[27]) );
  EDFFX1 R0_reg_26_ ( .D(data_in_1[26]), .E(n19), .CK(clk), .Q(R0[26]) );
  EDFFX1 R0_reg_25_ ( .D(data_in_1[25]), .E(n19), .CK(clk), .Q(R0[25]) );
  EDFFX1 R0_reg_24_ ( .D(data_in_1[24]), .E(n19), .CK(clk), .Q(R0[24]) );
  EDFFX1 R0_reg_23_ ( .D(data_in_1[23]), .E(n19), .CK(clk), .Q(R0[23]) );
  EDFFX1 R0_reg_22_ ( .D(data_in_1[22]), .E(n19), .CK(clk), .Q(R0[22]) );
  EDFFX1 R0_reg_21_ ( .D(data_in_1[21]), .E(n19), .CK(clk), .Q(R0[21]) );
  EDFFX1 R0_reg_20_ ( .D(data_in_1[20]), .E(n19), .CK(clk), .Q(R0[20]) );
  EDFFX1 R0_reg_19_ ( .D(data_in_1[19]), .E(n19), .CK(clk), .Q(R0[19]) );
  EDFFX1 R0_reg_18_ ( .D(data_in_1[18]), .E(n19), .CK(clk), .Q(R0[18]) );
  EDFFX1 R0_reg_17_ ( .D(data_in_1[17]), .E(n19), .CK(clk), .Q(R0[17]) );
  EDFFX1 R0_reg_16_ ( .D(data_in_1[16]), .E(n19), .CK(clk), .Q(R0[16]) );
  EDFFX1 R0_reg_15_ ( .D(data_in_1[15]), .E(n19), .CK(clk), .Q(R0[15]) );
  EDFFX1 R0_reg_14_ ( .D(data_in_1[14]), .E(n19), .CK(clk), .Q(R0[14]) );
  EDFFX1 R0_reg_13_ ( .D(data_in_1[13]), .E(n19), .CK(clk), .Q(R0[13]) );
  EDFFX1 R0_reg_12_ ( .D(data_in_1[12]), .E(n19), .CK(clk), .Q(R0[12]) );
  EDFFX1 R0_reg_11_ ( .D(data_in_1[11]), .E(n19), .CK(clk), .Q(R0[11]) );
  EDFFX1 R0_reg_10_ ( .D(data_in_1[10]), .E(n19), .CK(clk), .Q(R0[10]) );
  EDFFX1 R0_reg_9_ ( .D(data_in_1[9]), .E(n19), .CK(clk), .Q(R0[9]) );
  EDFFX1 R0_reg_8_ ( .D(data_in_1[8]), .E(n19), .CK(clk), .Q(R0[8]) );
  EDFFX1 R0_reg_7_ ( .D(data_in_1[7]), .E(n19), .CK(clk), .Q(R0[7]) );
  EDFFX1 R0_reg_6_ ( .D(data_in_1[6]), .E(n19), .CK(clk), .Q(R0[6]) );
  EDFFX1 R0_reg_5_ ( .D(data_in_1[5]), .E(n19), .CK(clk), .Q(R0[5]) );
  EDFFX1 R0_reg_4_ ( .D(data_in_1[4]), .E(n19), .CK(clk), .Q(R0[4]) );
  EDFFX1 R0_reg_3_ ( .D(data_in_1[3]), .E(n19), .CK(clk), .Q(R0[3]) );
  EDFFX1 R0_reg_2_ ( .D(data_in_1[2]), .E(n19), .CK(clk), .Q(R0[2]) );
  EDFFX1 R0_reg_1_ ( .D(data_in_1[1]), .E(n19), .CK(clk), .Q(R0[1]) );
  EDFFX1 R0_reg_0_ ( .D(data_in_1[0]), .E(n19), .CK(clk), .Q(R0[0]) );
  EDFFX1 R2_reg_33_ ( .D(data_in_1[33]), .E(n13), .CK(clk), .Q(R2[33]) );
  EDFFX1 R2_reg_32_ ( .D(data_in_1[32]), .E(n13), .CK(clk), .Q(R2[32]) );
  EDFFX1 R2_reg_31_ ( .D(data_in_1[31]), .E(n13), .CK(clk), .Q(R2[31]) );
  EDFFX1 R2_reg_30_ ( .D(data_in_1[30]), .E(n13), .CK(clk), .Q(R2[30]) );
  EDFFX1 R2_reg_29_ ( .D(data_in_1[29]), .E(n13), .CK(clk), .Q(R2[29]) );
  EDFFX1 R2_reg_28_ ( .D(data_in_1[28]), .E(n13), .CK(clk), .Q(R2[28]) );
  EDFFX1 R2_reg_27_ ( .D(data_in_1[27]), .E(n13), .CK(clk), .Q(R2[27]) );
  EDFFX1 R2_reg_26_ ( .D(data_in_1[26]), .E(n13), .CK(clk), .Q(R2[26]) );
  EDFFX1 R2_reg_25_ ( .D(data_in_1[25]), .E(n13), .CK(clk), .Q(R2[25]) );
  EDFFX1 R2_reg_24_ ( .D(data_in_1[24]), .E(n13), .CK(clk), .Q(R2[24]) );
  EDFFX1 R2_reg_23_ ( .D(data_in_1[23]), .E(n13), .CK(clk), .Q(R2[23]) );
  EDFFX1 R2_reg_22_ ( .D(data_in_1[22]), .E(n13), .CK(clk), .Q(R2[22]) );
  EDFFX1 R2_reg_21_ ( .D(data_in_1[21]), .E(n13), .CK(clk), .Q(R2[21]) );
  EDFFX1 R2_reg_20_ ( .D(data_in_1[20]), .E(n13), .CK(clk), .Q(R2[20]) );
  EDFFX1 R2_reg_19_ ( .D(data_in_1[19]), .E(n13), .CK(clk), .Q(R2[19]) );
  EDFFX1 R2_reg_18_ ( .D(data_in_1[18]), .E(n13), .CK(clk), .Q(R2[18]) );
  EDFFX1 R2_reg_17_ ( .D(data_in_1[17]), .E(n13), .CK(clk), .Q(R2[17]) );
  EDFFX1 R2_reg_16_ ( .D(data_in_1[16]), .E(n13), .CK(clk), .Q(R2[16]) );
  EDFFX1 R2_reg_15_ ( .D(data_in_1[15]), .E(n13), .CK(clk), .Q(R2[15]) );
  EDFFX1 R2_reg_14_ ( .D(data_in_1[14]), .E(n13), .CK(clk), .Q(R2[14]) );
  EDFFX1 R2_reg_13_ ( .D(data_in_1[13]), .E(n13), .CK(clk), .Q(R2[13]) );
  EDFFX1 R2_reg_12_ ( .D(data_in_1[12]), .E(n13), .CK(clk), .Q(R2[12]) );
  EDFFX1 R2_reg_11_ ( .D(data_in_1[11]), .E(n13), .CK(clk), .Q(R2[11]) );
  EDFFX1 R2_reg_10_ ( .D(data_in_1[10]), .E(n13), .CK(clk), .Q(R2[10]) );
  EDFFX1 R2_reg_9_ ( .D(data_in_1[9]), .E(n13), .CK(clk), .Q(R2[9]) );
  EDFFX1 R2_reg_8_ ( .D(data_in_1[8]), .E(n13), .CK(clk), .Q(R2[8]) );
  EDFFX1 R2_reg_7_ ( .D(data_in_1[7]), .E(n13), .CK(clk), .Q(R2[7]) );
  EDFFX1 R2_reg_6_ ( .D(data_in_1[6]), .E(n13), .CK(clk), .Q(R2[6]) );
  EDFFX1 R2_reg_5_ ( .D(data_in_1[5]), .E(n13), .CK(clk), .Q(R2[5]) );
  EDFFX1 R2_reg_4_ ( .D(data_in_1[4]), .E(n13), .CK(clk), .Q(R2[4]) );
  EDFFX1 R2_reg_3_ ( .D(data_in_1[3]), .E(n13), .CK(clk), .Q(R2[3]) );
  EDFFX1 R2_reg_2_ ( .D(data_in_1[2]), .E(n13), .CK(clk), .Q(R2[2]) );
  EDFFX1 R2_reg_1_ ( .D(data_in_1[1]), .E(n13), .CK(clk), .Q(R2[1]) );
  EDFFX1 R2_reg_0_ ( .D(data_in_1[0]), .E(n13), .CK(clk), .Q(R2[0]) );
  EDFFX1 R4_reg_33_ ( .D(data_in_1[33]), .E(n11), .CK(clk), .Q(R4[33]) );
  EDFFX1 R4_reg_32_ ( .D(data_in_1[32]), .E(n11), .CK(clk), .Q(R4[32]) );
  EDFFX1 R4_reg_31_ ( .D(data_in_1[31]), .E(n11), .CK(clk), .Q(R4[31]) );
  EDFFX1 R4_reg_30_ ( .D(data_in_1[30]), .E(n11), .CK(clk), .Q(R4[30]) );
  EDFFX1 R4_reg_29_ ( .D(data_in_1[29]), .E(n11), .CK(clk), .Q(R4[29]) );
  EDFFX1 R4_reg_28_ ( .D(data_in_1[28]), .E(n11), .CK(clk), .Q(R4[28]) );
  EDFFX1 R4_reg_27_ ( .D(data_in_1[27]), .E(n11), .CK(clk), .Q(R4[27]) );
  EDFFX1 R4_reg_26_ ( .D(data_in_1[26]), .E(n11), .CK(clk), .Q(R4[26]) );
  EDFFX1 R4_reg_25_ ( .D(data_in_1[25]), .E(n11), .CK(clk), .Q(R4[25]) );
  EDFFX1 R4_reg_24_ ( .D(data_in_1[24]), .E(n11), .CK(clk), .Q(R4[24]) );
  EDFFX1 R4_reg_23_ ( .D(data_in_1[23]), .E(n11), .CK(clk), .Q(R4[23]) );
  EDFFX1 R4_reg_22_ ( .D(data_in_1[22]), .E(n11), .CK(clk), .Q(R4[22]) );
  EDFFX1 R4_reg_21_ ( .D(data_in_1[21]), .E(n11), .CK(clk), .Q(R4[21]) );
  EDFFX1 R4_reg_20_ ( .D(data_in_1[20]), .E(n11), .CK(clk), .Q(R4[20]) );
  EDFFX1 R4_reg_19_ ( .D(data_in_1[19]), .E(n11), .CK(clk), .Q(R4[19]) );
  EDFFX1 R4_reg_18_ ( .D(data_in_1[18]), .E(n11), .CK(clk), .Q(R4[18]) );
  EDFFX1 R4_reg_17_ ( .D(data_in_1[17]), .E(n11), .CK(clk), .Q(R4[17]) );
  EDFFX1 R4_reg_16_ ( .D(data_in_1[16]), .E(n11), .CK(clk), .Q(R4[16]) );
  EDFFX1 R4_reg_15_ ( .D(data_in_1[15]), .E(n11), .CK(clk), .Q(R4[15]) );
  EDFFX1 R4_reg_14_ ( .D(data_in_1[14]), .E(n11), .CK(clk), .Q(R4[14]) );
  EDFFX1 R4_reg_13_ ( .D(data_in_1[13]), .E(n11), .CK(clk), .Q(R4[13]) );
  EDFFX1 R4_reg_12_ ( .D(data_in_1[12]), .E(n11), .CK(clk), .Q(R4[12]) );
  EDFFX1 R4_reg_11_ ( .D(data_in_1[11]), .E(n11), .CK(clk), .Q(R4[11]) );
  EDFFX1 R4_reg_10_ ( .D(data_in_1[10]), .E(n11), .CK(clk), .Q(R4[10]) );
  EDFFX1 R4_reg_9_ ( .D(data_in_1[9]), .E(n11), .CK(clk), .Q(R4[9]) );
  EDFFX1 R4_reg_8_ ( .D(data_in_1[8]), .E(n11), .CK(clk), .Q(R4[8]) );
  EDFFX1 R4_reg_7_ ( .D(data_in_1[7]), .E(n11), .CK(clk), .Q(R4[7]) );
  EDFFX1 R4_reg_6_ ( .D(data_in_1[6]), .E(n11), .CK(clk), .Q(R4[6]) );
  EDFFX1 R4_reg_5_ ( .D(data_in_1[5]), .E(n11), .CK(clk), .Q(R4[5]) );
  EDFFX1 R4_reg_4_ ( .D(data_in_1[4]), .E(n11), .CK(clk), .Q(R4[4]) );
  EDFFX1 R4_reg_3_ ( .D(data_in_1[3]), .E(n11), .CK(clk), .Q(R4[3]) );
  EDFFX1 R4_reg_2_ ( .D(data_in_1[2]), .E(n11), .CK(clk), .Q(R4[2]) );
  EDFFX1 R4_reg_1_ ( .D(data_in_1[1]), .E(n11), .CK(clk), .Q(R4[1]) );
  EDFFX1 R4_reg_0_ ( .D(data_in_1[0]), .E(n11), .CK(clk), .Q(R4[0]) );
  EDFFX1 R6_reg_33_ ( .D(data_in_1[33]), .E(n10), .CK(clk), .Q(R6[33]) );
  EDFFX1 R6_reg_32_ ( .D(data_in_1[32]), .E(n10), .CK(clk), .Q(R6[32]) );
  EDFFX1 R6_reg_31_ ( .D(data_in_1[31]), .E(n10), .CK(clk), .Q(R6[31]) );
  EDFFX1 R6_reg_30_ ( .D(data_in_1[30]), .E(n10), .CK(clk), .Q(R6[30]) );
  EDFFX1 R6_reg_29_ ( .D(data_in_1[29]), .E(n10), .CK(clk), .Q(R6[29]) );
  EDFFX1 R6_reg_28_ ( .D(data_in_1[28]), .E(n10), .CK(clk), .Q(R6[28]) );
  EDFFX1 R6_reg_27_ ( .D(data_in_1[27]), .E(n10), .CK(clk), .Q(R6[27]) );
  EDFFX1 R6_reg_26_ ( .D(data_in_1[26]), .E(n10), .CK(clk), .Q(R6[26]) );
  EDFFX1 R6_reg_25_ ( .D(data_in_1[25]), .E(n10), .CK(clk), .Q(R6[25]) );
  EDFFX1 R6_reg_24_ ( .D(data_in_1[24]), .E(n10), .CK(clk), .Q(R6[24]) );
  EDFFX1 R6_reg_23_ ( .D(data_in_1[23]), .E(n10), .CK(clk), .Q(R6[23]) );
  EDFFX1 R6_reg_22_ ( .D(data_in_1[22]), .E(n10), .CK(clk), .Q(R6[22]) );
  EDFFX1 R6_reg_21_ ( .D(data_in_1[21]), .E(n10), .CK(clk), .Q(R6[21]) );
  EDFFX1 R6_reg_20_ ( .D(data_in_1[20]), .E(n10), .CK(clk), .Q(R6[20]) );
  EDFFX1 R6_reg_19_ ( .D(data_in_1[19]), .E(n10), .CK(clk), .Q(R6[19]) );
  EDFFX1 R6_reg_18_ ( .D(data_in_1[18]), .E(n10), .CK(clk), .Q(R6[18]) );
  EDFFX1 R6_reg_17_ ( .D(data_in_1[17]), .E(n10), .CK(clk), .Q(R6[17]) );
  EDFFX1 R6_reg_16_ ( .D(data_in_1[16]), .E(n10), .CK(clk), .Q(R6[16]) );
  EDFFX1 R6_reg_15_ ( .D(data_in_1[15]), .E(n10), .CK(clk), .Q(R6[15]) );
  EDFFX1 R6_reg_14_ ( .D(data_in_1[14]), .E(n10), .CK(clk), .Q(R6[14]) );
  EDFFX1 R6_reg_13_ ( .D(data_in_1[13]), .E(n10), .CK(clk), .Q(R6[13]) );
  EDFFX1 R6_reg_12_ ( .D(data_in_1[12]), .E(n10), .CK(clk), .Q(R6[12]) );
  EDFFX1 R6_reg_11_ ( .D(data_in_1[11]), .E(n10), .CK(clk), .Q(R6[11]) );
  EDFFX1 R6_reg_10_ ( .D(data_in_1[10]), .E(n10), .CK(clk), .Q(R6[10]) );
  EDFFX1 R6_reg_9_ ( .D(data_in_1[9]), .E(n10), .CK(clk), .Q(R6[9]) );
  EDFFX1 R6_reg_8_ ( .D(data_in_1[8]), .E(n10), .CK(clk), .Q(R6[8]) );
  EDFFX1 R6_reg_7_ ( .D(data_in_1[7]), .E(n10), .CK(clk), .Q(R6[7]) );
  EDFFX1 R6_reg_6_ ( .D(data_in_1[6]), .E(n10), .CK(clk), .Q(R6[6]) );
  EDFFX1 R6_reg_5_ ( .D(data_in_1[5]), .E(n10), .CK(clk), .Q(R6[5]) );
  EDFFX1 R6_reg_4_ ( .D(data_in_1[4]), .E(n10), .CK(clk), .Q(R6[4]) );
  EDFFX1 R6_reg_3_ ( .D(data_in_1[3]), .E(n10), .CK(clk), .Q(R6[3]) );
  EDFFX1 R6_reg_2_ ( .D(data_in_1[2]), .E(n10), .CK(clk), .Q(R6[2]) );
  EDFFX1 R6_reg_1_ ( .D(data_in_1[1]), .E(n10), .CK(clk), .Q(R6[1]) );
  EDFFX1 R6_reg_0_ ( .D(data_in_1[0]), .E(n10), .CK(clk), .Q(R6[0]) );
  EDFFX1 R8_reg_33_ ( .D(data_in_1[33]), .E(n8), .CK(clk), .Q(R8[33]) );
  EDFFX1 R8_reg_32_ ( .D(data_in_1[32]), .E(n8), .CK(clk), .Q(R8[32]) );
  EDFFX1 R8_reg_31_ ( .D(data_in_1[31]), .E(n8), .CK(clk), .Q(R8[31]) );
  EDFFX1 R8_reg_30_ ( .D(data_in_1[30]), .E(n8), .CK(clk), .Q(R8[30]) );
  EDFFX1 R8_reg_29_ ( .D(data_in_1[29]), .E(n8), .CK(clk), .Q(R8[29]) );
  EDFFX1 R8_reg_28_ ( .D(data_in_1[28]), .E(n8), .CK(clk), .Q(R8[28]) );
  EDFFX1 R8_reg_27_ ( .D(data_in_1[27]), .E(n8), .CK(clk), .Q(R8[27]) );
  EDFFX1 R8_reg_26_ ( .D(data_in_1[26]), .E(n8), .CK(clk), .Q(R8[26]) );
  EDFFX1 R8_reg_25_ ( .D(data_in_1[25]), .E(n8), .CK(clk), .Q(R8[25]) );
  EDFFX1 R8_reg_24_ ( .D(data_in_1[24]), .E(n8), .CK(clk), .Q(R8[24]) );
  EDFFX1 R8_reg_23_ ( .D(data_in_1[23]), .E(n8), .CK(clk), .Q(R8[23]) );
  EDFFX1 R8_reg_22_ ( .D(data_in_1[22]), .E(n8), .CK(clk), .Q(R8[22]) );
  EDFFX1 R8_reg_21_ ( .D(data_in_1[21]), .E(n8), .CK(clk), .Q(R8[21]) );
  EDFFX1 R8_reg_20_ ( .D(data_in_1[20]), .E(n8), .CK(clk), .Q(R8[20]) );
  EDFFX1 R8_reg_19_ ( .D(data_in_1[19]), .E(n8), .CK(clk), .Q(R8[19]) );
  EDFFX1 R8_reg_18_ ( .D(data_in_1[18]), .E(n8), .CK(clk), .Q(R8[18]) );
  EDFFX1 R8_reg_17_ ( .D(data_in_1[17]), .E(n8), .CK(clk), .Q(R8[17]) );
  EDFFX1 R8_reg_16_ ( .D(data_in_1[16]), .E(n8), .CK(clk), .Q(R8[16]) );
  EDFFX1 R8_reg_15_ ( .D(data_in_1[15]), .E(n8), .CK(clk), .Q(R8[15]) );
  EDFFX1 R8_reg_14_ ( .D(data_in_1[14]), .E(n8), .CK(clk), .Q(R8[14]) );
  EDFFX1 R8_reg_13_ ( .D(data_in_1[13]), .E(n8), .CK(clk), .Q(R8[13]) );
  EDFFX1 R8_reg_12_ ( .D(data_in_1[12]), .E(n8), .CK(clk), .Q(R8[12]) );
  EDFFX1 R8_reg_11_ ( .D(data_in_1[11]), .E(n8), .CK(clk), .Q(R8[11]) );
  EDFFX1 R8_reg_10_ ( .D(data_in_1[10]), .E(n8), .CK(clk), .Q(R8[10]) );
  EDFFX1 R8_reg_9_ ( .D(data_in_1[9]), .E(n8), .CK(clk), .Q(R8[9]) );
  EDFFX1 R8_reg_8_ ( .D(data_in_1[8]), .E(n8), .CK(clk), .Q(R8[8]) );
  EDFFX1 R8_reg_7_ ( .D(data_in_1[7]), .E(n8), .CK(clk), .Q(R8[7]) );
  EDFFX1 R8_reg_6_ ( .D(data_in_1[6]), .E(n8), .CK(clk), .Q(R8[6]) );
  EDFFX1 R8_reg_5_ ( .D(data_in_1[5]), .E(n8), .CK(clk), .Q(R8[5]) );
  EDFFX1 R8_reg_4_ ( .D(data_in_1[4]), .E(n8), .CK(clk), .Q(R8[4]) );
  EDFFX1 R8_reg_3_ ( .D(data_in_1[3]), .E(n8), .CK(clk), .Q(R8[3]) );
  EDFFX1 R8_reg_2_ ( .D(data_in_1[2]), .E(n8), .CK(clk), .Q(R8[2]) );
  EDFFX1 R8_reg_1_ ( .D(data_in_1[1]), .E(n8), .CK(clk), .Q(R8[1]) );
  EDFFX1 R8_reg_0_ ( .D(data_in_1[0]), .E(n8), .CK(clk), .Q(R8[0]) );
  EDFFX1 R10_reg_33_ ( .D(data_in_1[33]), .E(n6), .CK(clk), .Q(R10[33]) );
  EDFFX1 R10_reg_32_ ( .D(data_in_1[32]), .E(n6), .CK(clk), .Q(R10[32]) );
  EDFFX1 R10_reg_31_ ( .D(data_in_1[31]), .E(n6), .CK(clk), .Q(R10[31]) );
  EDFFX1 R10_reg_30_ ( .D(data_in_1[30]), .E(n6), .CK(clk), .Q(R10[30]) );
  EDFFX1 R10_reg_29_ ( .D(data_in_1[29]), .E(n6), .CK(clk), .Q(R10[29]) );
  EDFFX1 R10_reg_28_ ( .D(data_in_1[28]), .E(n6), .CK(clk), .Q(R10[28]) );
  EDFFX1 R10_reg_27_ ( .D(data_in_1[27]), .E(n6), .CK(clk), .Q(R10[27]) );
  EDFFX1 R10_reg_26_ ( .D(data_in_1[26]), .E(n6), .CK(clk), .Q(R10[26]) );
  EDFFX1 R10_reg_25_ ( .D(data_in_1[25]), .E(n6), .CK(clk), .Q(R10[25]) );
  EDFFX1 R10_reg_24_ ( .D(data_in_1[24]), .E(n6), .CK(clk), .Q(R10[24]) );
  EDFFX1 R10_reg_23_ ( .D(data_in_1[23]), .E(n6), .CK(clk), .Q(R10[23]) );
  EDFFX1 R10_reg_22_ ( .D(data_in_1[22]), .E(n6), .CK(clk), .Q(R10[22]) );
  EDFFX1 R10_reg_21_ ( .D(data_in_1[21]), .E(n6), .CK(clk), .Q(R10[21]) );
  EDFFX1 R10_reg_20_ ( .D(data_in_1[20]), .E(n6), .CK(clk), .Q(R10[20]) );
  EDFFX1 R10_reg_19_ ( .D(data_in_1[19]), .E(n6), .CK(clk), .Q(R10[19]) );
  EDFFX1 R10_reg_18_ ( .D(data_in_1[18]), .E(n6), .CK(clk), .Q(R10[18]) );
  EDFFX1 R10_reg_17_ ( .D(data_in_1[17]), .E(n6), .CK(clk), .Q(R10[17]) );
  EDFFX1 R10_reg_16_ ( .D(data_in_1[16]), .E(n6), .CK(clk), .Q(R10[16]) );
  EDFFX1 R10_reg_15_ ( .D(data_in_1[15]), .E(n6), .CK(clk), .Q(R10[15]) );
  EDFFX1 R10_reg_14_ ( .D(data_in_1[14]), .E(n6), .CK(clk), .Q(R10[14]) );
  EDFFX1 R10_reg_13_ ( .D(data_in_1[13]), .E(n6), .CK(clk), .Q(R10[13]) );
  EDFFX1 R10_reg_12_ ( .D(data_in_1[12]), .E(n6), .CK(clk), .Q(R10[12]) );
  EDFFX1 R10_reg_11_ ( .D(data_in_1[11]), .E(n6), .CK(clk), .Q(R10[11]) );
  EDFFX1 R10_reg_10_ ( .D(data_in_1[10]), .E(n6), .CK(clk), .Q(R10[10]) );
  EDFFX1 R10_reg_9_ ( .D(data_in_1[9]), .E(n6), .CK(clk), .Q(R10[9]) );
  EDFFX1 R10_reg_8_ ( .D(data_in_1[8]), .E(n6), .CK(clk), .Q(R10[8]) );
  EDFFX1 R10_reg_7_ ( .D(data_in_1[7]), .E(n6), .CK(clk), .Q(R10[7]) );
  EDFFX1 R10_reg_6_ ( .D(data_in_1[6]), .E(n6), .CK(clk), .Q(R10[6]) );
  EDFFX1 R10_reg_5_ ( .D(data_in_1[5]), .E(n6), .CK(clk), .Q(R10[5]) );
  EDFFX1 R10_reg_4_ ( .D(data_in_1[4]), .E(n6), .CK(clk), .Q(R10[4]) );
  EDFFX1 R10_reg_3_ ( .D(data_in_1[3]), .E(n6), .CK(clk), .Q(R10[3]) );
  EDFFX1 R10_reg_2_ ( .D(data_in_1[2]), .E(n6), .CK(clk), .Q(R10[2]) );
  EDFFX1 R10_reg_1_ ( .D(data_in_1[1]), .E(n6), .CK(clk), .Q(R10[1]) );
  EDFFX1 R10_reg_0_ ( .D(data_in_1[0]), .E(n6), .CK(clk), .Q(R10[0]) );
  DFFX1 R1_reg_33_ ( .D(n1258), .CK(clk), .QN(n612) );
  DFFX1 R1_reg_32_ ( .D(n1257), .CK(clk), .QN(n613) );
  DFFX1 R1_reg_31_ ( .D(n1256), .CK(clk), .QN(n614) );
  DFFX1 R1_reg_30_ ( .D(n1255), .CK(clk), .QN(n615) );
  DFFX1 R1_reg_29_ ( .D(n1254), .CK(clk), .QN(n616) );
  DFFX1 R1_reg_28_ ( .D(n1253), .CK(clk), .QN(n617) );
  DFFX1 R1_reg_27_ ( .D(n1252), .CK(clk), .QN(n618) );
  DFFX1 R1_reg_26_ ( .D(n1251), .CK(clk), .QN(n619) );
  DFFX1 R1_reg_25_ ( .D(n1250), .CK(clk), .QN(n620) );
  DFFX1 R1_reg_24_ ( .D(n1249), .CK(clk), .QN(n621) );
  DFFX1 R1_reg_23_ ( .D(n1248), .CK(clk), .QN(n622) );
  DFFX1 R1_reg_22_ ( .D(n1247), .CK(clk), .QN(n623) );
  DFFX1 R1_reg_21_ ( .D(n1246), .CK(clk), .QN(n624) );
  DFFX1 R1_reg_20_ ( .D(n1245), .CK(clk), .QN(n625) );
  DFFX1 R1_reg_19_ ( .D(n1244), .CK(clk), .QN(n626) );
  DFFX1 R1_reg_18_ ( .D(n1243), .CK(clk), .QN(n627) );
  DFFX1 R1_reg_17_ ( .D(n1242), .CK(clk), .QN(n628) );
  DFFX1 R1_reg_16_ ( .D(n1241), .CK(clk), .QN(n629) );
  DFFX1 R1_reg_15_ ( .D(n1240), .CK(clk), .QN(n630) );
  DFFX1 R1_reg_14_ ( .D(n1239), .CK(clk), .QN(n631) );
  DFFX1 R1_reg_13_ ( .D(n1238), .CK(clk), .QN(n632) );
  DFFX1 R1_reg_12_ ( .D(n1237), .CK(clk), .QN(n633) );
  DFFX1 R1_reg_11_ ( .D(n1236), .CK(clk), .QN(n634) );
  DFFX1 R1_reg_10_ ( .D(n1235), .CK(clk), .QN(n635) );
  DFFX1 R1_reg_9_ ( .D(n1234), .CK(clk), .QN(n636) );
  DFFX1 R1_reg_8_ ( .D(n1233), .CK(clk), .QN(n637) );
  DFFX1 R1_reg_7_ ( .D(n1232), .CK(clk), .QN(n638) );
  DFFX1 R1_reg_6_ ( .D(n1231), .CK(clk), .QN(n639) );
  DFFX1 R1_reg_5_ ( .D(n1230), .CK(clk), .QN(n640) );
  DFFX1 R1_reg_4_ ( .D(n1229), .CK(clk), .QN(n641) );
  DFFX1 R1_reg_3_ ( .D(n1228), .CK(clk), .QN(n642) );
  DFFX1 R1_reg_2_ ( .D(n1227), .CK(clk), .QN(n643) );
  DFFX1 R1_reg_1_ ( .D(n1226), .CK(clk), .QN(n644) );
  DFFX1 R1_reg_0_ ( .D(n1225), .CK(clk), .QN(n645) );
  DFFX1 R5_reg_33_ ( .D(n1224), .CK(clk), .QN(n646) );
  DFFX1 R5_reg_32_ ( .D(n1223), .CK(clk), .QN(n647) );
  DFFX1 R5_reg_31_ ( .D(n1222), .CK(clk), .QN(n648) );
  DFFX1 R5_reg_30_ ( .D(n1221), .CK(clk), .QN(n649) );
  DFFX1 R5_reg_29_ ( .D(n1220), .CK(clk), .QN(n650) );
  DFFX1 R5_reg_28_ ( .D(n1219), .CK(clk), .QN(n651) );
  DFFX1 R5_reg_27_ ( .D(n1218), .CK(clk), .QN(n652) );
  DFFX1 R5_reg_26_ ( .D(n1217), .CK(clk), .QN(n653) );
  DFFX1 R5_reg_25_ ( .D(n1216), .CK(clk), .QN(n654) );
  DFFX1 R5_reg_24_ ( .D(n1215), .CK(clk), .QN(n655) );
  DFFX1 R5_reg_23_ ( .D(n1214), .CK(clk), .QN(n656) );
  DFFX1 R5_reg_22_ ( .D(n1213), .CK(clk), .QN(n657) );
  DFFX1 R5_reg_21_ ( .D(n1212), .CK(clk), .QN(n658) );
  DFFX1 R5_reg_20_ ( .D(n1211), .CK(clk), .QN(n659) );
  DFFX1 R5_reg_19_ ( .D(n1210), .CK(clk), .QN(n660) );
  DFFX1 R5_reg_18_ ( .D(n1209), .CK(clk), .QN(n661) );
  DFFX1 R5_reg_17_ ( .D(n1208), .CK(clk), .QN(n662) );
  DFFX1 R5_reg_16_ ( .D(n1207), .CK(clk), .QN(n663) );
  DFFX1 R5_reg_15_ ( .D(n1206), .CK(clk), .QN(n664) );
  DFFX1 R5_reg_14_ ( .D(n1205), .CK(clk), .QN(n665) );
  DFFX1 R5_reg_13_ ( .D(n1204), .CK(clk), .QN(n666) );
  DFFX1 R5_reg_12_ ( .D(n1203), .CK(clk), .QN(n667) );
  DFFX1 R5_reg_11_ ( .D(n1202), .CK(clk), .QN(n668) );
  DFFX1 R5_reg_10_ ( .D(n1201), .CK(clk), .QN(n669) );
  DFFX1 R5_reg_9_ ( .D(n1200), .CK(clk), .QN(n670) );
  DFFX1 R5_reg_8_ ( .D(n1199), .CK(clk), .QN(n671) );
  DFFX1 R5_reg_7_ ( .D(n1198), .CK(clk), .QN(n672) );
  DFFX1 R5_reg_6_ ( .D(n1197), .CK(clk), .QN(n673) );
  DFFX1 R5_reg_5_ ( .D(n1196), .CK(clk), .QN(n674) );
  DFFX1 R5_reg_4_ ( .D(n1195), .CK(clk), .QN(n675) );
  DFFX1 R5_reg_3_ ( .D(n1194), .CK(clk), .QN(n676) );
  DFFX1 R5_reg_2_ ( .D(n1193), .CK(clk), .QN(n677) );
  DFFX1 R5_reg_1_ ( .D(n1192), .CK(clk), .QN(n678) );
  DFFX1 R5_reg_0_ ( .D(n1191), .CK(clk), .QN(n679) );
  DFFHQX1 data_out_1_reg_135_ ( .D(n1055), .CK(clk), .Q(data_out_1[135]) );
  DFFHQX1 data_out_1_reg_134_ ( .D(n1056), .CK(clk), .Q(data_out_1[134]) );
  DFFHQX1 data_out_1_reg_118_ ( .D(n1072), .CK(clk), .Q(data_out_1[118]) );
  DFFHQX1 data_out_1_reg_117_ ( .D(n1073), .CK(clk), .Q(data_out_1[117]) );
  DFFHQX1 data_out_1_reg_33_ ( .D(n1157), .CK(clk), .Q(data_out_1[33]) );
  DFFHQX1 data_out_1_reg_32_ ( .D(n1158), .CK(clk), .Q(data_out_1[32]) );
  DFFHQX1 data_out_1_reg_31_ ( .D(n1159), .CK(clk), .Q(data_out_1[31]) );
  DFFHQX1 data_out_1_reg_16_ ( .D(n1174), .CK(clk), .Q(data_out_1[16]) );
  DFFHQX1 data_out_1_reg_15_ ( .D(n1175), .CK(clk), .Q(data_out_1[15]) );
  DFFHQX1 data_out_1_reg_14_ ( .D(n1176), .CK(clk), .Q(data_out_1[14]) );
  DFFHQX1 data_out_1_reg_67_ ( .D(n1123), .CK(clk), .Q(data_out_1[67]) );
  DFFHQX1 data_out_1_reg_66_ ( .D(n1124), .CK(clk), .Q(data_out_1[66]) );
  DFFHQX1 data_out_1_reg_50_ ( .D(n1140), .CK(clk), .Q(data_out_1[50]) );
  DFFHQX1 data_out_1_reg_49_ ( .D(n1141), .CK(clk), .Q(data_out_1[49]) );
  DFFHQX1 data_out_1_reg_101_ ( .D(n1089), .CK(clk), .Q(data_out_1[101]) );
  DFFHQX1 data_out_1_reg_100_ ( .D(n1090), .CK(clk), .Q(data_out_1[100]) );
  DFFHQX1 data_out_1_reg_84_ ( .D(n1106), .CK(clk), .Q(data_out_1[84]) );
  DFFHQX1 data_out_1_reg_83_ ( .D(n1107), .CK(clk), .Q(data_out_1[83]) );
  DFFHQX1 data_out_1_reg_133_ ( .D(n1057), .CK(clk), .Q(data_out_1[133]) );
  DFFHQX1 data_out_1_reg_132_ ( .D(n1058), .CK(clk), .Q(data_out_1[132]) );
  DFFHQX1 data_out_1_reg_131_ ( .D(n1059), .CK(clk), .Q(data_out_1[131]) );
  DFFHQX1 data_out_1_reg_130_ ( .D(n1060), .CK(clk), .Q(data_out_1[130]) );
  DFFHQX1 data_out_1_reg_116_ ( .D(n1074), .CK(clk), .Q(data_out_1[116]) );
  DFFHQX1 data_out_1_reg_115_ ( .D(n1075), .CK(clk), .Q(data_out_1[115]) );
  DFFHQX1 data_out_1_reg_114_ ( .D(n1076), .CK(clk), .Q(data_out_1[114]) );
  DFFHQX1 data_out_1_reg_113_ ( .D(n1077), .CK(clk), .Q(data_out_1[113]) );
  DFFHQX1 data_out_1_reg_112_ ( .D(n1078), .CK(clk), .Q(data_out_1[112]) );
  DFFHQX1 data_out_1_reg_30_ ( .D(n1160), .CK(clk), .Q(data_out_1[30]) );
  DFFHQX1 data_out_1_reg_29_ ( .D(n1161), .CK(clk), .Q(data_out_1[29]) );
  DFFHQX1 data_out_1_reg_28_ ( .D(n1162), .CK(clk), .Q(data_out_1[28]) );
  DFFHQX1 data_out_1_reg_27_ ( .D(n1163), .CK(clk), .Q(data_out_1[27]) );
  DFFHQX1 data_out_1_reg_26_ ( .D(n1164), .CK(clk), .Q(data_out_1[26]) );
  DFFHQX1 data_out_1_reg_13_ ( .D(n1177), .CK(clk), .Q(data_out_1[13]) );
  DFFHQX1 data_out_1_reg_12_ ( .D(n1178), .CK(clk), .Q(data_out_1[12]) );
  DFFHQX1 data_out_1_reg_11_ ( .D(n1179), .CK(clk), .Q(data_out_1[11]) );
  DFFHQX1 data_out_1_reg_10_ ( .D(n1180), .CK(clk), .Q(data_out_1[10]) );
  DFFHQX1 data_out_1_reg_9_ ( .D(n1181), .CK(clk), .Q(data_out_1[9]) );
  DFFHQX1 data_out_1_reg_65_ ( .D(n1125), .CK(clk), .Q(data_out_1[65]) );
  DFFHQX1 data_out_1_reg_64_ ( .D(n1126), .CK(clk), .Q(data_out_1[64]) );
  DFFHQX1 data_out_1_reg_63_ ( .D(n1127), .CK(clk), .Q(data_out_1[63]) );
  DFFHQX1 data_out_1_reg_62_ ( .D(n1128), .CK(clk), .Q(data_out_1[62]) );
  DFFHQX1 data_out_1_reg_48_ ( .D(n1142), .CK(clk), .Q(data_out_1[48]) );
  DFFHQX1 data_out_1_reg_47_ ( .D(n1143), .CK(clk), .Q(data_out_1[47]) );
  DFFHQX1 data_out_1_reg_46_ ( .D(n1144), .CK(clk), .Q(data_out_1[46]) );
  DFFHQX1 data_out_1_reg_45_ ( .D(n1145), .CK(clk), .Q(data_out_1[45]) );
  DFFHQX1 data_out_1_reg_44_ ( .D(n1146), .CK(clk), .Q(data_out_1[44]) );
  DFFHQX1 data_out_1_reg_99_ ( .D(n1091), .CK(clk), .Q(data_out_1[99]) );
  DFFHQX1 data_out_1_reg_98_ ( .D(n1092), .CK(clk), .Q(data_out_1[98]) );
  DFFHQX1 data_out_1_reg_97_ ( .D(n1093), .CK(clk), .Q(data_out_1[97]) );
  DFFHQX1 data_out_1_reg_96_ ( .D(n1094), .CK(clk), .Q(data_out_1[96]) );
  DFFHQX1 data_out_1_reg_95_ ( .D(n1095), .CK(clk), .Q(data_out_1[95]) );
  DFFHQX1 data_out_1_reg_82_ ( .D(n1108), .CK(clk), .Q(data_out_1[82]) );
  DFFHQX1 data_out_1_reg_81_ ( .D(n1109), .CK(clk), .Q(data_out_1[81]) );
  DFFHQX1 data_out_1_reg_80_ ( .D(n1110), .CK(clk), .Q(data_out_1[80]) );
  DFFHQX1 data_out_1_reg_79_ ( .D(n1111), .CK(clk), .Q(data_out_1[79]) );
  DFFHQX1 data_out_1_reg_78_ ( .D(n1112), .CK(clk), .Q(data_out_1[78]) );
  DFFTRX1 counter_reg_1_ ( .D(next[1]), .RN(rst_n), .CK(clk), .Q(counter[1]), 
        .QN(n609) );
  DFFTRX1 counter_reg_3_ ( .D(next[3]), .RN(rst_n), .CK(clk), .Q(counter[3]), 
        .QN(n605) );
  DFFTRX1 counter_reg_0_ ( .D(next[0]), .RN(rst_n), .CK(clk), .Q(counter[0]), 
        .QN(N86) );
  DFFTRX1 counter_reg_2_ ( .D(next[2]), .RN(rst_n), .CK(clk), .Q(counter[2]), 
        .QN(n606) );
  DFFHQX1 data_out_1_reg_129_ ( .D(n1061), .CK(clk), .Q(data_out_1[129]) );
  DFFHQX1 data_out_1_reg_128_ ( .D(n1062), .CK(clk), .Q(data_out_1[128]) );
  DFFHQX1 data_out_1_reg_127_ ( .D(n1063), .CK(clk), .Q(data_out_1[127]) );
  DFFHQX1 data_out_1_reg_126_ ( .D(n1064), .CK(clk), .Q(data_out_1[126]) );
  DFFHQX1 data_out_1_reg_125_ ( .D(n1065), .CK(clk), .Q(data_out_1[125]) );
  DFFHQX1 data_out_1_reg_111_ ( .D(n1079), .CK(clk), .Q(data_out_1[111]) );
  DFFHQX1 data_out_1_reg_110_ ( .D(n1080), .CK(clk), .Q(data_out_1[110]) );
  DFFHQX1 data_out_1_reg_109_ ( .D(n1081), .CK(clk), .Q(data_out_1[109]) );
  DFFHQX1 data_out_1_reg_108_ ( .D(n1082), .CK(clk), .Q(data_out_1[108]) );
  DFFHQX1 data_out_1_reg_25_ ( .D(n1165), .CK(clk), .Q(data_out_1[25]) );
  DFFHQX1 data_out_1_reg_24_ ( .D(n1166), .CK(clk), .Q(data_out_1[24]) );
  DFFHQX1 data_out_1_reg_23_ ( .D(n1167), .CK(clk), .Q(data_out_1[23]) );
  DFFHQX1 data_out_1_reg_22_ ( .D(n1168), .CK(clk), .Q(data_out_1[22]) );
  DFFHQX1 data_out_1_reg_8_ ( .D(n1182), .CK(clk), .Q(data_out_1[8]) );
  DFFHQX1 data_out_1_reg_7_ ( .D(n1183), .CK(clk), .Q(data_out_1[7]) );
  DFFHQX1 data_out_1_reg_6_ ( .D(n1184), .CK(clk), .Q(data_out_1[6]) );
  DFFHQX1 data_out_1_reg_5_ ( .D(n1185), .CK(clk), .Q(data_out_1[5]) );
  DFFHQX1 data_out_1_reg_61_ ( .D(n1129), .CK(clk), .Q(data_out_1[61]) );
  DFFHQX1 data_out_1_reg_60_ ( .D(n1130), .CK(clk), .Q(data_out_1[60]) );
  DFFHQX1 data_out_1_reg_59_ ( .D(n1131), .CK(clk), .Q(data_out_1[59]) );
  DFFHQX1 data_out_1_reg_58_ ( .D(n1132), .CK(clk), .Q(data_out_1[58]) );
  DFFHQX1 data_out_1_reg_43_ ( .D(n1147), .CK(clk), .Q(data_out_1[43]) );
  DFFHQX1 data_out_1_reg_42_ ( .D(n1148), .CK(clk), .Q(data_out_1[42]) );
  DFFHQX1 data_out_1_reg_41_ ( .D(n1149), .CK(clk), .Q(data_out_1[41]) );
  DFFHQX1 data_out_1_reg_40_ ( .D(n1150), .CK(clk), .Q(data_out_1[40]) );
  DFFHQX1 data_out_1_reg_94_ ( .D(n1096), .CK(clk), .Q(data_out_1[94]) );
  DFFHQX1 data_out_1_reg_93_ ( .D(n1097), .CK(clk), .Q(data_out_1[93]) );
  DFFHQX1 data_out_1_reg_92_ ( .D(n1098), .CK(clk), .Q(data_out_1[92]) );
  DFFHQX1 data_out_1_reg_91_ ( .D(n1099), .CK(clk), .Q(data_out_1[91]) );
  DFFHQX1 data_out_1_reg_77_ ( .D(n1113), .CK(clk), .Q(data_out_1[77]) );
  DFFHQX1 data_out_1_reg_76_ ( .D(n1114), .CK(clk), .Q(data_out_1[76]) );
  DFFHQX1 data_out_1_reg_75_ ( .D(n1115), .CK(clk), .Q(data_out_1[75]) );
  DFFHQX1 data_out_1_reg_74_ ( .D(n1116), .CK(clk), .Q(data_out_1[74]) );
  DFFHQX1 data_out_1_reg_124_ ( .D(n1066), .CK(clk), .Q(data_out_1[124]) );
  DFFHQX1 data_out_1_reg_123_ ( .D(n1067), .CK(clk), .Q(data_out_1[123]) );
  DFFHQX1 data_out_1_reg_122_ ( .D(n1068), .CK(clk), .Q(data_out_1[122]) );
  DFFHQX1 data_out_1_reg_121_ ( .D(n1069), .CK(clk), .Q(data_out_1[121]) );
  DFFHQX1 data_out_1_reg_107_ ( .D(n1083), .CK(clk), .Q(data_out_1[107]) );
  DFFHQX1 data_out_1_reg_106_ ( .D(n1084), .CK(clk), .Q(data_out_1[106]) );
  DFFHQX1 data_out_1_reg_105_ ( .D(n1085), .CK(clk), .Q(data_out_1[105]) );
  DFFHQX1 data_out_1_reg_104_ ( .D(n1086), .CK(clk), .Q(data_out_1[104]) );
  DFFHQX1 data_out_1_reg_21_ ( .D(n1169), .CK(clk), .Q(data_out_1[21]) );
  DFFHQX1 data_out_1_reg_20_ ( .D(n1170), .CK(clk), .Q(data_out_1[20]) );
  DFFHQX1 data_out_1_reg_19_ ( .D(n1171), .CK(clk), .Q(data_out_1[19]) );
  DFFHQX1 data_out_1_reg_18_ ( .D(n1172), .CK(clk), .Q(data_out_1[18]) );
  DFFHQX1 data_out_1_reg_17_ ( .D(n1173), .CK(clk), .Q(data_out_1[17]) );
  DFFHQX1 data_out_1_reg_4_ ( .D(n1186), .CK(clk), .Q(data_out_1[4]) );
  DFFHQX1 data_out_1_reg_3_ ( .D(n1187), .CK(clk), .Q(data_out_1[3]) );
  DFFHQX1 data_out_1_reg_2_ ( .D(n1188), .CK(clk), .Q(data_out_1[2]) );
  DFFHQX1 data_out_1_reg_1_ ( .D(n1189), .CK(clk), .Q(data_out_1[1]) );
  DFFHQX1 data_out_1_reg_0_ ( .D(n1190), .CK(clk), .Q(data_out_1[0]) );
  DFFHQX1 data_out_1_reg_57_ ( .D(n1133), .CK(clk), .Q(data_out_1[57]) );
  DFFHQX1 data_out_1_reg_56_ ( .D(n1134), .CK(clk), .Q(data_out_1[56]) );
  DFFHQX1 data_out_1_reg_55_ ( .D(n1135), .CK(clk), .Q(data_out_1[55]) );
  DFFHQX1 data_out_1_reg_54_ ( .D(n1136), .CK(clk), .Q(data_out_1[54]) );
  DFFHQX1 data_out_1_reg_53_ ( .D(n1137), .CK(clk), .Q(data_out_1[53]) );
  DFFHQX1 data_out_1_reg_39_ ( .D(n1151), .CK(clk), .Q(data_out_1[39]) );
  DFFHQX1 data_out_1_reg_38_ ( .D(n1152), .CK(clk), .Q(data_out_1[38]) );
  DFFHQX1 data_out_1_reg_37_ ( .D(n1153), .CK(clk), .Q(data_out_1[37]) );
  DFFHQX1 data_out_1_reg_36_ ( .D(n1154), .CK(clk), .Q(data_out_1[36]) );
  DFFHQX1 data_out_1_reg_90_ ( .D(n1100), .CK(clk), .Q(data_out_1[90]) );
  DFFHQX1 data_out_1_reg_89_ ( .D(n1101), .CK(clk), .Q(data_out_1[89]) );
  DFFHQX1 data_out_1_reg_88_ ( .D(n1102), .CK(clk), .Q(data_out_1[88]) );
  DFFHQX1 data_out_1_reg_87_ ( .D(n1103), .CK(clk), .Q(data_out_1[87]) );
  DFFHQX1 data_out_1_reg_85_ ( .D(n1105), .CK(clk), .Q(data_out_1[85]) );
  DFFHQX1 data_out_1_reg_73_ ( .D(n1117), .CK(clk), .Q(data_out_1[73]) );
  DFFHQX1 data_out_1_reg_72_ ( .D(n1118), .CK(clk), .Q(data_out_1[72]) );
  DFFHQX1 data_out_1_reg_71_ ( .D(n1119), .CK(clk), .Q(data_out_1[71]) );
  DFFHQX1 data_out_1_reg_70_ ( .D(n1120), .CK(clk), .Q(data_out_1[70]) );
  DFFHQX1 data_out_1_reg_120_ ( .D(n1070), .CK(clk), .Q(data_out_1[120]) );
  DFFHQX1 data_out_1_reg_119_ ( .D(n1071), .CK(clk), .Q(data_out_1[119]) );
  DFFHQX1 data_out_1_reg_103_ ( .D(n1087), .CK(clk), .Q(data_out_1[103]) );
  DFFHQX1 data_out_1_reg_102_ ( .D(n1088), .CK(clk), .Q(data_out_1[102]) );
  DFFHQX1 data_out_1_reg_52_ ( .D(n1138), .CK(clk), .Q(data_out_1[52]) );
  DFFHQX1 data_out_1_reg_51_ ( .D(n1139), .CK(clk), .Q(data_out_1[51]) );
  DFFHQX1 data_out_1_reg_35_ ( .D(n1155), .CK(clk), .Q(data_out_1[35]) );
  DFFHQX1 data_out_1_reg_34_ ( .D(n1156), .CK(clk), .Q(data_out_1[34]) );
  DFFHQX1 data_out_1_reg_86_ ( .D(n1104), .CK(clk), .Q(data_out_1[86]) );
  DFFHQX1 data_out_1_reg_69_ ( .D(n1121), .CK(clk), .Q(data_out_1[69]) );
  DFFHQX1 data_out_1_reg_68_ ( .D(n1122), .CK(clk), .Q(data_out_1[68]) );
  DFFTRX1 s_p_flag_mux_reg ( .D(rst_n), .RN(n1054), .CK(clk), .Q(s_p_flag_mux)
         );
  DFFTRX1 next_reg_3_ ( .D(N149), .RN(rst_n), .CK(clk), .Q(next[3]) );
  DFFTRX1 next_reg_2_ ( .D(N148), .RN(rst_n), .CK(clk), .Q(next[2]) );
  DFFTRX1 next_reg_0_ ( .D(N146), .RN(rst_n), .CK(clk), .Q(next[0]) );
  DFFTRX1 next_reg_1_ ( .D(N147), .RN(rst_n), .CK(clk), .Q(next[1]) );
  AND2X2 U3 ( .A(n1028), .B(n754), .Y(n3) );
  OR2X2 U4 ( .A(n1026), .B(n748), .Y(n4) );
  INVX1 U5 ( .A(n725), .Y(n728) );
  INVX1 U6 ( .A(n725), .Y(n727) );
  INVX1 U7 ( .A(n714), .Y(n717) );
  INVX1 U8 ( .A(n714), .Y(n716) );
  INVX1 U9 ( .A(n725), .Y(n729) );
  INVX1 U10 ( .A(n714), .Y(n718) );
  INVX1 U11 ( .A(n740), .Y(n736) );
  INVX1 U12 ( .A(n1050), .Y(n1042) );
  INVX1 U13 ( .A(n740), .Y(n735) );
  INVX1 U14 ( .A(n1050), .Y(n1036) );
  INVX1 U15 ( .A(n1050), .Y(n1038) );
  INVX1 U16 ( .A(n1050), .Y(n1040) );
  INVX1 U17 ( .A(n740), .Y(n733) );
  INVX1 U18 ( .A(n740), .Y(n734) );
  INVX1 U19 ( .A(n740), .Y(n737) );
  INVX1 U20 ( .A(n1050), .Y(n1046) );
  INVX1 U21 ( .A(n740), .Y(n738) );
  INVX1 U22 ( .A(n1050), .Y(n1047) );
  INVX1 U23 ( .A(n740), .Y(n739) );
  INVX1 U24 ( .A(n1050), .Y(n1048) );
  INVX1 U25 ( .A(n4), .Y(n730) );
  INVX1 U26 ( .A(n4), .Y(n731) );
  INVX1 U27 ( .A(n4), .Y(n732) );
  INVX1 U28 ( .A(n726), .Y(n725) );
  INVX1 U29 ( .A(n715), .Y(n714) );
  INVX1 U30 ( .A(n3), .Y(n1051) );
  INVX1 U31 ( .A(n3), .Y(n1052) );
  INVX1 U32 ( .A(n3), .Y(n1259) );
  INVX1 U33 ( .A(n726), .Y(n719) );
  INVX1 U34 ( .A(n729), .Y(n720) );
  INVX1 U35 ( .A(n729), .Y(n721) );
  INVX1 U36 ( .A(n729), .Y(n722) );
  INVX1 U37 ( .A(n726), .Y(n723) );
  INVX1 U38 ( .A(n726), .Y(n724) );
  INVX1 U39 ( .A(n715), .Y(n603) );
  INVX1 U40 ( .A(n718), .Y(n604) );
  INVX1 U41 ( .A(n718), .Y(n607) );
  INVX1 U42 ( .A(n715), .Y(n608) );
  INVX1 U43 ( .A(n715), .Y(n610) );
  INVX1 U44 ( .A(n715), .Y(n611) );
  INVX1 U45 ( .A(n1034), .Y(n748) );
  INVX1 U46 ( .A(n1037), .Y(n726) );
  INVX1 U47 ( .A(n1044), .Y(n715) );
  INVX1 U48 ( .A(n753), .Y(n740) );
  INVX1 U49 ( .A(n751), .Y(n1050) );
  INVX1 U50 ( .A(n1031), .Y(n744) );
  INVX1 U51 ( .A(n1029), .Y(n743) );
  INVX1 U52 ( .A(n1032), .Y(n746) );
  INVX1 U53 ( .A(n1031), .Y(n745) );
  INVX1 U54 ( .A(n1032), .Y(n747) );
  INVX1 U55 ( .A(n1029), .Y(n742) );
  INVX1 U56 ( .A(n1029), .Y(n741) );
  NOR2BX1 U57 ( .AN(n1027), .B(n748), .Y(n753) );
  NOR2BX1 U58 ( .AN(n1025), .B(n748), .Y(n751) );
  NAND2X1 U59 ( .A(n1035), .B(n1261), .Y(n1037) );
  NAND2X1 U60 ( .A(n1041), .B(n1261), .Y(n1044) );
  INVX1 U61 ( .A(n752), .Y(n1034) );
  AND2X2 U62 ( .A(n1030), .B(n1262), .Y(n6) );
  AND2X2 U63 ( .A(n1030), .B(n1261), .Y(n7) );
  AND2X2 U64 ( .A(n1030), .B(n1033), .Y(n8) );
  AND2X2 U65 ( .A(n1035), .B(n2), .Y(n9) );
  AND2X2 U66 ( .A(n1035), .B(n1262), .Y(n10) );
  AND2X2 U67 ( .A(n1035), .B(n1033), .Y(n11) );
  AND2X2 U68 ( .A(n1041), .B(n2), .Y(n12) );
  AND2X2 U69 ( .A(n1041), .B(n1262), .Y(n13) );
  AND2X2 U70 ( .A(n1030), .B(n2), .Y(n14) );
  INVX1 U71 ( .A(n752), .Y(n1032) );
  INVX1 U72 ( .A(n752), .Y(n1029) );
  INVX1 U73 ( .A(n752), .Y(n1031) );
  INVX1 U74 ( .A(n752), .Y(n754) );
  OR4X2 U75 ( .A(n1028), .B(n1025), .C(n1027), .D(n1260), .Y(n1054) );
  INVX1 U76 ( .A(n1026), .Y(n1260) );
  INVX1 U77 ( .A(n1045), .Y(n1261) );
  INVX1 U78 ( .A(n1043), .Y(n1262) );
  AND2X2 U79 ( .A(N87), .B(n1), .Y(N147) );
  NAND2X1 U80 ( .A(n1043), .B(n1045), .Y(N87) );
  NOR2BX1 U81 ( .AN(n1039), .B(n606), .Y(n1035) );
  NOR2BX1 U82 ( .AN(n1039), .B(counter[2]), .Y(n1041) );
  OAI22X1 U83 ( .A0(n1296), .A1(n719), .B0(n729), .B1(n679), .Y(n1191) );
  OAI22X1 U84 ( .A0(n1295), .A1(n719), .B0(n729), .B1(n678), .Y(n1192) );
  OAI22X1 U85 ( .A0(n1294), .A1(n720), .B0(n729), .B1(n677), .Y(n1193) );
  OAI22X1 U86 ( .A0(n1293), .A1(n720), .B0(n729), .B1(n676), .Y(n1194) );
  OAI22X1 U87 ( .A0(n1292), .A1(n724), .B0(n729), .B1(n675), .Y(n1195) );
  OAI22X1 U88 ( .A0(n1291), .A1(n720), .B0(n729), .B1(n674), .Y(n1196) );
  OAI22X1 U89 ( .A0(n1290), .A1(n721), .B0(n729), .B1(n673), .Y(n1197) );
  OAI22X1 U90 ( .A0(n1289), .A1(n721), .B0(n729), .B1(n672), .Y(n1198) );
  OAI22X1 U91 ( .A0(n1288), .A1(n720), .B0(n728), .B1(n671), .Y(n1199) );
  OAI22X1 U92 ( .A0(n1287), .A1(n719), .B0(n728), .B1(n670), .Y(n1200) );
  OAI22X1 U93 ( .A0(n1286), .A1(n721), .B0(n728), .B1(n669), .Y(n1201) );
  OAI22X1 U94 ( .A0(n1285), .A1(n719), .B0(n728), .B1(n668), .Y(n1202) );
  OAI22X1 U95 ( .A0(n1284), .A1(n722), .B0(n728), .B1(n667), .Y(n1203) );
  OAI22X1 U96 ( .A0(n1283), .A1(n722), .B0(n728), .B1(n666), .Y(n1204) );
  OAI22X1 U97 ( .A0(n1282), .A1(n722), .B0(n728), .B1(n665), .Y(n1205) );
  OAI22X1 U98 ( .A0(n1281), .A1(n723), .B0(n728), .B1(n664), .Y(n1206) );
  OAI22X1 U99 ( .A0(n1280), .A1(n722), .B0(n728), .B1(n663), .Y(n1207) );
  OAI22X1 U100 ( .A0(n1279), .A1(n722), .B0(n728), .B1(n662), .Y(n1208) );
  OAI22X1 U101 ( .A0(n1278), .A1(n723), .B0(n728), .B1(n661), .Y(n1209) );
  OAI22X1 U102 ( .A0(n1277), .A1(n723), .B0(n728), .B1(n660), .Y(n1210) );
  OAI22X1 U103 ( .A0(n1276), .A1(n724), .B0(n728), .B1(n659), .Y(n1211) );
  OAI22X1 U104 ( .A0(n1275), .A1(n721), .B0(n727), .B1(n658), .Y(n1212) );
  OAI22X1 U105 ( .A0(n1274), .A1(n723), .B0(n727), .B1(n657), .Y(n1213) );
  OAI22X1 U106 ( .A0(n1273), .A1(n724), .B0(n727), .B1(n656), .Y(n1214) );
  OAI22X1 U107 ( .A0(n1272), .A1(n721), .B0(n727), .B1(n655), .Y(n1215) );
  OAI22X1 U108 ( .A0(n1271), .A1(n720), .B0(n727), .B1(n654), .Y(n1216) );
  OAI22X1 U109 ( .A0(n1270), .A1(n723), .B0(n727), .B1(n653), .Y(n1217) );
  OAI22X1 U110 ( .A0(n1269), .A1(n721), .B0(n727), .B1(n652), .Y(n1218) );
  OAI22X1 U111 ( .A0(n1268), .A1(n720), .B0(n727), .B1(n651), .Y(n1219) );
  OAI22X1 U112 ( .A0(n1267), .A1(n724), .B0(n727), .B1(n650), .Y(n1220) );
  OAI22X1 U113 ( .A0(n1266), .A1(n724), .B0(n727), .B1(n649), .Y(n1221) );
  OAI22X1 U114 ( .A0(n1265), .A1(n724), .B0(n727), .B1(n648), .Y(n1222) );
  OAI22X1 U115 ( .A0(n1264), .A1(n724), .B0(n727), .B1(n647), .Y(n1223) );
  OAI22X1 U116 ( .A0(n1263), .A1(n719), .B0(n727), .B1(n646), .Y(n1224) );
  OAI22X1 U117 ( .A0(n1296), .A1(n603), .B0(n718), .B1(n645), .Y(n1225) );
  OAI22X1 U118 ( .A0(n1295), .A1(n603), .B0(n718), .B1(n644), .Y(n1226) );
  OAI22X1 U119 ( .A0(n1294), .A1(n604), .B0(n718), .B1(n643), .Y(n1227) );
  OAI22X1 U120 ( .A0(n1293), .A1(n604), .B0(n718), .B1(n642), .Y(n1228) );
  OAI22X1 U121 ( .A0(n1292), .A1(n611), .B0(n718), .B1(n641), .Y(n1229) );
  OAI22X1 U122 ( .A0(n1291), .A1(n604), .B0(n718), .B1(n640), .Y(n1230) );
  OAI22X1 U123 ( .A0(n1290), .A1(n607), .B0(n718), .B1(n639), .Y(n1231) );
  OAI22X1 U124 ( .A0(n1289), .A1(n607), .B0(n718), .B1(n638), .Y(n1232) );
  OAI22X1 U125 ( .A0(n1288), .A1(n604), .B0(n717), .B1(n637), .Y(n1233) );
  OAI22X1 U126 ( .A0(n1287), .A1(n603), .B0(n717), .B1(n636), .Y(n1234) );
  OAI22X1 U127 ( .A0(n1286), .A1(n607), .B0(n717), .B1(n635), .Y(n1235) );
  OAI22X1 U128 ( .A0(n1285), .A1(n603), .B0(n717), .B1(n634), .Y(n1236) );
  OAI22X1 U129 ( .A0(n1284), .A1(n608), .B0(n717), .B1(n633), .Y(n1237) );
  OAI22X1 U130 ( .A0(n1283), .A1(n608), .B0(n717), .B1(n632), .Y(n1238) );
  OAI22X1 U131 ( .A0(n1282), .A1(n608), .B0(n717), .B1(n631), .Y(n1239) );
  OAI22X1 U132 ( .A0(n1281), .A1(n610), .B0(n717), .B1(n630), .Y(n1240) );
  OAI22X1 U133 ( .A0(n1280), .A1(n608), .B0(n717), .B1(n629), .Y(n1241) );
  OAI22X1 U134 ( .A0(n1279), .A1(n608), .B0(n717), .B1(n628), .Y(n1242) );
  OAI22X1 U135 ( .A0(n1278), .A1(n610), .B0(n717), .B1(n627), .Y(n1243) );
  OAI22X1 U136 ( .A0(n1277), .A1(n610), .B0(n717), .B1(n626), .Y(n1244) );
  OAI22X1 U137 ( .A0(n1276), .A1(n611), .B0(n717), .B1(n625), .Y(n1245) );
  OAI22X1 U138 ( .A0(n1275), .A1(n607), .B0(n716), .B1(n624), .Y(n1246) );
  OAI22X1 U139 ( .A0(n1274), .A1(n610), .B0(n716), .B1(n623), .Y(n1247) );
  OAI22X1 U140 ( .A0(n1273), .A1(n611), .B0(n716), .B1(n622), .Y(n1248) );
  OAI22X1 U141 ( .A0(n1272), .A1(n607), .B0(n716), .B1(n621), .Y(n1249) );
  OAI22X1 U142 ( .A0(n1271), .A1(n604), .B0(n716), .B1(n620), .Y(n1250) );
  OAI22X1 U143 ( .A0(n1270), .A1(n610), .B0(n716), .B1(n619), .Y(n1251) );
  OAI22X1 U144 ( .A0(n1269), .A1(n607), .B0(n716), .B1(n618), .Y(n1252) );
  OAI22X1 U145 ( .A0(n1268), .A1(n604), .B0(n716), .B1(n617), .Y(n1253) );
  OAI22X1 U146 ( .A0(n1267), .A1(n611), .B0(n716), .B1(n616), .Y(n1254) );
  OAI22X1 U147 ( .A0(n1266), .A1(n611), .B0(n716), .B1(n615), .Y(n1255) );
  OAI22X1 U148 ( .A0(n1265), .A1(n611), .B0(n716), .B1(n614), .Y(n1256) );
  OAI22X1 U149 ( .A0(n1264), .A1(n611), .B0(n716), .B1(n613), .Y(n1257) );
  OAI22X1 U150 ( .A0(n1263), .A1(n603), .B0(n716), .B1(n612), .Y(n1258) );
  OAI211X1 U151 ( .A0(n1259), .A1(n713), .B0(n887), .C0(n888), .Y(n1122) );
  AOI22X1 U152 ( .A0(R8[0]), .A1(n1040), .B0(data_out_1[68]), .B1(n752), .Y(
        n888) );
  AOI22X1 U153 ( .A0(R10[0]), .A1(n736), .B0(R11[0]), .B1(n731), .Y(n887) );
  OAI211X1 U154 ( .A0(n1051), .A1(n712), .B0(n885), .C0(n886), .Y(n1121) );
  AOI22X1 U155 ( .A0(R8[1]), .A1(n1040), .B0(data_out_1[69]), .B1(n752), .Y(
        n886) );
  AOI22X1 U156 ( .A0(R10[1]), .A1(n737), .B0(R11[1]), .B1(n731), .Y(n885) );
  OAI211X1 U157 ( .A0(n1259), .A1(n711), .B0(n883), .C0(n884), .Y(n1120) );
  AOI22X1 U158 ( .A0(R8[2]), .A1(n1040), .B0(data_out_1[70]), .B1(n752), .Y(
        n884) );
  AOI22X1 U159 ( .A0(R10[2]), .A1(n738), .B0(R11[2]), .B1(n732), .Y(n883) );
  OAI211X1 U160 ( .A0(n1051), .A1(n710), .B0(n881), .C0(n882), .Y(n1119) );
  AOI22X1 U161 ( .A0(R8[3]), .A1(n1040), .B0(data_out_1[71]), .B1(n752), .Y(
        n882) );
  AOI22X1 U162 ( .A0(R10[3]), .A1(n733), .B0(R11[3]), .B1(n731), .Y(n881) );
  OAI211X1 U163 ( .A0(n1051), .A1(n709), .B0(n879), .C0(n880), .Y(n1118) );
  AOI22X1 U164 ( .A0(R8[4]), .A1(n1040), .B0(data_out_1[72]), .B1(n752), .Y(
        n880) );
  AOI22X1 U165 ( .A0(R10[4]), .A1(n753), .B0(R11[4]), .B1(n730), .Y(n879) );
  OAI211X1 U166 ( .A0(n1051), .A1(n708), .B0(n877), .C0(n878), .Y(n1117) );
  AOI22X1 U167 ( .A0(R8[5]), .A1(n1040), .B0(data_out_1[73]), .B1(n752), .Y(
        n878) );
  AOI22X1 U168 ( .A0(R10[5]), .A1(n753), .B0(R11[5]), .B1(n730), .Y(n877) );
  OAI211X1 U169 ( .A0(n1051), .A1(n707), .B0(n875), .C0(n876), .Y(n1116) );
  AOI22X1 U170 ( .A0(R8[6]), .A1(n1040), .B0(data_out_1[74]), .B1(n752), .Y(
        n876) );
  AOI22X1 U171 ( .A0(R10[6]), .A1(n753), .B0(R11[6]), .B1(n730), .Y(n875) );
  OAI211X1 U172 ( .A0(n1051), .A1(n706), .B0(n873), .C0(n874), .Y(n1115) );
  AOI22X1 U173 ( .A0(R8[7]), .A1(n1040), .B0(data_out_1[75]), .B1(n744), .Y(
        n874) );
  AOI22X1 U174 ( .A0(R10[7]), .A1(n753), .B0(R11[7]), .B1(n730), .Y(n873) );
  OAI211X1 U175 ( .A0(n1051), .A1(n705), .B0(n871), .C0(n872), .Y(n1114) );
  AOI22X1 U176 ( .A0(R8[8]), .A1(n1040), .B0(data_out_1[76]), .B1(n744), .Y(
        n872) );
  AOI22X1 U177 ( .A0(R10[8]), .A1(n753), .B0(R11[8]), .B1(n730), .Y(n871) );
  OAI211X1 U178 ( .A0(n1051), .A1(n704), .B0(n869), .C0(n870), .Y(n1113) );
  AOI22X1 U179 ( .A0(R8[9]), .A1(n1040), .B0(data_out_1[77]), .B1(n744), .Y(
        n870) );
  AOI22X1 U180 ( .A0(R10[9]), .A1(n753), .B0(R11[9]), .B1(n730), .Y(n869) );
  OAI211X1 U181 ( .A0(n1051), .A1(n703), .B0(n867), .C0(n868), .Y(n1112) );
  AOI22X1 U182 ( .A0(R8[10]), .A1(n1042), .B0(data_out_1[78]), .B1(n744), .Y(
        n868) );
  AOI22X1 U183 ( .A0(R10[10]), .A1(n736), .B0(R11[10]), .B1(n730), .Y(n867) );
  OAI211X1 U184 ( .A0(n1051), .A1(n702), .B0(n865), .C0(n866), .Y(n1111) );
  AOI22X1 U185 ( .A0(R8[11]), .A1(n1042), .B0(data_out_1[79]), .B1(n744), .Y(
        n866) );
  AOI22X1 U186 ( .A0(R10[11]), .A1(n736), .B0(R11[11]), .B1(n730), .Y(n865) );
  OAI211X1 U187 ( .A0(n1051), .A1(n701), .B0(n863), .C0(n864), .Y(n1110) );
  AOI22X1 U188 ( .A0(R8[12]), .A1(n1042), .B0(data_out_1[80]), .B1(n744), .Y(
        n864) );
  AOI22X1 U189 ( .A0(R10[12]), .A1(n736), .B0(R11[12]), .B1(n730), .Y(n863) );
  OAI211X1 U190 ( .A0(n1051), .A1(n700), .B0(n861), .C0(n862), .Y(n1109) );
  AOI22X1 U191 ( .A0(R8[13]), .A1(n1042), .B0(data_out_1[81]), .B1(n744), .Y(
        n862) );
  AOI22X1 U192 ( .A0(R10[13]), .A1(n736), .B0(R11[13]), .B1(n730), .Y(n861) );
  OAI211X1 U193 ( .A0(n1051), .A1(n699), .B0(n859), .C0(n860), .Y(n1108) );
  AOI22X1 U194 ( .A0(R8[14]), .A1(n1042), .B0(data_out_1[82]), .B1(n744), .Y(
        n860) );
  AOI22X1 U195 ( .A0(R10[14]), .A1(n736), .B0(R11[14]), .B1(n730), .Y(n859) );
  OAI211X1 U196 ( .A0(n1051), .A1(n698), .B0(n857), .C0(n858), .Y(n1107) );
  AOI22X1 U197 ( .A0(R8[15]), .A1(n1042), .B0(data_out_1[83]), .B1(n744), .Y(
        n858) );
  AOI22X1 U198 ( .A0(R10[15]), .A1(n736), .B0(R11[15]), .B1(n730), .Y(n857) );
  OAI211X1 U199 ( .A0(n1052), .A1(n697), .B0(n855), .C0(n856), .Y(n1106) );
  AOI22X1 U200 ( .A0(R8[16]), .A1(n1042), .B0(data_out_1[84]), .B1(n744), .Y(
        n856) );
  AOI22X1 U201 ( .A0(R10[16]), .A1(n736), .B0(R11[16]), .B1(n731), .Y(n855) );
  OAI211X1 U202 ( .A0(n1052), .A1(n696), .B0(n853), .C0(n854), .Y(n1105) );
  AOI22X1 U203 ( .A0(R8[17]), .A1(n1042), .B0(data_out_1[85]), .B1(n744), .Y(
        n854) );
  AOI22X1 U204 ( .A0(R10[17]), .A1(n736), .B0(R11[17]), .B1(n731), .Y(n853) );
  OAI211X1 U205 ( .A0(n1052), .A1(n695), .B0(n851), .C0(n852), .Y(n1104) );
  AOI22X1 U206 ( .A0(R8[18]), .A1(n1042), .B0(data_out_1[86]), .B1(n744), .Y(
        n852) );
  AOI22X1 U207 ( .A0(R10[18]), .A1(n736), .B0(R11[18]), .B1(n731), .Y(n851) );
  OAI211X1 U208 ( .A0(n1052), .A1(n694), .B0(n849), .C0(n850), .Y(n1103) );
  AOI22X1 U209 ( .A0(R8[19]), .A1(n1042), .B0(data_out_1[87]), .B1(n743), .Y(
        n850) );
  AOI22X1 U210 ( .A0(R10[19]), .A1(n736), .B0(R11[19]), .B1(n731), .Y(n849) );
  OAI211X1 U211 ( .A0(n1052), .A1(n693), .B0(n847), .C0(n848), .Y(n1102) );
  AOI22X1 U212 ( .A0(R8[20]), .A1(n1042), .B0(data_out_1[88]), .B1(n743), .Y(
        n848) );
  AOI22X1 U213 ( .A0(R10[20]), .A1(n736), .B0(R11[20]), .B1(n731), .Y(n847) );
  OAI211X1 U214 ( .A0(n1052), .A1(n692), .B0(n845), .C0(n846), .Y(n1101) );
  AOI22X1 U215 ( .A0(R8[21]), .A1(n1042), .B0(data_out_1[89]), .B1(n743), .Y(
        n846) );
  AOI22X1 U216 ( .A0(R10[21]), .A1(n736), .B0(R11[21]), .B1(n731), .Y(n845) );
  OAI211X1 U217 ( .A0(n1052), .A1(n691), .B0(n843), .C0(n844), .Y(n1100) );
  AOI22X1 U218 ( .A0(R8[22]), .A1(n1042), .B0(data_out_1[90]), .B1(n743), .Y(
        n844) );
  AOI22X1 U219 ( .A0(R10[22]), .A1(n736), .B0(R11[22]), .B1(n731), .Y(n843) );
  OAI211X1 U220 ( .A0(n1052), .A1(n690), .B0(n841), .C0(n842), .Y(n1099) );
  AOI22X1 U221 ( .A0(R8[23]), .A1(n1046), .B0(data_out_1[91]), .B1(n743), .Y(
        n842) );
  AOI22X1 U222 ( .A0(R10[23]), .A1(n737), .B0(R11[23]), .B1(n731), .Y(n841) );
  OAI211X1 U223 ( .A0(n1052), .A1(n689), .B0(n839), .C0(n840), .Y(n1098) );
  AOI22X1 U224 ( .A0(R8[24]), .A1(n1046), .B0(data_out_1[92]), .B1(n743), .Y(
        n840) );
  AOI22X1 U225 ( .A0(R10[24]), .A1(n737), .B0(R11[24]), .B1(n731), .Y(n839) );
  OAI211X1 U226 ( .A0(n1052), .A1(n688), .B0(n837), .C0(n838), .Y(n1097) );
  AOI22X1 U227 ( .A0(R8[25]), .A1(n1046), .B0(data_out_1[93]), .B1(n743), .Y(
        n838) );
  AOI22X1 U228 ( .A0(R10[25]), .A1(n737), .B0(R11[25]), .B1(n731), .Y(n837) );
  OAI211X1 U229 ( .A0(n1052), .A1(n687), .B0(n835), .C0(n836), .Y(n1096) );
  AOI22X1 U230 ( .A0(R8[26]), .A1(n1046), .B0(data_out_1[94]), .B1(n743), .Y(
        n836) );
  AOI22X1 U231 ( .A0(R10[26]), .A1(n737), .B0(R11[26]), .B1(n731), .Y(n835) );
  OAI211X1 U232 ( .A0(n1052), .A1(n686), .B0(n833), .C0(n834), .Y(n1095) );
  AOI22X1 U233 ( .A0(R8[27]), .A1(n1046), .B0(data_out_1[95]), .B1(n743), .Y(
        n834) );
  AOI22X1 U234 ( .A0(R10[27]), .A1(n737), .B0(R11[27]), .B1(n731), .Y(n833) );
  OAI211X1 U235 ( .A0(n1259), .A1(n685), .B0(n831), .C0(n832), .Y(n1094) );
  AOI22X1 U236 ( .A0(R8[28]), .A1(n1046), .B0(data_out_1[96]), .B1(n743), .Y(
        n832) );
  AOI22X1 U237 ( .A0(R10[28]), .A1(n737), .B0(R11[28]), .B1(n732), .Y(n831) );
  OAI211X1 U238 ( .A0(n1259), .A1(n684), .B0(n829), .C0(n830), .Y(n1093) );
  AOI22X1 U239 ( .A0(R8[29]), .A1(n1046), .B0(data_out_1[97]), .B1(n743), .Y(
        n830) );
  AOI22X1 U240 ( .A0(R10[29]), .A1(n737), .B0(R11[29]), .B1(n732), .Y(n829) );
  OAI211X1 U241 ( .A0(n1259), .A1(n683), .B0(n827), .C0(n828), .Y(n1092) );
  AOI22X1 U242 ( .A0(R8[30]), .A1(n1046), .B0(data_out_1[98]), .B1(n743), .Y(
        n828) );
  AOI22X1 U243 ( .A0(R10[30]), .A1(n737), .B0(R11[30]), .B1(n732), .Y(n827) );
  OAI211X1 U244 ( .A0(n1259), .A1(n682), .B0(n825), .C0(n826), .Y(n1091) );
  AOI22X1 U245 ( .A0(R8[31]), .A1(n1046), .B0(data_out_1[99]), .B1(n742), .Y(
        n826) );
  AOI22X1 U246 ( .A0(R10[31]), .A1(n737), .B0(R11[31]), .B1(n732), .Y(n825) );
  OAI211X1 U247 ( .A0(n1259), .A1(n681), .B0(n823), .C0(n824), .Y(n1090) );
  AOI22X1 U248 ( .A0(R8[32]), .A1(n1046), .B0(data_out_1[100]), .B1(n742), .Y(
        n824) );
  AOI22X1 U249 ( .A0(R10[32]), .A1(n737), .B0(R11[32]), .B1(n732), .Y(n823) );
  OAI211X1 U250 ( .A0(n1259), .A1(n680), .B0(n821), .C0(n822), .Y(n1089) );
  AOI22X1 U251 ( .A0(R8[33]), .A1(n1046), .B0(data_out_1[101]), .B1(n742), .Y(
        n822) );
  AOI22X1 U252 ( .A0(R10[33]), .A1(n737), .B0(R11[33]), .B1(n732), .Y(n821) );
  OAI211X1 U253 ( .A0(n1259), .A1(n598), .B0(n819), .C0(n820), .Y(n1088) );
  AOI22X1 U254 ( .A0(R12[0]), .A1(n1046), .B0(data_out_1[102]), .B1(n742), .Y(
        n820) );
  AOI22X1 U255 ( .A0(R14[0]), .A1(n737), .B0(R15[0]), .B1(n732), .Y(n819) );
  OAI211X1 U256 ( .A0(n1259), .A1(n597), .B0(n817), .C0(n818), .Y(n1087) );
  AOI22X1 U257 ( .A0(R12[1]), .A1(n1046), .B0(data_out_1[103]), .B1(n742), .Y(
        n818) );
  AOI22X1 U258 ( .A0(R14[1]), .A1(n737), .B0(R15[1]), .B1(n732), .Y(n817) );
  OAI211X1 U259 ( .A0(n1259), .A1(n596), .B0(n815), .C0(n816), .Y(n1086) );
  AOI22X1 U260 ( .A0(R12[2]), .A1(n1047), .B0(data_out_1[104]), .B1(n742), .Y(
        n816) );
  AOI22X1 U261 ( .A0(R14[2]), .A1(n738), .B0(R15[2]), .B1(n732), .Y(n815) );
  OAI211X1 U262 ( .A0(n1259), .A1(n595), .B0(n813), .C0(n814), .Y(n1085) );
  AOI22X1 U263 ( .A0(R12[3]), .A1(n1047), .B0(data_out_1[105]), .B1(n742), .Y(
        n814) );
  AOI22X1 U264 ( .A0(R14[3]), .A1(n738), .B0(R15[3]), .B1(n732), .Y(n813) );
  OAI211X1 U265 ( .A0(n1259), .A1(n594), .B0(n811), .C0(n812), .Y(n1084) );
  AOI22X1 U266 ( .A0(R12[4]), .A1(n1047), .B0(data_out_1[106]), .B1(n742), .Y(
        n812) );
  AOI22X1 U267 ( .A0(R14[4]), .A1(n738), .B0(R15[4]), .B1(n732), .Y(n811) );
  OAI211X1 U268 ( .A0(n1259), .A1(n593), .B0(n809), .C0(n810), .Y(n1083) );
  AOI22X1 U269 ( .A0(R12[5]), .A1(n1047), .B0(data_out_1[107]), .B1(n742), .Y(
        n810) );
  AOI22X1 U270 ( .A0(R14[5]), .A1(n738), .B0(R15[5]), .B1(n732), .Y(n809) );
  OAI211X1 U271 ( .A0(n1052), .A1(n592), .B0(n807), .C0(n808), .Y(n1082) );
  AOI22X1 U272 ( .A0(R12[6]), .A1(n1047), .B0(data_out_1[108]), .B1(n742), .Y(
        n808) );
  AOI22X1 U273 ( .A0(R14[6]), .A1(n738), .B0(R15[6]), .B1(n731), .Y(n807) );
  OAI211X1 U274 ( .A0(n1259), .A1(n591), .B0(n805), .C0(n806), .Y(n1081) );
  AOI22X1 U275 ( .A0(R12[7]), .A1(n1047), .B0(data_out_1[109]), .B1(n742), .Y(
        n806) );
  AOI22X1 U276 ( .A0(R14[7]), .A1(n738), .B0(R15[7]), .B1(n732), .Y(n805) );
  OAI211X1 U277 ( .A0(n1051), .A1(n590), .B0(n803), .C0(n804), .Y(n1080) );
  AOI22X1 U278 ( .A0(R12[8]), .A1(n1047), .B0(data_out_1[110]), .B1(n742), .Y(
        n804) );
  AOI22X1 U279 ( .A0(R14[8]), .A1(n738), .B0(R15[8]), .B1(n730), .Y(n803) );
  OAI211X1 U280 ( .A0(n1052), .A1(n589), .B0(n801), .C0(n802), .Y(n1079) );
  AOI22X1 U281 ( .A0(R12[9]), .A1(n1047), .B0(data_out_1[111]), .B1(n741), .Y(
        n802) );
  AOI22X1 U282 ( .A0(R14[9]), .A1(n738), .B0(R15[9]), .B1(n731), .Y(n801) );
  OAI211X1 U283 ( .A0(n1259), .A1(n588), .B0(n799), .C0(n800), .Y(n1078) );
  AOI22X1 U284 ( .A0(R12[10]), .A1(n1047), .B0(data_out_1[112]), .B1(n741), 
        .Y(n800) );
  AOI22X1 U285 ( .A0(R14[10]), .A1(n738), .B0(R15[10]), .B1(n732), .Y(n799) );
  OAI211X1 U286 ( .A0(n1051), .A1(n587), .B0(n797), .C0(n798), .Y(n1077) );
  AOI22X1 U287 ( .A0(R12[11]), .A1(n1047), .B0(data_out_1[113]), .B1(n741), 
        .Y(n798) );
  AOI22X1 U288 ( .A0(R14[11]), .A1(n738), .B0(R15[11]), .B1(n730), .Y(n797) );
  OAI211X1 U289 ( .A0(n1052), .A1(n586), .B0(n795), .C0(n796), .Y(n1076) );
  AOI22X1 U290 ( .A0(R12[12]), .A1(n1047), .B0(data_out_1[114]), .B1(n741), 
        .Y(n796) );
  AOI22X1 U291 ( .A0(R14[12]), .A1(n738), .B0(R15[12]), .B1(n731), .Y(n795) );
  OAI211X1 U292 ( .A0(n1259), .A1(n585), .B0(n793), .C0(n794), .Y(n1075) );
  AOI22X1 U293 ( .A0(R12[13]), .A1(n1047), .B0(data_out_1[115]), .B1(n741), 
        .Y(n794) );
  AOI22X1 U294 ( .A0(R14[13]), .A1(n738), .B0(R15[13]), .B1(n732), .Y(n793) );
  OAI211X1 U295 ( .A0(n1051), .A1(n584), .B0(n791), .C0(n792), .Y(n1074) );
  AOI22X1 U296 ( .A0(R12[14]), .A1(n1047), .B0(data_out_1[116]), .B1(n741), 
        .Y(n792) );
  AOI22X1 U297 ( .A0(R14[14]), .A1(n738), .B0(R15[14]), .B1(n730), .Y(n791) );
  OAI211X1 U298 ( .A0(n1052), .A1(n583), .B0(n789), .C0(n790), .Y(n1073) );
  AOI22X1 U299 ( .A0(R12[15]), .A1(n1048), .B0(data_out_1[117]), .B1(n741), 
        .Y(n790) );
  AOI22X1 U300 ( .A0(R14[15]), .A1(n739), .B0(R15[15]), .B1(n731), .Y(n789) );
  OAI211X1 U301 ( .A0(n1259), .A1(n582), .B0(n787), .C0(n788), .Y(n1072) );
  AOI22X1 U302 ( .A0(R12[16]), .A1(n1048), .B0(data_out_1[118]), .B1(n741), 
        .Y(n788) );
  AOI22X1 U303 ( .A0(R14[16]), .A1(n739), .B0(R15[16]), .B1(n732), .Y(n787) );
  OAI211X1 U304 ( .A0(n1051), .A1(n581), .B0(n785), .C0(n786), .Y(n1071) );
  AOI22X1 U305 ( .A0(R12[17]), .A1(n1048), .B0(data_out_1[119]), .B1(n741), 
        .Y(n786) );
  AOI22X1 U306 ( .A0(R14[17]), .A1(n739), .B0(R15[17]), .B1(n730), .Y(n785) );
  OAI211X1 U307 ( .A0(n1051), .A1(n580), .B0(n783), .C0(n784), .Y(n1070) );
  AOI22X1 U308 ( .A0(R12[18]), .A1(n1048), .B0(data_out_1[120]), .B1(n741), 
        .Y(n784) );
  AOI22X1 U309 ( .A0(R14[18]), .A1(n739), .B0(R15[18]), .B1(n732), .Y(n783) );
  OAI211X1 U310 ( .A0(n1051), .A1(n579), .B0(n781), .C0(n782), .Y(n1069) );
  AOI22X1 U311 ( .A0(R12[19]), .A1(n1048), .B0(data_out_1[121]), .B1(n741), 
        .Y(n782) );
  AOI22X1 U312 ( .A0(R14[19]), .A1(n739), .B0(R15[19]), .B1(n730), .Y(n781) );
  OAI211X1 U313 ( .A0(n1051), .A1(n578), .B0(n779), .C0(n780), .Y(n1068) );
  AOI22X1 U314 ( .A0(R12[20]), .A1(n1048), .B0(data_out_1[122]), .B1(n741), 
        .Y(n780) );
  AOI22X1 U315 ( .A0(R14[20]), .A1(n739), .B0(R15[20]), .B1(n731), .Y(n779) );
  OAI211X1 U316 ( .A0(n1052), .A1(n577), .B0(n777), .C0(n778), .Y(n1067) );
  AOI22X1 U317 ( .A0(R12[21]), .A1(n1048), .B0(data_out_1[123]), .B1(n752), 
        .Y(n778) );
  AOI22X1 U318 ( .A0(R14[21]), .A1(n739), .B0(R15[21]), .B1(n731), .Y(n777) );
  OAI211X1 U319 ( .A0(n1259), .A1(n576), .B0(n775), .C0(n776), .Y(n1066) );
  AOI22X1 U320 ( .A0(R12[22]), .A1(n1048), .B0(data_out_1[124]), .B1(n752), 
        .Y(n776) );
  AOI22X1 U321 ( .A0(R14[22]), .A1(n739), .B0(R15[22]), .B1(n732), .Y(n775) );
  OAI211X1 U322 ( .A0(n1259), .A1(n575), .B0(n773), .C0(n774), .Y(n1065) );
  AOI22X1 U323 ( .A0(R12[23]), .A1(n1048), .B0(data_out_1[125]), .B1(n752), 
        .Y(n774) );
  AOI22X1 U324 ( .A0(R14[23]), .A1(n739), .B0(R15[23]), .B1(n732), .Y(n773) );
  OAI211X1 U325 ( .A0(n1052), .A1(n574), .B0(n771), .C0(n772), .Y(n1064) );
  AOI22X1 U326 ( .A0(R12[24]), .A1(n1048), .B0(data_out_1[126]), .B1(n752), 
        .Y(n772) );
  AOI22X1 U327 ( .A0(R14[24]), .A1(n739), .B0(R15[24]), .B1(n730), .Y(n771) );
  OAI211X1 U328 ( .A0(n1052), .A1(n573), .B0(n769), .C0(n770), .Y(n1063) );
  AOI22X1 U329 ( .A0(R12[25]), .A1(n1048), .B0(data_out_1[127]), .B1(n752), 
        .Y(n770) );
  AOI22X1 U330 ( .A0(R14[25]), .A1(n739), .B0(R15[25]), .B1(n730), .Y(n769) );
  OAI211X1 U331 ( .A0(n1051), .A1(n572), .B0(n767), .C0(n768), .Y(n1062) );
  AOI22X1 U332 ( .A0(R12[26]), .A1(n1048), .B0(data_out_1[128]), .B1(n752), 
        .Y(n768) );
  AOI22X1 U333 ( .A0(R14[26]), .A1(n739), .B0(R15[26]), .B1(n732), .Y(n767) );
  OAI211X1 U334 ( .A0(n1052), .A1(n571), .B0(n765), .C0(n766), .Y(n1061) );
  AOI22X1 U335 ( .A0(R12[27]), .A1(n1048), .B0(data_out_1[129]), .B1(n752), 
        .Y(n766) );
  AOI22X1 U336 ( .A0(R14[27]), .A1(n739), .B0(R15[27]), .B1(n731), .Y(n765) );
  OAI211X1 U337 ( .A0(n1259), .A1(n570), .B0(n763), .C0(n764), .Y(n1060) );
  AOI22X1 U338 ( .A0(R12[28]), .A1(n1048), .B0(data_out_1[130]), .B1(n752), 
        .Y(n764) );
  AOI22X1 U339 ( .A0(R14[28]), .A1(n734), .B0(R15[28]), .B1(n732), .Y(n763) );
  OAI211X1 U340 ( .A0(n1051), .A1(n569), .B0(n761), .C0(n762), .Y(n1059) );
  AOI22X1 U341 ( .A0(R12[29]), .A1(n1042), .B0(data_out_1[131]), .B1(n752), 
        .Y(n762) );
  AOI22X1 U342 ( .A0(R14[29]), .A1(n738), .B0(R15[29]), .B1(n731), .Y(n761) );
  OAI211X1 U343 ( .A0(n1259), .A1(n568), .B0(n759), .C0(n760), .Y(n1058) );
  AOI22X1 U344 ( .A0(R12[30]), .A1(n1042), .B0(data_out_1[132]), .B1(n752), 
        .Y(n760) );
  AOI22X1 U345 ( .A0(R14[30]), .A1(n733), .B0(R15[30]), .B1(n730), .Y(n759) );
  OAI211X1 U346 ( .A0(n1052), .A1(n567), .B0(n757), .C0(n758), .Y(n1057) );
  AOI22X1 U347 ( .A0(R12[31]), .A1(n1046), .B0(data_out_1[133]), .B1(n752), 
        .Y(n758) );
  AOI22X1 U348 ( .A0(R14[31]), .A1(n736), .B0(R15[31]), .B1(n730), .Y(n757) );
  OAI211X1 U349 ( .A0(n1259), .A1(n566), .B0(n755), .C0(n756), .Y(n1056) );
  AOI22X1 U350 ( .A0(R12[32]), .A1(n1047), .B0(data_out_1[134]), .B1(n752), 
        .Y(n756) );
  AOI22X1 U351 ( .A0(R14[32]), .A1(n737), .B0(R15[32]), .B1(n732), .Y(n755) );
  OAI211X1 U352 ( .A0(n1051), .A1(n565), .B0(n749), .C0(n750), .Y(n1055) );
  AOI22X1 U353 ( .A0(R12[33]), .A1(n1042), .B0(data_out_1[135]), .B1(n752), 
        .Y(n750) );
  AOI22X1 U354 ( .A0(R14[33]), .A1(n739), .B0(R15[33]), .B1(n730), .Y(n749) );
  OAI211X1 U355 ( .A0(n1051), .A1(n679), .B0(n955), .C0(n956), .Y(n1156) );
  AOI22X1 U356 ( .A0(R4[0]), .A1(n1040), .B0(data_out_1[34]), .B1(n752), .Y(
        n956) );
  AOI22X1 U357 ( .A0(R6[0]), .A1(n735), .B0(R7[0]), .B1(n731), .Y(n955) );
  OAI211X1 U358 ( .A0(n1051), .A1(n678), .B0(n953), .C0(n954), .Y(n1155) );
  AOI22X1 U359 ( .A0(R4[1]), .A1(n1036), .B0(data_out_1[35]), .B1(n752), .Y(
        n954) );
  AOI22X1 U360 ( .A0(R6[1]), .A1(n753), .B0(R7[1]), .B1(n730), .Y(n953) );
  OAI211X1 U361 ( .A0(n1051), .A1(n677), .B0(n951), .C0(n952), .Y(n1154) );
  AOI22X1 U362 ( .A0(R4[2]), .A1(n1038), .B0(data_out_1[36]), .B1(n752), .Y(
        n952) );
  AOI22X1 U363 ( .A0(R6[2]), .A1(n734), .B0(R7[2]), .B1(n732), .Y(n951) );
  OAI211X1 U364 ( .A0(n1052), .A1(n676), .B0(n949), .C0(n950), .Y(n1153) );
  AOI22X1 U365 ( .A0(R4[3]), .A1(n1040), .B0(data_out_1[37]), .B1(n752), .Y(
        n950) );
  AOI22X1 U366 ( .A0(R6[3]), .A1(n735), .B0(R7[3]), .B1(n731), .Y(n949) );
  OAI211X1 U367 ( .A0(n1259), .A1(n675), .B0(n947), .C0(n948), .Y(n1152) );
  AOI22X1 U368 ( .A0(R4[4]), .A1(n1036), .B0(data_out_1[38]), .B1(n752), .Y(
        n948) );
  AOI22X1 U369 ( .A0(R6[4]), .A1(n753), .B0(R7[4]), .B1(n731), .Y(n947) );
  OAI211X1 U370 ( .A0(n1051), .A1(n674), .B0(n945), .C0(n946), .Y(n1151) );
  AOI22X1 U371 ( .A0(R4[5]), .A1(n1036), .B0(data_out_1[39]), .B1(n752), .Y(
        n946) );
  AOI22X1 U372 ( .A0(R6[5]), .A1(n735), .B0(R7[5]), .B1(n730), .Y(n945) );
  OAI211X1 U373 ( .A0(n1051), .A1(n673), .B0(n943), .C0(n944), .Y(n1150) );
  AOI22X1 U374 ( .A0(R4[6]), .A1(n1036), .B0(data_out_1[40]), .B1(n746), .Y(
        n944) );
  AOI22X1 U375 ( .A0(R6[6]), .A1(n735), .B0(R7[6]), .B1(n732), .Y(n943) );
  OAI211X1 U376 ( .A0(n1052), .A1(n672), .B0(n941), .C0(n942), .Y(n1149) );
  AOI22X1 U377 ( .A0(R4[7]), .A1(n1036), .B0(data_out_1[41]), .B1(n746), .Y(
        n942) );
  AOI22X1 U378 ( .A0(R6[7]), .A1(n735), .B0(R7[7]), .B1(n732), .Y(n941) );
  OAI211X1 U379 ( .A0(n1259), .A1(n671), .B0(n939), .C0(n940), .Y(n1148) );
  AOI22X1 U380 ( .A0(R4[8]), .A1(n1036), .B0(data_out_1[42]), .B1(n746), .Y(
        n940) );
  AOI22X1 U381 ( .A0(R6[8]), .A1(n735), .B0(R7[8]), .B1(n731), .Y(n939) );
  OAI211X1 U382 ( .A0(n1052), .A1(n670), .B0(n937), .C0(n938), .Y(n1147) );
  AOI22X1 U383 ( .A0(R4[9]), .A1(n1036), .B0(data_out_1[43]), .B1(n746), .Y(
        n938) );
  AOI22X1 U384 ( .A0(R6[9]), .A1(n735), .B0(R7[9]), .B1(n730), .Y(n937) );
  OAI211X1 U385 ( .A0(n1051), .A1(n669), .B0(n935), .C0(n936), .Y(n1146) );
  AOI22X1 U386 ( .A0(R4[10]), .A1(n1036), .B0(data_out_1[44]), .B1(n746), .Y(
        n936) );
  AOI22X1 U387 ( .A0(R6[10]), .A1(n735), .B0(R7[10]), .B1(n730), .Y(n935) );
  OAI211X1 U388 ( .A0(n1052), .A1(n668), .B0(n933), .C0(n934), .Y(n1145) );
  AOI22X1 U389 ( .A0(R4[11]), .A1(n1036), .B0(data_out_1[45]), .B1(n746), .Y(
        n934) );
  AOI22X1 U390 ( .A0(R6[11]), .A1(n735), .B0(R7[11]), .B1(n732), .Y(n933) );
  OAI211X1 U391 ( .A0(n1259), .A1(n667), .B0(n931), .C0(n932), .Y(n1144) );
  AOI22X1 U392 ( .A0(R4[12]), .A1(n1036), .B0(data_out_1[46]), .B1(n746), .Y(
        n932) );
  AOI22X1 U393 ( .A0(R6[12]), .A1(n735), .B0(R7[12]), .B1(n731), .Y(n931) );
  OAI211X1 U394 ( .A0(n1259), .A1(n666), .B0(n929), .C0(n930), .Y(n1143) );
  AOI22X1 U395 ( .A0(R4[13]), .A1(n1036), .B0(data_out_1[47]), .B1(n746), .Y(
        n930) );
  AOI22X1 U396 ( .A0(R6[13]), .A1(n735), .B0(R7[13]), .B1(n730), .Y(n929) );
  OAI211X1 U397 ( .A0(n1052), .A1(n665), .B0(n927), .C0(n928), .Y(n1142) );
  AOI22X1 U398 ( .A0(R4[14]), .A1(n1036), .B0(data_out_1[48]), .B1(n746), .Y(
        n928) );
  AOI22X1 U399 ( .A0(R6[14]), .A1(n735), .B0(R7[14]), .B1(n732), .Y(n927) );
  OAI211X1 U400 ( .A0(n1259), .A1(n664), .B0(n925), .C0(n926), .Y(n1141) );
  AOI22X1 U401 ( .A0(R4[15]), .A1(n1036), .B0(data_out_1[49]), .B1(n746), .Y(
        n926) );
  AOI22X1 U402 ( .A0(R6[15]), .A1(n735), .B0(R7[15]), .B1(n731), .Y(n925) );
  OAI211X1 U403 ( .A0(n1051), .A1(n663), .B0(n923), .C0(n924), .Y(n1140) );
  AOI22X1 U404 ( .A0(R4[16]), .A1(n1036), .B0(data_out_1[50]), .B1(n746), .Y(
        n924) );
  AOI22X1 U405 ( .A0(R6[16]), .A1(n735), .B0(R7[16]), .B1(n730), .Y(n923) );
  OAI211X1 U406 ( .A0(n1052), .A1(n662), .B0(n921), .C0(n922), .Y(n1139) );
  AOI22X1 U407 ( .A0(R4[17]), .A1(n1036), .B0(data_out_1[51]), .B1(n746), .Y(
        n922) );
  AOI22X1 U408 ( .A0(R6[17]), .A1(n735), .B0(R7[17]), .B1(n730), .Y(n921) );
  OAI211X1 U409 ( .A0(n1259), .A1(n661), .B0(n919), .C0(n920), .Y(n1138) );
  AOI22X1 U410 ( .A0(R4[18]), .A1(n1038), .B0(data_out_1[52]), .B1(n745), .Y(
        n920) );
  AOI22X1 U411 ( .A0(R6[18]), .A1(n753), .B0(R7[18]), .B1(n730), .Y(n919) );
  OAI211X1 U412 ( .A0(n1052), .A1(n660), .B0(n917), .C0(n918), .Y(n1137) );
  AOI22X1 U413 ( .A0(R4[19]), .A1(n1038), .B0(data_out_1[53]), .B1(n745), .Y(
        n918) );
  AOI22X1 U414 ( .A0(R6[19]), .A1(n753), .B0(R7[19]), .B1(n731), .Y(n917) );
  OAI211X1 U415 ( .A0(n1052), .A1(n659), .B0(n915), .C0(n916), .Y(n1136) );
  AOI22X1 U416 ( .A0(R4[20]), .A1(n1038), .B0(data_out_1[54]), .B1(n745), .Y(
        n916) );
  AOI22X1 U417 ( .A0(R6[20]), .A1(n753), .B0(R7[20]), .B1(n730), .Y(n915) );
  OAI211X1 U418 ( .A0(n1259), .A1(n658), .B0(n913), .C0(n914), .Y(n1135) );
  AOI22X1 U419 ( .A0(R4[21]), .A1(n1038), .B0(data_out_1[55]), .B1(n745), .Y(
        n914) );
  AOI22X1 U420 ( .A0(R6[21]), .A1(n753), .B0(R7[21]), .B1(n731), .Y(n913) );
  OAI211X1 U421 ( .A0(n1051), .A1(n657), .B0(n911), .C0(n912), .Y(n1134) );
  AOI22X1 U422 ( .A0(R4[22]), .A1(n1038), .B0(data_out_1[56]), .B1(n745), .Y(
        n912) );
  AOI22X1 U423 ( .A0(R6[22]), .A1(n753), .B0(R7[22]), .B1(n731), .Y(n911) );
  OAI211X1 U424 ( .A0(n1052), .A1(n656), .B0(n909), .C0(n910), .Y(n1133) );
  AOI22X1 U425 ( .A0(R4[23]), .A1(n1038), .B0(data_out_1[57]), .B1(n745), .Y(
        n910) );
  AOI22X1 U426 ( .A0(R6[23]), .A1(n753), .B0(R7[23]), .B1(n731), .Y(n909) );
  OAI211X1 U427 ( .A0(n1259), .A1(n655), .B0(n907), .C0(n908), .Y(n1132) );
  AOI22X1 U428 ( .A0(R4[24]), .A1(n1038), .B0(data_out_1[58]), .B1(n745), .Y(
        n908) );
  AOI22X1 U429 ( .A0(R6[24]), .A1(n753), .B0(R7[24]), .B1(n730), .Y(n907) );
  OAI211X1 U430 ( .A0(n1052), .A1(n654), .B0(n905), .C0(n906), .Y(n1131) );
  AOI22X1 U431 ( .A0(R4[25]), .A1(n1038), .B0(data_out_1[59]), .B1(n745), .Y(
        n906) );
  AOI22X1 U432 ( .A0(R6[25]), .A1(n753), .B0(R7[25]), .B1(n732), .Y(n905) );
  OAI211X1 U433 ( .A0(n1052), .A1(n653), .B0(n903), .C0(n904), .Y(n1130) );
  AOI22X1 U434 ( .A0(R4[26]), .A1(n1038), .B0(data_out_1[60]), .B1(n745), .Y(
        n904) );
  AOI22X1 U435 ( .A0(R6[26]), .A1(n753), .B0(R7[26]), .B1(n732), .Y(n903) );
  OAI211X1 U436 ( .A0(n1259), .A1(n652), .B0(n901), .C0(n902), .Y(n1129) );
  AOI22X1 U437 ( .A0(R4[27]), .A1(n1038), .B0(data_out_1[61]), .B1(n745), .Y(
        n902) );
  AOI22X1 U438 ( .A0(R6[27]), .A1(n753), .B0(R7[27]), .B1(n730), .Y(n901) );
  OAI211X1 U439 ( .A0(n1052), .A1(n651), .B0(n899), .C0(n900), .Y(n1128) );
  AOI22X1 U440 ( .A0(R4[28]), .A1(n1038), .B0(data_out_1[62]), .B1(n745), .Y(
        n900) );
  AOI22X1 U441 ( .A0(R6[28]), .A1(n753), .B0(R7[28]), .B1(n730), .Y(n899) );
  OAI211X1 U442 ( .A0(n1051), .A1(n650), .B0(n897), .C0(n898), .Y(n1127) );
  AOI22X1 U443 ( .A0(R4[29]), .A1(n1038), .B0(data_out_1[63]), .B1(n745), .Y(
        n898) );
  AOI22X1 U444 ( .A0(R6[29]), .A1(n753), .B0(R7[29]), .B1(n732), .Y(n897) );
  OAI211X1 U445 ( .A0(n1051), .A1(n649), .B0(n895), .C0(n896), .Y(n1126) );
  AOI22X1 U446 ( .A0(R4[30]), .A1(n1038), .B0(data_out_1[64]), .B1(n752), .Y(
        n896) );
  AOI22X1 U447 ( .A0(R6[30]), .A1(n753), .B0(R7[30]), .B1(n731), .Y(n895) );
  OAI211X1 U448 ( .A0(n1052), .A1(n648), .B0(n893), .C0(n894), .Y(n1125) );
  AOI22X1 U449 ( .A0(R4[31]), .A1(n1040), .B0(data_out_1[65]), .B1(n752), .Y(
        n894) );
  AOI22X1 U450 ( .A0(R6[31]), .A1(n735), .B0(R7[31]), .B1(n730), .Y(n893) );
  OAI211X1 U451 ( .A0(n1259), .A1(n647), .B0(n891), .C0(n892), .Y(n1124) );
  AOI22X1 U452 ( .A0(R4[32]), .A1(n1040), .B0(data_out_1[66]), .B1(n752), .Y(
        n892) );
  AOI22X1 U453 ( .A0(R6[32]), .A1(n753), .B0(R7[32]), .B1(n732), .Y(n891) );
  OAI211X1 U454 ( .A0(n1259), .A1(n646), .B0(n889), .C0(n890), .Y(n1123) );
  AOI22X1 U455 ( .A0(R4[33]), .A1(n1040), .B0(data_out_1[67]), .B1(n752), .Y(
        n890) );
  AOI22X1 U456 ( .A0(R6[33]), .A1(n753), .B0(R7[33]), .B1(n731), .Y(n889) );
  OAI211X1 U457 ( .A0(n1052), .A1(n645), .B0(n1023), .C0(n1024), .Y(n1190) );
  AOI22X1 U458 ( .A0(R0[0]), .A1(n751), .B0(data_out_1[0]), .B1(n748), .Y(
        n1024) );
  AOI22X1 U459 ( .A0(R2[0]), .A1(n733), .B0(R3[0]), .B1(n730), .Y(n1023) );
  OAI211X1 U460 ( .A0(n1259), .A1(n644), .B0(n1021), .C0(n1022), .Y(n1189) );
  AOI22X1 U461 ( .A0(R0[1]), .A1(n751), .B0(data_out_1[1]), .B1(n748), .Y(
        n1022) );
  AOI22X1 U462 ( .A0(R2[1]), .A1(n733), .B0(R3[1]), .B1(n731), .Y(n1021) );
  OAI211X1 U463 ( .A0(n1052), .A1(n643), .B0(n1019), .C0(n1020), .Y(n1188) );
  AOI22X1 U464 ( .A0(R0[2]), .A1(n751), .B0(data_out_1[2]), .B1(n748), .Y(
        n1020) );
  AOI22X1 U465 ( .A0(R2[2]), .A1(n733), .B0(R3[2]), .B1(n732), .Y(n1019) );
  OAI211X1 U466 ( .A0(n1051), .A1(n642), .B0(n1017), .C0(n1018), .Y(n1187) );
  AOI22X1 U467 ( .A0(R0[3]), .A1(n751), .B0(data_out_1[3]), .B1(n748), .Y(
        n1018) );
  AOI22X1 U468 ( .A0(R2[3]), .A1(n733), .B0(R3[3]), .B1(n731), .Y(n1017) );
  OAI211X1 U469 ( .A0(n1051), .A1(n641), .B0(n1015), .C0(n1016), .Y(n1186) );
  AOI22X1 U470 ( .A0(R0[4]), .A1(n1040), .B0(data_out_1[4]), .B1(n752), .Y(
        n1016) );
  AOI22X1 U471 ( .A0(R2[4]), .A1(n733), .B0(R3[4]), .B1(n731), .Y(n1015) );
  OAI211X1 U472 ( .A0(n1052), .A1(n640), .B0(n1013), .C0(n1014), .Y(n1185) );
  AOI22X1 U473 ( .A0(R0[5]), .A1(n1046), .B0(data_out_1[5]), .B1(n752), .Y(
        n1014) );
  AOI22X1 U474 ( .A0(R2[5]), .A1(n733), .B0(R3[5]), .B1(n730), .Y(n1013) );
  OAI211X1 U475 ( .A0(n1051), .A1(n639), .B0(n1011), .C0(n1012), .Y(n1184) );
  AOI22X1 U476 ( .A0(R0[6]), .A1(n1048), .B0(data_out_1[6]), .B1(n752), .Y(
        n1012) );
  AOI22X1 U477 ( .A0(R2[6]), .A1(n733), .B0(R3[6]), .B1(n731), .Y(n1011) );
  OAI211X1 U478 ( .A0(n1052), .A1(n638), .B0(n1009), .C0(n1010), .Y(n1183) );
  AOI22X1 U479 ( .A0(R0[7]), .A1(n1036), .B0(data_out_1[7]), .B1(n752), .Y(
        n1010) );
  AOI22X1 U480 ( .A0(R2[7]), .A1(n733), .B0(R3[7]), .B1(n730), .Y(n1009) );
  OAI211X1 U481 ( .A0(n1259), .A1(n637), .B0(n1007), .C0(n1008), .Y(n1182) );
  AOI22X1 U482 ( .A0(R0[8]), .A1(n1038), .B0(data_out_1[8]), .B1(n752), .Y(
        n1008) );
  AOI22X1 U483 ( .A0(R2[8]), .A1(n733), .B0(R3[8]), .B1(n731), .Y(n1007) );
  OAI211X1 U484 ( .A0(n1259), .A1(n636), .B0(n1005), .C0(n1006), .Y(n1181) );
  AOI22X1 U485 ( .A0(R0[9]), .A1(n751), .B0(data_out_1[9]), .B1(n752), .Y(
        n1006) );
  AOI22X1 U486 ( .A0(R2[9]), .A1(n733), .B0(R3[9]), .B1(n732), .Y(n1005) );
  OAI211X1 U487 ( .A0(n1052), .A1(n635), .B0(n1003), .C0(n1004), .Y(n1180) );
  AOI22X1 U488 ( .A0(R0[10]), .A1(n751), .B0(data_out_1[10]), .B1(n752), .Y(
        n1004) );
  AOI22X1 U489 ( .A0(R2[10]), .A1(n733), .B0(R3[10]), .B1(n732), .Y(n1003) );
  OAI211X1 U490 ( .A0(n1052), .A1(n634), .B0(n1001), .C0(n1002), .Y(n1179) );
  AOI22X1 U491 ( .A0(R0[11]), .A1(n751), .B0(data_out_1[11]), .B1(n752), .Y(
        n1002) );
  AOI22X1 U492 ( .A0(R2[11]), .A1(n733), .B0(R3[11]), .B1(n732), .Y(n1001) );
  OAI211X1 U493 ( .A0(n1259), .A1(n633), .B0(n999), .C0(n1000), .Y(n1178) );
  AOI22X1 U494 ( .A0(R0[12]), .A1(n751), .B0(data_out_1[12]), .B1(n752), .Y(
        n1000) );
  AOI22X1 U495 ( .A0(R2[12]), .A1(n733), .B0(R3[12]), .B1(n730), .Y(n999) );
  OAI211X1 U496 ( .A0(n1051), .A1(n632), .B0(n997), .C0(n998), .Y(n1177) );
  AOI22X1 U497 ( .A0(R0[13]), .A1(n1040), .B0(data_out_1[13]), .B1(n752), .Y(
        n998) );
  AOI22X1 U498 ( .A0(R2[13]), .A1(n734), .B0(R3[13]), .B1(n731), .Y(n997) );
  OAI211X1 U499 ( .A0(n1051), .A1(n631), .B0(n995), .C0(n996), .Y(n1176) );
  AOI22X1 U500 ( .A0(R0[14]), .A1(n1046), .B0(data_out_1[14]), .B1(n752), .Y(
        n996) );
  AOI22X1 U501 ( .A0(R2[14]), .A1(n734), .B0(R3[14]), .B1(n730), .Y(n995) );
  OAI211X1 U502 ( .A0(n1051), .A1(n630), .B0(n993), .C0(n994), .Y(n1175) );
  AOI22X1 U503 ( .A0(R0[15]), .A1(n1048), .B0(data_out_1[15]), .B1(n752), .Y(
        n994) );
  AOI22X1 U504 ( .A0(R2[15]), .A1(n734), .B0(R3[15]), .B1(n731), .Y(n993) );
  OAI211X1 U505 ( .A0(n1052), .A1(n629), .B0(n991), .C0(n992), .Y(n1174) );
  AOI22X1 U506 ( .A0(R0[16]), .A1(n1038), .B0(data_out_1[16]), .B1(n747), .Y(
        n992) );
  AOI22X1 U507 ( .A0(R2[16]), .A1(n734), .B0(R3[16]), .B1(n732), .Y(n991) );
  OAI211X1 U508 ( .A0(n1259), .A1(n628), .B0(n989), .C0(n990), .Y(n1173) );
  AOI22X1 U509 ( .A0(R0[17]), .A1(n751), .B0(data_out_1[17]), .B1(n747), .Y(
        n990) );
  AOI22X1 U510 ( .A0(R2[17]), .A1(n734), .B0(R3[17]), .B1(n731), .Y(n989) );
  OAI211X1 U511 ( .A0(n1259), .A1(n627), .B0(n987), .C0(n988), .Y(n1172) );
  AOI22X1 U512 ( .A0(R0[18]), .A1(n751), .B0(data_out_1[18]), .B1(n747), .Y(
        n988) );
  AOI22X1 U513 ( .A0(R2[18]), .A1(n734), .B0(R3[18]), .B1(n730), .Y(n987) );
  OAI211X1 U514 ( .A0(n1051), .A1(n626), .B0(n985), .C0(n986), .Y(n1171) );
  AOI22X1 U515 ( .A0(R0[19]), .A1(n751), .B0(data_out_1[19]), .B1(n747), .Y(
        n986) );
  AOI22X1 U516 ( .A0(R2[19]), .A1(n734), .B0(R3[19]), .B1(n732), .Y(n985) );
  OAI211X1 U517 ( .A0(n1259), .A1(n625), .B0(n983), .C0(n984), .Y(n1170) );
  AOI22X1 U518 ( .A0(R0[20]), .A1(n751), .B0(data_out_1[20]), .B1(n747), .Y(
        n984) );
  AOI22X1 U519 ( .A0(R2[20]), .A1(n734), .B0(R3[20]), .B1(n732), .Y(n983) );
  OAI211X1 U520 ( .A0(n1259), .A1(n624), .B0(n981), .C0(n982), .Y(n1169) );
  AOI22X1 U521 ( .A0(R0[21]), .A1(n751), .B0(data_out_1[21]), .B1(n747), .Y(
        n982) );
  AOI22X1 U522 ( .A0(R2[21]), .A1(n734), .B0(R3[21]), .B1(n730), .Y(n981) );
  OAI211X1 U523 ( .A0(n1052), .A1(n623), .B0(n979), .C0(n980), .Y(n1168) );
  AOI22X1 U524 ( .A0(R0[22]), .A1(n751), .B0(data_out_1[22]), .B1(n747), .Y(
        n980) );
  AOI22X1 U525 ( .A0(R2[22]), .A1(n734), .B0(R3[22]), .B1(n732), .Y(n979) );
  OAI211X1 U526 ( .A0(n1051), .A1(n622), .B0(n977), .C0(n978), .Y(n1167) );
  AOI22X1 U527 ( .A0(R0[23]), .A1(n751), .B0(data_out_1[23]), .B1(n747), .Y(
        n978) );
  AOI22X1 U528 ( .A0(R2[23]), .A1(n734), .B0(R3[23]), .B1(n730), .Y(n977) );
  OAI211X1 U529 ( .A0(n1052), .A1(n621), .B0(n975), .C0(n976), .Y(n1166) );
  AOI22X1 U530 ( .A0(R0[24]), .A1(n751), .B0(data_out_1[24]), .B1(n747), .Y(
        n976) );
  AOI22X1 U531 ( .A0(R2[24]), .A1(n734), .B0(R3[24]), .B1(n732), .Y(n975) );
  OAI211X1 U532 ( .A0(n1259), .A1(n620), .B0(n973), .C0(n974), .Y(n1165) );
  AOI22X1 U533 ( .A0(R0[25]), .A1(n1036), .B0(data_out_1[25]), .B1(n747), .Y(
        n974) );
  AOI22X1 U534 ( .A0(R2[25]), .A1(n734), .B0(R3[25]), .B1(n730), .Y(n973) );
  OAI211X1 U535 ( .A0(n1052), .A1(n619), .B0(n971), .C0(n972), .Y(n1164) );
  AOI22X1 U536 ( .A0(R0[26]), .A1(n1046), .B0(data_out_1[26]), .B1(n747), .Y(
        n972) );
  AOI22X1 U537 ( .A0(R2[26]), .A1(n734), .B0(R3[26]), .B1(n731), .Y(n971) );
  OAI211X1 U538 ( .A0(n1259), .A1(n618), .B0(n969), .C0(n970), .Y(n1163) );
  AOI22X1 U539 ( .A0(R0[27]), .A1(n751), .B0(data_out_1[27]), .B1(n747), .Y(
        n970) );
  AOI22X1 U540 ( .A0(R2[27]), .A1(n739), .B0(R3[27]), .B1(n732), .Y(n969) );
  OAI211X1 U541 ( .A0(n1051), .A1(n617), .B0(n967), .C0(n968), .Y(n1162) );
  AOI22X1 U542 ( .A0(R0[28]), .A1(n1038), .B0(data_out_1[28]), .B1(n752), .Y(
        n968) );
  AOI22X1 U543 ( .A0(R2[28]), .A1(n736), .B0(R3[28]), .B1(n732), .Y(n967) );
  OAI211X1 U544 ( .A0(n1051), .A1(n616), .B0(n965), .C0(n966), .Y(n1161) );
  AOI22X1 U545 ( .A0(R0[29]), .A1(n1048), .B0(data_out_1[29]), .B1(n752), .Y(
        n966) );
  AOI22X1 U546 ( .A0(R2[29]), .A1(n739), .B0(R3[29]), .B1(n730), .Y(n965) );
  OAI211X1 U547 ( .A0(n1051), .A1(n615), .B0(n963), .C0(n964), .Y(n1160) );
  AOI22X1 U548 ( .A0(R0[30]), .A1(n1047), .B0(data_out_1[30]), .B1(n752), .Y(
        n964) );
  AOI22X1 U549 ( .A0(R2[30]), .A1(n737), .B0(R3[30]), .B1(n732), .Y(n963) );
  OAI211X1 U550 ( .A0(n1051), .A1(n614), .B0(n961), .C0(n962), .Y(n1159) );
  AOI22X1 U551 ( .A0(R0[31]), .A1(n1047), .B0(data_out_1[31]), .B1(n752), .Y(
        n962) );
  AOI22X1 U552 ( .A0(R2[31]), .A1(n738), .B0(R3[31]), .B1(n730), .Y(n961) );
  OAI211X1 U553 ( .A0(n1052), .A1(n613), .B0(n959), .C0(n960), .Y(n1158) );
  AOI22X1 U554 ( .A0(R0[32]), .A1(n1047), .B0(data_out_1[32]), .B1(n752), .Y(
        n960) );
  AOI22X1 U555 ( .A0(R2[32]), .A1(n733), .B0(R3[32]), .B1(n731), .Y(n959) );
  OAI211X1 U556 ( .A0(n1259), .A1(n612), .B0(n957), .C0(n958), .Y(n1157) );
  AOI22X1 U557 ( .A0(R0[33]), .A1(n1042), .B0(data_out_1[33]), .B1(n752), .Y(
        n958) );
  AOI22X1 U558 ( .A0(R2[33]), .A1(n753), .B0(R3[33]), .B1(n732), .Y(n957) );
  NAND2X1 U559 ( .A(rst_n), .B(n1054), .Y(n752) );
  NOR2BX1 U560 ( .AN(rst_n), .B(counter[3]), .Y(n1039) );
  AND4X2 U561 ( .A(rst_n), .B(n1033), .C(counter[3]), .D(counter[2]), .Y(n18)
         );
  AND2X2 U562 ( .A(n1260), .B(rst_n), .Y(n19) );
  AND2X2 U563 ( .A(n1027), .B(rst_n), .Y(n20) );
  AND2X2 U564 ( .A(n1025), .B(rst_n), .Y(n21) );
  AND2X2 U565 ( .A(n1028), .B(rst_n), .Y(n22) );
  AND3X2 U566 ( .A(counter[3]), .B(n606), .C(rst_n), .Y(n1030) );
  INVX1 U567 ( .A(data_in_1[0]), .Y(n1296) );
  INVX1 U568 ( .A(data_in_1[1]), .Y(n1295) );
  INVX1 U569 ( .A(data_in_1[2]), .Y(n1294) );
  INVX1 U570 ( .A(data_in_1[3]), .Y(n1293) );
  INVX1 U571 ( .A(data_in_1[4]), .Y(n1292) );
  INVX1 U572 ( .A(data_in_1[5]), .Y(n1291) );
  INVX1 U573 ( .A(data_in_1[6]), .Y(n1290) );
  INVX1 U574 ( .A(data_in_1[7]), .Y(n1289) );
  INVX1 U575 ( .A(data_in_1[8]), .Y(n1288) );
  INVX1 U576 ( .A(data_in_1[9]), .Y(n1287) );
  INVX1 U577 ( .A(data_in_1[10]), .Y(n1286) );
  INVX1 U578 ( .A(data_in_1[11]), .Y(n1285) );
  INVX1 U579 ( .A(data_in_1[12]), .Y(n1284) );
  INVX1 U580 ( .A(data_in_1[13]), .Y(n1283) );
  INVX1 U581 ( .A(data_in_1[14]), .Y(n1282) );
  INVX1 U582 ( .A(data_in_1[15]), .Y(n1281) );
  INVX1 U583 ( .A(data_in_1[16]), .Y(n1280) );
  INVX1 U584 ( .A(data_in_1[17]), .Y(n1279) );
  INVX1 U585 ( .A(data_in_1[18]), .Y(n1278) );
  INVX1 U586 ( .A(data_in_1[19]), .Y(n1277) );
  INVX1 U587 ( .A(data_in_1[20]), .Y(n1276) );
  INVX1 U588 ( .A(data_in_1[21]), .Y(n1275) );
  INVX1 U589 ( .A(data_in_1[22]), .Y(n1274) );
  INVX1 U590 ( .A(data_in_1[23]), .Y(n1273) );
  INVX1 U591 ( .A(data_in_1[24]), .Y(n1272) );
  INVX1 U592 ( .A(data_in_1[25]), .Y(n1271) );
  INVX1 U593 ( .A(data_in_1[26]), .Y(n1270) );
  INVX1 U594 ( .A(data_in_1[27]), .Y(n1269) );
  INVX1 U595 ( .A(data_in_1[28]), .Y(n1268) );
  INVX1 U596 ( .A(data_in_1[29]), .Y(n1267) );
  INVX1 U597 ( .A(data_in_1[30]), .Y(n1266) );
  INVX1 U598 ( .A(data_in_1[31]), .Y(n1265) );
  INVX1 U599 ( .A(data_in_1[32]), .Y(n1264) );
  INVX1 U600 ( .A(data_in_1[33]), .Y(n1263) );
  NOR3X1 U601 ( .A(n605), .B(n606), .C(n1043), .Y(n1028) );
  NOR2X1 U602 ( .A(counter[0]), .B(counter[1]), .Y(n1033) );
  NOR3X1 U603 ( .A(n606), .B(n1049), .C(n605), .Y(n1027) );
  NOR3X1 U604 ( .A(n605), .B(n606), .C(n1045), .Y(n1025) );
  NAND2X1 U605 ( .A(counter[1]), .B(counter[0]), .Y(n1049) );
  NAND3X1 U606 ( .A(n606), .B(n605), .C(n1033), .Y(n1026) );
  OR2X2 U607 ( .A(n609), .B(counter[0]), .Y(n1043) );
  NAND2X1 U608 ( .A(counter[0]), .B(n609), .Y(n1045) );
  NAND3X1 U609 ( .A(counter[3]), .B(counter[2]), .C(n2), .Y(n1) );
  AND2X2 U610 ( .A(counter[1]), .B(counter[0]), .Y(n2) );
  AND2X2 U611 ( .A(N86), .B(n1), .Y(N146) );
  AND2X2 U612 ( .A(N88), .B(n1), .Y(N148) );
  XOR2X1 U613 ( .A(n606), .B(n1049), .Y(N88) );
  AND2X2 U614 ( .A(N89), .B(n1), .Y(N149) );
  XOR2X1 U615 ( .A(counter[3]), .B(n1053), .Y(N89) );
  NOR2X1 U616 ( .A(n1049), .B(n606), .Y(n1053) );
endmodule


module mux ( mux_flag, data_in_1, data_in_2, data_out );
  input [135:0] data_in_1;
  input [135:0] data_in_2;
  output [135:0] data_out;
  input mux_flag;
  wire   n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102;
  tri   [135:0] data_in_1;

  INVX1 U1 ( .A(n71), .Y(n9) );
  INVX1 U2 ( .A(n71), .Y(n12) );
  INVX1 U3 ( .A(n70), .Y(n6) );
  INVX1 U4 ( .A(n70), .Y(n8) );
  INVX1 U5 ( .A(n71), .Y(n11) );
  INVX1 U6 ( .A(n72), .Y(n14) );
  INVX1 U7 ( .A(n71), .Y(n10) );
  INVX1 U8 ( .A(n72), .Y(n13) );
  INVX1 U9 ( .A(n70), .Y(n7) );
  INVX1 U10 ( .A(n70), .Y(n5) );
  INVX1 U11 ( .A(n72), .Y(n15) );
  INVX1 U12 ( .A(n73), .Y(n71) );
  INVX1 U13 ( .A(n73), .Y(n70) );
  INVX1 U14 ( .A(n92), .Y(n23) );
  INVX1 U15 ( .A(n89), .Y(n31) );
  INVX1 U16 ( .A(n90), .Y(n30) );
  INVX1 U17 ( .A(n74), .Y(n67) );
  INVX1 U18 ( .A(n77), .Y(n61) );
  INVX1 U19 ( .A(n83), .Y(n47) );
  INVX1 U20 ( .A(n86), .Y(n39) );
  INVX1 U21 ( .A(n83), .Y(n48) );
  INVX1 U22 ( .A(n93), .Y(n22) );
  INVX1 U23 ( .A(n74), .Y(n68) );
  INVX1 U24 ( .A(n77), .Y(n62) );
  INVX1 U25 ( .A(n78), .Y(n60) );
  INVX1 U26 ( .A(n87), .Y(n38) );
  INVX1 U27 ( .A(n80), .Y(n54) );
  INVX1 U28 ( .A(n80), .Y(n55) );
  INVX1 U29 ( .A(n93), .Y(n21) );
  INVX1 U30 ( .A(n82), .Y(n50) );
  INVX1 U31 ( .A(n74), .Y(n69) );
  INVX1 U32 ( .A(n73), .Y(n72) );
  INVX1 U33 ( .A(n90), .Y(n29) );
  INVX1 U34 ( .A(n75), .Y(n66) );
  INVX1 U35 ( .A(n84), .Y(n46) );
  INVX1 U36 ( .A(n90), .Y(n28) );
  INVX1 U37 ( .A(n84), .Y(n45) );
  INVX1 U38 ( .A(n93), .Y(n20) );
  INVX1 U39 ( .A(n75), .Y(n65) );
  INVX1 U40 ( .A(n78), .Y(n59) );
  INVX1 U41 ( .A(n87), .Y(n37) );
  INVX1 U42 ( .A(n81), .Y(n53) );
  INVX1 U43 ( .A(n84), .Y(n44) );
  INVX1 U44 ( .A(n86), .Y(n40) );
  INVX1 U45 ( .A(n94), .Y(n19) );
  INVX1 U46 ( .A(n78), .Y(n58) );
  INVX1 U47 ( .A(n87), .Y(n36) );
  INVX1 U48 ( .A(n81), .Y(n52) );
  INVX1 U49 ( .A(n88), .Y(n35) );
  INVX1 U50 ( .A(n15), .Y(n16) );
  INVX1 U51 ( .A(n75), .Y(n64) );
  INVX1 U52 ( .A(n91), .Y(n27) );
  INVX1 U53 ( .A(n76), .Y(n63) );
  INVX1 U54 ( .A(n85), .Y(n43) );
  INVX1 U55 ( .A(n91), .Y(n26) );
  INVX1 U56 ( .A(n94), .Y(n18) );
  INVX1 U57 ( .A(n79), .Y(n57) );
  INVX1 U58 ( .A(n81), .Y(n51) );
  INVX1 U59 ( .A(n91), .Y(n25) );
  INVX1 U60 ( .A(n85), .Y(n42) );
  INVX1 U61 ( .A(n88), .Y(n34) );
  INVX1 U62 ( .A(n94), .Y(n17) );
  INVX1 U63 ( .A(n79), .Y(n56) );
  INVX1 U64 ( .A(n88), .Y(n33) );
  INVX1 U65 ( .A(n92), .Y(n24) );
  INVX1 U66 ( .A(n85), .Y(n41) );
  INVX1 U67 ( .A(n89), .Y(n32) );
  INVX1 U68 ( .A(n83), .Y(n49) );
  INVX1 U69 ( .A(n96), .Y(n92) );
  INVX1 U70 ( .A(n97), .Y(n89) );
  INVX1 U71 ( .A(n102), .Y(n73) );
  INVX1 U72 ( .A(n102), .Y(n74) );
  INVX1 U73 ( .A(n101), .Y(n77) );
  INVX1 U74 ( .A(n99), .Y(n83) );
  INVX1 U75 ( .A(n98), .Y(n86) );
  INVX1 U76 ( .A(n96), .Y(n90) );
  INVX1 U77 ( .A(n100), .Y(n80) );
  INVX1 U78 ( .A(n95), .Y(n93) );
  INVX1 U79 ( .A(n99), .Y(n82) );
  INVX1 U80 ( .A(n101), .Y(n78) );
  INVX1 U81 ( .A(n97), .Y(n87) );
  INVX1 U82 ( .A(n98), .Y(n84) );
  INVX1 U83 ( .A(n102), .Y(n75) );
  INVX1 U84 ( .A(n99), .Y(n81) );
  INVX1 U85 ( .A(n95), .Y(n94) );
  INVX1 U86 ( .A(n97), .Y(n88) );
  INVX1 U87 ( .A(n96), .Y(n91) );
  INVX1 U88 ( .A(n101), .Y(n76) );
  INVX1 U89 ( .A(n100), .Y(n79) );
  INVX1 U90 ( .A(n98), .Y(n85) );
  INVX1 U91 ( .A(n3), .Y(n102) );
  INVX1 U92 ( .A(n3), .Y(n101) );
  INVX1 U93 ( .A(n1), .Y(n96) );
  INVX1 U94 ( .A(n1), .Y(n95) );
  INVX1 U95 ( .A(n2), .Y(n98) );
  INVX1 U96 ( .A(n2), .Y(n99) );
  INVX1 U97 ( .A(n1), .Y(n97) );
  INVX1 U98 ( .A(n2), .Y(n100) );
  INVX1 U99 ( .A(n271), .Y(data_out[101]) );
  INVX1 U100 ( .A(n153), .Y(data_out[86]) );
  INVX1 U101 ( .A(n4), .Y(n1) );
  INVX1 U102 ( .A(n4), .Y(n2) );
  INVX1 U103 ( .A(n4), .Y(n3) );
  INVX1 U104 ( .A(n191), .Y(data_out[51]) );
  AOI22X1 U105 ( .A0(data_in_1[51]), .A1(n11), .B0(data_in_2[51]), .B1(n39), 
        .Y(n191) );
  AOI22X1 U106 ( .A0(data_in_1[86]), .A1(n14), .B0(data_in_2[86]), .B1(n22), 
        .Y(n153) );
  INVX1 U107 ( .A(n172), .Y(data_out[69]) );
  AOI22X1 U108 ( .A0(data_in_1[69]), .A1(n12), .B0(data_in_2[69]), .B1(n31), 
        .Y(n172) );
  INVX1 U109 ( .A(n269), .Y(data_out[103]) );
  AOI22X1 U110 ( .A0(data_in_1[103]), .A1(n5), .B0(data_in_2[103]), .B1(n67), 
        .Y(n269) );
  INVX1 U111 ( .A(n209), .Y(data_out[35]) );
  AOI22X1 U112 ( .A0(data_in_1[35]), .A1(n9), .B0(data_in_2[35]), .B1(n47), 
        .Y(n209) );
  INVX1 U113 ( .A(n170), .Y(data_out[70]) );
  AOI22X1 U114 ( .A0(data_in_1[70]), .A1(n12), .B0(data_in_2[70]), .B1(n30), 
        .Y(n170) );
  INVX1 U115 ( .A(n268), .Y(data_out[104]) );
  AOI22X1 U116 ( .A0(data_in_1[104]), .A1(n5), .B0(data_in_2[104]), .B1(n67), 
        .Y(n268) );
  INVX1 U117 ( .A(n208), .Y(data_out[36]) );
  AOI22X1 U118 ( .A0(data_in_1[36]), .A1(n10), .B0(data_in_2[36]), .B1(n47), 
        .Y(n208) );
  INVX1 U119 ( .A(n210), .Y(data_out[34]) );
  AOI22X1 U120 ( .A0(data_in_1[34]), .A1(n9), .B0(data_in_2[34]), .B1(n48), 
        .Y(n210) );
  INVX1 U121 ( .A(n169), .Y(data_out[71]) );
  AOI22X1 U122 ( .A0(data_in_1[71]), .A1(n13), .B0(data_in_2[71]), .B1(n29), 
        .Y(n169) );
  INVX1 U123 ( .A(n173), .Y(data_out[68]) );
  AOI22X1 U124 ( .A0(data_in_1[68]), .A1(n12), .B0(data_in_2[68]), .B1(n31), 
        .Y(n173) );
  INVX1 U125 ( .A(n267), .Y(data_out[105]) );
  AOI22X1 U126 ( .A0(data_in_1[105]), .A1(n5), .B0(data_in_2[105]), .B1(n66), 
        .Y(n267) );
  INVX1 U127 ( .A(n270), .Y(data_out[102]) );
  AOI22X1 U128 ( .A0(data_in_1[102]), .A1(n5), .B0(data_in_2[102]), .B1(n68), 
        .Y(n270) );
  INVX1 U129 ( .A(n207), .Y(data_out[37]) );
  AOI22X1 U130 ( .A0(data_in_1[37]), .A1(n10), .B0(data_in_2[37]), .B1(n46), 
        .Y(n207) );
  INVX1 U131 ( .A(n252), .Y(data_out[119]) );
  AOI22X1 U132 ( .A0(data_in_1[119]), .A1(n6), .B0(data_in_2[119]), .B1(n62), 
        .Y(n252) );
  INVX1 U133 ( .A(n190), .Y(data_out[52]) );
  AOI22X1 U134 ( .A0(data_in_1[52]), .A1(n11), .B0(data_in_2[52]), .B1(n39), 
        .Y(n190) );
  INVX1 U135 ( .A(n189), .Y(data_out[53]) );
  AOI22X1 U136 ( .A0(data_in_1[53]), .A1(n11), .B0(data_in_2[53]), .B1(n38), 
        .Y(n189) );
  INVX1 U137 ( .A(n188), .Y(data_out[54]) );
  AOI22X1 U138 ( .A0(data_in_1[54]), .A1(n11), .B0(data_in_2[54]), .B1(n38), 
        .Y(n188) );
  INVX1 U139 ( .A(n187), .Y(data_out[55]) );
  AOI22X1 U140 ( .A0(data_in_1[55]), .A1(n11), .B0(data_in_2[55]), .B1(n37), 
        .Y(n187) );
  INVX1 U141 ( .A(n273), .Y(data_out[0]) );
  AOI22X1 U142 ( .A0(data_in_1[0]), .A1(n5), .B0(data_in_2[0]), .B1(n69), .Y(
        n273) );
  INVX1 U143 ( .A(n229), .Y(data_out[17]) );
  AOI22X1 U144 ( .A0(data_in_1[17]), .A1(n8), .B0(data_in_2[17]), .B1(n55), 
        .Y(n229) );
  INVX1 U145 ( .A(n250), .Y(data_out[120]) );
  AOI22X1 U146 ( .A0(data_in_1[120]), .A1(n6), .B0(data_in_2[120]), .B1(n61), 
        .Y(n250) );
  INVX1 U147 ( .A(n249), .Y(data_out[121]) );
  AOI22X1 U148 ( .A0(data_in_1[121]), .A1(n6), .B0(data_in_2[121]), .B1(n60), 
        .Y(n249) );
  INVX1 U149 ( .A(n248), .Y(data_out[122]) );
  AOI22X1 U150 ( .A0(data_in_1[122]), .A1(n6), .B0(data_in_2[122]), .B1(n60), 
        .Y(n248) );
  INVX1 U151 ( .A(n247), .Y(data_out[123]) );
  AOI22X1 U152 ( .A0(data_in_1[123]), .A1(n7), .B0(data_in_2[123]), .B1(n59), 
        .Y(n247) );
  INVX1 U153 ( .A(n154), .Y(data_out[85]) );
  AOI22X1 U154 ( .A0(data_in_1[85]), .A1(n14), .B0(data_in_2[85]), .B1(n23), 
        .Y(n154) );
  INVX1 U155 ( .A(n226), .Y(data_out[1]) );
  AOI22X1 U156 ( .A0(data_in_1[1]), .A1(n8), .B0(data_in_2[1]), .B1(n54), .Y(
        n226) );
  INVX1 U157 ( .A(n228), .Y(data_out[18]) );
  AOI22X1 U158 ( .A0(data_in_1[18]), .A1(n8), .B0(data_in_2[18]), .B1(n55), 
        .Y(n228) );
  INVX1 U159 ( .A(n215), .Y(data_out[2]) );
  AOI22X1 U160 ( .A0(data_in_1[2]), .A1(n9), .B0(data_in_2[2]), .B1(n50), .Y(
        n215) );
  INVX1 U161 ( .A(n227), .Y(data_out[19]) );
  AOI22X1 U162 ( .A0(data_in_1[19]), .A1(n8), .B0(data_in_2[19]), .B1(n54), 
        .Y(n227) );
  INVX1 U163 ( .A(n204), .Y(data_out[3]) );
  AOI22X1 U164 ( .A0(data_in_1[3]), .A1(n10), .B0(data_in_2[3]), .B1(n45), .Y(
        n204) );
  INVX1 U165 ( .A(n225), .Y(data_out[20]) );
  AOI22X1 U166 ( .A0(data_in_1[20]), .A1(n8), .B0(data_in_2[20]), .B1(n53), 
        .Y(n225) );
  INVX1 U167 ( .A(n152), .Y(data_out[87]) );
  AOI22X1 U168 ( .A0(data_in_1[87]), .A1(n14), .B0(data_in_2[87]), .B1(n22), 
        .Y(n152) );
  INVX1 U169 ( .A(n151), .Y(data_out[88]) );
  AOI22X1 U170 ( .A0(data_in_1[88]), .A1(n14), .B0(data_in_2[88]), .B1(n21), 
        .Y(n151) );
  INVX1 U171 ( .A(n150), .Y(data_out[89]) );
  AOI22X1 U172 ( .A0(data_in_1[89]), .A1(n14), .B0(data_in_2[89]), .B1(n21), 
        .Y(n150) );
  INVX1 U173 ( .A(n148), .Y(data_out[90]) );
  AOI22X1 U174 ( .A0(data_in_1[90]), .A1(n14), .B0(data_in_2[90]), .B1(n20), 
        .Y(n148) );
  INVX1 U175 ( .A(n147), .Y(data_out[91]) );
  AOI22X1 U176 ( .A0(data_in_1[91]), .A1(n14), .B0(data_in_2[91]), .B1(n19), 
        .Y(n147) );
  INVX1 U177 ( .A(n146), .Y(data_out[92]) );
  AOI22X1 U178 ( .A0(data_in_1[92]), .A1(n14), .B0(data_in_2[92]), .B1(n19), 
        .Y(n146) );
  INVX1 U179 ( .A(n145), .Y(data_out[93]) );
  AOI22X1 U180 ( .A0(data_in_1[93]), .A1(n14), .B0(data_in_2[93]), .B1(n18), 
        .Y(n145) );
  INVX1 U181 ( .A(n144), .Y(data_out[94]) );
  AOI22X1 U182 ( .A0(data_in_1[94]), .A1(n14), .B0(data_in_2[94]), .B1(n18), 
        .Y(n144) );
  INVX1 U183 ( .A(n143), .Y(data_out[95]) );
  AOI22X1 U184 ( .A0(data_in_1[95]), .A1(n15), .B0(data_in_2[95]), .B1(n17), 
        .Y(n143) );
  INVX1 U185 ( .A(n142), .Y(data_out[96]) );
  AOI22X1 U186 ( .A0(data_in_1[96]), .A1(n15), .B0(data_in_2[96]), .B1(n17), 
        .Y(n142) );
  INVX1 U187 ( .A(n141), .Y(data_out[97]) );
  AOI22X1 U188 ( .A0(data_in_1[97]), .A1(n15), .B0(data_in_2[97]), .B1(n24), 
        .Y(n141) );
  INVX1 U189 ( .A(n140), .Y(data_out[98]) );
  AOI22X1 U190 ( .A0(data_in_1[98]), .A1(n15), .B0(data_in_2[98]), .B1(n32), 
        .Y(n140) );
  INVX1 U191 ( .A(n139), .Y(data_out[99]) );
  AOI22X1 U192 ( .A0(data_in_1[99]), .A1(n15), .B0(data_in_2[99]), .B1(n16), 
        .Y(n139) );
  INVX1 U193 ( .A(n272), .Y(data_out[100]) );
  AOI22X1 U194 ( .A0(data_in_1[100]), .A1(n5), .B0(data_in_2[100]), .B1(n69), 
        .Y(n272) );
  INVX1 U195 ( .A(mux_flag), .Y(n4) );
  INVX1 U196 ( .A(n168), .Y(data_out[72]) );
  AOI22X1 U197 ( .A0(data_in_1[72]), .A1(n13), .B0(data_in_2[72]), .B1(n29), 
        .Y(n168) );
  INVX1 U198 ( .A(n266), .Y(data_out[106]) );
  AOI22X1 U199 ( .A0(data_in_1[106]), .A1(n5), .B0(data_in_2[106]), .B1(n66), 
        .Y(n266) );
  INVX1 U200 ( .A(n206), .Y(data_out[38]) );
  AOI22X1 U201 ( .A0(data_in_1[38]), .A1(n10), .B0(data_in_2[38]), .B1(n46), 
        .Y(n206) );
  INVX1 U202 ( .A(n167), .Y(data_out[73]) );
  AOI22X1 U203 ( .A0(data_in_1[73]), .A1(n13), .B0(data_in_2[73]), .B1(n28), 
        .Y(n167) );
  INVX1 U204 ( .A(n265), .Y(data_out[107]) );
  AOI22X1 U205 ( .A0(data_in_1[107]), .A1(n5), .B0(data_in_2[107]), .B1(n65), 
        .Y(n265) );
  INVX1 U206 ( .A(n205), .Y(data_out[39]) );
  AOI22X1 U207 ( .A0(data_in_1[39]), .A1(n10), .B0(data_in_2[39]), .B1(n45), 
        .Y(n205) );
  INVX1 U208 ( .A(n166), .Y(data_out[74]) );
  AOI22X1 U209 ( .A0(data_in_1[74]), .A1(n13), .B0(data_in_2[74]), .B1(n28), 
        .Y(n166) );
  INVX1 U210 ( .A(n264), .Y(data_out[108]) );
  AOI22X1 U211 ( .A0(data_in_1[108]), .A1(n5), .B0(data_in_2[108]), .B1(n65), 
        .Y(n264) );
  INVX1 U212 ( .A(n203), .Y(data_out[40]) );
  AOI22X1 U213 ( .A0(data_in_1[40]), .A1(n10), .B0(data_in_2[40]), .B1(n44), 
        .Y(n203) );
  INVX1 U214 ( .A(n165), .Y(data_out[75]) );
  AOI22X1 U215 ( .A0(data_in_1[75]), .A1(n13), .B0(data_in_2[75]), .B1(n27), 
        .Y(n165) );
  INVX1 U216 ( .A(n263), .Y(data_out[109]) );
  AOI22X1 U217 ( .A0(data_in_1[109]), .A1(n5), .B0(data_in_2[109]), .B1(n64), 
        .Y(n263) );
  INVX1 U218 ( .A(n202), .Y(data_out[41]) );
  AOI22X1 U219 ( .A0(data_in_1[41]), .A1(n10), .B0(data_in_2[41]), .B1(n44), 
        .Y(n202) );
  INVX1 U220 ( .A(n164), .Y(data_out[76]) );
  AOI22X1 U221 ( .A0(data_in_1[76]), .A1(n13), .B0(data_in_2[76]), .B1(n27), 
        .Y(n164) );
  INVX1 U222 ( .A(n261), .Y(data_out[110]) );
  AOI22X1 U223 ( .A0(data_in_1[110]), .A1(n5), .B0(data_in_2[110]), .B1(n63), 
        .Y(n261) );
  INVX1 U224 ( .A(n201), .Y(data_out[42]) );
  AOI22X1 U225 ( .A0(data_in_1[42]), .A1(n10), .B0(data_in_2[42]), .B1(n43), 
        .Y(n201) );
  INVX1 U226 ( .A(n186), .Y(data_out[56]) );
  AOI22X1 U227 ( .A0(data_in_1[56]), .A1(n11), .B0(data_in_2[56]), .B1(n37), 
        .Y(n186) );
  INVX1 U228 ( .A(n185), .Y(data_out[57]) );
  AOI22X1 U229 ( .A0(data_in_1[57]), .A1(n11), .B0(data_in_2[57]), .B1(n36), 
        .Y(n185) );
  INVX1 U230 ( .A(n184), .Y(data_out[58]) );
  AOI22X1 U231 ( .A0(data_in_1[58]), .A1(n11), .B0(data_in_2[58]), .B1(n36), 
        .Y(n184) );
  INVX1 U232 ( .A(n183), .Y(data_out[59]) );
  AOI22X1 U233 ( .A0(data_in_1[59]), .A1(n11), .B0(data_in_2[59]), .B1(n35), 
        .Y(n183) );
  INVX1 U234 ( .A(n246), .Y(data_out[124]) );
  AOI22X1 U235 ( .A0(data_in_1[124]), .A1(n7), .B0(data_in_2[124]), .B1(n59), 
        .Y(n246) );
  INVX1 U236 ( .A(n245), .Y(data_out[125]) );
  AOI22X1 U237 ( .A0(data_in_1[125]), .A1(n7), .B0(data_in_2[125]), .B1(n58), 
        .Y(n245) );
  INVX1 U238 ( .A(n244), .Y(data_out[126]) );
  AOI22X1 U239 ( .A0(data_in_1[126]), .A1(n7), .B0(data_in_2[126]), .B1(n58), 
        .Y(n244) );
  INVX1 U240 ( .A(n243), .Y(data_out[127]) );
  AOI22X1 U241 ( .A0(data_in_1[127]), .A1(n7), .B0(data_in_2[127]), .B1(n57), 
        .Y(n243) );
  INVX1 U242 ( .A(n193), .Y(data_out[4]) );
  AOI22X1 U243 ( .A0(data_in_1[4]), .A1(n11), .B0(data_in_2[4]), .B1(n40), .Y(
        n193) );
  INVX1 U244 ( .A(n224), .Y(data_out[21]) );
  AOI22X1 U245 ( .A0(data_in_1[21]), .A1(n8), .B0(data_in_2[21]), .B1(n53), 
        .Y(n224) );
  INVX1 U246 ( .A(n182), .Y(data_out[5]) );
  AOI22X1 U247 ( .A0(data_in_1[5]), .A1(n12), .B0(data_in_2[5]), .B1(n35), .Y(
        n182) );
  INVX1 U248 ( .A(n223), .Y(data_out[22]) );
  AOI22X1 U249 ( .A0(data_in_1[22]), .A1(n8), .B0(data_in_2[22]), .B1(n52), 
        .Y(n223) );
  INVX1 U250 ( .A(n171), .Y(data_out[6]) );
  AOI22X1 U251 ( .A0(data_in_1[6]), .A1(n12), .B0(data_in_2[6]), .B1(n30), .Y(
        n171) );
  INVX1 U252 ( .A(n222), .Y(data_out[23]) );
  AOI22X1 U253 ( .A0(data_in_1[23]), .A1(n8), .B0(data_in_2[23]), .B1(n52), 
        .Y(n222) );
  INVX1 U254 ( .A(n160), .Y(data_out[7]) );
  AOI22X1 U255 ( .A0(data_in_1[7]), .A1(n13), .B0(data_in_2[7]), .B1(n25), .Y(
        n160) );
  INVX1 U256 ( .A(n221), .Y(data_out[24]) );
  AOI22X1 U257 ( .A0(data_in_1[24]), .A1(n9), .B0(data_in_2[24]), .B1(n51), 
        .Y(n221) );
  INVX1 U258 ( .A(n163), .Y(data_out[77]) );
  AOI22X1 U259 ( .A0(data_in_1[77]), .A1(n13), .B0(data_in_2[77]), .B1(n26), 
        .Y(n163) );
  INVX1 U260 ( .A(n260), .Y(data_out[111]) );
  AOI22X1 U261 ( .A0(data_in_1[111]), .A1(n6), .B0(data_in_2[111]), .B1(n63), 
        .Y(n260) );
  INVX1 U262 ( .A(n200), .Y(data_out[43]) );
  AOI22X1 U263 ( .A0(data_in_1[43]), .A1(n10), .B0(data_in_2[43]), .B1(n43), 
        .Y(n200) );
  INVX1 U264 ( .A(n162), .Y(data_out[78]) );
  AOI22X1 U265 ( .A0(data_in_1[78]), .A1(n13), .B0(data_in_2[78]), .B1(n26), 
        .Y(n162) );
  INVX1 U266 ( .A(n259), .Y(data_out[112]) );
  AOI22X1 U267 ( .A0(data_in_1[112]), .A1(n6), .B0(data_in_2[112]), .B1(n17), 
        .Y(n259) );
  INVX1 U268 ( .A(n199), .Y(data_out[44]) );
  AOI22X1 U269 ( .A0(data_in_1[44]), .A1(n10), .B0(data_in_2[44]), .B1(n42), 
        .Y(n199) );
  INVX1 U270 ( .A(n161), .Y(data_out[79]) );
  AOI22X1 U271 ( .A0(data_in_1[79]), .A1(n13), .B0(data_in_2[79]), .B1(n25), 
        .Y(n161) );
  INVX1 U272 ( .A(n258), .Y(data_out[113]) );
  AOI22X1 U273 ( .A0(data_in_1[113]), .A1(n6), .B0(data_in_2[113]), .B1(n56), 
        .Y(n258) );
  INVX1 U274 ( .A(n198), .Y(data_out[45]) );
  AOI22X1 U275 ( .A0(data_in_1[45]), .A1(n10), .B0(data_in_2[45]), .B1(n42), 
        .Y(n198) );
  INVX1 U276 ( .A(n159), .Y(data_out[80]) );
  AOI22X1 U277 ( .A0(data_in_1[80]), .A1(n13), .B0(data_in_2[80]), .B1(n24), 
        .Y(n159) );
  INVX1 U278 ( .A(n257), .Y(data_out[114]) );
  AOI22X1 U279 ( .A0(data_in_1[114]), .A1(n6), .B0(data_in_2[114]), .B1(n41), 
        .Y(n257) );
  INVX1 U280 ( .A(n197), .Y(data_out[46]) );
  AOI22X1 U281 ( .A0(data_in_1[46]), .A1(n10), .B0(data_in_2[46]), .B1(n41), 
        .Y(n197) );
  INVX1 U282 ( .A(n181), .Y(data_out[60]) );
  AOI22X1 U283 ( .A0(data_in_1[60]), .A1(n12), .B0(data_in_2[60]), .B1(n34), 
        .Y(n181) );
  INVX1 U284 ( .A(n180), .Y(data_out[61]) );
  AOI22X1 U285 ( .A0(data_in_1[61]), .A1(n12), .B0(data_in_2[61]), .B1(n34), 
        .Y(n180) );
  INVX1 U286 ( .A(n179), .Y(data_out[62]) );
  AOI22X1 U287 ( .A0(data_in_1[62]), .A1(n12), .B0(data_in_2[62]), .B1(n33), 
        .Y(n179) );
  INVX1 U288 ( .A(n178), .Y(data_out[63]) );
  AOI22X1 U289 ( .A0(data_in_1[63]), .A1(n12), .B0(data_in_2[63]), .B1(n33), 
        .Y(n178) );
  INVX1 U290 ( .A(n177), .Y(data_out[64]) );
  AOI22X1 U291 ( .A0(data_in_1[64]), .A1(n12), .B0(data_in_2[64]), .B1(n49), 
        .Y(n177) );
  INVX1 U292 ( .A(n242), .Y(data_out[128]) );
  AOI22X1 U293 ( .A0(data_in_1[128]), .A1(n7), .B0(data_in_2[128]), .B1(n57), 
        .Y(n242) );
  INVX1 U294 ( .A(n241), .Y(data_out[129]) );
  AOI22X1 U295 ( .A0(data_in_1[129]), .A1(n7), .B0(data_in_2[129]), .B1(n56), 
        .Y(n241) );
  INVX1 U296 ( .A(n239), .Y(data_out[130]) );
  AOI22X1 U297 ( .A0(data_in_1[130]), .A1(n7), .B0(data_in_2[130]), .B1(n56), 
        .Y(n239) );
  INVX1 U298 ( .A(n238), .Y(data_out[131]) );
  AOI22X1 U299 ( .A0(data_in_1[131]), .A1(n7), .B0(data_in_2[131]), .B1(n56), 
        .Y(n238) );
  INVX1 U300 ( .A(n138), .Y(data_out[9]) );
  AOI22X1 U301 ( .A0(n15), .A1(data_in_1[9]), .B0(data_in_2[9]), .B1(n16), .Y(
        n138) );
  INVX1 U302 ( .A(n149), .Y(data_out[8]) );
  AOI22X1 U303 ( .A0(data_in_1[8]), .A1(n14), .B0(data_in_2[8]), .B1(n20), .Y(
        n149) );
  INVX1 U304 ( .A(n220), .Y(data_out[25]) );
  AOI22X1 U305 ( .A0(data_in_1[25]), .A1(n9), .B0(data_in_2[25]), .B1(n51), 
        .Y(n220) );
  INVX1 U306 ( .A(n219), .Y(data_out[26]) );
  AOI22X1 U307 ( .A0(data_in_1[26]), .A1(n9), .B0(data_in_2[26]), .B1(n24), 
        .Y(n219) );
  INVX1 U308 ( .A(n262), .Y(data_out[10]) );
  AOI22X1 U309 ( .A0(data_in_1[10]), .A1(n5), .B0(data_in_2[10]), .B1(n64), 
        .Y(n262) );
  INVX1 U310 ( .A(n218), .Y(data_out[27]) );
  AOI22X1 U311 ( .A0(data_in_1[27]), .A1(n9), .B0(data_in_2[27]), .B1(n41), 
        .Y(n218) );
  INVX1 U312 ( .A(n251), .Y(data_out[11]) );
  AOI22X1 U313 ( .A0(data_in_1[11]), .A1(n6), .B0(data_in_2[11]), .B1(n61), 
        .Y(n251) );
  INVX1 U314 ( .A(n217), .Y(data_out[28]) );
  AOI22X1 U315 ( .A0(data_in_1[28]), .A1(n9), .B0(data_in_2[28]), .B1(n32), 
        .Y(n217) );
  INVX1 U316 ( .A(n158), .Y(data_out[81]) );
  AOI22X1 U317 ( .A0(data_in_1[81]), .A1(n13), .B0(data_in_2[81]), .B1(n24), 
        .Y(n158) );
  INVX1 U318 ( .A(n256), .Y(data_out[115]) );
  AOI22X1 U319 ( .A0(data_in_1[115]), .A1(n6), .B0(data_in_2[115]), .B1(n49), 
        .Y(n256) );
  INVX1 U320 ( .A(n196), .Y(data_out[47]) );
  AOI22X1 U321 ( .A0(data_in_1[47]), .A1(n10), .B0(data_in_2[47]), .B1(n41), 
        .Y(n196) );
  INVX1 U322 ( .A(n157), .Y(data_out[82]) );
  AOI22X1 U323 ( .A0(data_in_1[82]), .A1(n13), .B0(data_in_2[82]), .B1(n49), 
        .Y(n157) );
  INVX1 U324 ( .A(n255), .Y(data_out[116]) );
  AOI22X1 U325 ( .A0(data_in_1[116]), .A1(n6), .B0(data_in_2[116]), .B1(n32), 
        .Y(n255) );
  INVX1 U326 ( .A(n195), .Y(data_out[48]) );
  AOI22X1 U327 ( .A0(data_in_1[48]), .A1(n11), .B0(data_in_2[48]), .B1(n49), 
        .Y(n195) );
  INVX1 U328 ( .A(n156), .Y(data_out[83]) );
  AOI22X1 U329 ( .A0(data_in_1[83]), .A1(n14), .B0(data_in_2[83]), .B1(n32), 
        .Y(n156) );
  INVX1 U330 ( .A(n254), .Y(data_out[117]) );
  AOI22X1 U331 ( .A0(data_in_1[117]), .A1(n6), .B0(data_in_2[117]), .B1(n32), 
        .Y(n254) );
  INVX1 U332 ( .A(n194), .Y(data_out[49]) );
  AOI22X1 U333 ( .A0(data_in_1[49]), .A1(n11), .B0(data_in_2[49]), .B1(n49), 
        .Y(n194) );
  AOI22X1 U334 ( .A0(data_in_1[101]), .A1(n5), .B0(data_in_2[101]), .B1(n68), 
        .Y(n271) );
  INVX1 U335 ( .A(n176), .Y(data_out[65]) );
  AOI22X1 U336 ( .A0(data_in_1[65]), .A1(n12), .B0(data_in_2[65]), .B1(n49), 
        .Y(n176) );
  INVX1 U337 ( .A(n175), .Y(data_out[66]) );
  AOI22X1 U338 ( .A0(data_in_1[66]), .A1(n12), .B0(data_in_2[66]), .B1(n32), 
        .Y(n175) );
  INVX1 U339 ( .A(n155), .Y(data_out[84]) );
  AOI22X1 U340 ( .A0(data_in_1[84]), .A1(n14), .B0(data_in_2[84]), .B1(n23), 
        .Y(n155) );
  INVX1 U341 ( .A(n253), .Y(data_out[118]) );
  AOI22X1 U342 ( .A0(data_in_1[118]), .A1(n6), .B0(data_in_2[118]), .B1(n62), 
        .Y(n253) );
  INVX1 U343 ( .A(n192), .Y(data_out[50]) );
  AOI22X1 U344 ( .A0(data_in_1[50]), .A1(n11), .B0(data_in_2[50]), .B1(n40), 
        .Y(n192) );
  INVX1 U345 ( .A(n237), .Y(data_out[132]) );
  AOI22X1 U346 ( .A0(data_in_1[132]), .A1(n7), .B0(data_in_2[132]), .B1(n49), 
        .Y(n237) );
  INVX1 U347 ( .A(n236), .Y(data_out[133]) );
  AOI22X1 U348 ( .A0(data_in_1[133]), .A1(n7), .B0(data_in_2[133]), .B1(n32), 
        .Y(n236) );
  INVX1 U349 ( .A(n235), .Y(data_out[134]) );
  AOI22X1 U350 ( .A0(data_in_1[134]), .A1(n7), .B0(data_in_2[134]), .B1(n49), 
        .Y(n235) );
  INVX1 U351 ( .A(n234), .Y(data_out[135]) );
  AOI22X1 U352 ( .A0(data_in_1[135]), .A1(n8), .B0(data_in_2[135]), .B1(n32), 
        .Y(n234) );
  INVX1 U353 ( .A(n174), .Y(data_out[67]) );
  AOI22X1 U354 ( .A0(data_in_1[67]), .A1(n12), .B0(data_in_2[67]), .B1(n32), 
        .Y(n174) );
  INVX1 U355 ( .A(n240), .Y(data_out[12]) );
  AOI22X1 U356 ( .A0(data_in_1[12]), .A1(n7), .B0(data_in_2[12]), .B1(n32), 
        .Y(n240) );
  INVX1 U357 ( .A(n216), .Y(data_out[29]) );
  AOI22X1 U358 ( .A0(data_in_1[29]), .A1(n9), .B0(data_in_2[29]), .B1(n49), 
        .Y(n216) );
  INVX1 U359 ( .A(n233), .Y(data_out[13]) );
  AOI22X1 U360 ( .A0(data_in_1[13]), .A1(n8), .B0(data_in_2[13]), .B1(n32), 
        .Y(n233) );
  INVX1 U361 ( .A(n214), .Y(data_out[30]) );
  AOI22X1 U362 ( .A0(data_in_1[30]), .A1(n9), .B0(data_in_2[30]), .B1(n50), 
        .Y(n214) );
  INVX1 U363 ( .A(n232), .Y(data_out[14]) );
  AOI22X1 U364 ( .A0(data_in_1[14]), .A1(n8), .B0(data_in_2[14]), .B1(n49), 
        .Y(n232) );
  INVX1 U365 ( .A(n213), .Y(data_out[31]) );
  AOI22X1 U366 ( .A0(data_in_1[31]), .A1(n9), .B0(data_in_2[31]), .B1(n49), 
        .Y(n213) );
  INVX1 U367 ( .A(n231), .Y(data_out[15]) );
  AOI22X1 U368 ( .A0(data_in_1[15]), .A1(n8), .B0(data_in_2[15]), .B1(n49), 
        .Y(n231) );
  INVX1 U369 ( .A(n212), .Y(data_out[32]) );
  AOI22X1 U370 ( .A0(data_in_1[32]), .A1(n9), .B0(data_in_2[32]), .B1(n49), 
        .Y(n212) );
  INVX1 U371 ( .A(n230), .Y(data_out[16]) );
  AOI22X1 U372 ( .A0(data_in_1[16]), .A1(n8), .B0(data_in_2[16]), .B1(n49), 
        .Y(n230) );
  INVX1 U373 ( .A(n211), .Y(data_out[33]) );
  AOI22X1 U374 ( .A0(data_in_1[33]), .A1(n9), .B0(data_in_2[33]), .B1(n48), 
        .Y(n211) );
endmodule


module multi16_8_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  CMPR32X1 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .C(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S2_2_3 ( .A(ab_2__3_), .B(n2), .C(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  CMPR32X1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .C(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .C(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n4), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n5), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .C(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .C(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .C(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  CMPR32X1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .C(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .C(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  CMPR32X1 S2_14_2 ( .A(ab_14__2_), .B(CARRYB_13__2_), .C(SUMB_13__3_), .CO(
        CARRYB_14__2_), .S(SUMB_14__2_) );
  CMPR32X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .C(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX2 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .CI(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  ADDFHX1 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFHX4 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .CI(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  ADDFHX4 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFHX2 S4_1 ( .A(ab_15__1_), .B(CARRYB_14__1_), .CI(SUMB_14__2_), .CO(
        CARRYB_15__1_), .S(SUMB_15__1_) );
  ADDFHX1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .CI(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  ADDFHX1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFX2 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFHX2 S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFHX1 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S3_2_5 ( .A(ab_2__5_), .B(n6), .CI(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  ADDFHX1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .CI(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  ADDFHX1 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFHX1 S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFX2 S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFHXL S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFHX1 S2_2_4 ( .A(ab_2__4_), .B(n3), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  OR2X4 U2 ( .A(n19), .B(A1_17_), .Y(n30) );
  NOR2X2 U3 ( .A(n10), .B(n52), .Y(ab_1__5_) );
  INVX4 U4 ( .A(n9), .Y(n10) );
  INVX1 U5 ( .A(B[2]), .Y(n57) );
  NOR2X2 U6 ( .A(n55), .B(n53), .Y(ab_0__4_) );
  INVX4 U7 ( .A(B[4]), .Y(n55) );
  CLKINVX3 U8 ( .A(A[0]), .Y(n53) );
  NAND2X1 U9 ( .A(n20), .B(A1_15_), .Y(n22) );
  NOR2X1 U10 ( .A(n7), .B(n53), .Y(ab_0__6_) );
  INVX2 U11 ( .A(A[1]), .Y(n52) );
  NOR2X1 U12 ( .A(n57), .B(n52), .Y(ab_1__2_) );
  INVX2 U13 ( .A(B[1]), .Y(n58) );
  CLKINVX3 U14 ( .A(n54), .Y(n9) );
  INVX1 U15 ( .A(n13), .Y(n14) );
  OAI21X2 U16 ( .A0(n26), .A1(n22), .B0(n25), .Y(n15) );
  NOR2X1 U17 ( .A(n18), .B(A1_18_), .Y(n34) );
  INVX1 U18 ( .A(B[6]), .Y(n7) );
  AND2X2 U19 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n2) );
  AND2X2 U20 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n3) );
  AND2X2 U21 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n4) );
  AND2X2 U22 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n5) );
  AND2X2 U23 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n6) );
  AOI21X2 U24 ( .A0(n30), .A1(n15), .B0(n37), .Y(n33) );
  XOR2X1 U25 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  OAI21X1 U26 ( .A0(n34), .A1(n33), .B0(n32), .Y(n36) );
  INVXL U27 ( .A(B[6]), .Y(n8) );
  XOR2XL U28 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  NOR2X2 U29 ( .A(n52), .B(n58), .Y(ab_1__1_) );
  NOR2XL U30 ( .A(n55), .B(n52), .Y(ab_1__4_) );
  OAI21X2 U31 ( .A0(n26), .A1(n14), .B0(n25), .Y(n29) );
  NOR2XL U32 ( .A(n56), .B(n52), .Y(ab_1__3_) );
  NOR2XL U33 ( .A(n58), .B(n50), .Y(ab_3__1_) );
  NAND2BX1 U34 ( .AN(n26), .B(n25), .Y(n24) );
  NAND2X2 U35 ( .A(n17), .B(A1_16_), .Y(n25) );
  NOR2X2 U36 ( .A(n17), .B(A1_16_), .Y(n26) );
  AND2X2 U37 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n17) );
  INVX1 U38 ( .A(B[5]), .Y(n54) );
  NOR2XL U39 ( .A(n8), .B(n52), .Y(ab_1__6_) );
  XOR2X2 U40 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  NOR2X2 U41 ( .A(n57), .B(n53), .Y(ab_0__2_) );
  NOR2X2 U42 ( .A(n10), .B(n53), .Y(ab_0__5_) );
  INVXL U43 ( .A(B[2]), .Y(n11) );
  INVXL U44 ( .A(B[1]), .Y(n12) );
  INVX4 U45 ( .A(B[3]), .Y(n56) );
  XOR2XL U46 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  INVXL U47 ( .A(n22), .Y(n13) );
  NOR2XL U48 ( .A(n57), .B(n51), .Y(ab_2__2_) );
  NOR2XL U49 ( .A(n57), .B(n50), .Y(ab_3__2_) );
  NOR2XL U50 ( .A(n57), .B(n49), .Y(ab_4__2_) );
  NOR2XL U51 ( .A(n11), .B(n48), .Y(ab_5__2_) );
  XOR2X1 U52 ( .A(n31), .B(n33), .Y(PRODUCT_20_) );
  NOR2XL U53 ( .A(n10), .B(n45), .Y(ab_8__5_) );
  NOR2XL U54 ( .A(n10), .B(n39), .Y(ab_14__5_) );
  NOR2XL U55 ( .A(n10), .B(n46), .Y(ab_7__5_) );
  NOR2XL U56 ( .A(n10), .B(n47), .Y(ab_6__5_) );
  NOR2XL U57 ( .A(n10), .B(n40), .Y(ab_13__5_) );
  NOR2XL U58 ( .A(n10), .B(n48), .Y(ab_5__5_) );
  NOR2XL U59 ( .A(n10), .B(n43), .Y(ab_10__5_) );
  NOR2XL U60 ( .A(n10), .B(n41), .Y(ab_12__5_) );
  NOR2XL U61 ( .A(n10), .B(n49), .Y(ab_4__5_) );
  XOR2X1 U62 ( .A(ab_1__1_), .B(ab_0__2_), .Y(SUMB_1__1_) );
  NOR2XL U63 ( .A(n55), .B(n38), .Y(ab_15__4_) );
  NOR2XL U64 ( .A(n55), .B(n39), .Y(ab_14__4_) );
  NOR2XL U65 ( .A(n55), .B(n40), .Y(ab_13__4_) );
  NOR2XL U66 ( .A(n55), .B(n41), .Y(ab_12__4_) );
  NOR2XL U67 ( .A(n55), .B(n42), .Y(ab_11__4_) );
  NOR2XL U68 ( .A(n55), .B(n43), .Y(ab_10__4_) );
  NOR2XL U69 ( .A(n44), .B(n55), .Y(ab_9__4_) );
  NOR2XL U70 ( .A(n55), .B(n45), .Y(ab_8__4_) );
  NOR2XL U71 ( .A(n55), .B(n46), .Y(ab_7__4_) );
  NOR2XL U72 ( .A(n55), .B(n47), .Y(ab_6__4_) );
  NOR2XL U73 ( .A(n55), .B(n48), .Y(ab_5__4_) );
  NOR2XL U74 ( .A(n55), .B(n49), .Y(ab_4__4_) );
  NOR2XL U75 ( .A(n55), .B(n50), .Y(ab_3__4_) );
  NOR2XL U76 ( .A(n55), .B(n51), .Y(ab_2__4_) );
  NAND2XL U77 ( .A(n30), .B(n28), .Y(n27) );
  NAND2XL U78 ( .A(n18), .B(A1_18_), .Y(n32) );
  NOR2XL U79 ( .A(n10), .B(n50), .Y(ab_3__5_) );
  INVX2 U80 ( .A(B[0]), .Y(n59) );
  INVX1 U81 ( .A(n28), .Y(n37) );
  AND2X2 U82 ( .A(n23), .B(n14), .Y(PRODUCT_17_) );
  XOR2X1 U83 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U84 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  XOR2X1 U85 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U86 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U87 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n18) );
  AND2X2 U88 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n19) );
  AND2X2 U89 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n20) );
  AND2X2 U90 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n21) );
  XOR2X1 U91 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2X1 U92 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  INVX1 U93 ( .A(A[2]), .Y(n51) );
  INVX1 U94 ( .A(A[3]), .Y(n50) );
  INVX1 U95 ( .A(A[4]), .Y(n49) );
  INVX1 U96 ( .A(A[6]), .Y(n47) );
  INVX1 U97 ( .A(A[5]), .Y(n48) );
  INVX1 U98 ( .A(A[9]), .Y(n44) );
  INVX1 U99 ( .A(A[7]), .Y(n46) );
  INVX1 U100 ( .A(A[8]), .Y(n45) );
  INVX1 U101 ( .A(A[10]), .Y(n43) );
  INVX1 U102 ( .A(A[11]), .Y(n42) );
  INVX1 U103 ( .A(A[12]), .Y(n41) );
  INVX1 U104 ( .A(A[13]), .Y(n40) );
  INVX1 U105 ( .A(A[14]), .Y(n39) );
  INVX1 U106 ( .A(A[15]), .Y(n38) );
  OR2X1 U107 ( .A(n20), .B(A1_15_), .Y(n23) );
  XOR2X1 U108 ( .A(n24), .B(n14), .Y(PRODUCT_18_) );
  NAND2X1 U109 ( .A(n19), .B(A1_17_), .Y(n28) );
  XNOR2X1 U110 ( .A(n27), .B(n29), .Y(PRODUCT_19_) );
  NAND2BX1 U111 ( .AN(n34), .B(n32), .Y(n31) );
  XOR2X1 U112 ( .A(n21), .B(A1_19_), .Y(n35) );
  XOR2X1 U113 ( .A(n36), .B(n35), .Y(PRODUCT_21_) );
  NOR2X1 U114 ( .A(n44), .B(n8), .Y(ab_9__6_) );
  NOR2X1 U115 ( .A(n44), .B(n10), .Y(ab_9__5_) );
  NOR2X1 U116 ( .A(n44), .B(n56), .Y(ab_9__3_) );
  NOR2X1 U117 ( .A(n44), .B(n11), .Y(ab_9__2_) );
  NOR2X1 U118 ( .A(n44), .B(n12), .Y(ab_9__1_) );
  NOR2X1 U119 ( .A(n44), .B(n59), .Y(ab_9__0_) );
  NOR2X1 U120 ( .A(n7), .B(n45), .Y(ab_8__6_) );
  NOR2X1 U121 ( .A(n56), .B(n45), .Y(ab_8__3_) );
  NOR2X1 U122 ( .A(n11), .B(n45), .Y(ab_8__2_) );
  NOR2X1 U123 ( .A(n12), .B(n45), .Y(ab_8__1_) );
  NOR2X1 U124 ( .A(n59), .B(n45), .Y(ab_8__0_) );
  NOR2X1 U125 ( .A(n8), .B(n46), .Y(ab_7__6_) );
  NOR2X1 U126 ( .A(n56), .B(n46), .Y(ab_7__3_) );
  NOR2X1 U127 ( .A(n11), .B(n46), .Y(ab_7__2_) );
  NOR2X1 U128 ( .A(n12), .B(n46), .Y(ab_7__1_) );
  NOR2X1 U129 ( .A(n59), .B(n46), .Y(ab_7__0_) );
  NOR2X1 U130 ( .A(n7), .B(n47), .Y(ab_6__6_) );
  NOR2X1 U131 ( .A(n56), .B(n47), .Y(ab_6__3_) );
  NOR2X1 U132 ( .A(n11), .B(n47), .Y(ab_6__2_) );
  NOR2X1 U133 ( .A(n12), .B(n47), .Y(ab_6__1_) );
  NOR2X1 U134 ( .A(n59), .B(n47), .Y(ab_6__0_) );
  NOR2X1 U135 ( .A(n8), .B(n48), .Y(ab_5__6_) );
  NOR2X1 U136 ( .A(n56), .B(n48), .Y(ab_5__3_) );
  NOR2X1 U137 ( .A(n12), .B(n48), .Y(ab_5__1_) );
  NOR2X1 U138 ( .A(n59), .B(n48), .Y(ab_5__0_) );
  NOR2X1 U139 ( .A(n8), .B(n49), .Y(ab_4__6_) );
  NOR2X1 U140 ( .A(n56), .B(n49), .Y(ab_4__3_) );
  NOR2X1 U141 ( .A(n12), .B(n49), .Y(ab_4__1_) );
  NOR2X1 U142 ( .A(n59), .B(n49), .Y(ab_4__0_) );
  NOR2X1 U143 ( .A(n8), .B(n50), .Y(ab_3__6_) );
  NOR2X1 U144 ( .A(n56), .B(n50), .Y(ab_3__3_) );
  NOR2X1 U145 ( .A(n59), .B(n50), .Y(ab_3__0_) );
  NOR2X1 U146 ( .A(n8), .B(n51), .Y(ab_2__6_) );
  NOR2X1 U147 ( .A(n10), .B(n51), .Y(ab_2__5_) );
  NOR2X1 U148 ( .A(n56), .B(n51), .Y(ab_2__3_) );
  NOR2X1 U149 ( .A(n58), .B(n51), .Y(ab_2__1_) );
  NOR2X1 U150 ( .A(n59), .B(n51), .Y(ab_2__0_) );
  NOR2X1 U151 ( .A(n8), .B(n38), .Y(ab_15__6_) );
  NOR2X1 U152 ( .A(n10), .B(n38), .Y(ab_15__5_) );
  NOR2X1 U153 ( .A(n56), .B(n38), .Y(ab_15__3_) );
  NOR2X1 U154 ( .A(n11), .B(n38), .Y(ab_15__2_) );
  NOR2X1 U155 ( .A(n12), .B(n38), .Y(ab_15__1_) );
  NOR2X1 U156 ( .A(n59), .B(n38), .Y(ab_15__0_) );
  NOR2X1 U157 ( .A(n7), .B(n39), .Y(ab_14__6_) );
  NOR2X1 U158 ( .A(n56), .B(n39), .Y(ab_14__3_) );
  NOR2X1 U159 ( .A(n11), .B(n39), .Y(ab_14__2_) );
  NOR2X1 U160 ( .A(n12), .B(n39), .Y(ab_14__1_) );
  NOR2X1 U161 ( .A(n59), .B(n39), .Y(ab_14__0_) );
  NOR2X1 U162 ( .A(n8), .B(n40), .Y(ab_13__6_) );
  NOR2X1 U163 ( .A(n56), .B(n40), .Y(ab_13__3_) );
  NOR2X1 U164 ( .A(n11), .B(n40), .Y(ab_13__2_) );
  NOR2X1 U165 ( .A(n12), .B(n40), .Y(ab_13__1_) );
  NOR2X1 U166 ( .A(n59), .B(n40), .Y(ab_13__0_) );
  NOR2X1 U167 ( .A(n7), .B(n41), .Y(ab_12__6_) );
  NOR2X1 U168 ( .A(n56), .B(n41), .Y(ab_12__3_) );
  NOR2X1 U169 ( .A(n11), .B(n41), .Y(ab_12__2_) );
  NOR2X1 U170 ( .A(n12), .B(n41), .Y(ab_12__1_) );
  NOR2X1 U171 ( .A(n59), .B(n41), .Y(ab_12__0_) );
  NOR2X1 U172 ( .A(n8), .B(n42), .Y(ab_11__6_) );
  NOR2X1 U173 ( .A(n10), .B(n42), .Y(ab_11__5_) );
  NOR2X1 U174 ( .A(n56), .B(n42), .Y(ab_11__3_) );
  NOR2X1 U175 ( .A(n11), .B(n42), .Y(ab_11__2_) );
  NOR2X1 U176 ( .A(n12), .B(n42), .Y(ab_11__1_) );
  NOR2X1 U177 ( .A(n59), .B(n42), .Y(ab_11__0_) );
  NOR2X1 U178 ( .A(n8), .B(n43), .Y(ab_10__6_) );
  NOR2X1 U179 ( .A(n56), .B(n43), .Y(ab_10__3_) );
  NOR2X1 U180 ( .A(n11), .B(n43), .Y(ab_10__2_) );
  NOR2X1 U181 ( .A(n12), .B(n43), .Y(ab_10__1_) );
  NOR2X1 U182 ( .A(n59), .B(n43), .Y(ab_10__0_) );
  NOR2X1 U183 ( .A(n56), .B(n53), .Y(ab_0__3_) );
  AND3X1 U184 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
endmodule


module multi16_8 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_8_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(in_8bit[7]), .CK(clk), .RN(rst_n), .Q(
        in_8bit_b[7]) );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_16_ ( .D(n2), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n42), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n43), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n44), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_14_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 out_reg_10_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_6_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 out_reg_5_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_1_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 out_reg_0_ ( .D(n119), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n121), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 in_8bit_b_reg_5_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQXL sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQXL sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQXL sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQX4 in_8bit_b_reg_3_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX4 in_8bit_b_reg_1_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  DFFRHQX4 in_17bit_b_reg_1_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[1]) );
  DFFRHQX2 in_8bit_b_reg_4_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  DFFRHQX2 in_17bit_b_reg_0_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX2 in_8bit_b_reg_2_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  INVX1 U3 ( .A(n1), .Y(n118) );
  INVX1 U4 ( .A(in_17bit[0]), .Y(n3) );
  INVX1 U5 ( .A(n70), .Y(n42) );
  AOI22X1 U6 ( .A0(n1), .A1(N20), .B0(in_17bit[15]), .B1(n118), .Y(n70) );
  INVX1 U7 ( .A(in_17bit[15]), .Y(n18) );
  INVX1 U8 ( .A(n85), .Y(n117) );
  AOI22X1 U9 ( .A0(in_17bit[0]), .A1(n1), .B0(in_17bit[0]), .B1(n118), .Y(n85)
         );
  INVX1 U10 ( .A(n84), .Y(n95) );
  AOI22X1 U11 ( .A0(N6), .A1(n1), .B0(in_17bit[1]), .B1(n118), .Y(n84) );
  INVX1 U12 ( .A(n83), .Y(n94) );
  AOI22X1 U13 ( .A0(N7), .A1(n1), .B0(in_17bit[2]), .B1(n118), .Y(n83) );
  INVX1 U14 ( .A(n82), .Y(n93) );
  AOI22X1 U15 ( .A0(N8), .A1(n1), .B0(in_17bit[3]), .B1(n118), .Y(n82) );
  INVX1 U16 ( .A(n81), .Y(n92) );
  AOI22X1 U17 ( .A0(N9), .A1(n1), .B0(in_17bit[4]), .B1(n118), .Y(n81) );
  INVX1 U18 ( .A(n80), .Y(n91) );
  AOI22X1 U19 ( .A0(N10), .A1(n1), .B0(in_17bit[5]), .B1(n118), .Y(n80) );
  INVX1 U20 ( .A(n79), .Y(n90) );
  AOI22X1 U21 ( .A0(N11), .A1(n1), .B0(in_17bit[6]), .B1(n118), .Y(n79) );
  INVX1 U22 ( .A(n78), .Y(n89) );
  AOI22X1 U23 ( .A0(N12), .A1(n1), .B0(in_17bit[7]), .B1(n118), .Y(n78) );
  INVX1 U24 ( .A(n77), .Y(n49) );
  AOI22X1 U25 ( .A0(N13), .A1(n1), .B0(in_17bit[8]), .B1(n118), .Y(n77) );
  INVX1 U26 ( .A(n76), .Y(n48) );
  AOI22X1 U27 ( .A0(N14), .A1(n1), .B0(in_17bit[9]), .B1(n118), .Y(n76) );
  INVX1 U28 ( .A(n75), .Y(n47) );
  AOI22X1 U29 ( .A0(N15), .A1(n1), .B0(in_17bit[10]), .B1(n118), .Y(n75) );
  INVX1 U30 ( .A(n74), .Y(n46) );
  AOI22X1 U31 ( .A0(N16), .A1(n1), .B0(in_17bit[11]), .B1(n118), .Y(n74) );
  INVX1 U32 ( .A(n73), .Y(n45) );
  AOI22X1 U33 ( .A0(N17), .A1(n1), .B0(in_17bit[12]), .B1(n118), .Y(n73) );
  INVX1 U34 ( .A(n72), .Y(n44) );
  AOI22X1 U35 ( .A0(N18), .A1(n1), .B0(in_17bit[13]), .B1(n118), .Y(n72) );
  INVX1 U36 ( .A(n71), .Y(n43) );
  AOI22X1 U37 ( .A0(N19), .A1(n1), .B0(in_17bit[14]), .B1(n118), .Y(n71) );
  INVX1 U38 ( .A(in_17bit[3]), .Y(n6) );
  INVX1 U39 ( .A(in_17bit[4]), .Y(n7) );
  INVX1 U40 ( .A(in_17bit[5]), .Y(n8) );
  INVX1 U41 ( .A(in_17bit[6]), .Y(n9) );
  INVX1 U42 ( .A(in_17bit[7]), .Y(n10) );
  INVX1 U43 ( .A(in_17bit[8]), .Y(n11) );
  INVX1 U44 ( .A(in_17bit[9]), .Y(n12) );
  INVX1 U45 ( .A(in_17bit[10]), .Y(n13) );
  INVX1 U46 ( .A(in_17bit[1]), .Y(n4) );
  INVX1 U47 ( .A(in_17bit[11]), .Y(n14) );
  INVX1 U48 ( .A(in_17bit[12]), .Y(n15) );
  INVX1 U49 ( .A(in_17bit[2]), .Y(n5) );
  INVX1 U50 ( .A(in_17bit[13]), .Y(n16) );
  INVX1 U51 ( .A(in_17bit[14]), .Y(n17) );
  BUFX3 U52 ( .A(in_17bit[16]), .Y(n1) );
  INVX1 U53 ( .A(n2), .Y(n120) );
  INVX1 U54 ( .A(n51), .Y(n106) );
  AOI22X1 U55 ( .A0(N82), .A1(n2), .B0(sum_b[18]), .B1(n120), .Y(n51) );
  INVX1 U56 ( .A(n88), .Y(n104) );
  AOI22X1 U57 ( .A0(N84), .A1(n2), .B0(sum_b[20]), .B1(n120), .Y(n88) );
  INVX1 U58 ( .A(n50), .Y(n105) );
  AOI22X1 U59 ( .A0(n2), .A1(N83), .B0(sum_b[19]), .B1(n120), .Y(n50) );
  INVX1 U60 ( .A(N71), .Y(n26) );
  INVX1 U61 ( .A(sum_b[8]), .Y(n27) );
  INVX1 U62 ( .A(sum_b[9]), .Y(n28) );
  INVX1 U63 ( .A(sum_b[10]), .Y(n29) );
  INVX1 U64 ( .A(sum_b[11]), .Y(n30) );
  INVX1 U65 ( .A(sum_b[12]), .Y(n31) );
  INVX1 U66 ( .A(n87), .Y(n103) );
  AOI22X1 U67 ( .A0(N85), .A1(n2), .B0(sum_b[21]), .B1(n120), .Y(n87) );
  INVX1 U68 ( .A(n86), .Y(n102) );
  AOI22X1 U69 ( .A0(N86), .A1(n2), .B0(sum_b[22]), .B1(n120), .Y(n86) );
  INVX1 U70 ( .A(sum_b[22]), .Y(n41) );
  INVX1 U71 ( .A(n55), .Y(n110) );
  AOI22X1 U72 ( .A0(N78), .A1(n2), .B0(sum_b[14]), .B1(n120), .Y(n55) );
  INVX1 U73 ( .A(n54), .Y(n109) );
  AOI22X1 U74 ( .A0(N79), .A1(n2), .B0(sum_b[15]), .B1(n120), .Y(n54) );
  INVX1 U75 ( .A(n53), .Y(n108) );
  AOI22X1 U76 ( .A0(N80), .A1(n2), .B0(sum_b[16]), .B1(n120), .Y(n53) );
  INVX1 U77 ( .A(n52), .Y(n107) );
  AOI22X1 U78 ( .A0(N81), .A1(n2), .B0(sum_b[17]), .B1(n120), .Y(n52) );
  INVX1 U79 ( .A(in_8bit[0]), .Y(n20) );
  INVX1 U80 ( .A(sum_b[13]), .Y(n32) );
  INVX1 U81 ( .A(sum_b[14]), .Y(n33) );
  INVX1 U82 ( .A(sum_b[15]), .Y(n34) );
  INVX1 U83 ( .A(sum_b[16]), .Y(n35) );
  INVX1 U84 ( .A(n63), .Y(n96) );
  AOI22X1 U85 ( .A0(in_8bit[7]), .A1(N44), .B0(in_8bit[6]), .B1(n122), .Y(n63)
         );
  INVX1 U86 ( .A(in_8bit[6]), .Y(n19) );
  INVX1 U87 ( .A(n60), .Y(n115) );
  AOI22X1 U88 ( .A0(N73), .A1(n2), .B0(sum_b[9]), .B1(n120), .Y(n60) );
  INVX1 U89 ( .A(n59), .Y(n114) );
  AOI22X1 U90 ( .A0(N74), .A1(n2), .B0(sum_b[10]), .B1(n120), .Y(n59) );
  INVX1 U91 ( .A(n58), .Y(n113) );
  AOI22X1 U92 ( .A0(N75), .A1(n2), .B0(sum_b[11]), .B1(n120), .Y(n58) );
  INVX1 U93 ( .A(n57), .Y(n112) );
  AOI22X1 U94 ( .A0(N76), .A1(n2), .B0(sum_b[12]), .B1(n120), .Y(n57) );
  INVX1 U95 ( .A(n56), .Y(n111) );
  AOI22X1 U96 ( .A0(N77), .A1(n2), .B0(sum_b[13]), .B1(n120), .Y(n56) );
  INVX1 U97 ( .A(n67), .Y(n100) );
  AOI22X1 U98 ( .A0(N40), .A1(in_8bit[7]), .B0(in_8bit[2]), .B1(n122), .Y(n67)
         );
  INVX1 U99 ( .A(n66), .Y(n99) );
  AOI22X1 U100 ( .A0(N41), .A1(in_8bit[7]), .B0(in_8bit[3]), .B1(n122), .Y(n66) );
  INVX1 U101 ( .A(n65), .Y(n98) );
  AOI22X1 U102 ( .A0(N42), .A1(in_8bit[7]), .B0(in_8bit[4]), .B1(n122), .Y(n65) );
  INVX1 U103 ( .A(n64), .Y(n97) );
  AOI22X1 U104 ( .A0(N43), .A1(in_8bit[7]), .B0(in_8bit[5]), .B1(n122), .Y(n64) );
  INVX1 U105 ( .A(sum_b[17]), .Y(n36) );
  INVX1 U106 ( .A(sum_b[18]), .Y(n37) );
  INVX1 U107 ( .A(sum_b[19]), .Y(n38) );
  INVX1 U108 ( .A(sum_b[20]), .Y(n39) );
  INVX1 U109 ( .A(sum_b[21]), .Y(n40) );
  INVX1 U110 ( .A(in_8bit[1]), .Y(n21) );
  INVX1 U111 ( .A(in_8bit[2]), .Y(n22) );
  INVX1 U112 ( .A(in_8bit[3]), .Y(n23) );
  INVX1 U113 ( .A(in_8bit[4]), .Y(n24) );
  INVX1 U114 ( .A(in_8bit[5]), .Y(n25) );
  BUFX3 U115 ( .A(sum_b[23]), .Y(n2) );
  INVX1 U116 ( .A(n62), .Y(n119) );
  AOI22X1 U117 ( .A0(N71), .A1(n2), .B0(N71), .B1(n120), .Y(n62) );
  INVX1 U118 ( .A(n61), .Y(n116) );
  AOI22X1 U119 ( .A0(N72), .A1(n2), .B0(sum_b[8]), .B1(n120), .Y(n61) );
  XOR2X1 U120 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  INVX1 U121 ( .A(n69), .Y(n121) );
  AOI22X1 U122 ( .A0(in_8bit[0]), .A1(in_8bit[7]), .B0(in_8bit[0]), .B1(n122), 
        .Y(n69) );
  INVX1 U123 ( .A(n68), .Y(n101) );
  AOI22X1 U124 ( .A0(N39), .A1(in_8bit[7]), .B0(in_8bit[1]), .B1(n122), .Y(n68) );
  INVX1 U125 ( .A(in_8bit[7]), .Y(n122) );
  XOR2X1 U126 ( .A(n41), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U127 ( .A(sub_add_97_b0_carry[14]), .B(n40), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U128 ( .A(n40), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U129 ( .A(sub_add_97_b0_carry[13]), .B(n39), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U130 ( .A(n39), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U131 ( .A(sub_add_97_b0_carry[12]), .B(n38), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U132 ( .A(n38), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U133 ( .A(sub_add_97_b0_carry[11]), .B(n37), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U134 ( .A(n37), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U135 ( .A(sub_add_97_b0_carry[10]), .B(n36), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U136 ( .A(n36), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U137 ( .A(sub_add_97_b0_carry[9]), .B(n35), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U138 ( .A(n35), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U139 ( .A(sub_add_97_b0_carry[8]), .B(n34), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U140 ( .A(n34), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U141 ( .A(sub_add_97_b0_carry[7]), .B(n33), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U142 ( .A(n33), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U143 ( .A(sub_add_97_b0_carry[6]), .B(n32), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U144 ( .A(n32), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U145 ( .A(sub_add_97_b0_carry[5]), .B(n31), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U146 ( .A(n31), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U147 ( .A(sub_add_97_b0_carry[4]), .B(n30), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U148 ( .A(n30), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U149 ( .A(sub_add_97_b0_carry[3]), .B(n29), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U150 ( .A(n29), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U151 ( .A(sub_add_97_b0_carry[2]), .B(n28), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U152 ( .A(n28), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U153 ( .A(n26), .B(n27), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U154 ( .A(n27), .B(n26), .Y(N72) );
  XOR2X1 U155 ( .A(n19), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U156 ( .A(sub_add_61_b0_carry[5]), .B(n25), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U157 ( .A(n25), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U158 ( .A(sub_add_61_b0_carry[4]), .B(n24), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U159 ( .A(n24), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U160 ( .A(sub_add_61_b0_carry[3]), .B(n23), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U161 ( .A(n23), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U162 ( .A(sub_add_61_b0_carry[2]), .B(n22), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U163 ( .A(n22), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U164 ( .A(n20), .B(n21), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U165 ( .A(n21), .B(n20), .Y(N39) );
  XOR2X1 U166 ( .A(n18), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U167 ( .A(sub_add_52_b0_carry[14]), .B(n17), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U168 ( .A(n17), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U169 ( .A(sub_add_52_b0_carry[13]), .B(n16), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U170 ( .A(n16), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U171 ( .A(sub_add_52_b0_carry[12]), .B(n15), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U172 ( .A(n15), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U173 ( .A(sub_add_52_b0_carry[11]), .B(n14), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U174 ( .A(n14), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U175 ( .A(sub_add_52_b0_carry[10]), .B(n13), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U176 ( .A(n13), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U177 ( .A(sub_add_52_b0_carry[9]), .B(n12), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U178 ( .A(n12), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U179 ( .A(sub_add_52_b0_carry[8]), .B(n11), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U180 ( .A(n11), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U181 ( .A(sub_add_52_b0_carry[7]), .B(n10), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U182 ( .A(n10), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U183 ( .A(sub_add_52_b0_carry[6]), .B(n9), .Y(sub_add_52_b0_carry[7])
         );
  XOR2X1 U184 ( .A(n9), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U185 ( .A(sub_add_52_b0_carry[5]), .B(n8), .Y(sub_add_52_b0_carry[6])
         );
  XOR2X1 U186 ( .A(n8), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U187 ( .A(sub_add_52_b0_carry[4]), .B(n7), .Y(sub_add_52_b0_carry[5])
         );
  XOR2X1 U188 ( .A(n7), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U189 ( .A(sub_add_52_b0_carry[3]), .B(n6), .Y(sub_add_52_b0_carry[4])
         );
  XOR2X1 U190 ( .A(n6), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U191 ( .A(sub_add_52_b0_carry[2]), .B(n5), .Y(sub_add_52_b0_carry[3])
         );
  XOR2X1 U192 ( .A(n5), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U193 ( .A(n3), .B(n4), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U194 ( .A(n4), .B(n3), .Y(N6) );
endmodule


module multi16_7_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFX2 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  CMPR32X1 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .C(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S3_2_5 ( .A(ab_2__5_), .B(n2), .C(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  CMPR32X1 S2_2_4 ( .A(ab_2__4_), .B(n5), .C(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  CMPR32X1 S2_2_3 ( .A(ab_2__3_), .B(n4), .C(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  CMPR32X1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .C(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  CMPR32X1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .C(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .C(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n6), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n3), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .C(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .C(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .C(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  CMPR32X1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .C(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .C(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .C(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX1 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFHX1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .CI(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  ADDFHX1 S2_14_2 ( .A(ab_14__2_), .B(CARRYB_13__2_), .CI(SUMB_13__3_), .CO(
        CARRYB_14__2_), .S(SUMB_14__2_) );
  ADDFHX1 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFHX1 S4_1 ( .A(ab_15__1_), .B(CARRYB_14__1_), .CI(SUMB_14__2_), .CO(
        CARRYB_15__1_), .S(SUMB_15__1_) );
  ADDFHX1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .CI(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  ADDFHX1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .CI(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  ADDFHX1 S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFHX1 S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFHXL S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFHX1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .CI(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  ADDFX2 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  INVX2 U2 ( .A(A[1]), .Y(n47) );
  INVX4 U3 ( .A(B[3]), .Y(n52) );
  XOR2X2 U4 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  OAI21X1 U5 ( .A0(n29), .A1(n10), .B0(n28), .Y(n31) );
  CLKINVX3 U6 ( .A(A[0]), .Y(n48) );
  NOR2X1 U7 ( .A(n49), .B(n48), .Y(ab_0__6_) );
  NOR2X1 U8 ( .A(n51), .B(n48), .Y(ab_0__4_) );
  NOR2X1 U9 ( .A(n52), .B(n47), .Y(ab_1__3_) );
  INVX1 U10 ( .A(n8), .Y(n9) );
  NOR2X1 U11 ( .A(n52), .B(n48), .Y(ab_0__3_) );
  INVX1 U12 ( .A(A[2]), .Y(n46) );
  INVX1 U13 ( .A(B[1]), .Y(n54) );
  OR2X2 U14 ( .A(n16), .B(A1_17_), .Y(n26) );
  INVX1 U15 ( .A(B[0]), .Y(n55) );
  INVX1 U16 ( .A(B[6]), .Y(n7) );
  AND2X2 U17 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n2) );
  AND2X2 U18 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n3) );
  AND2X2 U19 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n4) );
  AND2X2 U20 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n5) );
  AND2X2 U21 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n6) );
  OAI21X2 U22 ( .A0(n23), .A1(n19), .B0(n22), .Y(n12) );
  NOR2X2 U23 ( .A(n51), .B(n47), .Y(ab_1__4_) );
  NOR2X1 U24 ( .A(n52), .B(n46), .Y(ab_2__3_) );
  INVX1 U25 ( .A(B[6]), .Y(n49) );
  INVX4 U26 ( .A(B[5]), .Y(n50) );
  NOR2X1 U27 ( .A(n53), .B(n46), .Y(ab_2__2_) );
  NOR2X1 U28 ( .A(n51), .B(n46), .Y(ab_2__4_) );
  NOR2X2 U29 ( .A(n50), .B(n48), .Y(ab_0__5_) );
  NOR2X2 U30 ( .A(n53), .B(n47), .Y(ab_1__2_) );
  INVX4 U31 ( .A(B[4]), .Y(n51) );
  NOR2XL U32 ( .A(n52), .B(n33), .Y(ab_15__3_) );
  NOR2XL U33 ( .A(n52), .B(n34), .Y(ab_14__3_) );
  NOR2XL U34 ( .A(n52), .B(n35), .Y(ab_13__3_) );
  NOR2XL U35 ( .A(n52), .B(n36), .Y(ab_12__3_) );
  NOR2XL U36 ( .A(n52), .B(n37), .Y(ab_11__3_) );
  NOR2XL U37 ( .A(n52), .B(n38), .Y(ab_10__3_) );
  NOR2XL U38 ( .A(n39), .B(n52), .Y(ab_9__3_) );
  NOR2XL U39 ( .A(n52), .B(n40), .Y(ab_8__3_) );
  NOR2XL U40 ( .A(n52), .B(n41), .Y(ab_7__3_) );
  NOR2XL U41 ( .A(n52), .B(n42), .Y(ab_6__3_) );
  NOR2XL U42 ( .A(n52), .B(n43), .Y(ab_5__3_) );
  NOR2XL U43 ( .A(n52), .B(n44), .Y(ab_4__3_) );
  NOR2XL U44 ( .A(n52), .B(n45), .Y(ab_3__3_) );
  AOI21X2 U45 ( .A0(n26), .A1(n12), .B0(n32), .Y(n10) );
  NOR2X2 U46 ( .A(n47), .B(n54), .Y(ab_1__1_) );
  INVX4 U47 ( .A(B[2]), .Y(n53) );
  NOR2XL U48 ( .A(n7), .B(n47), .Y(ab_1__6_) );
  NOR2XL U49 ( .A(n7), .B(n46), .Y(ab_2__6_) );
  NOR2XL U50 ( .A(n7), .B(n45), .Y(ab_3__6_) );
  NOR2XL U51 ( .A(n7), .B(n44), .Y(ab_4__6_) );
  NOR2XL U52 ( .A(n7), .B(n43), .Y(ab_5__6_) );
  NOR2X1 U53 ( .A(n53), .B(n48), .Y(ab_0__2_) );
  XNOR2XL U54 ( .A(n24), .B(n12), .Y(PRODUCT_19_) );
  NAND2X2 U55 ( .A(n17), .B(A1_15_), .Y(n19) );
  INVXL U56 ( .A(ab_0__2_), .Y(n8) );
  INVXL U57 ( .A(B[1]), .Y(n11) );
  XOR2X1 U58 ( .A(n27), .B(n10), .Y(PRODUCT_20_) );
  NAND2BXL U59 ( .AN(n23), .B(n22), .Y(n21) );
  NOR2XL U60 ( .A(n53), .B(n45), .Y(ab_3__2_) );
  NOR2XL U61 ( .A(n53), .B(n44), .Y(ab_4__2_) );
  NOR2XL U62 ( .A(n53), .B(n43), .Y(ab_5__2_) );
  XOR2X1 U63 ( .A(n21), .B(n19), .Y(PRODUCT_18_) );
  NOR2XL U64 ( .A(n50), .B(n40), .Y(ab_8__5_) );
  NOR2XL U65 ( .A(n50), .B(n34), .Y(ab_14__5_) );
  NOR2XL U66 ( .A(n50), .B(n41), .Y(ab_7__5_) );
  NOR2XL U67 ( .A(n50), .B(n42), .Y(ab_6__5_) );
  NOR2XL U68 ( .A(n50), .B(n35), .Y(ab_13__5_) );
  NOR2XL U69 ( .A(n50), .B(n43), .Y(ab_5__5_) );
  NOR2XL U70 ( .A(n50), .B(n38), .Y(ab_10__5_) );
  NOR2XL U71 ( .A(n50), .B(n36), .Y(ab_12__5_) );
  NOR2XL U72 ( .A(n50), .B(n44), .Y(ab_4__5_) );
  XOR2X1 U73 ( .A(ab_1__1_), .B(n9), .Y(SUMB_1__1_) );
  NOR2XL U74 ( .A(n51), .B(n33), .Y(ab_15__4_) );
  NOR2XL U75 ( .A(n51), .B(n34), .Y(ab_14__4_) );
  NOR2XL U76 ( .A(n51), .B(n35), .Y(ab_13__4_) );
  NOR2XL U77 ( .A(n51), .B(n36), .Y(ab_12__4_) );
  NOR2XL U78 ( .A(n51), .B(n37), .Y(ab_11__4_) );
  NOR2XL U79 ( .A(n51), .B(n38), .Y(ab_10__4_) );
  NOR2XL U80 ( .A(n39), .B(n51), .Y(ab_9__4_) );
  NOR2XL U81 ( .A(n51), .B(n40), .Y(ab_8__4_) );
  NOR2XL U82 ( .A(n51), .B(n41), .Y(ab_7__4_) );
  NOR2XL U83 ( .A(n51), .B(n42), .Y(ab_6__4_) );
  NOR2XL U84 ( .A(n51), .B(n43), .Y(ab_5__4_) );
  NOR2XL U85 ( .A(n51), .B(n44), .Y(ab_4__4_) );
  NOR2XL U86 ( .A(n51), .B(n45), .Y(ab_3__4_) );
  NAND2XL U87 ( .A(n26), .B(n25), .Y(n24) );
  NAND2XL U88 ( .A(n14), .B(A1_16_), .Y(n22) );
  NAND2XL U89 ( .A(n15), .B(A1_18_), .Y(n28) );
  AND2X1 U90 ( .A(n20), .B(n19), .Y(PRODUCT_17_) );
  AND2X1 U91 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n14) );
  XOR2XL U92 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  NOR2XL U93 ( .A(n50), .B(n47), .Y(ab_1__5_) );
  NOR2XL U94 ( .A(n50), .B(n45), .Y(ab_3__5_) );
  INVX1 U95 ( .A(n25), .Y(n32) );
  XOR2X1 U96 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U97 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  XOR2X1 U98 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  XOR2X1 U99 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U100 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U101 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n15) );
  AND2X2 U102 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n16) );
  AND2X2 U103 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n17) );
  AND2X2 U104 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n18) );
  XOR2X1 U105 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2X1 U106 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  XOR2X1 U107 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  INVX1 U108 ( .A(A[3]), .Y(n45) );
  INVX1 U109 ( .A(A[4]), .Y(n44) );
  INVX1 U110 ( .A(A[6]), .Y(n42) );
  INVX1 U111 ( .A(A[5]), .Y(n43) );
  INVX1 U112 ( .A(A[9]), .Y(n39) );
  INVX1 U113 ( .A(A[7]), .Y(n41) );
  INVX1 U114 ( .A(A[8]), .Y(n40) );
  INVX1 U115 ( .A(A[10]), .Y(n38) );
  INVX1 U116 ( .A(A[11]), .Y(n37) );
  INVX1 U117 ( .A(A[12]), .Y(n36) );
  INVX1 U118 ( .A(A[13]), .Y(n35) );
  INVX1 U119 ( .A(A[14]), .Y(n34) );
  INVX1 U120 ( .A(A[15]), .Y(n33) );
  OR2X1 U121 ( .A(n17), .B(A1_15_), .Y(n20) );
  NOR2X1 U122 ( .A(n14), .B(A1_16_), .Y(n23) );
  NAND2X1 U123 ( .A(n16), .B(A1_17_), .Y(n25) );
  NOR2X1 U124 ( .A(n15), .B(A1_18_), .Y(n29) );
  NAND2BX1 U125 ( .AN(n29), .B(n28), .Y(n27) );
  XOR2X1 U126 ( .A(n18), .B(A1_19_), .Y(n30) );
  XOR2X1 U127 ( .A(n31), .B(n30), .Y(PRODUCT_21_) );
  NOR2X1 U128 ( .A(n39), .B(n7), .Y(ab_9__6_) );
  NOR2X1 U129 ( .A(n39), .B(n50), .Y(ab_9__5_) );
  NOR2X1 U130 ( .A(n39), .B(n53), .Y(ab_9__2_) );
  NOR2X1 U131 ( .A(n39), .B(n11), .Y(ab_9__1_) );
  NOR2X1 U132 ( .A(n39), .B(n55), .Y(ab_9__0_) );
  NOR2X1 U133 ( .A(n7), .B(n40), .Y(ab_8__6_) );
  NOR2X1 U134 ( .A(n53), .B(n40), .Y(ab_8__2_) );
  NOR2X1 U135 ( .A(n11), .B(n40), .Y(ab_8__1_) );
  NOR2X1 U136 ( .A(n55), .B(n40), .Y(ab_8__0_) );
  NOR2X1 U137 ( .A(n7), .B(n41), .Y(ab_7__6_) );
  NOR2X1 U138 ( .A(n53), .B(n41), .Y(ab_7__2_) );
  NOR2X1 U139 ( .A(n11), .B(n41), .Y(ab_7__1_) );
  NOR2X1 U140 ( .A(n55), .B(n41), .Y(ab_7__0_) );
  NOR2X1 U141 ( .A(n7), .B(n42), .Y(ab_6__6_) );
  NOR2X1 U142 ( .A(n53), .B(n42), .Y(ab_6__2_) );
  NOR2X1 U143 ( .A(n11), .B(n42), .Y(ab_6__1_) );
  NOR2X1 U144 ( .A(n55), .B(n42), .Y(ab_6__0_) );
  NOR2X1 U145 ( .A(n11), .B(n43), .Y(ab_5__1_) );
  NOR2X1 U146 ( .A(n55), .B(n43), .Y(ab_5__0_) );
  NOR2X1 U147 ( .A(n11), .B(n44), .Y(ab_4__1_) );
  NOR2X1 U148 ( .A(n55), .B(n44), .Y(ab_4__0_) );
  NOR2X1 U149 ( .A(n54), .B(n45), .Y(ab_3__1_) );
  NOR2X1 U150 ( .A(n55), .B(n45), .Y(ab_3__0_) );
  NOR2X1 U151 ( .A(n50), .B(n46), .Y(ab_2__5_) );
  NOR2X1 U152 ( .A(n54), .B(n46), .Y(ab_2__1_) );
  NOR2X1 U153 ( .A(n55), .B(n46), .Y(ab_2__0_) );
  NOR2X1 U154 ( .A(n7), .B(n33), .Y(ab_15__6_) );
  NOR2X1 U155 ( .A(n50), .B(n33), .Y(ab_15__5_) );
  NOR2X1 U156 ( .A(n53), .B(n33), .Y(ab_15__2_) );
  NOR2X1 U157 ( .A(n11), .B(n33), .Y(ab_15__1_) );
  NOR2X1 U158 ( .A(n55), .B(n33), .Y(ab_15__0_) );
  NOR2X1 U159 ( .A(n7), .B(n34), .Y(ab_14__6_) );
  NOR2X1 U160 ( .A(n53), .B(n34), .Y(ab_14__2_) );
  NOR2X1 U161 ( .A(n11), .B(n34), .Y(ab_14__1_) );
  NOR2X1 U162 ( .A(n55), .B(n34), .Y(ab_14__0_) );
  NOR2X1 U163 ( .A(n7), .B(n35), .Y(ab_13__6_) );
  NOR2X1 U164 ( .A(n53), .B(n35), .Y(ab_13__2_) );
  NOR2X1 U165 ( .A(n11), .B(n35), .Y(ab_13__1_) );
  NOR2X1 U166 ( .A(n55), .B(n35), .Y(ab_13__0_) );
  NOR2X1 U167 ( .A(n7), .B(n36), .Y(ab_12__6_) );
  NOR2X1 U168 ( .A(n53), .B(n36), .Y(ab_12__2_) );
  NOR2X1 U169 ( .A(n11), .B(n36), .Y(ab_12__1_) );
  NOR2X1 U170 ( .A(n55), .B(n36), .Y(ab_12__0_) );
  NOR2X1 U171 ( .A(n7), .B(n37), .Y(ab_11__6_) );
  NOR2X1 U172 ( .A(n50), .B(n37), .Y(ab_11__5_) );
  NOR2X1 U173 ( .A(n53), .B(n37), .Y(ab_11__2_) );
  NOR2X1 U174 ( .A(n11), .B(n37), .Y(ab_11__1_) );
  NOR2X1 U175 ( .A(n55), .B(n37), .Y(ab_11__0_) );
  NOR2X1 U176 ( .A(n7), .B(n38), .Y(ab_10__6_) );
  NOR2X1 U177 ( .A(n53), .B(n38), .Y(ab_10__2_) );
  NOR2X1 U178 ( .A(n11), .B(n38), .Y(ab_10__1_) );
  NOR2X1 U179 ( .A(n55), .B(n38), .Y(ab_10__0_) );
  AND3X1 U180 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
endmodule


module multi16_7 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_7_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(in_8bit[7]), .CK(clk), .RN(rst_n), .Q(
        in_8bit_b[7]) );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 out_reg_16_ ( .D(n2), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_14_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n42), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n43), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n44), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_10_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 out_reg_6_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 out_reg_5_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_1_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_0_ ( .D(n119), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQX1 sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQX1 sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQX4 in_8bit_b_reg_3_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX4 in_17bit_b_reg_1_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[1]) );
  DFFRHQX4 in_17bit_b_reg_0_ ( .D(n121), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX4 in_8bit_b_reg_4_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  DFFRHQX4 in_8bit_b_reg_5_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX2 in_8bit_b_reg_1_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  INVX1 U3 ( .A(in_8bit[7]), .Y(n118) );
  INVX1 U4 ( .A(n1), .Y(n122) );
  INVX1 U5 ( .A(n149), .Y(n96) );
  AOI22X1 U6 ( .A0(in_8bit[7]), .A1(N44), .B0(in_8bit[6]), .B1(n118), .Y(n149)
         );
  INVX1 U7 ( .A(in_8bit[6]), .Y(n25) );
  INVX1 U8 ( .A(n142), .Y(n42) );
  AOI22X1 U9 ( .A0(n1), .A1(N20), .B0(in_17bit[15]), .B1(n122), .Y(n142) );
  INVX1 U10 ( .A(in_17bit[15]), .Y(n18) );
  INVX1 U11 ( .A(n139), .Y(n45) );
  AOI22X1 U12 ( .A0(N17), .A1(n1), .B0(in_17bit[12]), .B1(n122), .Y(n139) );
  INVX1 U13 ( .A(n140), .Y(n44) );
  AOI22X1 U14 ( .A0(N18), .A1(n1), .B0(in_17bit[13]), .B1(n122), .Y(n140) );
  INVX1 U15 ( .A(n141), .Y(n43) );
  AOI22X1 U16 ( .A0(N19), .A1(n1), .B0(in_17bit[14]), .B1(n122), .Y(n141) );
  INVX1 U17 ( .A(in_17bit[0]), .Y(n3) );
  INVX1 U18 ( .A(in_17bit[1]), .Y(n4) );
  INVX1 U19 ( .A(in_17bit[2]), .Y(n5) );
  INVX1 U20 ( .A(in_17bit[3]), .Y(n6) );
  INVX1 U21 ( .A(in_17bit[4]), .Y(n7) );
  INVX1 U22 ( .A(n135), .Y(n49) );
  AOI22X1 U23 ( .A0(N13), .A1(n1), .B0(in_17bit[8]), .B1(n122), .Y(n135) );
  INVX1 U24 ( .A(n136), .Y(n48) );
  AOI22X1 U25 ( .A0(N14), .A1(n1), .B0(in_17bit[9]), .B1(n122), .Y(n136) );
  INVX1 U26 ( .A(n137), .Y(n47) );
  AOI22X1 U27 ( .A0(N15), .A1(n1), .B0(in_17bit[10]), .B1(n122), .Y(n137) );
  INVX1 U28 ( .A(n138), .Y(n46) );
  AOI22X1 U29 ( .A0(N16), .A1(n1), .B0(in_17bit[11]), .B1(n122), .Y(n138) );
  INVX1 U30 ( .A(in_17bit[5]), .Y(n8) );
  INVX1 U31 ( .A(in_17bit[6]), .Y(n9) );
  INVX1 U32 ( .A(in_17bit[7]), .Y(n10) );
  INVX1 U33 ( .A(in_17bit[8]), .Y(n11) );
  INVX1 U34 ( .A(n132), .Y(n91) );
  AOI22X1 U35 ( .A0(N10), .A1(n1), .B0(in_17bit[5]), .B1(n122), .Y(n132) );
  INVX1 U36 ( .A(n130), .Y(n93) );
  AOI22X1 U37 ( .A0(N8), .A1(n1), .B0(in_17bit[3]), .B1(n122), .Y(n130) );
  INVX1 U38 ( .A(n131), .Y(n92) );
  AOI22X1 U39 ( .A0(N9), .A1(n1), .B0(in_17bit[4]), .B1(n122), .Y(n131) );
  INVX1 U40 ( .A(n133), .Y(n90) );
  AOI22X1 U41 ( .A0(N11), .A1(n1), .B0(in_17bit[6]), .B1(n122), .Y(n133) );
  INVX1 U42 ( .A(n134), .Y(n89) );
  AOI22X1 U43 ( .A0(N12), .A1(n1), .B0(in_17bit[7]), .B1(n122), .Y(n134) );
  INVX1 U44 ( .A(in_17bit[9]), .Y(n12) );
  INVX1 U45 ( .A(in_17bit[10]), .Y(n13) );
  INVX1 U46 ( .A(in_17bit[11]), .Y(n14) );
  INVX1 U47 ( .A(in_17bit[12]), .Y(n15) );
  INVX1 U48 ( .A(in_17bit[13]), .Y(n16) );
  BUFX3 U49 ( .A(in_17bit[16]), .Y(n1) );
  INVX1 U50 ( .A(in_8bit[0]), .Y(n19) );
  INVX1 U51 ( .A(n143), .Y(n117) );
  AOI22X1 U52 ( .A0(in_8bit[0]), .A1(in_8bit[7]), .B0(in_8bit[0]), .B1(n118), 
        .Y(n143) );
  INVX1 U53 ( .A(n144), .Y(n101) );
  AOI22X1 U54 ( .A0(N39), .A1(in_8bit[7]), .B0(in_8bit[1]), .B1(n118), .Y(n144) );
  INVX1 U55 ( .A(n145), .Y(n100) );
  AOI22X1 U56 ( .A0(N40), .A1(in_8bit[7]), .B0(in_8bit[2]), .B1(n118), .Y(n145) );
  INVX1 U57 ( .A(n146), .Y(n99) );
  AOI22X1 U58 ( .A0(N41), .A1(in_8bit[7]), .B0(in_8bit[3]), .B1(n118), .Y(n146) );
  INVX1 U59 ( .A(n147), .Y(n98) );
  AOI22X1 U60 ( .A0(N42), .A1(in_8bit[7]), .B0(in_8bit[4]), .B1(n118), .Y(n147) );
  INVX1 U61 ( .A(n148), .Y(n97) );
  AOI22X1 U62 ( .A0(N43), .A1(in_8bit[7]), .B0(in_8bit[5]), .B1(n118), .Y(n148) );
  INVX1 U63 ( .A(n127), .Y(n121) );
  AOI22X1 U64 ( .A0(in_17bit[0]), .A1(n1), .B0(in_17bit[0]), .B1(n122), .Y(
        n127) );
  INVX1 U65 ( .A(n128), .Y(n95) );
  AOI22X1 U66 ( .A0(N6), .A1(n1), .B0(in_17bit[1]), .B1(n122), .Y(n128) );
  INVX1 U67 ( .A(n129), .Y(n94) );
  AOI22X1 U68 ( .A0(N7), .A1(n1), .B0(in_17bit[2]), .B1(n122), .Y(n129) );
  INVX1 U69 ( .A(in_8bit[1]), .Y(n20) );
  INVX1 U70 ( .A(in_8bit[2]), .Y(n21) );
  INVX1 U71 ( .A(in_8bit[3]), .Y(n22) );
  INVX1 U72 ( .A(in_8bit[4]), .Y(n23) );
  INVX1 U73 ( .A(in_8bit[5]), .Y(n24) );
  INVX1 U74 ( .A(in_17bit[14]), .Y(n17) );
  INVX1 U75 ( .A(n2), .Y(n120) );
  INVX1 U76 ( .A(n161), .Y(n106) );
  AOI22X1 U77 ( .A0(N82), .A1(n2), .B0(sum_b[18]), .B1(n120), .Y(n161) );
  INVX1 U78 ( .A(n124), .Y(n104) );
  AOI22X1 U79 ( .A0(N84), .A1(n2), .B0(sum_b[20]), .B1(n120), .Y(n124) );
  INVX1 U80 ( .A(n162), .Y(n105) );
  AOI22X1 U81 ( .A0(n2), .A1(N83), .B0(sum_b[19]), .B1(n120), .Y(n162) );
  INVX1 U82 ( .A(N71), .Y(n26) );
  INVX1 U83 ( .A(sum_b[8]), .Y(n27) );
  INVX1 U84 ( .A(sum_b[9]), .Y(n28) );
  INVX1 U85 ( .A(sum_b[10]), .Y(n29) );
  INVX1 U86 ( .A(sum_b[11]), .Y(n30) );
  INVX1 U87 ( .A(sum_b[12]), .Y(n31) );
  INVX1 U88 ( .A(n125), .Y(n103) );
  AOI22X1 U89 ( .A0(N85), .A1(n2), .B0(sum_b[21]), .B1(n120), .Y(n125) );
  INVX1 U90 ( .A(n126), .Y(n102) );
  AOI22X1 U91 ( .A0(N86), .A1(n2), .B0(sum_b[22]), .B1(n120), .Y(n126) );
  INVX1 U92 ( .A(sum_b[22]), .Y(n41) );
  INVX1 U93 ( .A(n157), .Y(n110) );
  AOI22X1 U94 ( .A0(N78), .A1(n2), .B0(sum_b[14]), .B1(n120), .Y(n157) );
  INVX1 U95 ( .A(n158), .Y(n109) );
  AOI22X1 U96 ( .A0(N79), .A1(n2), .B0(sum_b[15]), .B1(n120), .Y(n158) );
  INVX1 U97 ( .A(n159), .Y(n108) );
  AOI22X1 U98 ( .A0(N80), .A1(n2), .B0(sum_b[16]), .B1(n120), .Y(n159) );
  INVX1 U99 ( .A(n160), .Y(n107) );
  AOI22X1 U100 ( .A0(N81), .A1(n2), .B0(sum_b[17]), .B1(n120), .Y(n160) );
  INVX1 U101 ( .A(sum_b[13]), .Y(n32) );
  INVX1 U102 ( .A(sum_b[14]), .Y(n33) );
  INVX1 U103 ( .A(sum_b[15]), .Y(n34) );
  INVX1 U104 ( .A(sum_b[16]), .Y(n35) );
  INVX1 U105 ( .A(n152), .Y(n115) );
  AOI22X1 U106 ( .A0(N73), .A1(n2), .B0(sum_b[9]), .B1(n120), .Y(n152) );
  INVX1 U107 ( .A(n153), .Y(n114) );
  AOI22X1 U108 ( .A0(N74), .A1(n2), .B0(sum_b[10]), .B1(n120), .Y(n153) );
  INVX1 U109 ( .A(n154), .Y(n113) );
  AOI22X1 U110 ( .A0(N75), .A1(n2), .B0(sum_b[11]), .B1(n120), .Y(n154) );
  INVX1 U111 ( .A(n155), .Y(n112) );
  AOI22X1 U112 ( .A0(N76), .A1(n2), .B0(sum_b[12]), .B1(n120), .Y(n155) );
  INVX1 U113 ( .A(n156), .Y(n111) );
  AOI22X1 U114 ( .A0(N77), .A1(n2), .B0(sum_b[13]), .B1(n120), .Y(n156) );
  INVX1 U115 ( .A(sum_b[17]), .Y(n36) );
  INVX1 U116 ( .A(sum_b[18]), .Y(n37) );
  INVX1 U117 ( .A(sum_b[19]), .Y(n38) );
  INVX1 U118 ( .A(sum_b[20]), .Y(n39) );
  INVX1 U119 ( .A(sum_b[21]), .Y(n40) );
  BUFX3 U120 ( .A(sum_b[23]), .Y(n2) );
  INVX1 U121 ( .A(n150), .Y(n119) );
  AOI22X1 U122 ( .A0(N71), .A1(n2), .B0(N71), .B1(n120), .Y(n150) );
  INVX1 U123 ( .A(n151), .Y(n116) );
  AOI22X1 U124 ( .A0(N72), .A1(n2), .B0(sum_b[8]), .B1(n120), .Y(n151) );
  XOR2X1 U125 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U126 ( .A(n41), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U127 ( .A(sub_add_97_b0_carry[14]), .B(n40), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U128 ( .A(n40), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U129 ( .A(sub_add_97_b0_carry[13]), .B(n39), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U130 ( .A(n39), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U131 ( .A(sub_add_97_b0_carry[12]), .B(n38), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U132 ( .A(n38), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U133 ( .A(sub_add_97_b0_carry[11]), .B(n37), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U134 ( .A(n37), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U135 ( .A(sub_add_97_b0_carry[10]), .B(n36), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U136 ( .A(n36), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U137 ( .A(sub_add_97_b0_carry[9]), .B(n35), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U138 ( .A(n35), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U139 ( .A(sub_add_97_b0_carry[8]), .B(n34), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U140 ( .A(n34), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U141 ( .A(sub_add_97_b0_carry[7]), .B(n33), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U142 ( .A(n33), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U143 ( .A(sub_add_97_b0_carry[6]), .B(n32), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U144 ( .A(n32), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U145 ( .A(sub_add_97_b0_carry[5]), .B(n31), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U146 ( .A(n31), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U147 ( .A(sub_add_97_b0_carry[4]), .B(n30), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U148 ( .A(n30), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U149 ( .A(sub_add_97_b0_carry[3]), .B(n29), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U150 ( .A(n29), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U151 ( .A(sub_add_97_b0_carry[2]), .B(n28), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U152 ( .A(n28), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U153 ( .A(n26), .B(n27), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U154 ( .A(n27), .B(n26), .Y(N72) );
  XOR2X1 U155 ( .A(n25), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U156 ( .A(sub_add_61_b0_carry[5]), .B(n24), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U157 ( .A(n24), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U158 ( .A(sub_add_61_b0_carry[4]), .B(n23), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U159 ( .A(n23), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U160 ( .A(sub_add_61_b0_carry[3]), .B(n22), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U161 ( .A(n22), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U162 ( .A(sub_add_61_b0_carry[2]), .B(n21), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U163 ( .A(n21), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U164 ( .A(n19), .B(n20), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U165 ( .A(n20), .B(n19), .Y(N39) );
  XOR2X1 U166 ( .A(n18), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U167 ( .A(sub_add_52_b0_carry[14]), .B(n17), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U168 ( .A(n17), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U169 ( .A(sub_add_52_b0_carry[13]), .B(n16), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U170 ( .A(n16), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U171 ( .A(sub_add_52_b0_carry[12]), .B(n15), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U172 ( .A(n15), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U173 ( .A(sub_add_52_b0_carry[11]), .B(n14), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U174 ( .A(n14), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U175 ( .A(sub_add_52_b0_carry[10]), .B(n13), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U176 ( .A(n13), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U177 ( .A(sub_add_52_b0_carry[9]), .B(n12), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U178 ( .A(n12), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U179 ( .A(sub_add_52_b0_carry[8]), .B(n11), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U180 ( .A(n11), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U181 ( .A(sub_add_52_b0_carry[7]), .B(n10), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U182 ( .A(n10), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U183 ( .A(sub_add_52_b0_carry[6]), .B(n9), .Y(sub_add_52_b0_carry[7])
         );
  XOR2X1 U184 ( .A(n9), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U185 ( .A(sub_add_52_b0_carry[5]), .B(n8), .Y(sub_add_52_b0_carry[6])
         );
  XOR2X1 U186 ( .A(n8), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U187 ( .A(sub_add_52_b0_carry[4]), .B(n7), .Y(sub_add_52_b0_carry[5])
         );
  XOR2X1 U188 ( .A(n7), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U189 ( .A(sub_add_52_b0_carry[3]), .B(n6), .Y(sub_add_52_b0_carry[4])
         );
  XOR2X1 U190 ( .A(n6), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U191 ( .A(sub_add_52_b0_carry[2]), .B(n5), .Y(sub_add_52_b0_carry[3])
         );
  XOR2X1 U192 ( .A(n5), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U193 ( .A(n3), .B(n4), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U194 ( .A(n4), .B(n3), .Y(N6) );
endmodule


module multi16_6_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  CMPR32X1 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .C(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S2_2_3 ( .A(ab_2__3_), .B(n4), .C(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  CMPR32X1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .C(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .C(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n2), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n5), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .C(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .C(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  CMPR32X1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .C(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .C(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  CMPR32X1 S2_14_2 ( .A(ab_14__2_), .B(CARRYB_13__2_), .C(SUMB_13__3_), .CO(
        CARRYB_14__2_), .S(SUMB_14__2_) );
  CMPR32X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .C(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX4 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .CI(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  ADDFHXL S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFHX1 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFHX1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .CI(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  ADDFHX1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFHXL S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFX2 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .CI(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  ADDFHX1 S4_1 ( .A(ab_15__1_), .B(CARRYB_14__1_), .CI(SUMB_14__2_), .CO(
        CARRYB_15__1_), .S(SUMB_15__1_) );
  ADDFHX1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .CI(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  ADDFHX1 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .CI(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  ADDFHX1 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFHX1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFHXL S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFHXL S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .CI(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  ADDFHX1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .CI(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  ADDFX1 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2 S2_2_4 ( .A(ab_2__4_), .B(n6), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  ADDFX2 S3_2_5 ( .A(ab_2__5_), .B(n3), .CI(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  NOR2X2 U2 ( .A(n50), .B(n46), .Y(ab_1__3_) );
  NOR2X1 U3 ( .A(n48), .B(n46), .Y(ab_1__5_) );
  NOR2X1 U4 ( .A(n51), .B(n46), .Y(ab_1__2_) );
  INVX3 U5 ( .A(A[1]), .Y(n46) );
  NOR2X2 U6 ( .A(n50), .B(n47), .Y(ab_0__3_) );
  NOR2X4 U7 ( .A(n48), .B(n47), .Y(ab_0__5_) );
  INVX4 U8 ( .A(A[0]), .Y(n47) );
  NOR2X1 U9 ( .A(n8), .B(n47), .Y(ab_0__6_) );
  NOR2X1 U10 ( .A(n51), .B(n47), .Y(ab_0__2_) );
  XOR2X1 U11 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  XOR2X1 U12 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  OAI21X2 U13 ( .A0(n21), .A1(n17), .B0(n20), .Y(n10) );
  OR2X2 U14 ( .A(n14), .B(A1_17_), .Y(n24) );
  AOI21X2 U15 ( .A0(n24), .A1(n10), .B0(n31), .Y(n27) );
  INVX1 U16 ( .A(n23), .Y(n31) );
  INVX4 U17 ( .A(B[4]), .Y(n49) );
  INVX1 U18 ( .A(B[6]), .Y(n8) );
  AND2X2 U19 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n2) );
  AND2X2 U20 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n3) );
  AND2X2 U21 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n4) );
  AND2X2 U22 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n5) );
  AND2X2 U23 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n6) );
  INVX1 U24 ( .A(B[0]), .Y(n53) );
  NAND2X2 U25 ( .A(n15), .B(A1_15_), .Y(n17) );
  OR2XL U26 ( .A(n15), .B(A1_15_), .Y(n18) );
  AND2X2 U27 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n12) );
  OAI21X2 U28 ( .A0(n28), .A1(n27), .B0(n26), .Y(n30) );
  INVXL U29 ( .A(B[0]), .Y(n7) );
  XOR2XL U30 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  NOR2X2 U31 ( .A(n49), .B(n46), .Y(ab_1__4_) );
  XOR2X1 U32 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  NOR2X2 U33 ( .A(n13), .B(A1_18_), .Y(n28) );
  INVXL U34 ( .A(B[6]), .Y(n9) );
  INVX4 U35 ( .A(B[5]), .Y(n48) );
  INVX4 U36 ( .A(B[1]), .Y(n52) );
  INVX4 U37 ( .A(B[2]), .Y(n51) );
  NOR2XL U38 ( .A(n9), .B(n32), .Y(ab_15__6_) );
  NOR2XL U39 ( .A(n8), .B(n33), .Y(ab_14__6_) );
  NOR2XL U40 ( .A(n9), .B(n34), .Y(ab_13__6_) );
  NOR2XL U41 ( .A(n9), .B(n35), .Y(ab_12__6_) );
  NOR2XL U42 ( .A(n9), .B(n36), .Y(ab_11__6_) );
  NOR2XL U43 ( .A(n9), .B(n37), .Y(ab_10__6_) );
  NOR2XL U44 ( .A(n38), .B(n9), .Y(ab_9__6_) );
  NOR2XL U45 ( .A(n9), .B(n39), .Y(ab_8__6_) );
  NOR2XL U46 ( .A(n9), .B(n40), .Y(ab_7__6_) );
  NOR2XL U47 ( .A(n9), .B(n41), .Y(ab_6__6_) );
  NOR2XL U48 ( .A(n9), .B(n42), .Y(ab_5__6_) );
  NOR2XL U49 ( .A(n9), .B(n43), .Y(ab_4__6_) );
  NOR2XL U50 ( .A(n9), .B(n44), .Y(ab_3__6_) );
  NOR2XL U51 ( .A(n9), .B(n45), .Y(ab_2__6_) );
  NOR2XL U52 ( .A(n9), .B(n46), .Y(ab_1__6_) );
  AND3X2 U53 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
  NOR2X2 U54 ( .A(n46), .B(n52), .Y(ab_1__1_) );
  XOR2X1 U55 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  XNOR2XL U56 ( .A(n22), .B(n10), .Y(PRODUCT_19_) );
  XOR2X1 U57 ( .A(n25), .B(n27), .Y(PRODUCT_20_) );
  NAND2BXL U58 ( .AN(n21), .B(n20), .Y(n19) );
  INVX4 U59 ( .A(B[3]), .Y(n50) );
  NOR2X1 U60 ( .A(n49), .B(n47), .Y(ab_0__4_) );
  NOR2XL U61 ( .A(n51), .B(n45), .Y(ab_2__2_) );
  NOR2XL U62 ( .A(n51), .B(n44), .Y(ab_3__2_) );
  NOR2XL U63 ( .A(n51), .B(n43), .Y(ab_4__2_) );
  NOR2XL U64 ( .A(n51), .B(n42), .Y(ab_5__2_) );
  XOR2X1 U65 ( .A(n19), .B(n17), .Y(PRODUCT_18_) );
  NOR2XL U66 ( .A(n48), .B(n39), .Y(ab_8__5_) );
  NOR2XL U67 ( .A(n48), .B(n33), .Y(ab_14__5_) );
  NOR2XL U68 ( .A(n48), .B(n40), .Y(ab_7__5_) );
  NOR2XL U69 ( .A(n48), .B(n41), .Y(ab_6__5_) );
  NOR2XL U70 ( .A(n48), .B(n34), .Y(ab_13__5_) );
  NOR2XL U71 ( .A(n48), .B(n42), .Y(ab_5__5_) );
  NOR2XL U72 ( .A(n48), .B(n37), .Y(ab_10__5_) );
  NOR2XL U73 ( .A(n48), .B(n35), .Y(ab_12__5_) );
  NOR2XL U74 ( .A(n48), .B(n43), .Y(ab_4__5_) );
  XOR2X1 U75 ( .A(ab_1__1_), .B(ab_0__2_), .Y(SUMB_1__1_) );
  NOR2XL U76 ( .A(n49), .B(n32), .Y(ab_15__4_) );
  NOR2XL U77 ( .A(n49), .B(n33), .Y(ab_14__4_) );
  NOR2XL U78 ( .A(n49), .B(n34), .Y(ab_13__4_) );
  NOR2XL U79 ( .A(n49), .B(n35), .Y(ab_12__4_) );
  NOR2XL U80 ( .A(n49), .B(n36), .Y(ab_11__4_) );
  NOR2XL U81 ( .A(n49), .B(n37), .Y(ab_10__4_) );
  NOR2XL U82 ( .A(n38), .B(n49), .Y(ab_9__4_) );
  NOR2XL U83 ( .A(n49), .B(n39), .Y(ab_8__4_) );
  NOR2XL U84 ( .A(n49), .B(n40), .Y(ab_7__4_) );
  NOR2XL U85 ( .A(n49), .B(n41), .Y(ab_6__4_) );
  NOR2XL U86 ( .A(n49), .B(n42), .Y(ab_5__4_) );
  NOR2XL U87 ( .A(n49), .B(n43), .Y(ab_4__4_) );
  NOR2XL U88 ( .A(n49), .B(n44), .Y(ab_3__4_) );
  NOR2XL U89 ( .A(n49), .B(n45), .Y(ab_2__4_) );
  NAND2XL U90 ( .A(n24), .B(n23), .Y(n22) );
  NAND2XL U91 ( .A(n12), .B(A1_16_), .Y(n20) );
  NAND2XL U92 ( .A(n13), .B(A1_18_), .Y(n26) );
  AND2X1 U93 ( .A(n18), .B(n17), .Y(PRODUCT_17_) );
  NOR2XL U94 ( .A(n48), .B(n44), .Y(ab_3__5_) );
  XOR2X1 U95 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U96 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U97 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U98 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n13) );
  AND2X2 U99 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n14) );
  AND2X2 U100 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n15) );
  AND2X2 U101 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n16) );
  XOR2X1 U102 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2X1 U103 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  INVX1 U104 ( .A(A[2]), .Y(n45) );
  INVX1 U105 ( .A(A[3]), .Y(n44) );
  INVX1 U106 ( .A(A[4]), .Y(n43) );
  INVX1 U107 ( .A(A[6]), .Y(n41) );
  INVX1 U108 ( .A(A[5]), .Y(n42) );
  INVX1 U109 ( .A(A[9]), .Y(n38) );
  INVX1 U110 ( .A(A[7]), .Y(n40) );
  INVX1 U111 ( .A(A[8]), .Y(n39) );
  INVX1 U112 ( .A(A[10]), .Y(n37) );
  INVX1 U113 ( .A(A[11]), .Y(n36) );
  INVX1 U114 ( .A(A[12]), .Y(n35) );
  INVX1 U115 ( .A(A[13]), .Y(n34) );
  INVX1 U116 ( .A(A[14]), .Y(n33) );
  INVX1 U117 ( .A(A[15]), .Y(n32) );
  NOR2X1 U118 ( .A(n12), .B(A1_16_), .Y(n21) );
  NAND2X1 U119 ( .A(n14), .B(A1_17_), .Y(n23) );
  NAND2BX1 U120 ( .AN(n28), .B(n26), .Y(n25) );
  XOR2X1 U121 ( .A(n16), .B(A1_19_), .Y(n29) );
  XOR2X1 U122 ( .A(n30), .B(n29), .Y(PRODUCT_21_) );
  NOR2X1 U123 ( .A(n38), .B(n48), .Y(ab_9__5_) );
  NOR2X1 U124 ( .A(n38), .B(n50), .Y(ab_9__3_) );
  NOR2X1 U125 ( .A(n38), .B(n51), .Y(ab_9__2_) );
  NOR2X1 U126 ( .A(n38), .B(n52), .Y(ab_9__1_) );
  NOR2X1 U127 ( .A(n38), .B(n7), .Y(ab_9__0_) );
  NOR2X1 U128 ( .A(n50), .B(n39), .Y(ab_8__3_) );
  NOR2X1 U129 ( .A(n51), .B(n39), .Y(ab_8__2_) );
  NOR2X1 U130 ( .A(n52), .B(n39), .Y(ab_8__1_) );
  NOR2X1 U131 ( .A(n7), .B(n39), .Y(ab_8__0_) );
  NOR2X1 U132 ( .A(n50), .B(n40), .Y(ab_7__3_) );
  NOR2X1 U133 ( .A(n51), .B(n40), .Y(ab_7__2_) );
  NOR2X1 U134 ( .A(n52), .B(n40), .Y(ab_7__1_) );
  NOR2X1 U135 ( .A(n7), .B(n40), .Y(ab_7__0_) );
  NOR2X1 U136 ( .A(n50), .B(n41), .Y(ab_6__3_) );
  NOR2X1 U137 ( .A(n51), .B(n41), .Y(ab_6__2_) );
  NOR2X1 U138 ( .A(n52), .B(n41), .Y(ab_6__1_) );
  NOR2X1 U139 ( .A(n7), .B(n41), .Y(ab_6__0_) );
  NOR2X1 U140 ( .A(n50), .B(n42), .Y(ab_5__3_) );
  NOR2X1 U141 ( .A(n52), .B(n42), .Y(ab_5__1_) );
  NOR2X1 U142 ( .A(n7), .B(n42), .Y(ab_5__0_) );
  NOR2X1 U143 ( .A(n50), .B(n43), .Y(ab_4__3_) );
  NOR2X1 U144 ( .A(n52), .B(n43), .Y(ab_4__1_) );
  NOR2X1 U145 ( .A(n7), .B(n43), .Y(ab_4__0_) );
  NOR2X1 U146 ( .A(n50), .B(n44), .Y(ab_3__3_) );
  NOR2X1 U147 ( .A(n52), .B(n44), .Y(ab_3__1_) );
  NOR2X1 U148 ( .A(n7), .B(n44), .Y(ab_3__0_) );
  NOR2X1 U149 ( .A(n48), .B(n45), .Y(ab_2__5_) );
  NOR2X1 U150 ( .A(n50), .B(n45), .Y(ab_2__3_) );
  NOR2X1 U151 ( .A(n52), .B(n45), .Y(ab_2__1_) );
  NOR2X1 U152 ( .A(n53), .B(n45), .Y(ab_2__0_) );
  NOR2X1 U153 ( .A(n48), .B(n32), .Y(ab_15__5_) );
  NOR2X1 U154 ( .A(n50), .B(n32), .Y(ab_15__3_) );
  NOR2X1 U155 ( .A(n51), .B(n32), .Y(ab_15__2_) );
  NOR2X1 U156 ( .A(n52), .B(n32), .Y(ab_15__1_) );
  NOR2X1 U157 ( .A(n7), .B(n32), .Y(ab_15__0_) );
  NOR2X1 U158 ( .A(n50), .B(n33), .Y(ab_14__3_) );
  NOR2X1 U159 ( .A(n51), .B(n33), .Y(ab_14__2_) );
  NOR2X1 U160 ( .A(n52), .B(n33), .Y(ab_14__1_) );
  NOR2X1 U161 ( .A(n7), .B(n33), .Y(ab_14__0_) );
  NOR2X1 U162 ( .A(n50), .B(n34), .Y(ab_13__3_) );
  NOR2X1 U163 ( .A(n51), .B(n34), .Y(ab_13__2_) );
  NOR2X1 U164 ( .A(n52), .B(n34), .Y(ab_13__1_) );
  NOR2X1 U165 ( .A(n7), .B(n34), .Y(ab_13__0_) );
  NOR2X1 U166 ( .A(n50), .B(n35), .Y(ab_12__3_) );
  NOR2X1 U167 ( .A(n51), .B(n35), .Y(ab_12__2_) );
  NOR2X1 U168 ( .A(n52), .B(n35), .Y(ab_12__1_) );
  NOR2X1 U169 ( .A(n7), .B(n35), .Y(ab_12__0_) );
  NOR2X1 U170 ( .A(n48), .B(n36), .Y(ab_11__5_) );
  NOR2X1 U171 ( .A(n50), .B(n36), .Y(ab_11__3_) );
  NOR2X1 U172 ( .A(n51), .B(n36), .Y(ab_11__2_) );
  NOR2X1 U173 ( .A(n52), .B(n36), .Y(ab_11__1_) );
  NOR2X1 U174 ( .A(n7), .B(n36), .Y(ab_11__0_) );
  NOR2X1 U175 ( .A(n50), .B(n37), .Y(ab_10__3_) );
  NOR2X1 U176 ( .A(n51), .B(n37), .Y(ab_10__2_) );
  NOR2X1 U177 ( .A(n52), .B(n37), .Y(ab_10__1_) );
  NOR2X1 U178 ( .A(n7), .B(n37), .Y(ab_10__0_) );
endmodule


module multi16_6 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_6_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(in_8bit[7]), .CK(clk), .RN(rst_n), .Q(
        in_8bit_b[7]) );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n4), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 out_reg_16_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_14_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_10_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 out_reg_6_ ( .D(n118), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 out_reg_5_ ( .D(n119), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n120), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n121), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n122), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_1_ ( .D(n123), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_0_ ( .D(n126), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n124), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQX1 sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQX1 sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX4 in_8bit_b_reg_1_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  DFFRHQX4 in_8bit_b_reg_4_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  DFFRHQX4 in_8bit_b_reg_5_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX2 in_8bit_b_reg_3_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX2 in_17bit_b_reg_0_ ( .D(n128), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX2 in_17bit_b_reg_1_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[1]) );
  INVX1 U3 ( .A(n5), .Y(n3) );
  INVX1 U4 ( .A(n9), .Y(n4) );
  INVX1 U5 ( .A(n2), .Y(n9) );
  INVX1 U6 ( .A(n2), .Y(n8) );
  INVX1 U7 ( .A(n2), .Y(n7) );
  INVX1 U8 ( .A(n2), .Y(n6) );
  INVX1 U9 ( .A(in_17bit[16]), .Y(n5) );
  INVX1 U10 ( .A(n5), .Y(n2) );
  INVX1 U11 ( .A(in_17bit[0]), .Y(n10) );
  INVX1 U12 ( .A(n148), .Y(n49) );
  AOI22X1 U13 ( .A0(n4), .A1(N20), .B0(in_17bit[15]), .B1(n5), .Y(n148) );
  INVX1 U14 ( .A(in_17bit[15]), .Y(n25) );
  INVX1 U15 ( .A(n145), .Y(n91) );
  AOI22X1 U16 ( .A0(N17), .A1(n3), .B0(in_17bit[12]), .B1(n5), .Y(n145) );
  INVX1 U17 ( .A(n146), .Y(n90) );
  AOI22X1 U18 ( .A0(N18), .A1(n3), .B0(in_17bit[13]), .B1(n5), .Y(n146) );
  INVX1 U19 ( .A(n147), .Y(n89) );
  AOI22X1 U20 ( .A0(N19), .A1(n3), .B0(in_17bit[14]), .B1(n6), .Y(n147) );
  INVX1 U21 ( .A(in_17bit[1]), .Y(n11) );
  INVX1 U22 ( .A(in_17bit[2]), .Y(n12) );
  INVX1 U23 ( .A(in_17bit[3]), .Y(n13) );
  INVX1 U24 ( .A(in_17bit[4]), .Y(n14) );
  INVX1 U25 ( .A(n140), .Y(n96) );
  AOI22X1 U26 ( .A0(N12), .A1(n3), .B0(in_17bit[7]), .B1(n8), .Y(n140) );
  INVX1 U27 ( .A(n141), .Y(n95) );
  AOI22X1 U28 ( .A0(N13), .A1(n3), .B0(in_17bit[8]), .B1(n7), .Y(n141) );
  INVX1 U29 ( .A(n142), .Y(n94) );
  AOI22X1 U30 ( .A0(N14), .A1(n3), .B0(in_17bit[9]), .B1(n7), .Y(n142) );
  INVX1 U31 ( .A(n143), .Y(n93) );
  AOI22X1 U32 ( .A0(N15), .A1(n3), .B0(in_17bit[10]), .B1(n6), .Y(n143) );
  INVX1 U33 ( .A(n144), .Y(n92) );
  AOI22X1 U34 ( .A0(N16), .A1(n3), .B0(in_17bit[11]), .B1(n6), .Y(n144) );
  INVX1 U35 ( .A(in_17bit[5]), .Y(n15) );
  INVX1 U36 ( .A(in_17bit[6]), .Y(n16) );
  INVX1 U37 ( .A(in_17bit[7]), .Y(n17) );
  INVX1 U38 ( .A(in_17bit[8]), .Y(n18) );
  INVX1 U39 ( .A(in_17bit[9]), .Y(n19) );
  INVX1 U40 ( .A(n137), .Y(n99) );
  AOI22X1 U41 ( .A0(N9), .A1(n3), .B0(in_17bit[4]), .B1(n8), .Y(n137) );
  INVX1 U42 ( .A(n138), .Y(n98) );
  AOI22X1 U43 ( .A0(N10), .A1(n3), .B0(in_17bit[5]), .B1(n8), .Y(n138) );
  INVX1 U44 ( .A(n133), .Y(n128) );
  AOI22X1 U45 ( .A0(in_17bit[0]), .A1(n4), .B0(in_17bit[0]), .B1(n9), .Y(n133)
         );
  INVX1 U46 ( .A(n134), .Y(n102) );
  AOI22X1 U47 ( .A0(N6), .A1(n4), .B0(in_17bit[1]), .B1(n9), .Y(n134) );
  INVX1 U48 ( .A(n135), .Y(n101) );
  AOI22X1 U49 ( .A0(N7), .A1(n3), .B0(in_17bit[2]), .B1(n6), .Y(n135) );
  INVX1 U50 ( .A(n136), .Y(n100) );
  AOI22X1 U51 ( .A0(N8), .A1(n3), .B0(in_17bit[3]), .B1(n5), .Y(n136) );
  INVX1 U52 ( .A(n139), .Y(n97) );
  AOI22X1 U53 ( .A0(N11), .A1(n3), .B0(in_17bit[6]), .B1(n7), .Y(n139) );
  INVX1 U54 ( .A(in_17bit[10]), .Y(n20) );
  INVX1 U55 ( .A(in_17bit[11]), .Y(n21) );
  INVX1 U56 ( .A(in_17bit[12]), .Y(n22) );
  INVX1 U57 ( .A(in_17bit[13]), .Y(n23) );
  INVX1 U58 ( .A(in_8bit[7]), .Y(n125) );
  INVX1 U59 ( .A(n149), .Y(n124) );
  AOI22X1 U60 ( .A0(in_8bit[0]), .A1(in_8bit[7]), .B0(in_8bit[0]), .B1(n125), 
        .Y(n149) );
  INVX1 U61 ( .A(n150), .Y(n108) );
  AOI22X1 U62 ( .A0(N39), .A1(in_8bit[7]), .B0(in_8bit[1]), .B1(n125), .Y(n150) );
  INVX1 U63 ( .A(n151), .Y(n107) );
  AOI22X1 U64 ( .A0(N40), .A1(in_8bit[7]), .B0(in_8bit[2]), .B1(n125), .Y(n151) );
  INVX1 U65 ( .A(n152), .Y(n106) );
  AOI22X1 U66 ( .A0(N41), .A1(in_8bit[7]), .B0(in_8bit[3]), .B1(n125), .Y(n152) );
  INVX1 U67 ( .A(n153), .Y(n105) );
  AOI22X1 U68 ( .A0(N42), .A1(in_8bit[7]), .B0(in_8bit[4]), .B1(n125), .Y(n153) );
  INVX1 U69 ( .A(n154), .Y(n104) );
  AOI22X1 U70 ( .A0(N43), .A1(in_8bit[7]), .B0(in_8bit[5]), .B1(n125), .Y(n154) );
  INVX1 U71 ( .A(n155), .Y(n103) );
  AOI22X1 U72 ( .A0(in_8bit[7]), .A1(N44), .B0(in_8bit[6]), .B1(n125), .Y(n155) );
  INVX1 U73 ( .A(in_8bit[6]), .Y(n32) );
  INVX1 U74 ( .A(in_8bit[0]), .Y(n26) );
  INVX1 U75 ( .A(in_8bit[1]), .Y(n27) );
  INVX1 U76 ( .A(in_8bit[2]), .Y(n28) );
  INVX1 U77 ( .A(in_8bit[3]), .Y(n29) );
  INVX1 U78 ( .A(in_8bit[4]), .Y(n30) );
  INVX1 U79 ( .A(in_8bit[5]), .Y(n31) );
  INVX1 U80 ( .A(in_17bit[14]), .Y(n24) );
  INVX1 U81 ( .A(n1), .Y(n127) );
  INVX1 U82 ( .A(n167), .Y(n113) );
  AOI22X1 U83 ( .A0(N82), .A1(n1), .B0(sum_b[18]), .B1(n127), .Y(n167) );
  INVX1 U84 ( .A(n130), .Y(n111) );
  AOI22X1 U85 ( .A0(N84), .A1(n1), .B0(sum_b[20]), .B1(n127), .Y(n130) );
  INVX1 U86 ( .A(n168), .Y(n112) );
  AOI22X1 U87 ( .A0(n1), .A1(N83), .B0(sum_b[19]), .B1(n127), .Y(n168) );
  INVX1 U88 ( .A(N71), .Y(n33) );
  INVX1 U89 ( .A(sum_b[8]), .Y(n34) );
  INVX1 U90 ( .A(sum_b[9]), .Y(n35) );
  INVX1 U91 ( .A(sum_b[10]), .Y(n36) );
  INVX1 U92 ( .A(sum_b[11]), .Y(n37) );
  INVX1 U93 ( .A(sum_b[12]), .Y(n38) );
  INVX1 U94 ( .A(n131), .Y(n110) );
  AOI22X1 U95 ( .A0(N85), .A1(n1), .B0(sum_b[21]), .B1(n127), .Y(n131) );
  INVX1 U96 ( .A(n132), .Y(n109) );
  AOI22X1 U97 ( .A0(N86), .A1(n1), .B0(sum_b[22]), .B1(n127), .Y(n132) );
  INVX1 U98 ( .A(sum_b[22]), .Y(n48) );
  INVX1 U99 ( .A(n163), .Y(n117) );
  AOI22X1 U100 ( .A0(N78), .A1(n1), .B0(sum_b[14]), .B1(n127), .Y(n163) );
  INVX1 U101 ( .A(n164), .Y(n116) );
  AOI22X1 U102 ( .A0(N79), .A1(n1), .B0(sum_b[15]), .B1(n127), .Y(n164) );
  INVX1 U103 ( .A(n165), .Y(n115) );
  AOI22X1 U104 ( .A0(N80), .A1(n1), .B0(sum_b[16]), .B1(n127), .Y(n165) );
  INVX1 U105 ( .A(n166), .Y(n114) );
  AOI22X1 U106 ( .A0(N81), .A1(n1), .B0(sum_b[17]), .B1(n127), .Y(n166) );
  INVX1 U107 ( .A(sum_b[13]), .Y(n39) );
  INVX1 U108 ( .A(sum_b[14]), .Y(n40) );
  INVX1 U109 ( .A(sum_b[15]), .Y(n41) );
  INVX1 U110 ( .A(sum_b[16]), .Y(n42) );
  INVX1 U111 ( .A(n158), .Y(n122) );
  AOI22X1 U112 ( .A0(N73), .A1(n1), .B0(sum_b[9]), .B1(n127), .Y(n158) );
  INVX1 U113 ( .A(n159), .Y(n121) );
  AOI22X1 U114 ( .A0(N74), .A1(n1), .B0(sum_b[10]), .B1(n127), .Y(n159) );
  INVX1 U115 ( .A(n160), .Y(n120) );
  AOI22X1 U116 ( .A0(N75), .A1(n1), .B0(sum_b[11]), .B1(n127), .Y(n160) );
  INVX1 U117 ( .A(n161), .Y(n119) );
  AOI22X1 U118 ( .A0(N76), .A1(n1), .B0(sum_b[12]), .B1(n127), .Y(n161) );
  INVX1 U119 ( .A(n162), .Y(n118) );
  AOI22X1 U120 ( .A0(N77), .A1(n1), .B0(sum_b[13]), .B1(n127), .Y(n162) );
  INVX1 U121 ( .A(sum_b[17]), .Y(n43) );
  INVX1 U122 ( .A(sum_b[18]), .Y(n44) );
  INVX1 U123 ( .A(sum_b[19]), .Y(n45) );
  INVX1 U124 ( .A(sum_b[20]), .Y(n46) );
  INVX1 U125 ( .A(sum_b[21]), .Y(n47) );
  BUFX3 U126 ( .A(sum_b[23]), .Y(n1) );
  INVX1 U127 ( .A(n156), .Y(n126) );
  AOI22X1 U128 ( .A0(N71), .A1(n1), .B0(N71), .B1(n127), .Y(n156) );
  INVX1 U129 ( .A(n157), .Y(n123) );
  AOI22X1 U130 ( .A0(N72), .A1(n1), .B0(sum_b[8]), .B1(n127), .Y(n157) );
  XOR2X1 U131 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U132 ( .A(n48), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U133 ( .A(sub_add_97_b0_carry[14]), .B(n47), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U134 ( .A(n47), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U135 ( .A(sub_add_97_b0_carry[13]), .B(n46), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U136 ( .A(n46), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U137 ( .A(sub_add_97_b0_carry[12]), .B(n45), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U138 ( .A(n45), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U139 ( .A(sub_add_97_b0_carry[11]), .B(n44), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U140 ( .A(n44), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U141 ( .A(sub_add_97_b0_carry[10]), .B(n43), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U142 ( .A(n43), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U143 ( .A(sub_add_97_b0_carry[9]), .B(n42), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U144 ( .A(n42), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U145 ( .A(sub_add_97_b0_carry[8]), .B(n41), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U146 ( .A(n41), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U147 ( .A(sub_add_97_b0_carry[7]), .B(n40), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U148 ( .A(n40), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U149 ( .A(sub_add_97_b0_carry[6]), .B(n39), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U150 ( .A(n39), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U151 ( .A(sub_add_97_b0_carry[5]), .B(n38), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U152 ( .A(n38), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U153 ( .A(sub_add_97_b0_carry[4]), .B(n37), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U154 ( .A(n37), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U155 ( .A(sub_add_97_b0_carry[3]), .B(n36), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U156 ( .A(n36), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U157 ( .A(sub_add_97_b0_carry[2]), .B(n35), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U158 ( .A(n35), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U159 ( .A(n33), .B(n34), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U160 ( .A(n34), .B(n33), .Y(N72) );
  XOR2X1 U161 ( .A(n32), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U162 ( .A(sub_add_61_b0_carry[5]), .B(n31), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U163 ( .A(n31), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U164 ( .A(sub_add_61_b0_carry[4]), .B(n30), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U165 ( .A(n30), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U166 ( .A(sub_add_61_b0_carry[3]), .B(n29), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U167 ( .A(n29), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U168 ( .A(sub_add_61_b0_carry[2]), .B(n28), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U169 ( .A(n28), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U170 ( .A(n26), .B(n27), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U171 ( .A(n27), .B(n26), .Y(N39) );
  XOR2X1 U172 ( .A(n25), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U173 ( .A(sub_add_52_b0_carry[14]), .B(n24), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U174 ( .A(n24), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U175 ( .A(sub_add_52_b0_carry[13]), .B(n23), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U176 ( .A(n23), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U177 ( .A(sub_add_52_b0_carry[12]), .B(n22), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U178 ( .A(n22), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U179 ( .A(sub_add_52_b0_carry[11]), .B(n21), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U180 ( .A(n21), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U181 ( .A(sub_add_52_b0_carry[10]), .B(n20), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U182 ( .A(n20), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U183 ( .A(sub_add_52_b0_carry[9]), .B(n19), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U184 ( .A(n19), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U185 ( .A(sub_add_52_b0_carry[8]), .B(n18), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U186 ( .A(n18), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U187 ( .A(sub_add_52_b0_carry[7]), .B(n17), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U188 ( .A(n17), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U189 ( .A(sub_add_52_b0_carry[6]), .B(n16), .Y(sub_add_52_b0_carry[7]) );
  XOR2X1 U190 ( .A(n16), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U191 ( .A(sub_add_52_b0_carry[5]), .B(n15), .Y(sub_add_52_b0_carry[6]) );
  XOR2X1 U192 ( .A(n15), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U193 ( .A(sub_add_52_b0_carry[4]), .B(n14), .Y(sub_add_52_b0_carry[5]) );
  XOR2X1 U194 ( .A(n14), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U195 ( .A(sub_add_52_b0_carry[3]), .B(n13), .Y(sub_add_52_b0_carry[4]) );
  XOR2X1 U196 ( .A(n13), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U197 ( .A(sub_add_52_b0_carry[2]), .B(n12), .Y(sub_add_52_b0_carry[3]) );
  XOR2X1 U198 ( .A(n12), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U199 ( .A(n10), .B(n11), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U200 ( .A(n11), .B(n10), .Y(N6) );
endmodule


module multi16_5_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFX2 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S3_2_5 ( .A(ab_2__5_), .B(n2), .C(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  CMPR32X1 S2_2_4 ( .A(ab_2__4_), .B(n4), .C(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .C(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n5), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n3), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .C(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .C(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  CMPR32X1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .C(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .C(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  CMPR32X1 S2_14_2 ( .A(ab_14__2_), .B(CARRYB_13__2_), .C(SUMB_13__3_), .CO(
        CARRYB_14__2_), .S(SUMB_14__2_) );
  CMPR32X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .C(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  CMPR32X1 S4_1 ( .A(ab_15__1_), .B(CARRYB_14__1_), .C(SUMB_14__2_), .CO(
        CARRYB_15__1_), .S(SUMB_15__1_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFHX1 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFHX1 S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFHX1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .CI(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  ADDFHX1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .CI(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  ADDFHX1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  ADDFHX1 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFHX1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  ADDFHX1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFHXL S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFX2 S2_2_3 ( .A(ab_2__3_), .B(n6), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFX2 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .CI(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFHX1 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFHX1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFX2 S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFX2 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .CI(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  NOR2X1 U2 ( .A(n59), .B(n55), .Y(ab_1__3_) );
  AOI21X1 U3 ( .A0(n33), .A1(n18), .B0(n40), .Y(n36) );
  INVX4 U4 ( .A(B[3]), .Y(n59) );
  CLKINVX3 U5 ( .A(A[0]), .Y(n56) );
  NOR2X1 U6 ( .A(n7), .B(n56), .Y(ab_0__6_) );
  INVX1 U7 ( .A(B[5]), .Y(n57) );
  NOR2X1 U8 ( .A(n57), .B(n56), .Y(ab_0__5_) );
  INVX1 U9 ( .A(n14), .Y(n15) );
  INVX1 U10 ( .A(n10), .Y(n11) );
  NOR2X1 U11 ( .A(n59), .B(n56), .Y(ab_0__3_) );
  NOR2X2 U12 ( .A(n55), .B(n61), .Y(ab_1__1_) );
  INVX2 U13 ( .A(B[1]), .Y(n61) );
  NOR2X1 U14 ( .A(n22), .B(A1_18_), .Y(n37) );
  NOR2X1 U15 ( .A(n58), .B(n55), .Y(ab_1__4_) );
  NOR2X1 U16 ( .A(n58), .B(n56), .Y(ab_0__4_) );
  CLKINVX3 U17 ( .A(B[4]), .Y(n58) );
  INVX1 U18 ( .A(B[6]), .Y(n7) );
  AND2X2 U19 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n2) );
  AND2X2 U20 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n3) );
  AND2X2 U21 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n4) );
  AND2X2 U22 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n5) );
  AND2X2 U23 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n6) );
  OAI21X1 U24 ( .A0(n30), .A1(n26), .B0(n29), .Y(n18) );
  XOR2X1 U25 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  AOI21X2 U26 ( .A0(n33), .A1(n12), .B0(n40), .Y(n16) );
  BUFX3 U27 ( .A(n62), .Y(n9) );
  NAND2BX2 U28 ( .AN(n37), .B(n35), .Y(n34) );
  OAI21X1 U29 ( .A0(n36), .A1(n37), .B0(n35), .Y(n39) );
  INVXL U30 ( .A(B[6]), .Y(n8) );
  INVXL U31 ( .A(B[0]), .Y(n62) );
  XOR2XL U32 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  NOR2X1 U33 ( .A(n57), .B(n55), .Y(ab_1__5_) );
  NOR2XL U34 ( .A(n59), .B(n41), .Y(ab_15__3_) );
  NOR2XL U35 ( .A(n59), .B(n42), .Y(ab_14__3_) );
  NOR2XL U36 ( .A(n59), .B(n43), .Y(ab_13__3_) );
  NOR2XL U37 ( .A(n59), .B(n44), .Y(ab_12__3_) );
  NOR2XL U38 ( .A(n59), .B(n45), .Y(ab_11__3_) );
  NOR2XL U39 ( .A(n59), .B(n46), .Y(ab_10__3_) );
  NOR2XL U40 ( .A(n47), .B(n59), .Y(ab_9__3_) );
  NOR2XL U41 ( .A(n59), .B(n48), .Y(ab_8__3_) );
  NOR2XL U42 ( .A(n59), .B(n49), .Y(ab_7__3_) );
  NOR2XL U43 ( .A(n59), .B(n50), .Y(ab_6__3_) );
  NOR2XL U44 ( .A(n59), .B(n51), .Y(ab_5__3_) );
  NOR2XL U45 ( .A(n59), .B(n52), .Y(ab_4__3_) );
  NOR2XL U46 ( .A(n59), .B(n53), .Y(ab_3__3_) );
  NOR2XL U47 ( .A(n59), .B(n54), .Y(ab_2__3_) );
  NOR2XL U48 ( .A(n57), .B(n54), .Y(ab_2__5_) );
  NOR2XL U49 ( .A(n8), .B(n41), .Y(ab_15__6_) );
  NOR2XL U50 ( .A(n7), .B(n42), .Y(ab_14__6_) );
  NOR2XL U51 ( .A(n8), .B(n43), .Y(ab_13__6_) );
  NOR2XL U52 ( .A(n8), .B(n44), .Y(ab_12__6_) );
  NOR2XL U53 ( .A(n8), .B(n45), .Y(ab_11__6_) );
  NOR2XL U54 ( .A(n8), .B(n46), .Y(ab_10__6_) );
  NOR2XL U55 ( .A(n47), .B(n8), .Y(ab_9__6_) );
  NOR2XL U56 ( .A(n8), .B(n48), .Y(ab_8__6_) );
  NOR2XL U57 ( .A(n8), .B(n49), .Y(ab_7__6_) );
  NOR2XL U58 ( .A(n8), .B(n50), .Y(ab_6__6_) );
  NOR2XL U59 ( .A(n8), .B(n51), .Y(ab_5__6_) );
  NOR2XL U60 ( .A(n8), .B(n52), .Y(ab_4__6_) );
  NOR2XL U61 ( .A(n8), .B(n53), .Y(ab_3__6_) );
  NOR2XL U62 ( .A(n8), .B(n54), .Y(ab_2__6_) );
  NOR2XL U63 ( .A(n61), .B(n54), .Y(ab_2__1_) );
  NOR2XL U64 ( .A(n61), .B(n53), .Y(ab_3__1_) );
  INVX4 U65 ( .A(B[2]), .Y(n60) );
  INVX4 U66 ( .A(A[1]), .Y(n55) );
  NOR2X1 U67 ( .A(n60), .B(n54), .Y(ab_2__2_) );
  NOR2X1 U68 ( .A(n60), .B(n56), .Y(ab_0__2_) );
  NOR2XL U69 ( .A(n8), .B(n55), .Y(ab_1__6_) );
  INVXL U70 ( .A(ab_1__2_), .Y(n10) );
  OAI21X1 U71 ( .A0(n30), .A1(n26), .B0(n29), .Y(n12) );
  NAND2X2 U72 ( .A(n24), .B(A1_15_), .Y(n26) );
  INVXL U73 ( .A(B[5]), .Y(n13) );
  INVXL U74 ( .A(ab_0__2_), .Y(n14) );
  INVXL U75 ( .A(B[1]), .Y(n17) );
  XOR2X1 U76 ( .A(n34), .B(n16), .Y(PRODUCT_20_) );
  NAND2BXL U77 ( .AN(n30), .B(n29), .Y(n28) );
  OAI21XL U78 ( .A0(n30), .A1(n26), .B0(n29), .Y(n19) );
  NOR2XL U79 ( .A(n60), .B(n53), .Y(ab_3__2_) );
  NOR2XL U80 ( .A(n60), .B(n52), .Y(ab_4__2_) );
  NOR2XL U81 ( .A(n60), .B(n51), .Y(ab_5__2_) );
  XNOR2X1 U82 ( .A(n31), .B(n19), .Y(PRODUCT_19_) );
  XOR2X1 U83 ( .A(n28), .B(n26), .Y(PRODUCT_18_) );
  NOR2XL U84 ( .A(n13), .B(n48), .Y(ab_8__5_) );
  NOR2XL U85 ( .A(n13), .B(n42), .Y(ab_14__5_) );
  NOR2XL U86 ( .A(n13), .B(n49), .Y(ab_7__5_) );
  NOR2XL U87 ( .A(n13), .B(n50), .Y(ab_6__5_) );
  NOR2XL U88 ( .A(n13), .B(n43), .Y(ab_13__5_) );
  NOR2XL U89 ( .A(n13), .B(n51), .Y(ab_5__5_) );
  NOR2XL U90 ( .A(n13), .B(n46), .Y(ab_10__5_) );
  NOR2XL U91 ( .A(n13), .B(n44), .Y(ab_12__5_) );
  NOR2XL U92 ( .A(n13), .B(n52), .Y(ab_4__5_) );
  XOR2X1 U93 ( .A(ab_1__1_), .B(n15), .Y(SUMB_1__1_) );
  NOR2XL U94 ( .A(n58), .B(n41), .Y(ab_15__4_) );
  NOR2XL U95 ( .A(n58), .B(n42), .Y(ab_14__4_) );
  NOR2XL U96 ( .A(n58), .B(n43), .Y(ab_13__4_) );
  NOR2XL U97 ( .A(n58), .B(n44), .Y(ab_12__4_) );
  NOR2XL U98 ( .A(n58), .B(n45), .Y(ab_11__4_) );
  NOR2XL U99 ( .A(n58), .B(n46), .Y(ab_10__4_) );
  NOR2XL U100 ( .A(n47), .B(n58), .Y(ab_9__4_) );
  NOR2XL U101 ( .A(n58), .B(n48), .Y(ab_8__4_) );
  NOR2XL U102 ( .A(n58), .B(n49), .Y(ab_7__4_) );
  NOR2XL U103 ( .A(n58), .B(n50), .Y(ab_6__4_) );
  NOR2XL U104 ( .A(n58), .B(n51), .Y(ab_5__4_) );
  NOR2XL U105 ( .A(n58), .B(n52), .Y(ab_4__4_) );
  NOR2XL U106 ( .A(n58), .B(n53), .Y(ab_3__4_) );
  NOR2XL U107 ( .A(n58), .B(n54), .Y(ab_2__4_) );
  NAND2XL U108 ( .A(n33), .B(n32), .Y(n31) );
  NAND2XL U109 ( .A(n21), .B(A1_16_), .Y(n29) );
  NAND2XL U110 ( .A(n22), .B(A1_18_), .Y(n35) );
  OR2X2 U111 ( .A(n23), .B(A1_17_), .Y(n33) );
  AND2X1 U112 ( .A(n27), .B(n26), .Y(PRODUCT_17_) );
  AND2X1 U113 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n21) );
  XOR2XL U114 ( .A(n11), .B(ab_0__3_), .Y(SUMB_1__2_) );
  NOR2XL U115 ( .A(n13), .B(n53), .Y(ab_3__5_) );
  INVX1 U116 ( .A(n32), .Y(n40) );
  XOR2X1 U117 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U118 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  XOR2X1 U119 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  XOR2X1 U120 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U121 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U122 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n22) );
  AND2X2 U123 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n23) );
  AND2X2 U124 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n24) );
  AND2X2 U125 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n25) );
  XOR2X1 U126 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2X1 U127 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  INVX1 U128 ( .A(A[2]), .Y(n54) );
  INVX1 U129 ( .A(A[3]), .Y(n53) );
  INVX1 U130 ( .A(A[4]), .Y(n52) );
  INVX1 U131 ( .A(A[6]), .Y(n50) );
  INVX1 U132 ( .A(A[5]), .Y(n51) );
  INVX1 U133 ( .A(A[9]), .Y(n47) );
  INVX1 U134 ( .A(A[7]), .Y(n49) );
  INVX1 U135 ( .A(A[8]), .Y(n48) );
  INVX1 U136 ( .A(A[10]), .Y(n46) );
  INVX1 U137 ( .A(A[11]), .Y(n45) );
  INVX1 U138 ( .A(A[12]), .Y(n44) );
  INVX1 U139 ( .A(A[13]), .Y(n43) );
  INVX1 U140 ( .A(A[14]), .Y(n42) );
  INVX1 U141 ( .A(A[15]), .Y(n41) );
  OR2X1 U142 ( .A(n24), .B(A1_15_), .Y(n27) );
  NOR2X1 U143 ( .A(n21), .B(A1_16_), .Y(n30) );
  NAND2X1 U144 ( .A(n23), .B(A1_17_), .Y(n32) );
  XOR2X1 U145 ( .A(n25), .B(A1_19_), .Y(n38) );
  XOR2X1 U146 ( .A(n39), .B(n38), .Y(PRODUCT_21_) );
  NOR2X1 U147 ( .A(n47), .B(n13), .Y(ab_9__5_) );
  NOR2X1 U148 ( .A(n47), .B(n60), .Y(ab_9__2_) );
  NOR2X1 U149 ( .A(n47), .B(n17), .Y(ab_9__1_) );
  NOR2X1 U150 ( .A(n47), .B(n9), .Y(ab_9__0_) );
  NOR2X1 U151 ( .A(n60), .B(n48), .Y(ab_8__2_) );
  NOR2X1 U152 ( .A(n17), .B(n48), .Y(ab_8__1_) );
  NOR2X1 U153 ( .A(n9), .B(n48), .Y(ab_8__0_) );
  NOR2X1 U154 ( .A(n60), .B(n49), .Y(ab_7__2_) );
  NOR2X1 U155 ( .A(n17), .B(n49), .Y(ab_7__1_) );
  NOR2X1 U156 ( .A(n9), .B(n49), .Y(ab_7__0_) );
  NOR2X1 U157 ( .A(n60), .B(n50), .Y(ab_6__2_) );
  NOR2X1 U158 ( .A(n17), .B(n50), .Y(ab_6__1_) );
  NOR2X1 U159 ( .A(n9), .B(n50), .Y(ab_6__0_) );
  NOR2X1 U160 ( .A(n17), .B(n51), .Y(ab_5__1_) );
  NOR2X1 U161 ( .A(n9), .B(n51), .Y(ab_5__0_) );
  NOR2X1 U162 ( .A(n17), .B(n52), .Y(ab_4__1_) );
  NOR2X1 U163 ( .A(n9), .B(n52), .Y(ab_4__0_) );
  NOR2X1 U164 ( .A(n9), .B(n53), .Y(ab_3__0_) );
  NOR2X1 U165 ( .A(n62), .B(n54), .Y(ab_2__0_) );
  NOR2X1 U166 ( .A(n60), .B(n55), .Y(ab_1__2_) );
  NOR2X1 U167 ( .A(n13), .B(n41), .Y(ab_15__5_) );
  NOR2X1 U168 ( .A(n60), .B(n41), .Y(ab_15__2_) );
  NOR2X1 U169 ( .A(n17), .B(n41), .Y(ab_15__1_) );
  NOR2X1 U170 ( .A(n9), .B(n41), .Y(ab_15__0_) );
  NOR2X1 U171 ( .A(n60), .B(n42), .Y(ab_14__2_) );
  NOR2X1 U172 ( .A(n17), .B(n42), .Y(ab_14__1_) );
  NOR2X1 U173 ( .A(n9), .B(n42), .Y(ab_14__0_) );
  NOR2X1 U174 ( .A(n60), .B(n43), .Y(ab_13__2_) );
  NOR2X1 U175 ( .A(n17), .B(n43), .Y(ab_13__1_) );
  NOR2X1 U176 ( .A(n9), .B(n43), .Y(ab_13__0_) );
  NOR2X1 U177 ( .A(n60), .B(n44), .Y(ab_12__2_) );
  NOR2X1 U178 ( .A(n17), .B(n44), .Y(ab_12__1_) );
  NOR2X1 U179 ( .A(n9), .B(n44), .Y(ab_12__0_) );
  NOR2X1 U180 ( .A(n13), .B(n45), .Y(ab_11__5_) );
  NOR2X1 U181 ( .A(n60), .B(n45), .Y(ab_11__2_) );
  NOR2X1 U182 ( .A(n17), .B(n45), .Y(ab_11__1_) );
  NOR2X1 U183 ( .A(n9), .B(n45), .Y(ab_11__0_) );
  NOR2X1 U184 ( .A(n60), .B(n46), .Y(ab_10__2_) );
  NOR2X1 U185 ( .A(n17), .B(n46), .Y(ab_10__1_) );
  NOR2X1 U186 ( .A(n9), .B(n46), .Y(ab_10__0_) );
  AND3X1 U187 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
endmodule


module multi16_5 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_5_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(in_8bit_b[7])
         );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n2), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_16_ ( .D(n3), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n43), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n44), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_14_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 out_reg_10_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_6_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 out_reg_5_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_1_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 out_reg_0_ ( .D(n120), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n122), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 in_8bit_b_reg_5_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQX1 sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQX1 sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQX4 in_17bit_b_reg_1_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_17bit_b[1]) );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX4 in_8bit_b_reg_1_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  DFFRHQX4 in_8bit_b_reg_4_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  DFFRHQX2 in_8bit_b_reg_3_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX2 in_17bit_b_reg_0_ ( .D(n118), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  INVX1 U3 ( .A(n2), .Y(n119) );
  INVX1 U4 ( .A(in_17bit[0]), .Y(n4) );
  INVX1 U5 ( .A(n128), .Y(n118) );
  AOI22X1 U6 ( .A0(in_17bit[0]), .A1(n2), .B0(in_17bit[0]), .B1(n119), .Y(n128) );
  INVX1 U7 ( .A(n129), .Y(n96) );
  AOI22X1 U8 ( .A0(N6), .A1(n2), .B0(in_17bit[1]), .B1(n119), .Y(n129) );
  INVX1 U9 ( .A(in_17bit[1]), .Y(n5) );
  BUFX3 U10 ( .A(in_17bit[16]), .Y(n2) );
  INVX1 U11 ( .A(n143), .Y(n43) );
  AOI22X1 U12 ( .A0(n2), .A1(N20), .B0(in_17bit[15]), .B1(n119), .Y(n143) );
  INVX1 U13 ( .A(in_17bit[15]), .Y(n19) );
  INVX1 U14 ( .A(n130), .Y(n95) );
  AOI22X1 U15 ( .A0(N7), .A1(n2), .B0(in_17bit[2]), .B1(n119), .Y(n130) );
  INVX1 U16 ( .A(n131), .Y(n94) );
  AOI22X1 U17 ( .A0(N8), .A1(n2), .B0(in_17bit[3]), .B1(n119), .Y(n131) );
  INVX1 U18 ( .A(n132), .Y(n93) );
  AOI22X1 U19 ( .A0(N9), .A1(n2), .B0(in_17bit[4]), .B1(n119), .Y(n132) );
  INVX1 U20 ( .A(n133), .Y(n92) );
  AOI22X1 U21 ( .A0(N10), .A1(n2), .B0(in_17bit[5]), .B1(n119), .Y(n133) );
  INVX1 U22 ( .A(n134), .Y(n91) );
  AOI22X1 U23 ( .A0(N11), .A1(n2), .B0(in_17bit[6]), .B1(n119), .Y(n134) );
  INVX1 U24 ( .A(n135), .Y(n90) );
  AOI22X1 U25 ( .A0(N12), .A1(n2), .B0(in_17bit[7]), .B1(n119), .Y(n135) );
  INVX1 U26 ( .A(n136), .Y(n89) );
  AOI22X1 U27 ( .A0(N13), .A1(n2), .B0(in_17bit[8]), .B1(n119), .Y(n136) );
  INVX1 U28 ( .A(n137), .Y(n49) );
  AOI22X1 U29 ( .A0(N14), .A1(n2), .B0(in_17bit[9]), .B1(n119), .Y(n137) );
  INVX1 U30 ( .A(n138), .Y(n48) );
  AOI22X1 U31 ( .A0(N15), .A1(n2), .B0(in_17bit[10]), .B1(n119), .Y(n138) );
  INVX1 U32 ( .A(n139), .Y(n47) );
  AOI22X1 U33 ( .A0(N16), .A1(n2), .B0(in_17bit[11]), .B1(n119), .Y(n139) );
  INVX1 U34 ( .A(n140), .Y(n46) );
  AOI22X1 U35 ( .A0(N17), .A1(n2), .B0(in_17bit[12]), .B1(n119), .Y(n140) );
  INVX1 U36 ( .A(n141), .Y(n45) );
  AOI22X1 U37 ( .A0(N18), .A1(n2), .B0(in_17bit[13]), .B1(n119), .Y(n141) );
  INVX1 U38 ( .A(n142), .Y(n44) );
  AOI22X1 U39 ( .A0(N19), .A1(n2), .B0(in_17bit[14]), .B1(n119), .Y(n142) );
  INVX1 U40 ( .A(in_17bit[2]), .Y(n6) );
  INVX1 U41 ( .A(in_17bit[3]), .Y(n7) );
  INVX1 U42 ( .A(in_17bit[4]), .Y(n8) );
  INVX1 U43 ( .A(in_17bit[5]), .Y(n9) );
  INVX1 U44 ( .A(in_17bit[6]), .Y(n10) );
  INVX1 U45 ( .A(in_17bit[7]), .Y(n11) );
  INVX1 U46 ( .A(in_17bit[11]), .Y(n15) );
  INVX1 U47 ( .A(in_17bit[8]), .Y(n12) );
  INVX1 U48 ( .A(in_17bit[9]), .Y(n13) );
  INVX1 U49 ( .A(in_17bit[10]), .Y(n14) );
  INVX1 U50 ( .A(in_17bit[12]), .Y(n16) );
  INVX1 U51 ( .A(in_17bit[13]), .Y(n17) );
  INVX1 U52 ( .A(in_17bit[14]), .Y(n18) );
  INVX1 U53 ( .A(n1), .Y(n123) );
  INVX1 U54 ( .A(n3), .Y(n121) );
  INVX1 U55 ( .A(n162), .Y(n107) );
  AOI22X1 U56 ( .A0(N82), .A1(n3), .B0(sum_b[18]), .B1(n121), .Y(n162) );
  INVX1 U57 ( .A(n125), .Y(n105) );
  AOI22X1 U58 ( .A0(N84), .A1(n3), .B0(sum_b[20]), .B1(n121), .Y(n125) );
  INVX1 U59 ( .A(n163), .Y(n106) );
  AOI22X1 U60 ( .A0(n3), .A1(N83), .B0(sum_b[19]), .B1(n121), .Y(n163) );
  INVX1 U61 ( .A(N71), .Y(n27) );
  INVX1 U62 ( .A(sum_b[8]), .Y(n28) );
  INVX1 U63 ( .A(sum_b[9]), .Y(n29) );
  INVX1 U64 ( .A(sum_b[10]), .Y(n30) );
  INVX1 U65 ( .A(sum_b[11]), .Y(n31) );
  INVX1 U66 ( .A(sum_b[12]), .Y(n32) );
  INVX1 U67 ( .A(n126), .Y(n104) );
  AOI22X1 U68 ( .A0(N85), .A1(n3), .B0(sum_b[21]), .B1(n121), .Y(n126) );
  INVX1 U69 ( .A(n127), .Y(n103) );
  AOI22X1 U70 ( .A0(N86), .A1(n3), .B0(sum_b[22]), .B1(n121), .Y(n127) );
  INVX1 U71 ( .A(sum_b[22]), .Y(n42) );
  INVX1 U72 ( .A(n158), .Y(n111) );
  AOI22X1 U73 ( .A0(N78), .A1(n3), .B0(sum_b[14]), .B1(n121), .Y(n158) );
  INVX1 U74 ( .A(n159), .Y(n110) );
  AOI22X1 U75 ( .A0(N79), .A1(n3), .B0(sum_b[15]), .B1(n121), .Y(n159) );
  INVX1 U76 ( .A(n160), .Y(n109) );
  AOI22X1 U77 ( .A0(N80), .A1(n3), .B0(sum_b[16]), .B1(n121), .Y(n160) );
  INVX1 U78 ( .A(n161), .Y(n108) );
  AOI22X1 U79 ( .A0(N81), .A1(n3), .B0(sum_b[17]), .B1(n121), .Y(n161) );
  INVX1 U80 ( .A(sum_b[13]), .Y(n33) );
  INVX1 U81 ( .A(sum_b[14]), .Y(n34) );
  INVX1 U82 ( .A(sum_b[15]), .Y(n35) );
  INVX1 U83 ( .A(sum_b[16]), .Y(n36) );
  INVX1 U84 ( .A(n153), .Y(n116) );
  AOI22X1 U85 ( .A0(N73), .A1(n3), .B0(sum_b[9]), .B1(n121), .Y(n153) );
  INVX1 U86 ( .A(n154), .Y(n115) );
  AOI22X1 U87 ( .A0(N74), .A1(n3), .B0(sum_b[10]), .B1(n121), .Y(n154) );
  INVX1 U88 ( .A(n155), .Y(n114) );
  AOI22X1 U89 ( .A0(N75), .A1(n3), .B0(sum_b[11]), .B1(n121), .Y(n155) );
  INVX1 U90 ( .A(n156), .Y(n113) );
  AOI22X1 U91 ( .A0(N76), .A1(n3), .B0(sum_b[12]), .B1(n121), .Y(n156) );
  INVX1 U92 ( .A(n157), .Y(n112) );
  AOI22X1 U93 ( .A0(N77), .A1(n3), .B0(sum_b[13]), .B1(n121), .Y(n157) );
  INVX1 U94 ( .A(in_8bit[0]), .Y(n20) );
  INVX1 U95 ( .A(sum_b[17]), .Y(n37) );
  INVX1 U96 ( .A(sum_b[18]), .Y(n38) );
  INVX1 U97 ( .A(sum_b[19]), .Y(n39) );
  INVX1 U98 ( .A(sum_b[20]), .Y(n40) );
  INVX1 U99 ( .A(sum_b[21]), .Y(n41) );
  INVX1 U100 ( .A(n146), .Y(n101) );
  AOI22X1 U101 ( .A0(N40), .A1(n1), .B0(in_8bit[2]), .B1(n123), .Y(n146) );
  INVX1 U102 ( .A(n147), .Y(n100) );
  AOI22X1 U103 ( .A0(N41), .A1(n1), .B0(in_8bit[3]), .B1(n123), .Y(n147) );
  INVX1 U104 ( .A(n148), .Y(n99) );
  AOI22X1 U105 ( .A0(N42), .A1(n1), .B0(in_8bit[4]), .B1(n123), .Y(n148) );
  INVX1 U106 ( .A(n149), .Y(n98) );
  AOI22X1 U107 ( .A0(N43), .A1(n1), .B0(in_8bit[5]), .B1(n123), .Y(n149) );
  INVX1 U108 ( .A(n150), .Y(n97) );
  AOI22X1 U109 ( .A0(n1), .A1(N44), .B0(in_8bit[6]), .B1(n123), .Y(n150) );
  INVX1 U110 ( .A(in_8bit[6]), .Y(n26) );
  INVX1 U111 ( .A(in_8bit[1]), .Y(n21) );
  INVX1 U112 ( .A(in_8bit[2]), .Y(n22) );
  INVX1 U113 ( .A(in_8bit[3]), .Y(n23) );
  INVX1 U114 ( .A(in_8bit[4]), .Y(n24) );
  INVX1 U115 ( .A(in_8bit[5]), .Y(n25) );
  BUFX3 U116 ( .A(sum_b[23]), .Y(n3) );
  BUFX3 U117 ( .A(in_8bit[7]), .Y(n1) );
  INVX1 U118 ( .A(n144), .Y(n122) );
  AOI22X1 U119 ( .A0(in_8bit[0]), .A1(n1), .B0(in_8bit[0]), .B1(n123), .Y(n144) );
  INVX1 U120 ( .A(n145), .Y(n102) );
  AOI22X1 U121 ( .A0(N39), .A1(n1), .B0(in_8bit[1]), .B1(n123), .Y(n145) );
  INVX1 U122 ( .A(n151), .Y(n120) );
  AOI22X1 U123 ( .A0(N71), .A1(n3), .B0(N71), .B1(n121), .Y(n151) );
  INVX1 U124 ( .A(n152), .Y(n117) );
  AOI22X1 U125 ( .A0(N72), .A1(n3), .B0(sum_b[8]), .B1(n121), .Y(n152) );
  XOR2X1 U126 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U127 ( .A(n42), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U128 ( .A(sub_add_97_b0_carry[14]), .B(n41), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U129 ( .A(n41), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U130 ( .A(sub_add_97_b0_carry[13]), .B(n40), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U131 ( .A(n40), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U132 ( .A(sub_add_97_b0_carry[12]), .B(n39), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U133 ( .A(n39), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U134 ( .A(sub_add_97_b0_carry[11]), .B(n38), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U135 ( .A(n38), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U136 ( .A(sub_add_97_b0_carry[10]), .B(n37), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U137 ( .A(n37), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U138 ( .A(sub_add_97_b0_carry[9]), .B(n36), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U139 ( .A(n36), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U140 ( .A(sub_add_97_b0_carry[8]), .B(n35), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U141 ( .A(n35), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U142 ( .A(sub_add_97_b0_carry[7]), .B(n34), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U143 ( .A(n34), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U144 ( .A(sub_add_97_b0_carry[6]), .B(n33), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U145 ( .A(n33), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U146 ( .A(sub_add_97_b0_carry[5]), .B(n32), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U147 ( .A(n32), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U148 ( .A(sub_add_97_b0_carry[4]), .B(n31), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U149 ( .A(n31), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U150 ( .A(sub_add_97_b0_carry[3]), .B(n30), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U151 ( .A(n30), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U152 ( .A(sub_add_97_b0_carry[2]), .B(n29), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U153 ( .A(n29), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U154 ( .A(n27), .B(n28), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U155 ( .A(n28), .B(n27), .Y(N72) );
  XOR2X1 U156 ( .A(n26), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U157 ( .A(sub_add_61_b0_carry[5]), .B(n25), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U158 ( .A(n25), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U159 ( .A(sub_add_61_b0_carry[4]), .B(n24), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U160 ( .A(n24), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U161 ( .A(sub_add_61_b0_carry[3]), .B(n23), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U162 ( .A(n23), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U163 ( .A(sub_add_61_b0_carry[2]), .B(n22), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U164 ( .A(n22), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U165 ( .A(n20), .B(n21), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U166 ( .A(n21), .B(n20), .Y(N39) );
  XOR2X1 U167 ( .A(n19), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U168 ( .A(sub_add_52_b0_carry[14]), .B(n18), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U169 ( .A(n18), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U170 ( .A(sub_add_52_b0_carry[13]), .B(n17), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U171 ( .A(n17), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U172 ( .A(sub_add_52_b0_carry[12]), .B(n16), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U173 ( .A(n16), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U174 ( .A(sub_add_52_b0_carry[11]), .B(n15), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U175 ( .A(n15), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U176 ( .A(sub_add_52_b0_carry[10]), .B(n14), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U177 ( .A(n14), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U178 ( .A(sub_add_52_b0_carry[9]), .B(n13), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U179 ( .A(n13), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U180 ( .A(sub_add_52_b0_carry[8]), .B(n12), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U181 ( .A(n12), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U182 ( .A(sub_add_52_b0_carry[7]), .B(n11), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U183 ( .A(n11), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U184 ( .A(sub_add_52_b0_carry[6]), .B(n10), .Y(sub_add_52_b0_carry[7]) );
  XOR2X1 U185 ( .A(n10), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U186 ( .A(sub_add_52_b0_carry[5]), .B(n9), .Y(sub_add_52_b0_carry[6])
         );
  XOR2X1 U187 ( .A(n9), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U188 ( .A(sub_add_52_b0_carry[4]), .B(n8), .Y(sub_add_52_b0_carry[5])
         );
  XOR2X1 U189 ( .A(n8), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U190 ( .A(sub_add_52_b0_carry[3]), .B(n7), .Y(sub_add_52_b0_carry[4])
         );
  XOR2X1 U191 ( .A(n7), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U192 ( .A(sub_add_52_b0_carry[2]), .B(n6), .Y(sub_add_52_b0_carry[3])
         );
  XOR2X1 U193 ( .A(n6), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U194 ( .A(n4), .B(n5), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U195 ( .A(n5), .B(n4), .Y(N6) );
endmodule


module multi16_4_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S2_2_4 ( .A(ab_2__4_), .B(n3), .C(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  CMPR32X1 S2_2_3 ( .A(ab_2__3_), .B(n4), .C(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX1 S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .C(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .C(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n2), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n5), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .C(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .C(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .C(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  CMPR32X1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .C(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .C(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .C(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  CMPR32X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .C(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX1 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFHX1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFHX1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFHX1 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFHX1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  ADDFX2 S3_2_5 ( .A(ab_2__5_), .B(n6), .CI(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  ADDFX2 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  ADDFHX1 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFHX1 S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFHX1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFHX2 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .CI(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  ADDFX2 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .CI(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFHXL S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .CI(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  INVX2 U2 ( .A(A[1]), .Y(n59) );
  INVX8 U3 ( .A(B[2]), .Y(n64) );
  XOR3X2 U4 ( .A(CARRYB_13__2_), .B(ab_14__2_), .C(SUMB_13__3_), .Y(
        SUMB_14__2_) );
  NOR2XL U5 ( .A(n62), .B(n45), .Y(ab_15__4_) );
  NOR2XL U6 ( .A(n62), .B(n46), .Y(ab_14__4_) );
  NOR2XL U7 ( .A(n62), .B(n47), .Y(ab_13__4_) );
  NOR2XL U8 ( .A(n62), .B(n48), .Y(ab_12__4_) );
  NOR2XL U9 ( .A(n62), .B(n49), .Y(ab_11__4_) );
  NOR2XL U10 ( .A(n62), .B(n50), .Y(ab_10__4_) );
  NOR2XL U11 ( .A(n51), .B(n62), .Y(ab_9__4_) );
  NOR2XL U12 ( .A(n62), .B(n52), .Y(ab_8__4_) );
  NOR2XL U13 ( .A(n62), .B(n53), .Y(ab_7__4_) );
  NOR2XL U14 ( .A(n62), .B(n54), .Y(ab_6__4_) );
  NOR2XL U15 ( .A(n62), .B(n55), .Y(ab_5__4_) );
  NOR2XL U16 ( .A(n62), .B(n57), .Y(ab_3__4_) );
  NOR2XL U17 ( .A(n62), .B(n58), .Y(ab_2__4_) );
  NOR2X2 U18 ( .A(n62), .B(n60), .Y(ab_0__4_) );
  NOR2X1 U19 ( .A(n7), .B(n60), .Y(ab_0__6_) );
  CLKINVX3 U20 ( .A(A[0]), .Y(n60) );
  NAND3X1 U21 ( .A(n16), .B(n14), .C(n15), .Y(CARRYB_4__4_) );
  INVX1 U22 ( .A(B[1]), .Y(n65) );
  NAND3X1 U23 ( .A(n19), .B(n17), .C(n18), .Y(CARRYB_14__2_) );
  NOR2X1 U24 ( .A(n21), .B(n45), .Y(ab_15__1_) );
  INVX2 U25 ( .A(B[4]), .Y(n62) );
  XOR2X1 U26 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  XOR2X1 U27 ( .A(CARRYB_14__1_), .B(n10), .Y(SUMB_15__1_) );
  XOR2X1 U28 ( .A(SUMB_14__2_), .B(ab_15__1_), .Y(n10) );
  NOR2X1 U29 ( .A(n64), .B(n60), .Y(ab_0__2_) );
  INVX1 U30 ( .A(B[6]), .Y(n7) );
  AND2X2 U31 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n2) );
  AND2X2 U32 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n3) );
  AND2X2 U33 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n4) );
  AND2X2 U34 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n5) );
  AND2X4 U35 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n6) );
  INVX1 U36 ( .A(B[0]), .Y(n66) );
  XOR2XL U37 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  NOR2X2 U38 ( .A(n61), .B(n59), .Y(ab_1__5_) );
  INVXL U39 ( .A(B[6]), .Y(n8) );
  INVXL U40 ( .A(B[0]), .Y(n9) );
  NOR2X1 U41 ( .A(n64), .B(n59), .Y(ab_1__2_) );
  NOR2XL U42 ( .A(n62), .B(n59), .Y(ab_1__4_) );
  OAI21XL U43 ( .A0(n41), .A1(n40), .B0(n39), .Y(n43) );
  NOR2XL U44 ( .A(n8), .B(n45), .Y(ab_15__6_) );
  NOR2XL U45 ( .A(n7), .B(n46), .Y(ab_14__6_) );
  NOR2XL U46 ( .A(n8), .B(n47), .Y(ab_13__6_) );
  NOR2XL U47 ( .A(n8), .B(n48), .Y(ab_12__6_) );
  NOR2XL U48 ( .A(n8), .B(n49), .Y(ab_11__6_) );
  NOR2XL U49 ( .A(n7), .B(n50), .Y(ab_10__6_) );
  NOR2XL U50 ( .A(n51), .B(n8), .Y(ab_9__6_) );
  NOR2XL U51 ( .A(n8), .B(n52), .Y(ab_8__6_) );
  NOR2XL U52 ( .A(n8), .B(n53), .Y(ab_7__6_) );
  NOR2XL U53 ( .A(n8), .B(n54), .Y(ab_6__6_) );
  NOR2XL U54 ( .A(n8), .B(n55), .Y(ab_5__6_) );
  NOR2XL U55 ( .A(n8), .B(n56), .Y(ab_4__6_) );
  NOR2XL U56 ( .A(n8), .B(n57), .Y(ab_3__6_) );
  NOR2XL U57 ( .A(n8), .B(n58), .Y(ab_2__6_) );
  OAI21X2 U58 ( .A0(n33), .A1(n29), .B0(n32), .Y(n22) );
  NOR2XL U59 ( .A(n65), .B(n58), .Y(ab_2__1_) );
  NOR2XL U60 ( .A(n65), .B(n57), .Y(ab_3__1_) );
  AOI21X1 U61 ( .A0(n22), .A1(n37), .B0(n44), .Y(n40) );
  NAND2XL U62 ( .A(SUMB_14__2_), .B(CARRYB_14__1_), .Y(n11) );
  NAND2XL U63 ( .A(ab_15__1_), .B(CARRYB_14__1_), .Y(n12) );
  NAND2XL U64 ( .A(ab_15__1_), .B(SUMB_14__2_), .Y(n13) );
  NAND3X1 U65 ( .A(n13), .B(n11), .C(n12), .Y(CARRYB_15__1_) );
  XOR3X2 U66 ( .A(CARRYB_3__4_), .B(ab_4__4_), .C(SUMB_3__5_), .Y(SUMB_4__4_)
         );
  NAND2XL U67 ( .A(SUMB_3__5_), .B(CARRYB_3__4_), .Y(n14) );
  NAND2XL U68 ( .A(ab_4__4_), .B(CARRYB_3__4_), .Y(n15) );
  NAND2XL U69 ( .A(ab_4__4_), .B(SUMB_3__5_), .Y(n16) );
  NOR2XL U70 ( .A(n62), .B(n56), .Y(ab_4__4_) );
  AND3X2 U71 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
  NOR2X1 U72 ( .A(n61), .B(n60), .Y(ab_0__5_) );
  NAND2XL U73 ( .A(SUMB_13__3_), .B(CARRYB_13__2_), .Y(n17) );
  NAND2XL U74 ( .A(ab_14__2_), .B(CARRYB_13__2_), .Y(n18) );
  NAND2XL U75 ( .A(ab_14__2_), .B(SUMB_13__3_), .Y(n19) );
  NAND2X2 U76 ( .A(n27), .B(A1_15_), .Y(n29) );
  NOR2X2 U77 ( .A(n59), .B(n65), .Y(ab_1__1_) );
  NOR2XL U78 ( .A(n8), .B(n59), .Y(ab_1__6_) );
  INVXL U79 ( .A(B[5]), .Y(n20) );
  INVX1 U80 ( .A(B[5]), .Y(n61) );
  XOR2X1 U81 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  INVXL U82 ( .A(B[1]), .Y(n21) );
  INVX4 U83 ( .A(B[3]), .Y(n63) );
  XOR2XL U84 ( .A(n38), .B(n40), .Y(PRODUCT_20_) );
  NOR2X1 U85 ( .A(n63), .B(n60), .Y(ab_0__3_) );
  XOR2X1 U86 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2XL U87 ( .A(ab_0__2_), .B(ab_1__1_), .Y(SUMB_1__1_) );
  NOR2X1 U88 ( .A(n63), .B(n59), .Y(ab_1__3_) );
  NOR2XL U89 ( .A(n20), .B(n52), .Y(ab_8__5_) );
  NOR2XL U90 ( .A(n20), .B(n46), .Y(ab_14__5_) );
  NOR2XL U91 ( .A(n20), .B(n53), .Y(ab_7__5_) );
  NOR2XL U92 ( .A(n20), .B(n54), .Y(ab_6__5_) );
  NOR2XL U93 ( .A(n20), .B(n47), .Y(ab_13__5_) );
  NOR2XL U94 ( .A(n20), .B(n55), .Y(ab_5__5_) );
  NOR2XL U95 ( .A(n20), .B(n50), .Y(ab_10__5_) );
  NOR2XL U96 ( .A(n20), .B(n48), .Y(ab_12__5_) );
  NOR2XL U97 ( .A(n20), .B(n56), .Y(ab_4__5_) );
  NAND2XL U98 ( .A(n37), .B(n35), .Y(n34) );
  NAND2BXL U99 ( .AN(n33), .B(n32), .Y(n31) );
  NAND2XL U100 ( .A(n24), .B(A1_16_), .Y(n32) );
  NAND2XL U101 ( .A(n25), .B(A1_18_), .Y(n39) );
  OR2X2 U102 ( .A(n26), .B(A1_17_), .Y(n37) );
  AND2X1 U103 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n24) );
  XOR2XL U104 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  NOR2XL U105 ( .A(n20), .B(n57), .Y(ab_3__5_) );
  INVX1 U106 ( .A(n35), .Y(n44) );
  AND2X2 U107 ( .A(n30), .B(n29), .Y(PRODUCT_17_) );
  XOR2X1 U108 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U109 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  XOR2X1 U110 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U111 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U112 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n25) );
  AND2X2 U113 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n26) );
  AND2X2 U114 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n27) );
  AND2X2 U115 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n28) );
  XOR2X1 U116 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  INVX1 U117 ( .A(A[2]), .Y(n58) );
  INVX1 U118 ( .A(A[3]), .Y(n57) );
  INVX1 U119 ( .A(A[4]), .Y(n56) );
  INVX1 U120 ( .A(A[6]), .Y(n54) );
  INVX1 U121 ( .A(A[5]), .Y(n55) );
  INVX1 U122 ( .A(A[9]), .Y(n51) );
  INVX1 U123 ( .A(A[7]), .Y(n53) );
  INVX1 U124 ( .A(A[8]), .Y(n52) );
  INVX1 U125 ( .A(A[10]), .Y(n50) );
  INVX1 U126 ( .A(A[11]), .Y(n49) );
  INVX1 U127 ( .A(A[12]), .Y(n48) );
  INVX1 U128 ( .A(A[13]), .Y(n47) );
  INVX1 U129 ( .A(A[14]), .Y(n46) );
  INVX1 U130 ( .A(A[15]), .Y(n45) );
  OR2X1 U131 ( .A(n27), .B(A1_15_), .Y(n30) );
  NOR2X1 U132 ( .A(n24), .B(A1_16_), .Y(n33) );
  XOR2X1 U133 ( .A(n31), .B(n29), .Y(PRODUCT_18_) );
  NAND2X1 U134 ( .A(n26), .B(A1_17_), .Y(n35) );
  OAI21XL U135 ( .A0(n33), .A1(n29), .B0(n32), .Y(n36) );
  XNOR2X1 U136 ( .A(n34), .B(n36), .Y(PRODUCT_19_) );
  NOR2X1 U137 ( .A(n25), .B(A1_18_), .Y(n41) );
  NAND2BX1 U138 ( .AN(n41), .B(n39), .Y(n38) );
  XOR2X1 U139 ( .A(n28), .B(A1_19_), .Y(n42) );
  XOR2X1 U140 ( .A(n43), .B(n42), .Y(PRODUCT_21_) );
  NOR2X1 U141 ( .A(n51), .B(n20), .Y(ab_9__5_) );
  NOR2X1 U142 ( .A(n51), .B(n63), .Y(ab_9__3_) );
  NOR2X1 U143 ( .A(n51), .B(n64), .Y(ab_9__2_) );
  NOR2X1 U144 ( .A(n51), .B(n21), .Y(ab_9__1_) );
  NOR2X1 U145 ( .A(n51), .B(n9), .Y(ab_9__0_) );
  NOR2X1 U146 ( .A(n63), .B(n52), .Y(ab_8__3_) );
  NOR2X1 U147 ( .A(n64), .B(n52), .Y(ab_8__2_) );
  NOR2X1 U148 ( .A(n21), .B(n52), .Y(ab_8__1_) );
  NOR2X1 U149 ( .A(n9), .B(n52), .Y(ab_8__0_) );
  NOR2X1 U150 ( .A(n63), .B(n53), .Y(ab_7__3_) );
  NOR2X1 U151 ( .A(n64), .B(n53), .Y(ab_7__2_) );
  NOR2X1 U152 ( .A(n21), .B(n53), .Y(ab_7__1_) );
  NOR2X1 U153 ( .A(n9), .B(n53), .Y(ab_7__0_) );
  NOR2X1 U154 ( .A(n63), .B(n54), .Y(ab_6__3_) );
  NOR2X1 U155 ( .A(n64), .B(n54), .Y(ab_6__2_) );
  NOR2X1 U156 ( .A(n21), .B(n54), .Y(ab_6__1_) );
  NOR2X1 U157 ( .A(n9), .B(n54), .Y(ab_6__0_) );
  NOR2X1 U158 ( .A(n63), .B(n55), .Y(ab_5__3_) );
  NOR2X1 U159 ( .A(n64), .B(n55), .Y(ab_5__2_) );
  NOR2X1 U160 ( .A(n21), .B(n55), .Y(ab_5__1_) );
  NOR2X1 U161 ( .A(n9), .B(n55), .Y(ab_5__0_) );
  NOR2X1 U162 ( .A(n63), .B(n56), .Y(ab_4__3_) );
  NOR2X1 U163 ( .A(n64), .B(n56), .Y(ab_4__2_) );
  NOR2X1 U164 ( .A(n21), .B(n56), .Y(ab_4__1_) );
  NOR2X1 U165 ( .A(n9), .B(n56), .Y(ab_4__0_) );
  NOR2X1 U166 ( .A(n63), .B(n57), .Y(ab_3__3_) );
  NOR2X1 U167 ( .A(n64), .B(n57), .Y(ab_3__2_) );
  NOR2X1 U168 ( .A(n9), .B(n57), .Y(ab_3__0_) );
  NOR2X1 U169 ( .A(n61), .B(n58), .Y(ab_2__5_) );
  NOR2X1 U170 ( .A(n63), .B(n58), .Y(ab_2__3_) );
  NOR2X1 U171 ( .A(n64), .B(n58), .Y(ab_2__2_) );
  NOR2X1 U172 ( .A(n66), .B(n58), .Y(ab_2__0_) );
  NOR2X1 U173 ( .A(n20), .B(n45), .Y(ab_15__5_) );
  NOR2X1 U174 ( .A(n63), .B(n45), .Y(ab_15__3_) );
  NOR2X1 U175 ( .A(n64), .B(n45), .Y(ab_15__2_) );
  NOR2X1 U176 ( .A(n9), .B(n45), .Y(ab_15__0_) );
  NOR2X1 U177 ( .A(n63), .B(n46), .Y(ab_14__3_) );
  NOR2X1 U178 ( .A(n64), .B(n46), .Y(ab_14__2_) );
  NOR2X1 U179 ( .A(n21), .B(n46), .Y(ab_14__1_) );
  NOR2X1 U180 ( .A(n9), .B(n46), .Y(ab_14__0_) );
  NOR2X1 U181 ( .A(n63), .B(n47), .Y(ab_13__3_) );
  NOR2X1 U182 ( .A(n64), .B(n47), .Y(ab_13__2_) );
  NOR2X1 U183 ( .A(n21), .B(n47), .Y(ab_13__1_) );
  NOR2X1 U184 ( .A(n9), .B(n47), .Y(ab_13__0_) );
  NOR2X1 U185 ( .A(n63), .B(n48), .Y(ab_12__3_) );
  NOR2X1 U186 ( .A(n64), .B(n48), .Y(ab_12__2_) );
  NOR2X1 U187 ( .A(n21), .B(n48), .Y(ab_12__1_) );
  NOR2X1 U188 ( .A(n9), .B(n48), .Y(ab_12__0_) );
  NOR2X1 U189 ( .A(n20), .B(n49), .Y(ab_11__5_) );
  NOR2X1 U190 ( .A(n63), .B(n49), .Y(ab_11__3_) );
  NOR2X1 U191 ( .A(n64), .B(n49), .Y(ab_11__2_) );
  NOR2X1 U192 ( .A(n21), .B(n49), .Y(ab_11__1_) );
  NOR2X1 U193 ( .A(n9), .B(n49), .Y(ab_11__0_) );
  NOR2X1 U194 ( .A(n63), .B(n50), .Y(ab_10__3_) );
  NOR2X1 U195 ( .A(n64), .B(n50), .Y(ab_10__2_) );
  NOR2X1 U196 ( .A(n21), .B(n50), .Y(ab_10__1_) );
  NOR2X1 U197 ( .A(n9), .B(n50), .Y(ab_10__0_) );
endmodule


module multi16_4 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_4_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(in_8bit_b[7])
         );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n2), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 out_reg_16_ ( .D(n3), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_14_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n43), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n44), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_10_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 out_reg_6_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 out_reg_5_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_1_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_0_ ( .D(n120), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n118), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 in_8bit_b_reg_5_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQXL sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQXL sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQXL sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQX4 in_8bit_b_reg_3_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX4 in_17bit_b_reg_0_ ( .D(n122), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX4 in_8bit_b_reg_1_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  DFFRHQX4 in_17bit_b_reg_1_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_17bit_b[1]) );
  DFFRHQX2 in_8bit_b_reg_4_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  INVX1 U3 ( .A(n2), .Y(n123) );
  INVX1 U4 ( .A(n143), .Y(n43) );
  AOI22X1 U5 ( .A0(n2), .A1(N20), .B0(in_17bit[15]), .B1(n123), .Y(n143) );
  INVX1 U6 ( .A(in_17bit[15]), .Y(n19) );
  INVX1 U7 ( .A(n140), .Y(n46) );
  AOI22X1 U8 ( .A0(N17), .A1(n2), .B0(in_17bit[12]), .B1(n123), .Y(n140) );
  INVX1 U9 ( .A(n141), .Y(n45) );
  AOI22X1 U10 ( .A0(N18), .A1(n2), .B0(in_17bit[13]), .B1(n123), .Y(n141) );
  INVX1 U11 ( .A(n142), .Y(n44) );
  AOI22X1 U12 ( .A0(N19), .A1(n2), .B0(in_17bit[14]), .B1(n123), .Y(n142) );
  INVX1 U13 ( .A(in_17bit[0]), .Y(n4) );
  INVX1 U14 ( .A(in_17bit[1]), .Y(n5) );
  INVX1 U15 ( .A(in_17bit[2]), .Y(n6) );
  INVX1 U16 ( .A(in_17bit[3]), .Y(n7) );
  INVX1 U17 ( .A(in_17bit[4]), .Y(n8) );
  INVX1 U18 ( .A(n136), .Y(n89) );
  AOI22X1 U19 ( .A0(N13), .A1(n2), .B0(in_17bit[8]), .B1(n123), .Y(n136) );
  INVX1 U20 ( .A(n137), .Y(n49) );
  AOI22X1 U21 ( .A0(N14), .A1(n2), .B0(in_17bit[9]), .B1(n123), .Y(n137) );
  INVX1 U22 ( .A(n138), .Y(n48) );
  AOI22X1 U23 ( .A0(N15), .A1(n2), .B0(in_17bit[10]), .B1(n123), .Y(n138) );
  INVX1 U24 ( .A(n139), .Y(n47) );
  AOI22X1 U25 ( .A0(N16), .A1(n2), .B0(in_17bit[11]), .B1(n123), .Y(n139) );
  INVX1 U26 ( .A(in_17bit[5]), .Y(n9) );
  INVX1 U27 ( .A(in_17bit[6]), .Y(n10) );
  INVX1 U28 ( .A(in_17bit[7]), .Y(n11) );
  INVX1 U29 ( .A(in_17bit[8]), .Y(n12) );
  INVX1 U30 ( .A(n133), .Y(n92) );
  AOI22X1 U31 ( .A0(N10), .A1(n2), .B0(in_17bit[5]), .B1(n123), .Y(n133) );
  INVX1 U32 ( .A(n131), .Y(n94) );
  AOI22X1 U33 ( .A0(N8), .A1(n2), .B0(in_17bit[3]), .B1(n123), .Y(n131) );
  INVX1 U34 ( .A(n132), .Y(n93) );
  AOI22X1 U35 ( .A0(N9), .A1(n2), .B0(in_17bit[4]), .B1(n123), .Y(n132) );
  INVX1 U36 ( .A(n134), .Y(n91) );
  AOI22X1 U37 ( .A0(N11), .A1(n2), .B0(in_17bit[6]), .B1(n123), .Y(n134) );
  INVX1 U38 ( .A(n135), .Y(n90) );
  AOI22X1 U39 ( .A0(N12), .A1(n2), .B0(in_17bit[7]), .B1(n123), .Y(n135) );
  INVX1 U40 ( .A(in_17bit[9]), .Y(n13) );
  INVX1 U41 ( .A(in_17bit[10]), .Y(n14) );
  INVX1 U42 ( .A(in_17bit[11]), .Y(n15) );
  INVX1 U43 ( .A(in_17bit[12]), .Y(n16) );
  INVX1 U44 ( .A(in_17bit[13]), .Y(n17) );
  INVX1 U45 ( .A(n1), .Y(n119) );
  BUFX3 U46 ( .A(in_17bit[16]), .Y(n2) );
  INVX1 U47 ( .A(in_8bit[0]), .Y(n20) );
  INVX1 U48 ( .A(n144), .Y(n118) );
  AOI22X1 U49 ( .A0(in_8bit[0]), .A1(n1), .B0(in_8bit[0]), .B1(n119), .Y(n144)
         );
  INVX1 U50 ( .A(n145), .Y(n102) );
  AOI22X1 U51 ( .A0(N39), .A1(n1), .B0(in_8bit[1]), .B1(n119), .Y(n145) );
  INVX1 U52 ( .A(n146), .Y(n101) );
  AOI22X1 U53 ( .A0(N40), .A1(n1), .B0(in_8bit[2]), .B1(n119), .Y(n146) );
  INVX1 U54 ( .A(n147), .Y(n100) );
  AOI22X1 U55 ( .A0(N41), .A1(n1), .B0(in_8bit[3]), .B1(n119), .Y(n147) );
  INVX1 U56 ( .A(n148), .Y(n99) );
  AOI22X1 U57 ( .A0(N42), .A1(n1), .B0(in_8bit[4]), .B1(n119), .Y(n148) );
  INVX1 U58 ( .A(n149), .Y(n98) );
  AOI22X1 U59 ( .A0(N43), .A1(n1), .B0(in_8bit[5]), .B1(n119), .Y(n149) );
  INVX1 U60 ( .A(n150), .Y(n97) );
  AOI22X1 U61 ( .A0(n1), .A1(N44), .B0(in_8bit[6]), .B1(n119), .Y(n150) );
  INVX1 U62 ( .A(in_8bit[6]), .Y(n26) );
  INVX1 U63 ( .A(n128), .Y(n122) );
  AOI22X1 U64 ( .A0(in_17bit[0]), .A1(n2), .B0(in_17bit[0]), .B1(n123), .Y(
        n128) );
  INVX1 U65 ( .A(n129), .Y(n96) );
  AOI22X1 U66 ( .A0(N6), .A1(n2), .B0(in_17bit[1]), .B1(n123), .Y(n129) );
  INVX1 U67 ( .A(n130), .Y(n95) );
  AOI22X1 U68 ( .A0(N7), .A1(n2), .B0(in_17bit[2]), .B1(n123), .Y(n130) );
  INVX1 U69 ( .A(in_8bit[1]), .Y(n21) );
  INVX1 U70 ( .A(in_8bit[2]), .Y(n22) );
  INVX1 U71 ( .A(in_8bit[3]), .Y(n23) );
  INVX1 U72 ( .A(in_8bit[4]), .Y(n24) );
  INVX1 U73 ( .A(in_8bit[5]), .Y(n25) );
  INVX1 U74 ( .A(in_17bit[14]), .Y(n18) );
  INVX1 U75 ( .A(n3), .Y(n121) );
  INVX1 U76 ( .A(n162), .Y(n107) );
  AOI22X1 U77 ( .A0(N82), .A1(n3), .B0(sum_b[18]), .B1(n121), .Y(n162) );
  INVX1 U78 ( .A(n125), .Y(n105) );
  AOI22X1 U79 ( .A0(N84), .A1(n3), .B0(sum_b[20]), .B1(n121), .Y(n125) );
  INVX1 U80 ( .A(n163), .Y(n106) );
  AOI22X1 U81 ( .A0(n3), .A1(N83), .B0(sum_b[19]), .B1(n121), .Y(n163) );
  INVX1 U82 ( .A(N71), .Y(n27) );
  INVX1 U83 ( .A(sum_b[8]), .Y(n28) );
  INVX1 U84 ( .A(sum_b[9]), .Y(n29) );
  INVX1 U85 ( .A(sum_b[10]), .Y(n30) );
  INVX1 U86 ( .A(sum_b[11]), .Y(n31) );
  INVX1 U87 ( .A(sum_b[12]), .Y(n32) );
  INVX1 U88 ( .A(n126), .Y(n104) );
  AOI22X1 U89 ( .A0(N85), .A1(n3), .B0(sum_b[21]), .B1(n121), .Y(n126) );
  INVX1 U90 ( .A(n127), .Y(n103) );
  AOI22X1 U91 ( .A0(N86), .A1(n3), .B0(sum_b[22]), .B1(n121), .Y(n127) );
  INVX1 U92 ( .A(sum_b[22]), .Y(n42) );
  INVX1 U93 ( .A(n158), .Y(n111) );
  AOI22X1 U94 ( .A0(N78), .A1(n3), .B0(sum_b[14]), .B1(n121), .Y(n158) );
  INVX1 U95 ( .A(n159), .Y(n110) );
  AOI22X1 U96 ( .A0(N79), .A1(n3), .B0(sum_b[15]), .B1(n121), .Y(n159) );
  INVX1 U97 ( .A(n160), .Y(n109) );
  AOI22X1 U98 ( .A0(N80), .A1(n3), .B0(sum_b[16]), .B1(n121), .Y(n160) );
  INVX1 U99 ( .A(n161), .Y(n108) );
  AOI22X1 U100 ( .A0(N81), .A1(n3), .B0(sum_b[17]), .B1(n121), .Y(n161) );
  BUFX3 U101 ( .A(in_8bit[7]), .Y(n1) );
  INVX1 U102 ( .A(sum_b[13]), .Y(n33) );
  INVX1 U103 ( .A(sum_b[14]), .Y(n34) );
  INVX1 U104 ( .A(sum_b[15]), .Y(n35) );
  INVX1 U105 ( .A(sum_b[16]), .Y(n36) );
  INVX1 U106 ( .A(n153), .Y(n116) );
  AOI22X1 U107 ( .A0(N73), .A1(n3), .B0(sum_b[9]), .B1(n121), .Y(n153) );
  INVX1 U108 ( .A(n154), .Y(n115) );
  AOI22X1 U109 ( .A0(N74), .A1(n3), .B0(sum_b[10]), .B1(n121), .Y(n154) );
  INVX1 U110 ( .A(n155), .Y(n114) );
  AOI22X1 U111 ( .A0(N75), .A1(n3), .B0(sum_b[11]), .B1(n121), .Y(n155) );
  INVX1 U112 ( .A(n156), .Y(n113) );
  AOI22X1 U113 ( .A0(N76), .A1(n3), .B0(sum_b[12]), .B1(n121), .Y(n156) );
  INVX1 U114 ( .A(n157), .Y(n112) );
  AOI22X1 U115 ( .A0(N77), .A1(n3), .B0(sum_b[13]), .B1(n121), .Y(n157) );
  INVX1 U116 ( .A(sum_b[17]), .Y(n37) );
  INVX1 U117 ( .A(sum_b[18]), .Y(n38) );
  INVX1 U118 ( .A(sum_b[19]), .Y(n39) );
  INVX1 U119 ( .A(sum_b[20]), .Y(n40) );
  INVX1 U120 ( .A(sum_b[21]), .Y(n41) );
  BUFX3 U121 ( .A(sum_b[23]), .Y(n3) );
  INVX1 U122 ( .A(n151), .Y(n120) );
  AOI22X1 U123 ( .A0(N71), .A1(n3), .B0(N71), .B1(n121), .Y(n151) );
  INVX1 U124 ( .A(n152), .Y(n117) );
  AOI22X1 U125 ( .A0(N72), .A1(n3), .B0(sum_b[8]), .B1(n121), .Y(n152) );
  XOR2X1 U126 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U127 ( .A(n42), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U128 ( .A(sub_add_97_b0_carry[14]), .B(n41), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U129 ( .A(n41), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U130 ( .A(sub_add_97_b0_carry[13]), .B(n40), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U131 ( .A(n40), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U132 ( .A(sub_add_97_b0_carry[12]), .B(n39), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U133 ( .A(n39), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U134 ( .A(sub_add_97_b0_carry[11]), .B(n38), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U135 ( .A(n38), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U136 ( .A(sub_add_97_b0_carry[10]), .B(n37), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U137 ( .A(n37), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U138 ( .A(sub_add_97_b0_carry[9]), .B(n36), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U139 ( .A(n36), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U140 ( .A(sub_add_97_b0_carry[8]), .B(n35), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U141 ( .A(n35), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U142 ( .A(sub_add_97_b0_carry[7]), .B(n34), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U143 ( .A(n34), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U144 ( .A(sub_add_97_b0_carry[6]), .B(n33), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U145 ( .A(n33), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U146 ( .A(sub_add_97_b0_carry[5]), .B(n32), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U147 ( .A(n32), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U148 ( .A(sub_add_97_b0_carry[4]), .B(n31), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U149 ( .A(n31), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U150 ( .A(sub_add_97_b0_carry[3]), .B(n30), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U151 ( .A(n30), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U152 ( .A(sub_add_97_b0_carry[2]), .B(n29), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U153 ( .A(n29), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U154 ( .A(n27), .B(n28), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U155 ( .A(n28), .B(n27), .Y(N72) );
  XOR2X1 U156 ( .A(n26), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U157 ( .A(sub_add_61_b0_carry[5]), .B(n25), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U158 ( .A(n25), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U159 ( .A(sub_add_61_b0_carry[4]), .B(n24), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U160 ( .A(n24), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U161 ( .A(sub_add_61_b0_carry[3]), .B(n23), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U162 ( .A(n23), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U163 ( .A(sub_add_61_b0_carry[2]), .B(n22), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U164 ( .A(n22), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U165 ( .A(n20), .B(n21), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U166 ( .A(n21), .B(n20), .Y(N39) );
  XOR2X1 U167 ( .A(n19), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U168 ( .A(sub_add_52_b0_carry[14]), .B(n18), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U169 ( .A(n18), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U170 ( .A(sub_add_52_b0_carry[13]), .B(n17), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U171 ( .A(n17), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U172 ( .A(sub_add_52_b0_carry[12]), .B(n16), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U173 ( .A(n16), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U174 ( .A(sub_add_52_b0_carry[11]), .B(n15), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U175 ( .A(n15), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U176 ( .A(sub_add_52_b0_carry[10]), .B(n14), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U177 ( .A(n14), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U178 ( .A(sub_add_52_b0_carry[9]), .B(n13), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U179 ( .A(n13), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U180 ( .A(sub_add_52_b0_carry[8]), .B(n12), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U181 ( .A(n12), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U182 ( .A(sub_add_52_b0_carry[7]), .B(n11), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U183 ( .A(n11), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U184 ( .A(sub_add_52_b0_carry[6]), .B(n10), .Y(sub_add_52_b0_carry[7]) );
  XOR2X1 U185 ( .A(n10), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U186 ( .A(sub_add_52_b0_carry[5]), .B(n9), .Y(sub_add_52_b0_carry[6])
         );
  XOR2X1 U187 ( .A(n9), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U188 ( .A(sub_add_52_b0_carry[4]), .B(n8), .Y(sub_add_52_b0_carry[5])
         );
  XOR2X1 U189 ( .A(n8), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U190 ( .A(sub_add_52_b0_carry[3]), .B(n7), .Y(sub_add_52_b0_carry[4])
         );
  XOR2X1 U191 ( .A(n7), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U192 ( .A(sub_add_52_b0_carry[2]), .B(n6), .Y(sub_add_52_b0_carry[3])
         );
  XOR2X1 U193 ( .A(n6), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U194 ( .A(n4), .B(n5), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U195 ( .A(n5), .B(n4), .Y(N6) );
endmodule


module multi16_3_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  CMPR32X1 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .C(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S2_2_4 ( .A(ab_2__4_), .B(n6), .C(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  CMPR32X1 S2_2_3 ( .A(ab_2__3_), .B(n5), .C(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  CMPR32X1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .C(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX1 S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .C(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n4), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n3), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .C(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .C(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .C(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  CMPR32X1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .C(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .C(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .C(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .C(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX1 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFHX2 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .CI(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  ADDFHX1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFHX1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFHX1 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFHX1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .CI(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  ADDFHX1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  ADDFHX1 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFHX1 S3_2_5 ( .A(ab_2__5_), .B(n2), .CI(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  ADDFHX1 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  ADDFHX1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .CI(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFHXL S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  NOR2XL U2 ( .A(n62), .B(n44), .Y(ab_15__3_) );
  NOR2XL U3 ( .A(n62), .B(n45), .Y(ab_14__3_) );
  NOR2XL U4 ( .A(n62), .B(n46), .Y(ab_13__3_) );
  NOR2XL U5 ( .A(n62), .B(n47), .Y(ab_12__3_) );
  NOR2XL U6 ( .A(n62), .B(n48), .Y(ab_11__3_) );
  NOR2XL U7 ( .A(n62), .B(n49), .Y(ab_10__3_) );
  INVX1 U8 ( .A(B[1]), .Y(n64) );
  NOR2X1 U9 ( .A(n61), .B(n58), .Y(ab_1__4_) );
  OAI21X2 U10 ( .A0(n32), .A1(n28), .B0(n31), .Y(n21) );
  NAND2X4 U11 ( .A(n26), .B(A1_15_), .Y(n28) );
  NOR2XL U12 ( .A(n65), .B(n44), .Y(ab_15__0_) );
  NOR2XL U13 ( .A(n65), .B(n45), .Y(ab_14__0_) );
  NOR2XL U14 ( .A(n65), .B(n46), .Y(ab_13__0_) );
  NOR2XL U15 ( .A(n65), .B(n47), .Y(ab_12__0_) );
  NOR2XL U16 ( .A(n65), .B(n48), .Y(ab_11__0_) );
  NOR2XL U17 ( .A(n65), .B(n49), .Y(ab_10__0_) );
  NOR2X2 U18 ( .A(n58), .B(n64), .Y(ab_1__1_) );
  INVX2 U19 ( .A(A[1]), .Y(n58) );
  NOR2XL U20 ( .A(n61), .B(n57), .Y(ab_2__4_) );
  NOR2XL U21 ( .A(n61), .B(n56), .Y(ab_3__4_) );
  NOR2XL U22 ( .A(n61), .B(n54), .Y(ab_5__4_) );
  INVX4 U23 ( .A(B[4]), .Y(n61) );
  NOR2X2 U24 ( .A(n8), .B(n59), .Y(ab_0__6_) );
  INVX2 U25 ( .A(B[6]), .Y(n8) );
  XOR2X1 U26 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  NAND3X1 U27 ( .A(n15), .B(n13), .C(n14), .Y(CARRYB_4__4_) );
  NAND3X1 U28 ( .A(n18), .B(n16), .C(n17), .Y(CARRYB_14__2_) );
  NOR2X1 U29 ( .A(n20), .B(n44), .Y(ab_15__1_) );
  XOR2X1 U30 ( .A(CARRYB_14__1_), .B(n9), .Y(SUMB_15__1_) );
  AOI21X1 U31 ( .A0(n21), .A1(n36), .B0(n43), .Y(n39) );
  INVX1 U32 ( .A(B[0]), .Y(n65) );
  AND2X2 U33 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n2) );
  AND2X2 U34 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n3) );
  AND2X2 U35 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n4) );
  AND2X2 U36 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n5) );
  AND2X2 U37 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n6) );
  NOR2X1 U38 ( .A(n63), .B(n59), .Y(ab_0__2_) );
  INVX2 U39 ( .A(A[0]), .Y(n59) );
  NOR2X1 U40 ( .A(n63), .B(n58), .Y(ab_1__2_) );
  NOR2X1 U41 ( .A(n60), .B(n58), .Y(ab_1__5_) );
  NOR2XL U42 ( .A(n64), .B(n56), .Y(ab_3__1_) );
  NOR2XL U43 ( .A(n64), .B(n57), .Y(ab_2__1_) );
  INVXL U44 ( .A(B[6]), .Y(n7) );
  XOR2XL U45 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  NOR2XL U46 ( .A(n7), .B(n44), .Y(ab_15__6_) );
  NOR2XL U47 ( .A(n8), .B(n45), .Y(ab_14__6_) );
  NOR2XL U48 ( .A(n7), .B(n46), .Y(ab_13__6_) );
  NOR2XL U49 ( .A(n8), .B(n47), .Y(ab_12__6_) );
  NOR2XL U50 ( .A(n7), .B(n48), .Y(ab_11__6_) );
  NOR2XL U51 ( .A(n8), .B(n49), .Y(ab_10__6_) );
  NOR2XL U52 ( .A(n50), .B(n7), .Y(ab_9__6_) );
  NOR2XL U53 ( .A(n8), .B(n51), .Y(ab_8__6_) );
  NOR2XL U54 ( .A(n7), .B(n52), .Y(ab_7__6_) );
  NOR2XL U55 ( .A(n8), .B(n53), .Y(ab_6__6_) );
  NOR2XL U56 ( .A(n7), .B(n54), .Y(ab_5__6_) );
  NOR2XL U57 ( .A(n8), .B(n55), .Y(ab_4__6_) );
  NOR2XL U58 ( .A(n7), .B(n56), .Y(ab_3__6_) );
  NOR2XL U59 ( .A(n8), .B(n57), .Y(ab_2__6_) );
  XOR2X2 U60 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  XOR2X4 U61 ( .A(SUMB_14__2_), .B(ab_15__1_), .Y(n9) );
  NAND2XL U62 ( .A(SUMB_14__2_), .B(CARRYB_14__1_), .Y(n10) );
  NAND2XL U63 ( .A(ab_15__1_), .B(CARRYB_14__1_), .Y(n11) );
  NAND2XL U64 ( .A(ab_15__1_), .B(SUMB_14__2_), .Y(n12) );
  NAND3X1 U65 ( .A(n12), .B(n10), .C(n11), .Y(CARRYB_15__1_) );
  XOR3X4 U66 ( .A(CARRYB_13__2_), .B(ab_14__2_), .C(SUMB_13__3_), .Y(
        SUMB_14__2_) );
  INVX4 U67 ( .A(B[2]), .Y(n63) );
  XOR3X2 U68 ( .A(CARRYB_3__4_), .B(ab_4__4_), .C(SUMB_3__5_), .Y(SUMB_4__4_)
         );
  NAND2XL U69 ( .A(SUMB_3__5_), .B(CARRYB_3__4_), .Y(n13) );
  NAND2XL U70 ( .A(ab_4__4_), .B(CARRYB_3__4_), .Y(n14) );
  NAND2XL U71 ( .A(ab_4__4_), .B(SUMB_3__5_), .Y(n15) );
  NOR2XL U72 ( .A(n61), .B(n55), .Y(ab_4__4_) );
  AND3X2 U73 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
  NOR2X1 U74 ( .A(n60), .B(n59), .Y(ab_0__5_) );
  NAND2XL U75 ( .A(SUMB_13__3_), .B(CARRYB_13__2_), .Y(n16) );
  NAND2XL U76 ( .A(ab_14__2_), .B(CARRYB_13__2_), .Y(n17) );
  NAND2XL U77 ( .A(ab_14__2_), .B(SUMB_13__3_), .Y(n18) );
  NOR2XL U78 ( .A(n7), .B(n58), .Y(ab_1__6_) );
  INVXL U79 ( .A(B[5]), .Y(n19) );
  INVX1 U80 ( .A(B[5]), .Y(n60) );
  INVXL U81 ( .A(B[1]), .Y(n20) );
  INVX4 U82 ( .A(B[3]), .Y(n62) );
  XOR2XL U83 ( .A(n37), .B(n39), .Y(PRODUCT_20_) );
  NOR2X1 U84 ( .A(n62), .B(n59), .Y(ab_0__3_) );
  XOR2X1 U85 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2XL U86 ( .A(ab_0__2_), .B(ab_1__1_), .Y(SUMB_1__1_) );
  NOR2X1 U87 ( .A(n61), .B(n59), .Y(ab_0__4_) );
  NOR2X1 U88 ( .A(n62), .B(n58), .Y(ab_1__3_) );
  NOR2XL U89 ( .A(n19), .B(n51), .Y(ab_8__5_) );
  NOR2XL U90 ( .A(n19), .B(n45), .Y(ab_14__5_) );
  NOR2XL U91 ( .A(n19), .B(n52), .Y(ab_7__5_) );
  NOR2XL U92 ( .A(n19), .B(n53), .Y(ab_6__5_) );
  NOR2XL U93 ( .A(n19), .B(n46), .Y(ab_13__5_) );
  NOR2XL U94 ( .A(n19), .B(n54), .Y(ab_5__5_) );
  NOR2XL U95 ( .A(n19), .B(n49), .Y(ab_10__5_) );
  NOR2XL U96 ( .A(n19), .B(n47), .Y(ab_12__5_) );
  NOR2XL U97 ( .A(n19), .B(n55), .Y(ab_4__5_) );
  NAND2XL U98 ( .A(n36), .B(n34), .Y(n33) );
  NAND2BXL U99 ( .AN(n32), .B(n31), .Y(n30) );
  NAND2XL U100 ( .A(n23), .B(A1_16_), .Y(n31) );
  NAND2XL U101 ( .A(n24), .B(A1_18_), .Y(n38) );
  OR2X2 U102 ( .A(n25), .B(A1_17_), .Y(n36) );
  AND2X1 U103 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n23) );
  XOR2XL U104 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  NOR2XL U105 ( .A(n19), .B(n56), .Y(ab_3__5_) );
  INVX1 U106 ( .A(n34), .Y(n43) );
  AND2X2 U107 ( .A(n29), .B(n28), .Y(PRODUCT_17_) );
  XOR2X1 U108 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U109 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  XOR2X1 U110 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U111 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U112 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n24) );
  AND2X2 U113 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n25) );
  AND2X2 U114 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n26) );
  AND2X2 U115 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n27) );
  XOR2X1 U116 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  INVX1 U117 ( .A(A[2]), .Y(n57) );
  INVX1 U118 ( .A(A[3]), .Y(n56) );
  INVX1 U119 ( .A(A[4]), .Y(n55) );
  INVX1 U120 ( .A(A[6]), .Y(n53) );
  INVX1 U121 ( .A(A[5]), .Y(n54) );
  INVX1 U122 ( .A(A[9]), .Y(n50) );
  INVX1 U123 ( .A(A[7]), .Y(n52) );
  INVX1 U124 ( .A(A[8]), .Y(n51) );
  INVX1 U125 ( .A(A[10]), .Y(n49) );
  INVX1 U126 ( .A(A[11]), .Y(n48) );
  INVX1 U127 ( .A(A[12]), .Y(n47) );
  INVX1 U128 ( .A(A[13]), .Y(n46) );
  INVX1 U129 ( .A(A[14]), .Y(n45) );
  INVX1 U130 ( .A(A[15]), .Y(n44) );
  OR2X1 U131 ( .A(n26), .B(A1_15_), .Y(n29) );
  NOR2X1 U132 ( .A(n23), .B(A1_16_), .Y(n32) );
  XOR2X1 U133 ( .A(n30), .B(n28), .Y(PRODUCT_18_) );
  NAND2X1 U134 ( .A(n25), .B(A1_17_), .Y(n34) );
  OAI21XL U135 ( .A0(n32), .A1(n28), .B0(n31), .Y(n35) );
  XNOR2X1 U136 ( .A(n33), .B(n35), .Y(PRODUCT_19_) );
  NOR2X1 U137 ( .A(n24), .B(A1_18_), .Y(n40) );
  NAND2BX1 U138 ( .AN(n40), .B(n38), .Y(n37) );
  OAI21XL U139 ( .A0(n40), .A1(n39), .B0(n38), .Y(n42) );
  XOR2X1 U140 ( .A(n27), .B(A1_19_), .Y(n41) );
  XOR2X1 U141 ( .A(n42), .B(n41), .Y(PRODUCT_21_) );
  NOR2X1 U142 ( .A(n50), .B(n19), .Y(ab_9__5_) );
  NOR2X1 U143 ( .A(n50), .B(n61), .Y(ab_9__4_) );
  NOR2X1 U144 ( .A(n50), .B(n62), .Y(ab_9__3_) );
  NOR2X1 U145 ( .A(n50), .B(n63), .Y(ab_9__2_) );
  NOR2X1 U146 ( .A(n50), .B(n20), .Y(ab_9__1_) );
  NOR2X1 U147 ( .A(n50), .B(n65), .Y(ab_9__0_) );
  NOR2X1 U148 ( .A(n61), .B(n51), .Y(ab_8__4_) );
  NOR2X1 U149 ( .A(n62), .B(n51), .Y(ab_8__3_) );
  NOR2X1 U150 ( .A(n63), .B(n51), .Y(ab_8__2_) );
  NOR2X1 U151 ( .A(n20), .B(n51), .Y(ab_8__1_) );
  NOR2X1 U152 ( .A(n65), .B(n51), .Y(ab_8__0_) );
  NOR2X1 U153 ( .A(n61), .B(n52), .Y(ab_7__4_) );
  NOR2X1 U154 ( .A(n62), .B(n52), .Y(ab_7__3_) );
  NOR2X1 U155 ( .A(n63), .B(n52), .Y(ab_7__2_) );
  NOR2X1 U156 ( .A(n20), .B(n52), .Y(ab_7__1_) );
  NOR2X1 U157 ( .A(n65), .B(n52), .Y(ab_7__0_) );
  NOR2X1 U158 ( .A(n61), .B(n53), .Y(ab_6__4_) );
  NOR2X1 U159 ( .A(n62), .B(n53), .Y(ab_6__3_) );
  NOR2X1 U160 ( .A(n63), .B(n53), .Y(ab_6__2_) );
  NOR2X1 U161 ( .A(n20), .B(n53), .Y(ab_6__1_) );
  NOR2X1 U162 ( .A(n65), .B(n53), .Y(ab_6__0_) );
  NOR2X1 U163 ( .A(n62), .B(n54), .Y(ab_5__3_) );
  NOR2X1 U164 ( .A(n63), .B(n54), .Y(ab_5__2_) );
  NOR2X1 U165 ( .A(n20), .B(n54), .Y(ab_5__1_) );
  NOR2X1 U166 ( .A(n65), .B(n54), .Y(ab_5__0_) );
  NOR2X1 U167 ( .A(n62), .B(n55), .Y(ab_4__3_) );
  NOR2X1 U168 ( .A(n63), .B(n55), .Y(ab_4__2_) );
  NOR2X1 U169 ( .A(n20), .B(n55), .Y(ab_4__1_) );
  NOR2X1 U170 ( .A(n65), .B(n55), .Y(ab_4__0_) );
  NOR2X1 U171 ( .A(n62), .B(n56), .Y(ab_3__3_) );
  NOR2X1 U172 ( .A(n63), .B(n56), .Y(ab_3__2_) );
  NOR2X1 U173 ( .A(n65), .B(n56), .Y(ab_3__0_) );
  NOR2X1 U174 ( .A(n60), .B(n57), .Y(ab_2__5_) );
  NOR2X1 U175 ( .A(n62), .B(n57), .Y(ab_2__3_) );
  NOR2X1 U176 ( .A(n63), .B(n57), .Y(ab_2__2_) );
  NOR2X1 U177 ( .A(n65), .B(n57), .Y(ab_2__0_) );
  NOR2X1 U178 ( .A(n19), .B(n44), .Y(ab_15__5_) );
  NOR2X1 U179 ( .A(n61), .B(n44), .Y(ab_15__4_) );
  NOR2X1 U180 ( .A(n63), .B(n44), .Y(ab_15__2_) );
  NOR2X1 U181 ( .A(n61), .B(n45), .Y(ab_14__4_) );
  NOR2X1 U182 ( .A(n63), .B(n45), .Y(ab_14__2_) );
  NOR2X1 U183 ( .A(n20), .B(n45), .Y(ab_14__1_) );
  NOR2X1 U184 ( .A(n61), .B(n46), .Y(ab_13__4_) );
  NOR2X1 U185 ( .A(n63), .B(n46), .Y(ab_13__2_) );
  NOR2X1 U186 ( .A(n20), .B(n46), .Y(ab_13__1_) );
  NOR2X1 U187 ( .A(n61), .B(n47), .Y(ab_12__4_) );
  NOR2X1 U188 ( .A(n63), .B(n47), .Y(ab_12__2_) );
  NOR2X1 U189 ( .A(n20), .B(n47), .Y(ab_12__1_) );
  NOR2X1 U190 ( .A(n19), .B(n48), .Y(ab_11__5_) );
  NOR2X1 U191 ( .A(n61), .B(n48), .Y(ab_11__4_) );
  NOR2X1 U192 ( .A(n63), .B(n48), .Y(ab_11__2_) );
  NOR2X1 U193 ( .A(n20), .B(n48), .Y(ab_11__1_) );
  NOR2X1 U194 ( .A(n61), .B(n49), .Y(ab_10__4_) );
  NOR2X1 U195 ( .A(n63), .B(n49), .Y(ab_10__2_) );
  NOR2X1 U196 ( .A(n20), .B(n49), .Y(ab_10__1_) );
endmodule


module multi16_3 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_3_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(in_8bit[7]), .CK(clk), .RN(rst_n), .Q(
        in_8bit_b[7]) );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n3), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 out_reg_16_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_14_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_10_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 out_reg_6_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 out_reg_5_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n118), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n119), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n120), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_1_ ( .D(n121), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_0_ ( .D(n124), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n122), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 in_8bit_b_reg_5_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQXL sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQXL sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQXL sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQX4 in_17bit_b_reg_0_ ( .D(n126), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX2 in_17bit_b_reg_1_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[1]) );
  DFFRHQX2 in_8bit_b_reg_4_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  DFFRHQX2 in_8bit_b_reg_3_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX2 in_8bit_b_reg_1_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  INVX1 U3 ( .A(n4), .Y(n2) );
  INVX1 U4 ( .A(n7), .Y(n3) );
  INVX1 U5 ( .A(in_17bit[16]), .Y(n7) );
  INVX1 U6 ( .A(in_17bit[16]), .Y(n6) );
  INVX1 U7 ( .A(in_17bit[16]), .Y(n5) );
  INVX1 U8 ( .A(in_17bit[16]), .Y(n4) );
  INVX1 U9 ( .A(in_17bit[0]), .Y(n8) );
  INVX1 U10 ( .A(n146), .Y(n47) );
  AOI22X1 U11 ( .A0(n3), .A1(N20), .B0(in_17bit[15]), .B1(n4), .Y(n146) );
  INVX1 U12 ( .A(in_17bit[15]), .Y(n23) );
  INVX1 U13 ( .A(n143), .Y(n89) );
  AOI22X1 U14 ( .A0(N17), .A1(n2), .B0(in_17bit[12]), .B1(n4), .Y(n143) );
  INVX1 U15 ( .A(n144), .Y(n49) );
  AOI22X1 U16 ( .A0(N18), .A1(n2), .B0(in_17bit[13]), .B1(n4), .Y(n144) );
  INVX1 U17 ( .A(n145), .Y(n48) );
  AOI22X1 U18 ( .A0(N19), .A1(n2), .B0(in_17bit[14]), .B1(n5), .Y(n145) );
  INVX1 U19 ( .A(in_17bit[1]), .Y(n9) );
  INVX1 U20 ( .A(in_17bit[2]), .Y(n10) );
  INVX1 U21 ( .A(in_17bit[3]), .Y(n11) );
  INVX1 U22 ( .A(in_17bit[4]), .Y(n12) );
  INVX1 U23 ( .A(n138), .Y(n94) );
  AOI22X1 U24 ( .A0(N12), .A1(n2), .B0(in_17bit[7]), .B1(n7), .Y(n138) );
  INVX1 U25 ( .A(n139), .Y(n93) );
  AOI22X1 U26 ( .A0(N13), .A1(n2), .B0(in_17bit[8]), .B1(n6), .Y(n139) );
  INVX1 U27 ( .A(n140), .Y(n92) );
  AOI22X1 U28 ( .A0(N14), .A1(n2), .B0(in_17bit[9]), .B1(n6), .Y(n140) );
  INVX1 U29 ( .A(n141), .Y(n91) );
  AOI22X1 U30 ( .A0(N15), .A1(n2), .B0(in_17bit[10]), .B1(n5), .Y(n141) );
  INVX1 U31 ( .A(n142), .Y(n90) );
  AOI22X1 U32 ( .A0(N16), .A1(n2), .B0(in_17bit[11]), .B1(n5), .Y(n142) );
  INVX1 U33 ( .A(in_17bit[5]), .Y(n13) );
  INVX1 U34 ( .A(in_17bit[6]), .Y(n14) );
  INVX1 U35 ( .A(in_17bit[7]), .Y(n15) );
  INVX1 U36 ( .A(in_17bit[8]), .Y(n16) );
  INVX1 U37 ( .A(in_17bit[9]), .Y(n17) );
  INVX1 U38 ( .A(n135), .Y(n97) );
  AOI22X1 U39 ( .A0(N9), .A1(n2), .B0(in_17bit[4]), .B1(n7), .Y(n135) );
  INVX1 U40 ( .A(n136), .Y(n96) );
  AOI22X1 U41 ( .A0(N10), .A1(n2), .B0(in_17bit[5]), .B1(n7), .Y(n136) );
  INVX1 U42 ( .A(n131), .Y(n126) );
  AOI22X1 U43 ( .A0(in_17bit[0]), .A1(n3), .B0(in_17bit[0]), .B1(n6), .Y(n131)
         );
  INVX1 U44 ( .A(n132), .Y(n100) );
  AOI22X1 U45 ( .A0(N6), .A1(n3), .B0(in_17bit[1]), .B1(n6), .Y(n132) );
  INVX1 U46 ( .A(n133), .Y(n99) );
  AOI22X1 U47 ( .A0(N7), .A1(n2), .B0(in_17bit[2]), .B1(n5), .Y(n133) );
  INVX1 U48 ( .A(n134), .Y(n98) );
  AOI22X1 U49 ( .A0(N8), .A1(n2), .B0(in_17bit[3]), .B1(n4), .Y(n134) );
  INVX1 U50 ( .A(n137), .Y(n95) );
  AOI22X1 U51 ( .A0(N11), .A1(n2), .B0(in_17bit[6]), .B1(n6), .Y(n137) );
  INVX1 U52 ( .A(in_17bit[10]), .Y(n18) );
  INVX1 U53 ( .A(in_17bit[11]), .Y(n19) );
  INVX1 U54 ( .A(in_17bit[12]), .Y(n20) );
  INVX1 U55 ( .A(in_17bit[13]), .Y(n21) );
  INVX1 U56 ( .A(in_8bit[7]), .Y(n123) );
  INVX1 U57 ( .A(n147), .Y(n122) );
  AOI22X1 U58 ( .A0(in_8bit[0]), .A1(in_8bit[7]), .B0(in_8bit[0]), .B1(n123), 
        .Y(n147) );
  INVX1 U59 ( .A(n148), .Y(n106) );
  AOI22X1 U60 ( .A0(N39), .A1(in_8bit[7]), .B0(in_8bit[1]), .B1(n123), .Y(n148) );
  INVX1 U61 ( .A(n149), .Y(n105) );
  AOI22X1 U62 ( .A0(N40), .A1(in_8bit[7]), .B0(in_8bit[2]), .B1(n123), .Y(n149) );
  INVX1 U63 ( .A(n150), .Y(n104) );
  AOI22X1 U64 ( .A0(N41), .A1(in_8bit[7]), .B0(in_8bit[3]), .B1(n123), .Y(n150) );
  INVX1 U65 ( .A(n151), .Y(n103) );
  AOI22X1 U66 ( .A0(N42), .A1(in_8bit[7]), .B0(in_8bit[4]), .B1(n123), .Y(n151) );
  INVX1 U67 ( .A(n152), .Y(n102) );
  AOI22X1 U68 ( .A0(N43), .A1(in_8bit[7]), .B0(in_8bit[5]), .B1(n123), .Y(n152) );
  INVX1 U69 ( .A(n153), .Y(n101) );
  AOI22X1 U70 ( .A0(in_8bit[7]), .A1(N44), .B0(in_8bit[6]), .B1(n123), .Y(n153) );
  INVX1 U71 ( .A(in_8bit[6]), .Y(n30) );
  INVX1 U72 ( .A(in_8bit[0]), .Y(n24) );
  INVX1 U73 ( .A(in_8bit[1]), .Y(n25) );
  INVX1 U74 ( .A(in_8bit[2]), .Y(n26) );
  INVX1 U75 ( .A(in_8bit[3]), .Y(n27) );
  INVX1 U76 ( .A(in_8bit[4]), .Y(n28) );
  INVX1 U77 ( .A(in_8bit[5]), .Y(n29) );
  INVX1 U78 ( .A(in_17bit[14]), .Y(n22) );
  INVX1 U79 ( .A(n1), .Y(n125) );
  INVX1 U80 ( .A(n165), .Y(n111) );
  AOI22X1 U81 ( .A0(N82), .A1(n1), .B0(sum_b[18]), .B1(n125), .Y(n165) );
  INVX1 U82 ( .A(n128), .Y(n109) );
  AOI22X1 U83 ( .A0(N84), .A1(n1), .B0(sum_b[20]), .B1(n125), .Y(n128) );
  INVX1 U84 ( .A(n166), .Y(n110) );
  AOI22X1 U85 ( .A0(n1), .A1(N83), .B0(sum_b[19]), .B1(n125), .Y(n166) );
  INVX1 U86 ( .A(N71), .Y(n31) );
  INVX1 U87 ( .A(sum_b[8]), .Y(n32) );
  INVX1 U88 ( .A(sum_b[9]), .Y(n33) );
  INVX1 U89 ( .A(sum_b[10]), .Y(n34) );
  INVX1 U90 ( .A(sum_b[11]), .Y(n35) );
  INVX1 U91 ( .A(sum_b[12]), .Y(n36) );
  INVX1 U92 ( .A(n129), .Y(n108) );
  AOI22X1 U93 ( .A0(N85), .A1(n1), .B0(sum_b[21]), .B1(n125), .Y(n129) );
  INVX1 U94 ( .A(n130), .Y(n107) );
  AOI22X1 U95 ( .A0(N86), .A1(n1), .B0(sum_b[22]), .B1(n125), .Y(n130) );
  INVX1 U96 ( .A(sum_b[22]), .Y(n46) );
  INVX1 U97 ( .A(n161), .Y(n115) );
  AOI22X1 U98 ( .A0(N78), .A1(n1), .B0(sum_b[14]), .B1(n125), .Y(n161) );
  INVX1 U99 ( .A(n162), .Y(n114) );
  AOI22X1 U100 ( .A0(N79), .A1(n1), .B0(sum_b[15]), .B1(n125), .Y(n162) );
  INVX1 U101 ( .A(n163), .Y(n113) );
  AOI22X1 U102 ( .A0(N80), .A1(n1), .B0(sum_b[16]), .B1(n125), .Y(n163) );
  INVX1 U103 ( .A(n164), .Y(n112) );
  AOI22X1 U104 ( .A0(N81), .A1(n1), .B0(sum_b[17]), .B1(n125), .Y(n164) );
  INVX1 U105 ( .A(sum_b[13]), .Y(n37) );
  INVX1 U106 ( .A(sum_b[14]), .Y(n38) );
  INVX1 U107 ( .A(sum_b[15]), .Y(n39) );
  INVX1 U108 ( .A(sum_b[16]), .Y(n40) );
  INVX1 U109 ( .A(n156), .Y(n120) );
  AOI22X1 U110 ( .A0(N73), .A1(n1), .B0(sum_b[9]), .B1(n125), .Y(n156) );
  INVX1 U111 ( .A(n157), .Y(n119) );
  AOI22X1 U112 ( .A0(N74), .A1(n1), .B0(sum_b[10]), .B1(n125), .Y(n157) );
  INVX1 U113 ( .A(n158), .Y(n118) );
  AOI22X1 U114 ( .A0(N75), .A1(n1), .B0(sum_b[11]), .B1(n125), .Y(n158) );
  INVX1 U115 ( .A(n159), .Y(n117) );
  AOI22X1 U116 ( .A0(N76), .A1(n1), .B0(sum_b[12]), .B1(n125), .Y(n159) );
  INVX1 U117 ( .A(n160), .Y(n116) );
  AOI22X1 U118 ( .A0(N77), .A1(n1), .B0(sum_b[13]), .B1(n125), .Y(n160) );
  INVX1 U119 ( .A(sum_b[17]), .Y(n41) );
  INVX1 U120 ( .A(sum_b[18]), .Y(n42) );
  INVX1 U121 ( .A(sum_b[19]), .Y(n43) );
  INVX1 U122 ( .A(sum_b[20]), .Y(n44) );
  INVX1 U123 ( .A(sum_b[21]), .Y(n45) );
  BUFX3 U124 ( .A(sum_b[23]), .Y(n1) );
  INVX1 U125 ( .A(n154), .Y(n124) );
  AOI22X1 U126 ( .A0(N71), .A1(n1), .B0(N71), .B1(n125), .Y(n154) );
  INVX1 U127 ( .A(n155), .Y(n121) );
  AOI22X1 U128 ( .A0(N72), .A1(n1), .B0(sum_b[8]), .B1(n125), .Y(n155) );
  XOR2X1 U129 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U130 ( .A(n46), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U131 ( .A(sub_add_97_b0_carry[14]), .B(n45), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U132 ( .A(n45), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U133 ( .A(sub_add_97_b0_carry[13]), .B(n44), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U134 ( .A(n44), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U135 ( .A(sub_add_97_b0_carry[12]), .B(n43), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U136 ( .A(n43), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U137 ( .A(sub_add_97_b0_carry[11]), .B(n42), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U138 ( .A(n42), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U139 ( .A(sub_add_97_b0_carry[10]), .B(n41), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U140 ( .A(n41), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U141 ( .A(sub_add_97_b0_carry[9]), .B(n40), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U142 ( .A(n40), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U143 ( .A(sub_add_97_b0_carry[8]), .B(n39), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U144 ( .A(n39), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U145 ( .A(sub_add_97_b0_carry[7]), .B(n38), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U146 ( .A(n38), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U147 ( .A(sub_add_97_b0_carry[6]), .B(n37), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U148 ( .A(n37), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U149 ( .A(sub_add_97_b0_carry[5]), .B(n36), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U150 ( .A(n36), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U151 ( .A(sub_add_97_b0_carry[4]), .B(n35), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U152 ( .A(n35), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U153 ( .A(sub_add_97_b0_carry[3]), .B(n34), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U154 ( .A(n34), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U155 ( .A(sub_add_97_b0_carry[2]), .B(n33), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U156 ( .A(n33), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U157 ( .A(n31), .B(n32), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U158 ( .A(n32), .B(n31), .Y(N72) );
  XOR2X1 U159 ( .A(n30), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U160 ( .A(sub_add_61_b0_carry[5]), .B(n29), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U161 ( .A(n29), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U162 ( .A(sub_add_61_b0_carry[4]), .B(n28), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U163 ( .A(n28), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U164 ( .A(sub_add_61_b0_carry[3]), .B(n27), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U165 ( .A(n27), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U166 ( .A(sub_add_61_b0_carry[2]), .B(n26), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U167 ( .A(n26), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U168 ( .A(n24), .B(n25), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U169 ( .A(n25), .B(n24), .Y(N39) );
  XOR2X1 U170 ( .A(n23), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U171 ( .A(sub_add_52_b0_carry[14]), .B(n22), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U172 ( .A(n22), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U173 ( .A(sub_add_52_b0_carry[13]), .B(n21), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U174 ( .A(n21), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U175 ( .A(sub_add_52_b0_carry[12]), .B(n20), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U176 ( .A(n20), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U177 ( .A(sub_add_52_b0_carry[11]), .B(n19), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U178 ( .A(n19), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U179 ( .A(sub_add_52_b0_carry[10]), .B(n18), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U180 ( .A(n18), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U181 ( .A(sub_add_52_b0_carry[9]), .B(n17), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U182 ( .A(n17), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U183 ( .A(sub_add_52_b0_carry[8]), .B(n16), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U184 ( .A(n16), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U185 ( .A(sub_add_52_b0_carry[7]), .B(n15), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U186 ( .A(n15), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U187 ( .A(sub_add_52_b0_carry[6]), .B(n14), .Y(sub_add_52_b0_carry[7]) );
  XOR2X1 U188 ( .A(n14), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U189 ( .A(sub_add_52_b0_carry[5]), .B(n13), .Y(sub_add_52_b0_carry[6]) );
  XOR2X1 U190 ( .A(n13), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U191 ( .A(sub_add_52_b0_carry[4]), .B(n12), .Y(sub_add_52_b0_carry[5]) );
  XOR2X1 U192 ( .A(n12), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U193 ( .A(sub_add_52_b0_carry[3]), .B(n11), .Y(sub_add_52_b0_carry[4]) );
  XOR2X1 U194 ( .A(n11), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U195 ( .A(sub_add_52_b0_carry[2]), .B(n10), .Y(sub_add_52_b0_carry[3]) );
  XOR2X1 U196 ( .A(n10), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U197 ( .A(n8), .B(n9), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U198 ( .A(n9), .B(n8), .Y(N6) );
endmodule


module multi16_2_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  CMPR32X1 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .C(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S2_2_4 ( .A(ab_2__4_), .B(n5), .C(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX1 S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .C(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .C(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n4), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n3), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .C(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .C(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .C(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .C(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .C(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .C(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX1 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFHX1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFHX1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFHX1 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFHX4 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFHX1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  ADDFHX1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  ADDFHX1 S3_2_5 ( .A(ab_2__5_), .B(n2), .CI(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  ADDFX2 S2_2_3 ( .A(ab_2__3_), .B(n6), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFHX1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .CI(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  ADDFHX1 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  ADDFHX1 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFHX1 S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  NOR2XL U2 ( .A(n62), .B(n58), .Y(ab_1__3_) );
  NOR2X1 U3 ( .A(n58), .B(n64), .Y(ab_1__1_) );
  INVX1 U4 ( .A(B[1]), .Y(n64) );
  INVX2 U5 ( .A(B[4]), .Y(n61) );
  NOR2XL U6 ( .A(n65), .B(n44), .Y(ab_15__0_) );
  NOR2XL U7 ( .A(n65), .B(n45), .Y(ab_14__0_) );
  NOR2XL U8 ( .A(n65), .B(n46), .Y(ab_13__0_) );
  NOR2XL U9 ( .A(n65), .B(n47), .Y(ab_12__0_) );
  NOR2XL U10 ( .A(n65), .B(n48), .Y(ab_11__0_) );
  NOR2XL U11 ( .A(n65), .B(n49), .Y(ab_10__0_) );
  NOR2XL U12 ( .A(n50), .B(n65), .Y(ab_9__0_) );
  OAI21X1 U13 ( .A0(n32), .A1(n28), .B0(n31), .Y(n21) );
  NAND2X4 U14 ( .A(n26), .B(A1_15_), .Y(n28) );
  NOR2X2 U15 ( .A(n62), .B(n59), .Y(ab_0__3_) );
  NOR2XL U16 ( .A(n60), .B(n59), .Y(ab_0__5_) );
  NOR2X2 U17 ( .A(n63), .B(n59), .Y(ab_0__2_) );
  INVX4 U18 ( .A(A[0]), .Y(n59) );
  NAND3X1 U19 ( .A(n15), .B(n13), .C(n14), .Y(CARRYB_4__4_) );
  NAND3X1 U20 ( .A(n18), .B(n16), .C(n17), .Y(CARRYB_14__2_) );
  NOR2X1 U21 ( .A(n20), .B(n44), .Y(ab_15__1_) );
  AOI21X1 U22 ( .A0(n21), .A1(n36), .B0(n43), .Y(n39) );
  INVX1 U23 ( .A(B[0]), .Y(n65) );
  AND2X2 U24 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n2) );
  AND2X2 U25 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n3) );
  AND2X2 U26 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n4) );
  AND2X2 U27 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n5) );
  AND2X2 U28 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n6) );
  INVX1 U29 ( .A(A[1]), .Y(n58) );
  NOR2X1 U30 ( .A(n63), .B(n58), .Y(ab_1__2_) );
  NOR2XL U31 ( .A(n61), .B(n58), .Y(ab_1__4_) );
  NOR2XL U32 ( .A(n60), .B(n58), .Y(ab_1__5_) );
  INVXL U33 ( .A(B[6]), .Y(n7) );
  INVXL U34 ( .A(B[6]), .Y(n8) );
  OAI21XL U35 ( .A0(n40), .A1(n39), .B0(n38), .Y(n42) );
  NOR2XL U36 ( .A(n7), .B(n44), .Y(ab_15__6_) );
  NOR2XL U37 ( .A(n8), .B(n45), .Y(ab_14__6_) );
  NOR2XL U38 ( .A(n7), .B(n46), .Y(ab_13__6_) );
  NOR2XL U39 ( .A(n8), .B(n47), .Y(ab_12__6_) );
  NOR2XL U40 ( .A(n7), .B(n48), .Y(ab_11__6_) );
  NOR2XL U41 ( .A(n8), .B(n49), .Y(ab_10__6_) );
  NOR2XL U42 ( .A(n50), .B(n7), .Y(ab_9__6_) );
  NOR2XL U43 ( .A(n8), .B(n51), .Y(ab_8__6_) );
  NOR2XL U44 ( .A(n7), .B(n52), .Y(ab_7__6_) );
  NOR2XL U45 ( .A(n8), .B(n53), .Y(ab_6__6_) );
  NOR2XL U46 ( .A(n7), .B(n54), .Y(ab_5__6_) );
  NOR2XL U47 ( .A(n8), .B(n55), .Y(ab_4__6_) );
  NOR2XL U48 ( .A(n7), .B(n56), .Y(ab_3__6_) );
  NOR2XL U49 ( .A(n8), .B(n57), .Y(ab_2__6_) );
  NOR2X2 U50 ( .A(n8), .B(n59), .Y(ab_0__6_) );
  NOR2XL U51 ( .A(n64), .B(n57), .Y(ab_2__1_) );
  NOR2XL U52 ( .A(n64), .B(n56), .Y(ab_3__1_) );
  XOR2X4 U53 ( .A(SUMB_14__2_), .B(ab_15__1_), .Y(n9) );
  XOR2X2 U54 ( .A(CARRYB_14__1_), .B(n9), .Y(SUMB_15__1_) );
  NAND2XL U55 ( .A(SUMB_14__2_), .B(CARRYB_14__1_), .Y(n10) );
  NAND2XL U56 ( .A(ab_15__1_), .B(CARRYB_14__1_), .Y(n11) );
  NAND2XL U57 ( .A(ab_15__1_), .B(SUMB_14__2_), .Y(n12) );
  NAND3X1 U58 ( .A(n12), .B(n10), .C(n11), .Y(CARRYB_15__1_) );
  XOR3X4 U59 ( .A(CARRYB_13__2_), .B(ab_14__2_), .C(SUMB_13__3_), .Y(
        SUMB_14__2_) );
  XOR2X2 U60 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  INVX4 U61 ( .A(B[2]), .Y(n63) );
  XOR3X2 U62 ( .A(CARRYB_3__4_), .B(ab_4__4_), .C(SUMB_3__5_), .Y(SUMB_4__4_)
         );
  NAND2XL U63 ( .A(SUMB_3__5_), .B(CARRYB_3__4_), .Y(n13) );
  NAND2XL U64 ( .A(ab_4__4_), .B(CARRYB_3__4_), .Y(n14) );
  NAND2XL U65 ( .A(ab_4__4_), .B(SUMB_3__5_), .Y(n15) );
  NOR2XL U66 ( .A(n61), .B(n55), .Y(ab_4__4_) );
  AND3X2 U67 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
  NAND2XL U68 ( .A(SUMB_13__3_), .B(CARRYB_13__2_), .Y(n16) );
  NAND2XL U69 ( .A(ab_14__2_), .B(CARRYB_13__2_), .Y(n17) );
  NAND2XL U70 ( .A(ab_14__2_), .B(SUMB_13__3_), .Y(n18) );
  NOR2XL U71 ( .A(n7), .B(n58), .Y(ab_1__6_) );
  INVXL U72 ( .A(B[5]), .Y(n19) );
  INVX1 U73 ( .A(B[5]), .Y(n60) );
  XOR2X1 U74 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  INVXL U75 ( .A(B[1]), .Y(n20) );
  INVX4 U76 ( .A(B[3]), .Y(n62) );
  XOR2XL U77 ( .A(n37), .B(n39), .Y(PRODUCT_20_) );
  XOR2X1 U78 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2XL U79 ( .A(ab_0__2_), .B(ab_1__1_), .Y(SUMB_1__1_) );
  NOR2X1 U80 ( .A(n61), .B(n59), .Y(ab_0__4_) );
  NOR2XL U81 ( .A(n19), .B(n51), .Y(ab_8__5_) );
  NOR2XL U82 ( .A(n19), .B(n45), .Y(ab_14__5_) );
  NOR2XL U83 ( .A(n19), .B(n52), .Y(ab_7__5_) );
  NOR2XL U84 ( .A(n19), .B(n53), .Y(ab_6__5_) );
  NOR2XL U85 ( .A(n19), .B(n46), .Y(ab_13__5_) );
  NOR2XL U86 ( .A(n19), .B(n54), .Y(ab_5__5_) );
  NOR2XL U87 ( .A(n19), .B(n49), .Y(ab_10__5_) );
  NOR2XL U88 ( .A(n19), .B(n47), .Y(ab_12__5_) );
  NOR2XL U89 ( .A(n19), .B(n55), .Y(ab_4__5_) );
  NAND2XL U90 ( .A(n36), .B(n34), .Y(n33) );
  NAND2BXL U91 ( .AN(n32), .B(n31), .Y(n30) );
  NAND2XL U92 ( .A(n23), .B(A1_16_), .Y(n31) );
  NAND2XL U93 ( .A(n24), .B(A1_18_), .Y(n38) );
  OR2X2 U94 ( .A(n25), .B(A1_17_), .Y(n36) );
  AND2X1 U95 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n23) );
  XOR2XL U96 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  NOR2XL U97 ( .A(n19), .B(n56), .Y(ab_3__5_) );
  INVX1 U98 ( .A(n34), .Y(n43) );
  AND2X2 U99 ( .A(n29), .B(n28), .Y(PRODUCT_17_) );
  XOR2X1 U100 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U101 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  XOR2X1 U102 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U103 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U104 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n24) );
  AND2X2 U105 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n25) );
  AND2X2 U106 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n26) );
  AND2X2 U107 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n27) );
  XOR2X1 U108 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  XOR2X1 U109 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  INVX1 U110 ( .A(A[2]), .Y(n57) );
  INVX1 U111 ( .A(A[3]), .Y(n56) );
  INVX1 U112 ( .A(A[4]), .Y(n55) );
  INVX1 U113 ( .A(A[6]), .Y(n53) );
  INVX1 U114 ( .A(A[5]), .Y(n54) );
  INVX1 U115 ( .A(A[9]), .Y(n50) );
  INVX1 U116 ( .A(A[7]), .Y(n52) );
  INVX1 U117 ( .A(A[8]), .Y(n51) );
  INVX1 U118 ( .A(A[10]), .Y(n49) );
  INVX1 U119 ( .A(A[11]), .Y(n48) );
  INVX1 U120 ( .A(A[12]), .Y(n47) );
  INVX1 U121 ( .A(A[13]), .Y(n46) );
  INVX1 U122 ( .A(A[14]), .Y(n45) );
  INVX1 U123 ( .A(A[15]), .Y(n44) );
  OR2X1 U124 ( .A(n26), .B(A1_15_), .Y(n29) );
  NOR2X1 U125 ( .A(n23), .B(A1_16_), .Y(n32) );
  XOR2X1 U126 ( .A(n30), .B(n28), .Y(PRODUCT_18_) );
  NAND2X1 U127 ( .A(n25), .B(A1_17_), .Y(n34) );
  OAI21XL U128 ( .A0(n32), .A1(n28), .B0(n31), .Y(n35) );
  XNOR2X1 U129 ( .A(n33), .B(n35), .Y(PRODUCT_19_) );
  NOR2X1 U130 ( .A(n24), .B(A1_18_), .Y(n40) );
  NAND2BX1 U131 ( .AN(n40), .B(n38), .Y(n37) );
  XOR2X1 U132 ( .A(n27), .B(A1_19_), .Y(n41) );
  XOR2X1 U133 ( .A(n42), .B(n41), .Y(PRODUCT_21_) );
  NOR2X1 U134 ( .A(n50), .B(n19), .Y(ab_9__5_) );
  NOR2X1 U135 ( .A(n50), .B(n61), .Y(ab_9__4_) );
  NOR2X1 U136 ( .A(n50), .B(n62), .Y(ab_9__3_) );
  NOR2X1 U137 ( .A(n50), .B(n63), .Y(ab_9__2_) );
  NOR2X1 U138 ( .A(n50), .B(n20), .Y(ab_9__1_) );
  NOR2X1 U139 ( .A(n61), .B(n51), .Y(ab_8__4_) );
  NOR2X1 U140 ( .A(n62), .B(n51), .Y(ab_8__3_) );
  NOR2X1 U141 ( .A(n63), .B(n51), .Y(ab_8__2_) );
  NOR2X1 U142 ( .A(n20), .B(n51), .Y(ab_8__1_) );
  NOR2X1 U143 ( .A(n65), .B(n51), .Y(ab_8__0_) );
  NOR2X1 U144 ( .A(n61), .B(n52), .Y(ab_7__4_) );
  NOR2X1 U145 ( .A(n62), .B(n52), .Y(ab_7__3_) );
  NOR2X1 U146 ( .A(n63), .B(n52), .Y(ab_7__2_) );
  NOR2X1 U147 ( .A(n20), .B(n52), .Y(ab_7__1_) );
  NOR2X1 U148 ( .A(n65), .B(n52), .Y(ab_7__0_) );
  NOR2X1 U149 ( .A(n61), .B(n53), .Y(ab_6__4_) );
  NOR2X1 U150 ( .A(n62), .B(n53), .Y(ab_6__3_) );
  NOR2X1 U151 ( .A(n63), .B(n53), .Y(ab_6__2_) );
  NOR2X1 U152 ( .A(n20), .B(n53), .Y(ab_6__1_) );
  NOR2X1 U153 ( .A(n65), .B(n53), .Y(ab_6__0_) );
  NOR2X1 U154 ( .A(n61), .B(n54), .Y(ab_5__4_) );
  NOR2X1 U155 ( .A(n62), .B(n54), .Y(ab_5__3_) );
  NOR2X1 U156 ( .A(n63), .B(n54), .Y(ab_5__2_) );
  NOR2X1 U157 ( .A(n20), .B(n54), .Y(ab_5__1_) );
  NOR2X1 U158 ( .A(n65), .B(n54), .Y(ab_5__0_) );
  NOR2X1 U159 ( .A(n62), .B(n55), .Y(ab_4__3_) );
  NOR2X1 U160 ( .A(n63), .B(n55), .Y(ab_4__2_) );
  NOR2X1 U161 ( .A(n20), .B(n55), .Y(ab_4__1_) );
  NOR2X1 U162 ( .A(n65), .B(n55), .Y(ab_4__0_) );
  NOR2X1 U163 ( .A(n61), .B(n56), .Y(ab_3__4_) );
  NOR2X1 U164 ( .A(n62), .B(n56), .Y(ab_3__3_) );
  NOR2X1 U165 ( .A(n63), .B(n56), .Y(ab_3__2_) );
  NOR2X1 U166 ( .A(n65), .B(n56), .Y(ab_3__0_) );
  NOR2X1 U167 ( .A(n60), .B(n57), .Y(ab_2__5_) );
  NOR2X1 U168 ( .A(n61), .B(n57), .Y(ab_2__4_) );
  NOR2X1 U169 ( .A(n62), .B(n57), .Y(ab_2__3_) );
  NOR2X1 U170 ( .A(n63), .B(n57), .Y(ab_2__2_) );
  NOR2X1 U171 ( .A(n65), .B(n57), .Y(ab_2__0_) );
  NOR2X1 U172 ( .A(n19), .B(n44), .Y(ab_15__5_) );
  NOR2X1 U173 ( .A(n61), .B(n44), .Y(ab_15__4_) );
  NOR2X1 U174 ( .A(n62), .B(n44), .Y(ab_15__3_) );
  NOR2X1 U175 ( .A(n63), .B(n44), .Y(ab_15__2_) );
  NOR2X1 U176 ( .A(n61), .B(n45), .Y(ab_14__4_) );
  NOR2X1 U177 ( .A(n62), .B(n45), .Y(ab_14__3_) );
  NOR2X1 U178 ( .A(n63), .B(n45), .Y(ab_14__2_) );
  NOR2X1 U179 ( .A(n20), .B(n45), .Y(ab_14__1_) );
  NOR2X1 U180 ( .A(n61), .B(n46), .Y(ab_13__4_) );
  NOR2X1 U181 ( .A(n62), .B(n46), .Y(ab_13__3_) );
  NOR2X1 U182 ( .A(n63), .B(n46), .Y(ab_13__2_) );
  NOR2X1 U183 ( .A(n20), .B(n46), .Y(ab_13__1_) );
  NOR2X1 U184 ( .A(n61), .B(n47), .Y(ab_12__4_) );
  NOR2X1 U185 ( .A(n62), .B(n47), .Y(ab_12__3_) );
  NOR2X1 U186 ( .A(n63), .B(n47), .Y(ab_12__2_) );
  NOR2X1 U187 ( .A(n20), .B(n47), .Y(ab_12__1_) );
  NOR2X1 U188 ( .A(n19), .B(n48), .Y(ab_11__5_) );
  NOR2X1 U189 ( .A(n61), .B(n48), .Y(ab_11__4_) );
  NOR2X1 U190 ( .A(n62), .B(n48), .Y(ab_11__3_) );
  NOR2X1 U191 ( .A(n63), .B(n48), .Y(ab_11__2_) );
  NOR2X1 U192 ( .A(n20), .B(n48), .Y(ab_11__1_) );
  NOR2X1 U193 ( .A(n61), .B(n49), .Y(ab_10__4_) );
  NOR2X1 U194 ( .A(n62), .B(n49), .Y(ab_10__3_) );
  NOR2X1 U195 ( .A(n63), .B(n49), .Y(ab_10__2_) );
  NOR2X1 U196 ( .A(n20), .B(n49), .Y(ab_10__1_) );
endmodule


module multi16_2 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_2_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(in_8bit_b[7])
         );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n2), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_16_ ( .D(n3), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n43), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n44), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_14_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 out_reg_10_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_6_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 out_reg_5_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_2_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 out_reg_1_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 out_reg_0_ ( .D(n120), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n122), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 in_8bit_b_reg_5_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQXL sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQXL sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQXL sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX2 in_17bit_b_reg_1_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_17bit_b[1]) );
  DFFRHQX2 in_8bit_b_reg_4_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  DFFRHQX2 in_8bit_b_reg_3_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX2 in_17bit_b_reg_0_ ( .D(n118), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX2 in_8bit_b_reg_1_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  INVX1 U3 ( .A(n2), .Y(n119) );
  INVX1 U4 ( .A(in_17bit[0]), .Y(n4) );
  INVX1 U5 ( .A(n143), .Y(n43) );
  AOI22X1 U6 ( .A0(n2), .A1(N20), .B0(in_17bit[15]), .B1(n119), .Y(n143) );
  INVX1 U7 ( .A(in_17bit[15]), .Y(n19) );
  INVX1 U8 ( .A(n128), .Y(n118) );
  AOI22X1 U9 ( .A0(in_17bit[0]), .A1(n2), .B0(in_17bit[0]), .B1(n119), .Y(n128) );
  INVX1 U10 ( .A(n129), .Y(n96) );
  AOI22X1 U11 ( .A0(N6), .A1(n2), .B0(in_17bit[1]), .B1(n119), .Y(n129) );
  INVX1 U12 ( .A(n130), .Y(n95) );
  AOI22X1 U13 ( .A0(N7), .A1(n2), .B0(in_17bit[2]), .B1(n119), .Y(n130) );
  INVX1 U14 ( .A(n131), .Y(n94) );
  AOI22X1 U15 ( .A0(N8), .A1(n2), .B0(in_17bit[3]), .B1(n119), .Y(n131) );
  INVX1 U16 ( .A(n132), .Y(n93) );
  AOI22X1 U17 ( .A0(N9), .A1(n2), .B0(in_17bit[4]), .B1(n119), .Y(n132) );
  INVX1 U18 ( .A(n133), .Y(n92) );
  AOI22X1 U19 ( .A0(N10), .A1(n2), .B0(in_17bit[5]), .B1(n119), .Y(n133) );
  INVX1 U20 ( .A(n134), .Y(n91) );
  AOI22X1 U21 ( .A0(N11), .A1(n2), .B0(in_17bit[6]), .B1(n119), .Y(n134) );
  INVX1 U22 ( .A(n135), .Y(n90) );
  AOI22X1 U23 ( .A0(N12), .A1(n2), .B0(in_17bit[7]), .B1(n119), .Y(n135) );
  INVX1 U24 ( .A(n136), .Y(n89) );
  AOI22X1 U25 ( .A0(N13), .A1(n2), .B0(in_17bit[8]), .B1(n119), .Y(n136) );
  INVX1 U26 ( .A(n137), .Y(n49) );
  AOI22X1 U27 ( .A0(N14), .A1(n2), .B0(in_17bit[9]), .B1(n119), .Y(n137) );
  INVX1 U28 ( .A(n138), .Y(n48) );
  AOI22X1 U29 ( .A0(N15), .A1(n2), .B0(in_17bit[10]), .B1(n119), .Y(n138) );
  INVX1 U30 ( .A(n139), .Y(n47) );
  AOI22X1 U31 ( .A0(N16), .A1(n2), .B0(in_17bit[11]), .B1(n119), .Y(n139) );
  INVX1 U32 ( .A(n140), .Y(n46) );
  AOI22X1 U33 ( .A0(N17), .A1(n2), .B0(in_17bit[12]), .B1(n119), .Y(n140) );
  INVX1 U34 ( .A(n141), .Y(n45) );
  AOI22X1 U35 ( .A0(N18), .A1(n2), .B0(in_17bit[13]), .B1(n119), .Y(n141) );
  INVX1 U36 ( .A(n142), .Y(n44) );
  AOI22X1 U37 ( .A0(N19), .A1(n2), .B0(in_17bit[14]), .B1(n119), .Y(n142) );
  INVX1 U38 ( .A(in_17bit[1]), .Y(n5) );
  INVX1 U39 ( .A(in_17bit[3]), .Y(n7) );
  INVX1 U40 ( .A(in_17bit[4]), .Y(n8) );
  INVX1 U41 ( .A(in_17bit[5]), .Y(n9) );
  INVX1 U42 ( .A(in_17bit[6]), .Y(n10) );
  INVX1 U43 ( .A(in_17bit[7]), .Y(n11) );
  INVX1 U44 ( .A(in_17bit[8]), .Y(n12) );
  INVX1 U45 ( .A(in_17bit[9]), .Y(n13) );
  INVX1 U46 ( .A(in_17bit[10]), .Y(n14) );
  INVX1 U47 ( .A(in_17bit[11]), .Y(n15) );
  INVX1 U48 ( .A(in_17bit[2]), .Y(n6) );
  INVX1 U49 ( .A(in_17bit[12]), .Y(n16) );
  INVX1 U50 ( .A(in_17bit[13]), .Y(n17) );
  INVX1 U51 ( .A(in_17bit[14]), .Y(n18) );
  BUFX3 U52 ( .A(in_17bit[16]), .Y(n2) );
  INVX1 U53 ( .A(n1), .Y(n123) );
  INVX1 U54 ( .A(n3), .Y(n121) );
  INVX1 U55 ( .A(n162), .Y(n107) );
  AOI22X1 U56 ( .A0(N82), .A1(n3), .B0(sum_b[18]), .B1(n121), .Y(n162) );
  INVX1 U57 ( .A(n125), .Y(n105) );
  AOI22X1 U58 ( .A0(N84), .A1(n3), .B0(sum_b[20]), .B1(n121), .Y(n125) );
  INVX1 U59 ( .A(n163), .Y(n106) );
  AOI22X1 U60 ( .A0(n3), .A1(N83), .B0(sum_b[19]), .B1(n121), .Y(n163) );
  INVX1 U61 ( .A(N71), .Y(n27) );
  INVX1 U62 ( .A(sum_b[8]), .Y(n28) );
  INVX1 U63 ( .A(sum_b[9]), .Y(n29) );
  INVX1 U64 ( .A(sum_b[10]), .Y(n30) );
  INVX1 U65 ( .A(sum_b[11]), .Y(n31) );
  INVX1 U66 ( .A(sum_b[12]), .Y(n32) );
  INVX1 U67 ( .A(n126), .Y(n104) );
  AOI22X1 U68 ( .A0(N85), .A1(n3), .B0(sum_b[21]), .B1(n121), .Y(n126) );
  INVX1 U69 ( .A(n127), .Y(n103) );
  AOI22X1 U70 ( .A0(N86), .A1(n3), .B0(sum_b[22]), .B1(n121), .Y(n127) );
  INVX1 U71 ( .A(sum_b[22]), .Y(n42) );
  INVX1 U72 ( .A(n158), .Y(n111) );
  AOI22X1 U73 ( .A0(N78), .A1(n3), .B0(sum_b[14]), .B1(n121), .Y(n158) );
  INVX1 U74 ( .A(n159), .Y(n110) );
  AOI22X1 U75 ( .A0(N79), .A1(n3), .B0(sum_b[15]), .B1(n121), .Y(n159) );
  INVX1 U76 ( .A(n160), .Y(n109) );
  AOI22X1 U77 ( .A0(N80), .A1(n3), .B0(sum_b[16]), .B1(n121), .Y(n160) );
  INVX1 U78 ( .A(n161), .Y(n108) );
  AOI22X1 U79 ( .A0(N81), .A1(n3), .B0(sum_b[17]), .B1(n121), .Y(n161) );
  INVX1 U80 ( .A(in_8bit[0]), .Y(n20) );
  INVX1 U81 ( .A(sum_b[13]), .Y(n33) );
  INVX1 U82 ( .A(sum_b[14]), .Y(n34) );
  INVX1 U83 ( .A(sum_b[15]), .Y(n35) );
  INVX1 U84 ( .A(sum_b[16]), .Y(n36) );
  INVX1 U85 ( .A(n150), .Y(n97) );
  AOI22X1 U86 ( .A0(n1), .A1(N44), .B0(in_8bit[6]), .B1(n123), .Y(n150) );
  INVX1 U87 ( .A(in_8bit[6]), .Y(n26) );
  INVX1 U88 ( .A(n153), .Y(n116) );
  AOI22X1 U89 ( .A0(N73), .A1(n3), .B0(sum_b[9]), .B1(n121), .Y(n153) );
  INVX1 U90 ( .A(n154), .Y(n115) );
  AOI22X1 U91 ( .A0(N74), .A1(n3), .B0(sum_b[10]), .B1(n121), .Y(n154) );
  INVX1 U92 ( .A(n155), .Y(n114) );
  AOI22X1 U93 ( .A0(N75), .A1(n3), .B0(sum_b[11]), .B1(n121), .Y(n155) );
  INVX1 U94 ( .A(n156), .Y(n113) );
  AOI22X1 U95 ( .A0(N76), .A1(n3), .B0(sum_b[12]), .B1(n121), .Y(n156) );
  INVX1 U96 ( .A(n157), .Y(n112) );
  AOI22X1 U97 ( .A0(N77), .A1(n3), .B0(sum_b[13]), .B1(n121), .Y(n157) );
  INVX1 U98 ( .A(sum_b[17]), .Y(n37) );
  INVX1 U99 ( .A(sum_b[18]), .Y(n38) );
  INVX1 U100 ( .A(sum_b[19]), .Y(n39) );
  INVX1 U101 ( .A(sum_b[20]), .Y(n40) );
  INVX1 U102 ( .A(sum_b[21]), .Y(n41) );
  INVX1 U103 ( .A(in_8bit[1]), .Y(n21) );
  INVX1 U104 ( .A(in_8bit[2]), .Y(n22) );
  INVX1 U105 ( .A(in_8bit[3]), .Y(n23) );
  INVX1 U106 ( .A(in_8bit[4]), .Y(n24) );
  INVX1 U107 ( .A(in_8bit[5]), .Y(n25) );
  INVX1 U108 ( .A(n146), .Y(n101) );
  AOI22X1 U109 ( .A0(N40), .A1(n1), .B0(in_8bit[2]), .B1(n123), .Y(n146) );
  INVX1 U110 ( .A(n147), .Y(n100) );
  AOI22X1 U111 ( .A0(N41), .A1(n1), .B0(in_8bit[3]), .B1(n123), .Y(n147) );
  INVX1 U112 ( .A(n148), .Y(n99) );
  AOI22X1 U113 ( .A0(N42), .A1(n1), .B0(in_8bit[4]), .B1(n123), .Y(n148) );
  INVX1 U114 ( .A(n149), .Y(n98) );
  AOI22X1 U115 ( .A0(N43), .A1(n1), .B0(in_8bit[5]), .B1(n123), .Y(n149) );
  BUFX3 U116 ( .A(sum_b[23]), .Y(n3) );
  BUFX3 U117 ( .A(in_8bit[7]), .Y(n1) );
  INVX1 U118 ( .A(n144), .Y(n122) );
  AOI22X1 U119 ( .A0(in_8bit[0]), .A1(n1), .B0(in_8bit[0]), .B1(n123), .Y(n144) );
  INVX1 U120 ( .A(n145), .Y(n102) );
  AOI22X1 U121 ( .A0(N39), .A1(n1), .B0(in_8bit[1]), .B1(n123), .Y(n145) );
  INVX1 U122 ( .A(n151), .Y(n120) );
  AOI22X1 U123 ( .A0(N71), .A1(n3), .B0(N71), .B1(n121), .Y(n151) );
  INVX1 U124 ( .A(n152), .Y(n117) );
  AOI22X1 U125 ( .A0(N72), .A1(n3), .B0(sum_b[8]), .B1(n121), .Y(n152) );
  XOR2X1 U126 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U127 ( .A(n42), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U128 ( .A(sub_add_97_b0_carry[14]), .B(n41), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U129 ( .A(n41), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U130 ( .A(sub_add_97_b0_carry[13]), .B(n40), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U131 ( .A(n40), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U132 ( .A(sub_add_97_b0_carry[12]), .B(n39), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U133 ( .A(n39), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U134 ( .A(sub_add_97_b0_carry[11]), .B(n38), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U135 ( .A(n38), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U136 ( .A(sub_add_97_b0_carry[10]), .B(n37), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U137 ( .A(n37), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U138 ( .A(sub_add_97_b0_carry[9]), .B(n36), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U139 ( .A(n36), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U140 ( .A(sub_add_97_b0_carry[8]), .B(n35), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U141 ( .A(n35), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U142 ( .A(sub_add_97_b0_carry[7]), .B(n34), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U143 ( .A(n34), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U144 ( .A(sub_add_97_b0_carry[6]), .B(n33), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U145 ( .A(n33), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U146 ( .A(sub_add_97_b0_carry[5]), .B(n32), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U147 ( .A(n32), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U148 ( .A(sub_add_97_b0_carry[4]), .B(n31), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U149 ( .A(n31), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U150 ( .A(sub_add_97_b0_carry[3]), .B(n30), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U151 ( .A(n30), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U152 ( .A(sub_add_97_b0_carry[2]), .B(n29), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U153 ( .A(n29), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U154 ( .A(n27), .B(n28), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U155 ( .A(n28), .B(n27), .Y(N72) );
  XOR2X1 U156 ( .A(n26), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U157 ( .A(sub_add_61_b0_carry[5]), .B(n25), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U158 ( .A(n25), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U159 ( .A(sub_add_61_b0_carry[4]), .B(n24), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U160 ( .A(n24), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U161 ( .A(sub_add_61_b0_carry[3]), .B(n23), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U162 ( .A(n23), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U163 ( .A(sub_add_61_b0_carry[2]), .B(n22), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U164 ( .A(n22), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U165 ( .A(n20), .B(n21), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U166 ( .A(n21), .B(n20), .Y(N39) );
  XOR2X1 U167 ( .A(n19), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U168 ( .A(sub_add_52_b0_carry[14]), .B(n18), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U169 ( .A(n18), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U170 ( .A(sub_add_52_b0_carry[13]), .B(n17), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U171 ( .A(n17), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U172 ( .A(sub_add_52_b0_carry[12]), .B(n16), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U173 ( .A(n16), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U174 ( .A(sub_add_52_b0_carry[11]), .B(n15), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U175 ( .A(n15), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U176 ( .A(sub_add_52_b0_carry[10]), .B(n14), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U177 ( .A(n14), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U178 ( .A(sub_add_52_b0_carry[9]), .B(n13), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U179 ( .A(n13), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U180 ( .A(sub_add_52_b0_carry[8]), .B(n12), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U181 ( .A(n12), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U182 ( .A(sub_add_52_b0_carry[7]), .B(n11), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U183 ( .A(n11), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U184 ( .A(sub_add_52_b0_carry[6]), .B(n10), .Y(sub_add_52_b0_carry[7]) );
  XOR2X1 U185 ( .A(n10), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U186 ( .A(sub_add_52_b0_carry[5]), .B(n9), .Y(sub_add_52_b0_carry[6])
         );
  XOR2X1 U187 ( .A(n9), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U188 ( .A(sub_add_52_b0_carry[4]), .B(n8), .Y(sub_add_52_b0_carry[5])
         );
  XOR2X1 U189 ( .A(n8), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U190 ( .A(sub_add_52_b0_carry[3]), .B(n7), .Y(sub_add_52_b0_carry[4])
         );
  XOR2X1 U191 ( .A(n7), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U192 ( .A(sub_add_52_b0_carry[2]), .B(n6), .Y(sub_add_52_b0_carry[3])
         );
  XOR2X1 U193 ( .A(n6), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U194 ( .A(n4), .B(n5), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U195 ( .A(n5), .B(n4), .Y(N6) );
endmodule


module multi16_1_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  CMPR32X1 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .C(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S2_2_4 ( .A(ab_2__4_), .B(n5), .C(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  CMPR32X1 S2_2_3 ( .A(ab_2__3_), .B(n3), .C(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  CMPR32X1 S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .C(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .C(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n6), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n4), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .C(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .C(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  CMPR32X1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .C(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .C(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  CMPR32X1 S2_14_2 ( .A(ab_14__2_), .B(CARRYB_13__2_), .C(SUMB_13__3_), .CO(
        CARRYB_14__2_), .S(SUMB_14__2_) );
  CMPR32X1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .C(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX1 S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFHX1 S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFHX1 S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFHX1 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFHX1 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFHX1 S4_1 ( .A(ab_15__1_), .B(CARRYB_14__1_), .CI(SUMB_14__2_), .CO(
        CARRYB_15__1_), .S(SUMB_15__1_) );
  ADDFHX1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .CI(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  ADDFHXL S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .CI(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  ADDFHX1 S3_2_5 ( .A(ab_2__5_), .B(n2), .CI(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  ADDFX2 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFHX1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .CI(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  ADDFX2 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFHX1 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .CI(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  ADDFHX1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .CI(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  ADDFX2 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .CI(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  NOR2XL U2 ( .A(n9), .B(n41), .Y(ab_12__6_) );
  NOR2X2 U3 ( .A(n55), .B(n53), .Y(ab_0__4_) );
  INVX4 U4 ( .A(B[4]), .Y(n55) );
  INVX4 U5 ( .A(A[0]), .Y(n53) );
  NOR2X2 U6 ( .A(n17), .B(A1_16_), .Y(n26) );
  XOR2X2 U7 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  NOR2X1 U8 ( .A(n18), .B(A1_18_), .Y(n34) );
  NOR2X1 U9 ( .A(n9), .B(n53), .Y(ab_0__6_) );
  INVX2 U10 ( .A(A[1]), .Y(n52) );
  NOR2X2 U11 ( .A(n52), .B(n58), .Y(ab_1__1_) );
  NOR2X1 U12 ( .A(n57), .B(n53), .Y(ab_0__2_) );
  NOR2X1 U13 ( .A(n56), .B(n53), .Y(ab_0__3_) );
  INVX1 U14 ( .A(A[2]), .Y(n51) );
  CLKINVX3 U15 ( .A(B[2]), .Y(n57) );
  CLKINVX3 U16 ( .A(B[1]), .Y(n58) );
  BUFX3 U17 ( .A(n59), .Y(n7) );
  NAND2BX1 U18 ( .AN(n34), .B(n32), .Y(n31) );
  INVX1 U19 ( .A(B[5]), .Y(n10) );
  INVX1 U20 ( .A(B[6]), .Y(n9) );
  AND2X2 U21 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n2) );
  AND2X2 U22 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n3) );
  AND2X2 U23 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n4) );
  AND2X2 U24 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n5) );
  AND2X2 U25 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n6) );
  OAI21X2 U26 ( .A0(n26), .A1(n22), .B0(n25), .Y(n15) );
  OAI21X1 U27 ( .A0(n34), .A1(n33), .B0(n32), .Y(n36) );
  INVXL U28 ( .A(B[0]), .Y(n59) );
  NAND2X1 U29 ( .A(n17), .B(A1_16_), .Y(n25) );
  AND2X2 U30 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n17) );
  NOR2X1 U31 ( .A(n57), .B(n51), .Y(ab_2__2_) );
  NOR2X1 U32 ( .A(n58), .B(n51), .Y(ab_2__1_) );
  NOR2XL U33 ( .A(n56), .B(n52), .Y(ab_1__3_) );
  INVX1 U34 ( .A(B[5]), .Y(n54) );
  NOR2XL U35 ( .A(n56), .B(n38), .Y(ab_15__3_) );
  NOR2XL U36 ( .A(n56), .B(n39), .Y(ab_14__3_) );
  NOR2XL U37 ( .A(n56), .B(n40), .Y(ab_13__3_) );
  NOR2XL U38 ( .A(n56), .B(n41), .Y(ab_12__3_) );
  NOR2XL U39 ( .A(n56), .B(n42), .Y(ab_11__3_) );
  NOR2XL U40 ( .A(n56), .B(n43), .Y(ab_10__3_) );
  NOR2XL U41 ( .A(n44), .B(n56), .Y(ab_9__3_) );
  NOR2XL U42 ( .A(n56), .B(n45), .Y(ab_8__3_) );
  NOR2XL U43 ( .A(n56), .B(n46), .Y(ab_7__3_) );
  NOR2XL U44 ( .A(n56), .B(n47), .Y(ab_6__3_) );
  NOR2XL U45 ( .A(n56), .B(n48), .Y(ab_5__3_) );
  NOR2XL U46 ( .A(n56), .B(n49), .Y(ab_4__3_) );
  NOR2XL U47 ( .A(n56), .B(n50), .Y(ab_3__3_) );
  NOR2XL U48 ( .A(n56), .B(n51), .Y(ab_2__3_) );
  OR2X4 U49 ( .A(n19), .B(A1_17_), .Y(n30) );
  INVXL U50 ( .A(B[6]), .Y(n8) );
  NOR2X1 U51 ( .A(n54), .B(n52), .Y(ab_1__5_) );
  NOR2XL U52 ( .A(n58), .B(n50), .Y(ab_3__1_) );
  NOR2X2 U53 ( .A(n57), .B(n52), .Y(ab_1__2_) );
  NOR2XL U54 ( .A(n8), .B(n52), .Y(ab_1__6_) );
  NOR2X2 U55 ( .A(n54), .B(n53), .Y(ab_0__5_) );
  INVXL U56 ( .A(B[2]), .Y(n11) );
  NOR2X1 U57 ( .A(n55), .B(n52), .Y(ab_1__4_) );
  AOI21X2 U58 ( .A0(n30), .A1(n15), .B0(n37), .Y(n33) );
  INVXL U59 ( .A(B[1]), .Y(n12) );
  INVX4 U60 ( .A(B[3]), .Y(n56) );
  XOR2XL U61 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  INVXL U62 ( .A(n22), .Y(n13) );
  INVX1 U63 ( .A(n13), .Y(n14) );
  NOR2XL U64 ( .A(n57), .B(n50), .Y(ab_3__2_) );
  NOR2XL U65 ( .A(n57), .B(n49), .Y(ab_4__2_) );
  NOR2XL U66 ( .A(n11), .B(n48), .Y(ab_5__2_) );
  XOR2X1 U67 ( .A(n31), .B(n33), .Y(PRODUCT_20_) );
  NOR2XL U68 ( .A(n54), .B(n45), .Y(ab_8__5_) );
  NOR2XL U69 ( .A(n10), .B(n39), .Y(ab_14__5_) );
  NOR2XL U70 ( .A(n10), .B(n46), .Y(ab_7__5_) );
  NOR2XL U71 ( .A(n10), .B(n47), .Y(ab_6__5_) );
  NOR2XL U72 ( .A(n54), .B(n40), .Y(ab_13__5_) );
  NOR2XL U73 ( .A(n10), .B(n48), .Y(ab_5__5_) );
  NOR2XL U74 ( .A(n10), .B(n43), .Y(ab_10__5_) );
  NOR2XL U75 ( .A(n10), .B(n41), .Y(ab_12__5_) );
  NOR2XL U76 ( .A(n10), .B(n49), .Y(ab_4__5_) );
  XOR2X1 U77 ( .A(ab_1__1_), .B(ab_0__2_), .Y(SUMB_1__1_) );
  NOR2XL U78 ( .A(n55), .B(n38), .Y(ab_15__4_) );
  NOR2XL U79 ( .A(n55), .B(n39), .Y(ab_14__4_) );
  NOR2XL U80 ( .A(n55), .B(n40), .Y(ab_13__4_) );
  NOR2XL U81 ( .A(n55), .B(n41), .Y(ab_12__4_) );
  NOR2XL U82 ( .A(n55), .B(n42), .Y(ab_11__4_) );
  NOR2XL U83 ( .A(n55), .B(n43), .Y(ab_10__4_) );
  NOR2XL U84 ( .A(n44), .B(n55), .Y(ab_9__4_) );
  NOR2XL U85 ( .A(n55), .B(n45), .Y(ab_8__4_) );
  NOR2XL U86 ( .A(n55), .B(n46), .Y(ab_7__4_) );
  NOR2XL U87 ( .A(n55), .B(n47), .Y(ab_6__4_) );
  NOR2XL U88 ( .A(n55), .B(n48), .Y(ab_5__4_) );
  NOR2XL U89 ( .A(n55), .B(n49), .Y(ab_4__4_) );
  NOR2XL U90 ( .A(n55), .B(n50), .Y(ab_3__4_) );
  NOR2XL U91 ( .A(n55), .B(n51), .Y(ab_2__4_) );
  NAND2XL U92 ( .A(n30), .B(n28), .Y(n27) );
  NAND2BXL U93 ( .AN(n26), .B(n25), .Y(n24) );
  NAND2XL U94 ( .A(n18), .B(A1_18_), .Y(n32) );
  NAND2X1 U95 ( .A(n20), .B(A1_15_), .Y(n22) );
  NOR2XL U96 ( .A(n10), .B(n50), .Y(ab_3__5_) );
  INVX1 U97 ( .A(n28), .Y(n37) );
  AND2X2 U98 ( .A(n23), .B(n14), .Y(PRODUCT_17_) );
  XOR2X1 U99 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U100 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  XOR2X1 U101 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  XOR2X1 U102 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U103 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U104 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n18) );
  AND2X2 U105 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n19) );
  AND2X2 U106 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n20) );
  AND2X2 U107 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n21) );
  XOR2X1 U108 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2X1 U109 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  XOR2X1 U110 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  INVX1 U111 ( .A(A[3]), .Y(n50) );
  INVX1 U112 ( .A(A[4]), .Y(n49) );
  INVX1 U113 ( .A(A[6]), .Y(n47) );
  INVX1 U114 ( .A(A[5]), .Y(n48) );
  INVX1 U115 ( .A(A[9]), .Y(n44) );
  INVX1 U116 ( .A(A[7]), .Y(n46) );
  INVX1 U117 ( .A(A[8]), .Y(n45) );
  INVX1 U118 ( .A(A[10]), .Y(n43) );
  INVX1 U119 ( .A(A[11]), .Y(n42) );
  INVX1 U120 ( .A(A[12]), .Y(n41) );
  INVX1 U121 ( .A(A[13]), .Y(n40) );
  INVX1 U122 ( .A(A[14]), .Y(n39) );
  INVX1 U123 ( .A(A[15]), .Y(n38) );
  OR2X1 U124 ( .A(n20), .B(A1_15_), .Y(n23) );
  XOR2X1 U125 ( .A(n24), .B(n14), .Y(PRODUCT_18_) );
  NAND2X1 U126 ( .A(n19), .B(A1_17_), .Y(n28) );
  OAI21XL U127 ( .A0(n26), .A1(n14), .B0(n25), .Y(n29) );
  XNOR2X1 U128 ( .A(n27), .B(n29), .Y(PRODUCT_19_) );
  XOR2X1 U129 ( .A(n21), .B(A1_19_), .Y(n35) );
  XOR2X1 U130 ( .A(n36), .B(n35), .Y(PRODUCT_21_) );
  NOR2X1 U131 ( .A(n44), .B(n8), .Y(ab_9__6_) );
  NOR2X1 U132 ( .A(n44), .B(n10), .Y(ab_9__5_) );
  NOR2X1 U133 ( .A(n44), .B(n11), .Y(ab_9__2_) );
  NOR2X1 U134 ( .A(n44), .B(n12), .Y(ab_9__1_) );
  NOR2X1 U135 ( .A(n44), .B(n7), .Y(ab_9__0_) );
  NOR2X1 U136 ( .A(n9), .B(n45), .Y(ab_8__6_) );
  NOR2X1 U137 ( .A(n11), .B(n45), .Y(ab_8__2_) );
  NOR2X1 U138 ( .A(n12), .B(n45), .Y(ab_8__1_) );
  NOR2X1 U139 ( .A(n7), .B(n45), .Y(ab_8__0_) );
  NOR2X1 U140 ( .A(n8), .B(n46), .Y(ab_7__6_) );
  NOR2X1 U141 ( .A(n11), .B(n46), .Y(ab_7__2_) );
  NOR2X1 U142 ( .A(n12), .B(n46), .Y(ab_7__1_) );
  NOR2X1 U143 ( .A(n7), .B(n46), .Y(ab_7__0_) );
  NOR2X1 U144 ( .A(n9), .B(n47), .Y(ab_6__6_) );
  NOR2X1 U145 ( .A(n11), .B(n47), .Y(ab_6__2_) );
  NOR2X1 U146 ( .A(n12), .B(n47), .Y(ab_6__1_) );
  NOR2X1 U147 ( .A(n7), .B(n47), .Y(ab_6__0_) );
  NOR2X1 U148 ( .A(n8), .B(n48), .Y(ab_5__6_) );
  NOR2X1 U149 ( .A(n12), .B(n48), .Y(ab_5__1_) );
  NOR2X1 U150 ( .A(n7), .B(n48), .Y(ab_5__0_) );
  NOR2X1 U151 ( .A(n9), .B(n49), .Y(ab_4__6_) );
  NOR2X1 U152 ( .A(n12), .B(n49), .Y(ab_4__1_) );
  NOR2X1 U153 ( .A(n7), .B(n49), .Y(ab_4__0_) );
  NOR2X1 U154 ( .A(n8), .B(n50), .Y(ab_3__6_) );
  NOR2X1 U155 ( .A(n7), .B(n50), .Y(ab_3__0_) );
  NOR2X1 U156 ( .A(n9), .B(n51), .Y(ab_2__6_) );
  NOR2X1 U157 ( .A(n10), .B(n51), .Y(ab_2__5_) );
  NOR2X1 U158 ( .A(n59), .B(n51), .Y(ab_2__0_) );
  NOR2X1 U159 ( .A(n8), .B(n38), .Y(ab_15__6_) );
  NOR2X1 U160 ( .A(n10), .B(n38), .Y(ab_15__5_) );
  NOR2X1 U161 ( .A(n11), .B(n38), .Y(ab_15__2_) );
  NOR2X1 U162 ( .A(n12), .B(n38), .Y(ab_15__1_) );
  NOR2X1 U163 ( .A(n7), .B(n38), .Y(ab_15__0_) );
  NOR2X1 U164 ( .A(n9), .B(n39), .Y(ab_14__6_) );
  NOR2X1 U165 ( .A(n11), .B(n39), .Y(ab_14__2_) );
  NOR2X1 U166 ( .A(n12), .B(n39), .Y(ab_14__1_) );
  NOR2X1 U167 ( .A(n7), .B(n39), .Y(ab_14__0_) );
  NOR2X1 U168 ( .A(n8), .B(n40), .Y(ab_13__6_) );
  NOR2X1 U169 ( .A(n11), .B(n40), .Y(ab_13__2_) );
  NOR2X1 U170 ( .A(n12), .B(n40), .Y(ab_13__1_) );
  NOR2X1 U171 ( .A(n7), .B(n40), .Y(ab_13__0_) );
  NOR2X1 U172 ( .A(n11), .B(n41), .Y(ab_12__2_) );
  NOR2X1 U173 ( .A(n12), .B(n41), .Y(ab_12__1_) );
  NOR2X1 U174 ( .A(n7), .B(n41), .Y(ab_12__0_) );
  NOR2X1 U175 ( .A(n8), .B(n42), .Y(ab_11__6_) );
  NOR2X1 U176 ( .A(n10), .B(n42), .Y(ab_11__5_) );
  NOR2X1 U177 ( .A(n11), .B(n42), .Y(ab_11__2_) );
  NOR2X1 U178 ( .A(n12), .B(n42), .Y(ab_11__1_) );
  NOR2X1 U179 ( .A(n7), .B(n42), .Y(ab_11__0_) );
  NOR2X1 U180 ( .A(n9), .B(n43), .Y(ab_10__6_) );
  NOR2X1 U181 ( .A(n11), .B(n43), .Y(ab_10__2_) );
  NOR2X1 U182 ( .A(n12), .B(n43), .Y(ab_10__1_) );
  NOR2X1 U183 ( .A(n7), .B(n43), .Y(ab_10__0_) );
  AND3X1 U184 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
endmodule


module multi16_1 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_1_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(in_8bit_b[7])
         );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n2), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 out_reg_16_ ( .D(n3), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_14_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n43), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n44), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_10_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 out_reg_6_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 out_reg_5_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_1_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_0_ ( .D(n120), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n118), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 in_8bit_b_reg_5_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQXL sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQXL sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQXL sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQX4 in_8bit_b_reg_3_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX4 in_17bit_b_reg_0_ ( .D(n122), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX4 in_17bit_b_reg_1_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_17bit_b[1]) );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX4 in_8bit_b_reg_1_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  DFFRHQX2 in_8bit_b_reg_4_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  INVX1 U3 ( .A(n2), .Y(n123) );
  INVX1 U4 ( .A(n143), .Y(n43) );
  AOI22X1 U5 ( .A0(n2), .A1(N20), .B0(in_17bit[15]), .B1(n123), .Y(n143) );
  INVX1 U6 ( .A(in_17bit[15]), .Y(n19) );
  INVX1 U7 ( .A(n140), .Y(n46) );
  AOI22X1 U8 ( .A0(N17), .A1(n2), .B0(in_17bit[12]), .B1(n123), .Y(n140) );
  INVX1 U9 ( .A(n141), .Y(n45) );
  AOI22X1 U10 ( .A0(N18), .A1(n2), .B0(in_17bit[13]), .B1(n123), .Y(n141) );
  INVX1 U11 ( .A(n142), .Y(n44) );
  AOI22X1 U12 ( .A0(N19), .A1(n2), .B0(in_17bit[14]), .B1(n123), .Y(n142) );
  INVX1 U13 ( .A(in_17bit[0]), .Y(n4) );
  INVX1 U14 ( .A(in_17bit[1]), .Y(n5) );
  INVX1 U15 ( .A(in_17bit[2]), .Y(n6) );
  INVX1 U16 ( .A(in_17bit[3]), .Y(n7) );
  INVX1 U17 ( .A(in_17bit[4]), .Y(n8) );
  INVX1 U18 ( .A(n136), .Y(n89) );
  AOI22X1 U19 ( .A0(N13), .A1(n2), .B0(in_17bit[8]), .B1(n123), .Y(n136) );
  INVX1 U20 ( .A(n137), .Y(n49) );
  AOI22X1 U21 ( .A0(N14), .A1(n2), .B0(in_17bit[9]), .B1(n123), .Y(n137) );
  INVX1 U22 ( .A(n138), .Y(n48) );
  AOI22X1 U23 ( .A0(N15), .A1(n2), .B0(in_17bit[10]), .B1(n123), .Y(n138) );
  INVX1 U24 ( .A(n139), .Y(n47) );
  AOI22X1 U25 ( .A0(N16), .A1(n2), .B0(in_17bit[11]), .B1(n123), .Y(n139) );
  INVX1 U26 ( .A(in_17bit[5]), .Y(n9) );
  INVX1 U27 ( .A(in_17bit[6]), .Y(n10) );
  INVX1 U28 ( .A(in_17bit[7]), .Y(n11) );
  INVX1 U29 ( .A(in_17bit[8]), .Y(n12) );
  INVX1 U30 ( .A(n133), .Y(n92) );
  AOI22X1 U31 ( .A0(N10), .A1(n2), .B0(in_17bit[5]), .B1(n123), .Y(n133) );
  INVX1 U32 ( .A(n131), .Y(n94) );
  AOI22X1 U33 ( .A0(N8), .A1(n2), .B0(in_17bit[3]), .B1(n123), .Y(n131) );
  INVX1 U34 ( .A(n132), .Y(n93) );
  AOI22X1 U35 ( .A0(N9), .A1(n2), .B0(in_17bit[4]), .B1(n123), .Y(n132) );
  INVX1 U36 ( .A(n134), .Y(n91) );
  AOI22X1 U37 ( .A0(N11), .A1(n2), .B0(in_17bit[6]), .B1(n123), .Y(n134) );
  INVX1 U38 ( .A(n135), .Y(n90) );
  AOI22X1 U39 ( .A0(N12), .A1(n2), .B0(in_17bit[7]), .B1(n123), .Y(n135) );
  INVX1 U40 ( .A(in_17bit[9]), .Y(n13) );
  INVX1 U41 ( .A(in_17bit[10]), .Y(n14) );
  INVX1 U42 ( .A(in_17bit[11]), .Y(n15) );
  INVX1 U43 ( .A(in_17bit[12]), .Y(n16) );
  INVX1 U44 ( .A(in_17bit[13]), .Y(n17) );
  INVX1 U45 ( .A(n1), .Y(n119) );
  BUFX3 U46 ( .A(in_17bit[16]), .Y(n2) );
  INVX1 U47 ( .A(in_8bit[0]), .Y(n20) );
  INVX1 U48 ( .A(n144), .Y(n118) );
  AOI22X1 U49 ( .A0(in_8bit[0]), .A1(n1), .B0(in_8bit[0]), .B1(n119), .Y(n144)
         );
  INVX1 U50 ( .A(n145), .Y(n102) );
  AOI22X1 U51 ( .A0(N39), .A1(n1), .B0(in_8bit[1]), .B1(n119), .Y(n145) );
  INVX1 U52 ( .A(n146), .Y(n101) );
  AOI22X1 U53 ( .A0(N40), .A1(n1), .B0(in_8bit[2]), .B1(n119), .Y(n146) );
  INVX1 U54 ( .A(n147), .Y(n100) );
  AOI22X1 U55 ( .A0(N41), .A1(n1), .B0(in_8bit[3]), .B1(n119), .Y(n147) );
  INVX1 U56 ( .A(n148), .Y(n99) );
  AOI22X1 U57 ( .A0(N42), .A1(n1), .B0(in_8bit[4]), .B1(n119), .Y(n148) );
  INVX1 U58 ( .A(n149), .Y(n98) );
  AOI22X1 U59 ( .A0(N43), .A1(n1), .B0(in_8bit[5]), .B1(n119), .Y(n149) );
  INVX1 U60 ( .A(n150), .Y(n97) );
  AOI22X1 U61 ( .A0(n1), .A1(N44), .B0(in_8bit[6]), .B1(n119), .Y(n150) );
  INVX1 U62 ( .A(in_8bit[6]), .Y(n26) );
  INVX1 U63 ( .A(n128), .Y(n122) );
  AOI22X1 U64 ( .A0(in_17bit[0]), .A1(n2), .B0(in_17bit[0]), .B1(n123), .Y(
        n128) );
  INVX1 U65 ( .A(n129), .Y(n96) );
  AOI22X1 U66 ( .A0(N6), .A1(n2), .B0(in_17bit[1]), .B1(n123), .Y(n129) );
  INVX1 U67 ( .A(n130), .Y(n95) );
  AOI22X1 U68 ( .A0(N7), .A1(n2), .B0(in_17bit[2]), .B1(n123), .Y(n130) );
  INVX1 U69 ( .A(in_8bit[1]), .Y(n21) );
  INVX1 U70 ( .A(in_8bit[2]), .Y(n22) );
  INVX1 U71 ( .A(in_8bit[3]), .Y(n23) );
  INVX1 U72 ( .A(in_8bit[4]), .Y(n24) );
  INVX1 U73 ( .A(in_8bit[5]), .Y(n25) );
  INVX1 U74 ( .A(in_17bit[14]), .Y(n18) );
  INVX1 U75 ( .A(n3), .Y(n121) );
  INVX1 U76 ( .A(n162), .Y(n107) );
  AOI22X1 U77 ( .A0(N82), .A1(n3), .B0(sum_b[18]), .B1(n121), .Y(n162) );
  INVX1 U78 ( .A(n125), .Y(n105) );
  AOI22X1 U79 ( .A0(N84), .A1(n3), .B0(sum_b[20]), .B1(n121), .Y(n125) );
  INVX1 U80 ( .A(n163), .Y(n106) );
  AOI22X1 U81 ( .A0(n3), .A1(N83), .B0(sum_b[19]), .B1(n121), .Y(n163) );
  INVX1 U82 ( .A(N71), .Y(n27) );
  INVX1 U83 ( .A(sum_b[8]), .Y(n28) );
  INVX1 U84 ( .A(sum_b[9]), .Y(n29) );
  INVX1 U85 ( .A(sum_b[10]), .Y(n30) );
  INVX1 U86 ( .A(sum_b[11]), .Y(n31) );
  INVX1 U87 ( .A(sum_b[12]), .Y(n32) );
  INVX1 U88 ( .A(n126), .Y(n104) );
  AOI22X1 U89 ( .A0(N85), .A1(n3), .B0(sum_b[21]), .B1(n121), .Y(n126) );
  INVX1 U90 ( .A(n127), .Y(n103) );
  AOI22X1 U91 ( .A0(N86), .A1(n3), .B0(sum_b[22]), .B1(n121), .Y(n127) );
  INVX1 U92 ( .A(sum_b[22]), .Y(n42) );
  INVX1 U93 ( .A(n158), .Y(n111) );
  AOI22X1 U94 ( .A0(N78), .A1(n3), .B0(sum_b[14]), .B1(n121), .Y(n158) );
  INVX1 U95 ( .A(n159), .Y(n110) );
  AOI22X1 U96 ( .A0(N79), .A1(n3), .B0(sum_b[15]), .B1(n121), .Y(n159) );
  INVX1 U97 ( .A(n160), .Y(n109) );
  AOI22X1 U98 ( .A0(N80), .A1(n3), .B0(sum_b[16]), .B1(n121), .Y(n160) );
  INVX1 U99 ( .A(n161), .Y(n108) );
  AOI22X1 U100 ( .A0(N81), .A1(n3), .B0(sum_b[17]), .B1(n121), .Y(n161) );
  BUFX3 U101 ( .A(in_8bit[7]), .Y(n1) );
  INVX1 U102 ( .A(sum_b[13]), .Y(n33) );
  INVX1 U103 ( .A(sum_b[14]), .Y(n34) );
  INVX1 U104 ( .A(sum_b[15]), .Y(n35) );
  INVX1 U105 ( .A(sum_b[16]), .Y(n36) );
  INVX1 U106 ( .A(n153), .Y(n116) );
  AOI22X1 U107 ( .A0(N73), .A1(n3), .B0(sum_b[9]), .B1(n121), .Y(n153) );
  INVX1 U108 ( .A(n154), .Y(n115) );
  AOI22X1 U109 ( .A0(N74), .A1(n3), .B0(sum_b[10]), .B1(n121), .Y(n154) );
  INVX1 U110 ( .A(n155), .Y(n114) );
  AOI22X1 U111 ( .A0(N75), .A1(n3), .B0(sum_b[11]), .B1(n121), .Y(n155) );
  INVX1 U112 ( .A(n156), .Y(n113) );
  AOI22X1 U113 ( .A0(N76), .A1(n3), .B0(sum_b[12]), .B1(n121), .Y(n156) );
  INVX1 U114 ( .A(n157), .Y(n112) );
  AOI22X1 U115 ( .A0(N77), .A1(n3), .B0(sum_b[13]), .B1(n121), .Y(n157) );
  INVX1 U116 ( .A(sum_b[17]), .Y(n37) );
  INVX1 U117 ( .A(sum_b[18]), .Y(n38) );
  INVX1 U118 ( .A(sum_b[19]), .Y(n39) );
  INVX1 U119 ( .A(sum_b[20]), .Y(n40) );
  INVX1 U120 ( .A(sum_b[21]), .Y(n41) );
  BUFX3 U121 ( .A(sum_b[23]), .Y(n3) );
  INVX1 U122 ( .A(n151), .Y(n120) );
  AOI22X1 U123 ( .A0(N71), .A1(n3), .B0(N71), .B1(n121), .Y(n151) );
  INVX1 U124 ( .A(n152), .Y(n117) );
  AOI22X1 U125 ( .A0(N72), .A1(n3), .B0(sum_b[8]), .B1(n121), .Y(n152) );
  XOR2X1 U126 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U127 ( .A(n42), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U128 ( .A(sub_add_97_b0_carry[14]), .B(n41), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U129 ( .A(n41), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U130 ( .A(sub_add_97_b0_carry[13]), .B(n40), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U131 ( .A(n40), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U132 ( .A(sub_add_97_b0_carry[12]), .B(n39), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U133 ( .A(n39), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U134 ( .A(sub_add_97_b0_carry[11]), .B(n38), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U135 ( .A(n38), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U136 ( .A(sub_add_97_b0_carry[10]), .B(n37), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U137 ( .A(n37), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U138 ( .A(sub_add_97_b0_carry[9]), .B(n36), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U139 ( .A(n36), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U140 ( .A(sub_add_97_b0_carry[8]), .B(n35), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U141 ( .A(n35), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U142 ( .A(sub_add_97_b0_carry[7]), .B(n34), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U143 ( .A(n34), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U144 ( .A(sub_add_97_b0_carry[6]), .B(n33), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U145 ( .A(n33), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U146 ( .A(sub_add_97_b0_carry[5]), .B(n32), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U147 ( .A(n32), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U148 ( .A(sub_add_97_b0_carry[4]), .B(n31), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U149 ( .A(n31), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U150 ( .A(sub_add_97_b0_carry[3]), .B(n30), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U151 ( .A(n30), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U152 ( .A(sub_add_97_b0_carry[2]), .B(n29), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U153 ( .A(n29), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U154 ( .A(n27), .B(n28), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U155 ( .A(n28), .B(n27), .Y(N72) );
  XOR2X1 U156 ( .A(n26), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U157 ( .A(sub_add_61_b0_carry[5]), .B(n25), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U158 ( .A(n25), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U159 ( .A(sub_add_61_b0_carry[4]), .B(n24), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U160 ( .A(n24), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U161 ( .A(sub_add_61_b0_carry[3]), .B(n23), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U162 ( .A(n23), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U163 ( .A(sub_add_61_b0_carry[2]), .B(n22), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U164 ( .A(n22), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U165 ( .A(n20), .B(n21), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U166 ( .A(n21), .B(n20), .Y(N39) );
  XOR2X1 U167 ( .A(n19), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U168 ( .A(sub_add_52_b0_carry[14]), .B(n18), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U169 ( .A(n18), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U170 ( .A(sub_add_52_b0_carry[13]), .B(n17), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U171 ( .A(n17), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U172 ( .A(sub_add_52_b0_carry[12]), .B(n16), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U173 ( .A(n16), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U174 ( .A(sub_add_52_b0_carry[11]), .B(n15), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U175 ( .A(n15), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U176 ( .A(sub_add_52_b0_carry[10]), .B(n14), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U177 ( .A(n14), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U178 ( .A(sub_add_52_b0_carry[9]), .B(n13), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U179 ( .A(n13), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U180 ( .A(sub_add_52_b0_carry[8]), .B(n12), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U181 ( .A(n12), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U182 ( .A(sub_add_52_b0_carry[7]), .B(n11), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U183 ( .A(n11), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U184 ( .A(sub_add_52_b0_carry[6]), .B(n10), .Y(sub_add_52_b0_carry[7]) );
  XOR2X1 U185 ( .A(n10), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U186 ( .A(sub_add_52_b0_carry[5]), .B(n9), .Y(sub_add_52_b0_carry[6])
         );
  XOR2X1 U187 ( .A(n9), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U188 ( .A(sub_add_52_b0_carry[4]), .B(n8), .Y(sub_add_52_b0_carry[5])
         );
  XOR2X1 U189 ( .A(n8), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U190 ( .A(sub_add_52_b0_carry[3]), .B(n7), .Y(sub_add_52_b0_carry[4])
         );
  XOR2X1 U191 ( .A(n7), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U192 ( .A(sub_add_52_b0_carry[2]), .B(n6), .Y(sub_add_52_b0_carry[3])
         );
  XOR2X1 U193 ( .A(n6), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U194 ( .A(n4), .B(n5), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U195 ( .A(n5), .B(n4), .Y(N6) );
endmodule


module multi16_0_DW02_mult_0 ( A, B, PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, 
        PRODUCT_18_, PRODUCT_17_, PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, 
        PRODUCT_13_, PRODUCT_12_, PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, 
        PRODUCT_8_, PRODUCT_7_, PRODUCT_6_ );
  input [15:0] A;
  input [6:0] B;
  output PRODUCT_21_, PRODUCT_20_, PRODUCT_19_, PRODUCT_18_, PRODUCT_17_,
         PRODUCT_16_, PRODUCT_15_, PRODUCT_14_, PRODUCT_13_, PRODUCT_12_,
         PRODUCT_11_, PRODUCT_10_, PRODUCT_9_, PRODUCT_8_, PRODUCT_7_,
         PRODUCT_6_;
  wire   ab_15__6_, ab_15__5_, ab_15__4_, ab_15__3_, ab_15__2_, ab_15__1_,
         ab_15__0_, ab_14__6_, ab_14__5_, ab_14__4_, ab_14__3_, ab_14__2_,
         ab_14__1_, ab_14__0_, ab_13__6_, ab_13__5_, ab_13__4_, ab_13__3_,
         ab_13__2_, ab_13__1_, ab_13__0_, ab_12__6_, ab_12__5_, ab_12__4_,
         ab_12__3_, ab_12__2_, ab_12__1_, ab_12__0_, ab_11__6_, ab_11__5_,
         ab_11__4_, ab_11__3_, ab_11__2_, ab_11__1_, ab_11__0_, ab_10__6_,
         ab_10__5_, ab_10__4_, ab_10__3_, ab_10__2_, ab_10__1_, ab_10__0_,
         ab_9__6_, ab_9__5_, ab_9__4_, ab_9__3_, ab_9__2_, ab_9__1_, ab_9__0_,
         ab_8__6_, ab_8__5_, ab_8__4_, ab_8__3_, ab_8__2_, ab_8__1_, ab_8__0_,
         ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_, ab_7__0_,
         ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_, ab_6__1_, ab_6__0_,
         ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_, ab_5__2_, ab_5__1_, ab_5__0_,
         ab_4__6_, ab_4__5_, ab_4__4_, ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_,
         ab_3__6_, ab_3__5_, ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_,
         ab_2__6_, ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_0__6_,
         ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, CARRYB_15__5_, CARRYB_15__4_,
         CARRYB_15__3_, CARRYB_15__2_, CARRYB_15__1_, CARRYB_15__0_,
         CARRYB_14__5_, CARRYB_14__4_, CARRYB_14__3_, CARRYB_14__2_,
         CARRYB_14__1_, CARRYB_14__0_, CARRYB_13__5_, CARRYB_13__4_,
         CARRYB_13__3_, CARRYB_13__2_, CARRYB_13__1_, CARRYB_13__0_,
         CARRYB_12__5_, CARRYB_12__4_, CARRYB_12__3_, CARRYB_12__2_,
         CARRYB_12__1_, CARRYB_12__0_, CARRYB_11__5_, CARRYB_11__4_,
         CARRYB_11__3_, CARRYB_11__2_, CARRYB_11__1_, CARRYB_11__0_,
         CARRYB_10__5_, CARRYB_10__4_, CARRYB_10__3_, CARRYB_10__2_,
         CARRYB_10__1_, CARRYB_10__0_, CARRYB_9__5_, CARRYB_9__4_,
         CARRYB_9__3_, CARRYB_9__2_, CARRYB_9__1_, CARRYB_9__0_, CARRYB_8__5_,
         CARRYB_8__4_, CARRYB_8__3_, CARRYB_8__2_, CARRYB_8__1_, CARRYB_8__0_,
         CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_, CARRYB_7__1_,
         CARRYB_7__0_, CARRYB_6__5_, CARRYB_6__4_, CARRYB_6__3_, CARRYB_6__2_,
         CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_,
         CARRYB_5__2_, CARRYB_5__1_, CARRYB_5__0_, CARRYB_4__5_, CARRYB_4__4_,
         CARRYB_4__3_, CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_, CARRYB_2__1_,
         CARRYB_2__0_, CARRYB_1__0_, SUMB_15__5_, SUMB_15__4_, SUMB_15__3_,
         SUMB_15__2_, SUMB_15__1_, SUMB_14__5_, SUMB_14__4_, SUMB_14__3_,
         SUMB_14__2_, SUMB_14__1_, SUMB_13__5_, SUMB_13__4_, SUMB_13__3_,
         SUMB_13__2_, SUMB_13__1_, SUMB_12__5_, SUMB_12__4_, SUMB_12__3_,
         SUMB_12__2_, SUMB_12__1_, SUMB_11__5_, SUMB_11__4_, SUMB_11__3_,
         SUMB_11__2_, SUMB_11__1_, SUMB_10__5_, SUMB_10__4_, SUMB_10__3_,
         SUMB_10__2_, SUMB_10__1_, SUMB_9__5_, SUMB_9__4_, SUMB_9__3_,
         SUMB_9__2_, SUMB_9__1_, SUMB_8__5_, SUMB_8__4_, SUMB_8__3_,
         SUMB_8__2_, SUMB_8__1_, SUMB_7__5_, SUMB_7__4_, SUMB_7__3_,
         SUMB_7__2_, SUMB_7__1_, SUMB_6__5_, SUMB_6__4_, SUMB_6__3_,
         SUMB_6__2_, SUMB_6__1_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_,
         SUMB_5__2_, SUMB_5__1_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__5_, SUMB_3__4_, SUMB_3__3_,
         SUMB_3__2_, SUMB_3__1_, SUMB_2__5_, SUMB_2__4_, SUMB_2__3_,
         SUMB_2__2_, SUMB_2__1_, SUMB_1__5_, SUMB_1__4_, SUMB_1__3_,
         SUMB_1__2_, SUMB_1__1_, A1_19_, A1_18_, A1_17_, A1_16_, A1_15_, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60;

  ADDFX2 S3_9_5 ( .A(ab_9__5_), .B(CARRYB_8__5_), .CI(ab_8__6_), .CO(
        CARRYB_9__5_), .S(SUMB_9__5_) );
  ADDFX2 S1_10_0 ( .A(ab_10__0_), .B(CARRYB_9__0_), .CI(SUMB_9__1_), .CO(
        CARRYB_10__0_), .S(PRODUCT_10_) );
  ADDFX2 S1_8_0 ( .A(ab_8__0_), .B(CARRYB_7__0_), .CI(SUMB_7__1_), .CO(
        CARRYB_8__0_), .S(PRODUCT_8_) );
  ADDFX2 S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_) );
  ADDFX2 S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(PRODUCT_6_) );
  ADDFX2 S3_11_5 ( .A(ab_11__5_), .B(CARRYB_10__5_), .CI(ab_10__6_), .CO(
        CARRYB_11__5_), .S(SUMB_11__5_) );
  ADDFX2 S4_4 ( .A(ab_15__4_), .B(CARRYB_14__4_), .CI(SUMB_14__5_), .CO(
        CARRYB_15__4_), .S(SUMB_15__4_) );
  ADDFX2 S2_13_4 ( .A(ab_13__4_), .B(CARRYB_12__4_), .CI(SUMB_12__5_), .CO(
        CARRYB_13__4_), .S(SUMB_13__4_) );
  ADDFX2 S2_14_1 ( .A(ab_14__1_), .B(CARRYB_13__1_), .CI(SUMB_13__2_), .CO(
        CARRYB_14__1_), .S(SUMB_14__1_) );
  ADDFX2 S2_13_3 ( .A(ab_13__3_), .B(CARRYB_12__3_), .CI(SUMB_12__4_), .CO(
        CARRYB_13__3_), .S(SUMB_13__3_) );
  ADDFX2 S2_12_2 ( .A(ab_12__2_), .B(CARRYB_11__2_), .CI(SUMB_11__3_), .CO(
        CARRYB_12__2_), .S(SUMB_12__2_) );
  ADDFX2 S2_11_4 ( .A(ab_11__4_), .B(CARRYB_10__4_), .CI(SUMB_10__5_), .CO(
        CARRYB_11__4_), .S(SUMB_11__4_) );
  ADDFX2 S2_11_1 ( .A(ab_11__1_), .B(CARRYB_10__1_), .CI(SUMB_10__2_), .CO(
        CARRYB_11__1_), .S(SUMB_11__1_) );
  ADDFX2 S2_10_3 ( .A(ab_10__3_), .B(CARRYB_9__3_), .CI(SUMB_9__4_), .CO(
        CARRYB_10__3_), .S(SUMB_10__3_) );
  ADDFX2 S2_10_2 ( .A(ab_10__2_), .B(CARRYB_9__2_), .CI(SUMB_9__3_), .CO(
        CARRYB_10__2_), .S(SUMB_10__2_) );
  ADDFX2 S2_9_1 ( .A(ab_9__1_), .B(CARRYB_8__1_), .CI(SUMB_8__2_), .CO(
        CARRYB_9__1_), .S(SUMB_9__1_) );
  ADDFX2 S2_8_4 ( .A(ab_8__4_), .B(CARRYB_7__4_), .CI(SUMB_7__5_), .CO(
        CARRYB_8__4_), .S(SUMB_8__4_) );
  ADDFX2 S2_8_3 ( .A(ab_8__3_), .B(CARRYB_7__3_), .CI(SUMB_7__4_), .CO(
        CARRYB_8__3_), .S(SUMB_8__3_) );
  ADDFX2 S2_7_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2 S2_7_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2 S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2 S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2 S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2 S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2 S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2 S4_3 ( .A(ab_15__3_), .B(CARRYB_14__3_), .CI(SUMB_14__4_), .CO(
        CARRYB_15__3_), .S(SUMB_15__3_) );
  ADDFX2 S4_2 ( .A(ab_15__2_), .B(CARRYB_14__2_), .CI(SUMB_14__3_), .CO(
        CARRYB_15__2_), .S(SUMB_15__2_) );
  CMPR32X1 S1_2_0 ( .A(ab_2__0_), .B(CARRYB_1__0_), .C(SUMB_1__1_), .CO(
        CARRYB_2__0_) );
  ADDFX1 S3_13_5 ( .A(ab_13__5_), .B(CARRYB_12__5_), .CI(ab_12__6_), .CO(
        CARRYB_13__5_), .S(SUMB_13__5_) );
  CMPR32X1 S3_8_5 ( .A(ab_8__5_), .B(CARRYB_7__5_), .C(ab_7__6_), .CO(
        CARRYB_8__5_), .S(SUMB_8__5_) );
  ADDFX1 S3_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(ab_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  CMPR32X1 S3_10_5 ( .A(ab_10__5_), .B(CARRYB_9__5_), .C(ab_9__6_), .CO(
        CARRYB_10__5_), .S(SUMB_10__5_) );
  CMPR32X1 S2_7_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .C(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  CMPR32X1 S2_9_4 ( .A(ab_9__4_), .B(CARRYB_8__4_), .C(SUMB_8__5_), .CO(
        CARRYB_9__4_), .S(SUMB_9__4_) );
  CMPR32X1 S2_10_4 ( .A(ab_10__4_), .B(CARRYB_9__4_), .C(SUMB_9__5_), .CO(
        CARRYB_10__4_), .S(SUMB_10__4_) );
  CMPR32X1 S2_12_4 ( .A(ab_12__4_), .B(CARRYB_11__4_), .C(SUMB_11__5_), .CO(
        CARRYB_12__4_), .S(SUMB_12__4_) );
  CMPR32X1 S2_7_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .C(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  CMPR32X1 S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .C(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  CMPR32X1 S2_9_3 ( .A(ab_9__3_), .B(CARRYB_8__3_), .C(SUMB_8__4_), .CO(
        CARRYB_9__3_), .S(SUMB_9__3_) );
  CMPR32X1 S2_11_3 ( .A(ab_11__3_), .B(CARRYB_10__3_), .C(SUMB_10__4_), .CO(
        CARRYB_11__3_), .S(SUMB_11__3_) );
  CMPR32X1 S2_12_3 ( .A(ab_12__3_), .B(CARRYB_11__3_), .C(SUMB_11__4_), .CO(
        CARRYB_12__3_), .S(SUMB_12__3_) );
  CMPR32X1 S2_14_4 ( .A(ab_14__4_), .B(CARRYB_13__4_), .C(SUMB_13__5_), .CO(
        CARRYB_14__4_), .S(SUMB_14__4_) );
  CMPR32X1 S2_14_3 ( .A(ab_14__3_), .B(CARRYB_13__3_), .C(SUMB_13__4_), .CO(
        CARRYB_14__3_), .S(SUMB_14__3_) );
  CMPR32X1 S2_2_2 ( .A(ab_2__2_), .B(n3), .C(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  CMPR32X1 S2_2_1 ( .A(ab_2__1_), .B(n5), .C(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  CMPR32X1 S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .C(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  CMPR32X1 S1_13_0 ( .A(ab_13__0_), .B(CARRYB_12__0_), .C(SUMB_12__1_), .CO(
        CARRYB_13__0_), .S(PRODUCT_13_) );
  CMPR32X1 S1_11_0 ( .A(ab_11__0_), .B(CARRYB_10__0_), .C(SUMB_10__1_), .CO(
        CARRYB_11__0_), .S(PRODUCT_11_) );
  CMPR32X1 S1_9_0 ( .A(ab_9__0_), .B(CARRYB_8__0_), .C(SUMB_8__1_), .CO(
        CARRYB_9__0_), .S(PRODUCT_9_) );
  CMPR32X1 S1_7_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .C(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(PRODUCT_7_) );
  CMPR32X1 S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .C(SUMB_3__1_), .CO(
        CARRYB_4__0_) );
  CMPR32X1 S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .C(SUMB_2__1_), .CO(
        CARRYB_3__0_) );
  CMPR32X1 S2_12_1 ( .A(ab_12__1_), .B(CARRYB_11__1_), .C(SUMB_11__2_), .CO(
        CARRYB_12__1_), .S(SUMB_12__1_) );
  CMPR32X1 S2_10_1 ( .A(ab_10__1_), .B(CARRYB_9__1_), .C(SUMB_9__2_), .CO(
        CARRYB_10__1_), .S(SUMB_10__1_) );
  CMPR32X1 S2_8_1 ( .A(ab_8__1_), .B(CARRYB_7__1_), .C(SUMB_7__2_), .CO(
        CARRYB_8__1_), .S(SUMB_8__1_) );
  CMPR32X1 S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .C(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  CMPR32X1 S2_13_1 ( .A(ab_13__1_), .B(CARRYB_12__1_), .C(SUMB_12__2_), .CO(
        CARRYB_13__1_), .S(SUMB_13__1_) );
  CMPR32X1 S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .C(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  CMPR32X1 S2_11_2 ( .A(ab_11__2_), .B(CARRYB_10__2_), .C(SUMB_10__3_), .CO(
        CARRYB_11__2_), .S(SUMB_11__2_) );
  CMPR32X1 S2_13_2 ( .A(ab_13__2_), .B(CARRYB_12__2_), .C(SUMB_12__3_), .CO(
        CARRYB_13__2_), .S(SUMB_13__2_) );
  CMPR32X1 S2_14_2 ( .A(ab_14__2_), .B(CARRYB_13__2_), .C(SUMB_13__3_), .CO(
        CARRYB_14__2_), .S(SUMB_14__2_) );
  CMPR32X1 S4_0 ( .A(ab_15__0_), .B(CARRYB_14__0_), .C(SUMB_14__1_), .CO(
        CARRYB_15__0_), .S(PRODUCT_15_) );
  CMPR32X1 S4_1 ( .A(ab_15__1_), .B(CARRYB_14__1_), .C(SUMB_14__2_), .CO(
        CARRYB_15__1_), .S(SUMB_15__1_) );
  CMPR32X1 S3_12_5 ( .A(ab_12__5_), .B(CARRYB_11__5_), .C(ab_11__6_), .CO(
        CARRYB_12__5_), .S(SUMB_12__5_) );
  CMPR32X1 S3_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .C(ab_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  CMPR32X1 S3_7_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .C(ab_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  CMPR32X1 S3_14_5 ( .A(ab_14__5_), .B(CARRYB_13__5_), .C(ab_13__6_), .CO(
        CARRYB_14__5_), .S(SUMB_14__5_) );
  ADDFHX2 S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFHX1 S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFHX1 S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  ADDFHX1 S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFHX1 S1_14_0 ( .A(ab_14__0_), .B(CARRYB_13__0_), .CI(SUMB_13__1_), .CO(
        CARRYB_14__0_), .S(PRODUCT_14_) );
  ADDFHX1 S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFHX1 S3_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(ab_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFHX2 S2_3_3 ( .A(ab_3__3_), .B(n2), .CI(SUMB_2__4_), .CO(CARRYB_3__3_), 
        .S(SUMB_3__3_) );
  ADDFHXL S1_12_0 ( .A(ab_12__0_), .B(CARRYB_11__0_), .CI(SUMB_11__1_), .CO(
        CARRYB_12__0_), .S(PRODUCT_12_) );
  ADDFHX1 S5_5 ( .A(ab_15__5_), .B(CARRYB_14__5_), .CI(ab_14__6_), .CO(
        CARRYB_15__5_), .S(SUMB_15__5_) );
  ADDFX2 S3_2_5 ( .A(ab_2__5_), .B(n7), .CI(ab_1__6_), .CO(CARRYB_2__5_), .S(
        SUMB_2__5_) );
  ADDFHX1 S2_9_2 ( .A(ab_9__2_), .B(CARRYB_8__2_), .CI(SUMB_8__3_), .CO(
        CARRYB_9__2_), .S(SUMB_9__2_) );
  ADDFHX1 S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFX2 S3_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(ab_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFHX1 S2_8_2 ( .A(ab_8__2_), .B(CARRYB_7__2_), .CI(SUMB_7__3_), .CO(
        CARRYB_8__2_), .S(SUMB_8__2_) );
  ADDFHX1 S2_2_3 ( .A(ab_2__3_), .B(n6), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFHX1 S2_2_4 ( .A(ab_2__4_), .B(n4), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  INVX2 U2 ( .A(B[4]), .Y(n56) );
  NAND2X2 U3 ( .A(n21), .B(A1_15_), .Y(n23) );
  XOR2XL U4 ( .A(ab_1__5_), .B(ab_0__6_), .Y(SUMB_1__5_) );
  NOR2X2 U5 ( .A(n11), .B(n53), .Y(ab_1__5_) );
  NOR2X1 U6 ( .A(n11), .B(n54), .Y(ab_0__5_) );
  INVX2 U7 ( .A(A[0]), .Y(n54) );
  BUFX3 U8 ( .A(CARRYB_2__3_), .Y(n2) );
  XOR2X2 U9 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(A1_16_) );
  NOR2X1 U10 ( .A(n56), .B(n54), .Y(ab_0__4_) );
  NOR2X1 U11 ( .A(n58), .B(n54), .Y(ab_0__2_) );
  INVX1 U12 ( .A(B[2]), .Y(n58) );
  INVX2 U13 ( .A(B[1]), .Y(n59) );
  NOR2X1 U14 ( .A(n19), .B(A1_18_), .Y(n35) );
  INVX1 U15 ( .A(B[6]), .Y(n9) );
  AND2X2 U16 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n3) );
  AND2X2 U17 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n4) );
  AND2X2 U18 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n5) );
  AND2X2 U19 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n6) );
  AND2X2 U20 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n7) );
  XOR2X1 U21 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(A1_18_) );
  NOR2X1 U22 ( .A(n57), .B(n53), .Y(ab_1__3_) );
  OAI21X1 U23 ( .A0(n35), .A1(n34), .B0(n33), .Y(n37) );
  OAI21X1 U24 ( .A0(n27), .A1(n23), .B0(n26), .Y(n16) );
  INVXL U25 ( .A(B[6]), .Y(n8) );
  INVX4 U26 ( .A(A[1]), .Y(n53) );
  NOR2XL U27 ( .A(n56), .B(n53), .Y(ab_1__4_) );
  NOR2X2 U28 ( .A(n53), .B(n59), .Y(ab_1__1_) );
  NOR2X1 U29 ( .A(n58), .B(n53), .Y(ab_1__2_) );
  NOR2XL U30 ( .A(n59), .B(n51), .Y(ab_3__1_) );
  CLKINVX4 U31 ( .A(n55), .Y(n10) );
  INVX8 U32 ( .A(n10), .Y(n11) );
  INVX1 U33 ( .A(B[5]), .Y(n55) );
  NOR2XL U34 ( .A(n8), .B(n53), .Y(ab_1__6_) );
  NOR2X2 U35 ( .A(n9), .B(n54), .Y(ab_0__6_) );
  INVXL U36 ( .A(B[2]), .Y(n12) );
  AOI21X2 U37 ( .A0(n31), .A1(n16), .B0(n38), .Y(n34) );
  INVXL U38 ( .A(B[1]), .Y(n13) );
  INVX4 U39 ( .A(B[3]), .Y(n57) );
  XOR2XL U40 ( .A(ab_1__2_), .B(ab_0__3_), .Y(SUMB_1__2_) );
  INVXL U41 ( .A(n23), .Y(n14) );
  INVX1 U42 ( .A(n14), .Y(n15) );
  NOR2XL U43 ( .A(n58), .B(n52), .Y(ab_2__2_) );
  NOR2XL U44 ( .A(n58), .B(n51), .Y(ab_3__2_) );
  NOR2XL U45 ( .A(n58), .B(n50), .Y(ab_4__2_) );
  NOR2XL U46 ( .A(n12), .B(n49), .Y(ab_5__2_) );
  XOR2X1 U47 ( .A(n32), .B(n34), .Y(PRODUCT_20_) );
  NOR2XL U48 ( .A(n11), .B(n46), .Y(ab_8__5_) );
  NOR2XL U49 ( .A(n11), .B(n40), .Y(ab_14__5_) );
  NOR2XL U50 ( .A(n11), .B(n47), .Y(ab_7__5_) );
  NOR2XL U51 ( .A(n11), .B(n48), .Y(ab_6__5_) );
  NOR2XL U52 ( .A(n11), .B(n41), .Y(ab_13__5_) );
  NOR2XL U53 ( .A(n11), .B(n49), .Y(ab_5__5_) );
  NOR2XL U54 ( .A(n11), .B(n44), .Y(ab_10__5_) );
  NOR2XL U55 ( .A(n11), .B(n42), .Y(ab_12__5_) );
  NOR2XL U56 ( .A(n11), .B(n50), .Y(ab_4__5_) );
  XOR2X1 U57 ( .A(ab_1__1_), .B(ab_0__2_), .Y(SUMB_1__1_) );
  NOR2XL U58 ( .A(n56), .B(n39), .Y(ab_15__4_) );
  NOR2XL U59 ( .A(n56), .B(n40), .Y(ab_14__4_) );
  NOR2XL U60 ( .A(n56), .B(n41), .Y(ab_13__4_) );
  NOR2XL U61 ( .A(n56), .B(n42), .Y(ab_12__4_) );
  NOR2XL U62 ( .A(n56), .B(n43), .Y(ab_11__4_) );
  NOR2XL U63 ( .A(n56), .B(n44), .Y(ab_10__4_) );
  NOR2XL U64 ( .A(n45), .B(n56), .Y(ab_9__4_) );
  NOR2XL U65 ( .A(n56), .B(n46), .Y(ab_8__4_) );
  NOR2XL U66 ( .A(n56), .B(n47), .Y(ab_7__4_) );
  NOR2XL U67 ( .A(n56), .B(n48), .Y(ab_6__4_) );
  NOR2XL U68 ( .A(n56), .B(n49), .Y(ab_5__4_) );
  NOR2XL U69 ( .A(n56), .B(n50), .Y(ab_4__4_) );
  NOR2XL U70 ( .A(n56), .B(n51), .Y(ab_3__4_) );
  NOR2XL U71 ( .A(n56), .B(n52), .Y(ab_2__4_) );
  NAND2XL U72 ( .A(n31), .B(n29), .Y(n28) );
  NAND2BXL U73 ( .AN(n27), .B(n26), .Y(n25) );
  NAND2XL U74 ( .A(n18), .B(A1_16_), .Y(n26) );
  NAND2XL U75 ( .A(n19), .B(A1_18_), .Y(n33) );
  OR2X2 U76 ( .A(n20), .B(A1_17_), .Y(n31) );
  AND2X1 U77 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(n18) );
  NOR2XL U78 ( .A(n11), .B(n51), .Y(ab_3__5_) );
  INVX2 U79 ( .A(B[0]), .Y(n60) );
  INVX1 U80 ( .A(n29), .Y(n38) );
  AND2X2 U81 ( .A(n24), .B(n15), .Y(PRODUCT_17_) );
  XOR2X1 U82 ( .A(CARRYB_15__5_), .B(ab_15__6_), .Y(A1_19_) );
  XOR2X1 U83 ( .A(CARRYB_15__1_), .B(SUMB_15__2_), .Y(A1_15_) );
  XOR2X1 U84 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(A1_17_) );
  XOR2X1 U85 ( .A(CARRYB_15__0_), .B(SUMB_15__1_), .Y(PRODUCT_16_) );
  AND2X2 U86 ( .A(CARRYB_15__3_), .B(SUMB_15__4_), .Y(n19) );
  AND2X2 U87 ( .A(CARRYB_15__2_), .B(SUMB_15__3_), .Y(n20) );
  AND2X2 U88 ( .A(SUMB_15__1_), .B(CARRYB_15__0_), .Y(n21) );
  AND2X2 U89 ( .A(CARRYB_15__4_), .B(SUMB_15__5_), .Y(n22) );
  XOR2X1 U90 ( .A(ab_1__3_), .B(ab_0__4_), .Y(SUMB_1__3_) );
  XOR2X1 U91 ( .A(ab_1__4_), .B(ab_0__5_), .Y(SUMB_1__4_) );
  INVX1 U92 ( .A(A[2]), .Y(n52) );
  INVX1 U93 ( .A(A[3]), .Y(n51) );
  INVX1 U94 ( .A(A[4]), .Y(n50) );
  INVX1 U95 ( .A(A[6]), .Y(n48) );
  INVX1 U96 ( .A(A[5]), .Y(n49) );
  INVX1 U97 ( .A(A[9]), .Y(n45) );
  INVX1 U98 ( .A(A[7]), .Y(n47) );
  INVX1 U99 ( .A(A[8]), .Y(n46) );
  INVX1 U100 ( .A(A[10]), .Y(n44) );
  INVX1 U101 ( .A(A[11]), .Y(n43) );
  INVX1 U102 ( .A(A[12]), .Y(n42) );
  INVX1 U103 ( .A(A[13]), .Y(n41) );
  INVX1 U104 ( .A(A[14]), .Y(n40) );
  INVX1 U105 ( .A(A[15]), .Y(n39) );
  OR2X1 U106 ( .A(n21), .B(A1_15_), .Y(n24) );
  NOR2X1 U107 ( .A(n18), .B(A1_16_), .Y(n27) );
  XOR2X1 U108 ( .A(n25), .B(n15), .Y(PRODUCT_18_) );
  NAND2X1 U109 ( .A(n20), .B(A1_17_), .Y(n29) );
  OAI21XL U110 ( .A0(n27), .A1(n15), .B0(n26), .Y(n30) );
  XNOR2X1 U111 ( .A(n28), .B(n30), .Y(PRODUCT_19_) );
  NAND2BX1 U112 ( .AN(n35), .B(n33), .Y(n32) );
  XOR2X1 U113 ( .A(n22), .B(A1_19_), .Y(n36) );
  XOR2X1 U114 ( .A(n37), .B(n36), .Y(PRODUCT_21_) );
  NOR2X1 U115 ( .A(n45), .B(n8), .Y(ab_9__6_) );
  NOR2X1 U116 ( .A(n45), .B(n11), .Y(ab_9__5_) );
  NOR2X1 U117 ( .A(n45), .B(n57), .Y(ab_9__3_) );
  NOR2X1 U118 ( .A(n45), .B(n12), .Y(ab_9__2_) );
  NOR2X1 U119 ( .A(n45), .B(n13), .Y(ab_9__1_) );
  NOR2X1 U120 ( .A(n45), .B(n60), .Y(ab_9__0_) );
  NOR2X1 U121 ( .A(n9), .B(n46), .Y(ab_8__6_) );
  NOR2X1 U122 ( .A(n57), .B(n46), .Y(ab_8__3_) );
  NOR2X1 U123 ( .A(n12), .B(n46), .Y(ab_8__2_) );
  NOR2X1 U124 ( .A(n13), .B(n46), .Y(ab_8__1_) );
  NOR2X1 U125 ( .A(n60), .B(n46), .Y(ab_8__0_) );
  NOR2X1 U126 ( .A(n8), .B(n47), .Y(ab_7__6_) );
  NOR2X1 U127 ( .A(n57), .B(n47), .Y(ab_7__3_) );
  NOR2X1 U128 ( .A(n12), .B(n47), .Y(ab_7__2_) );
  NOR2X1 U129 ( .A(n13), .B(n47), .Y(ab_7__1_) );
  NOR2X1 U130 ( .A(n60), .B(n47), .Y(ab_7__0_) );
  NOR2X1 U131 ( .A(n9), .B(n48), .Y(ab_6__6_) );
  NOR2X1 U132 ( .A(n57), .B(n48), .Y(ab_6__3_) );
  NOR2X1 U133 ( .A(n12), .B(n48), .Y(ab_6__2_) );
  NOR2X1 U134 ( .A(n13), .B(n48), .Y(ab_6__1_) );
  NOR2X1 U135 ( .A(n60), .B(n48), .Y(ab_6__0_) );
  NOR2X1 U136 ( .A(n8), .B(n49), .Y(ab_5__6_) );
  NOR2X1 U137 ( .A(n57), .B(n49), .Y(ab_5__3_) );
  NOR2X1 U138 ( .A(n13), .B(n49), .Y(ab_5__1_) );
  NOR2X1 U139 ( .A(n60), .B(n49), .Y(ab_5__0_) );
  NOR2X1 U140 ( .A(n9), .B(n50), .Y(ab_4__6_) );
  NOR2X1 U141 ( .A(n57), .B(n50), .Y(ab_4__3_) );
  NOR2X1 U142 ( .A(n13), .B(n50), .Y(ab_4__1_) );
  NOR2X1 U143 ( .A(n60), .B(n50), .Y(ab_4__0_) );
  NOR2X1 U144 ( .A(n8), .B(n51), .Y(ab_3__6_) );
  NOR2X1 U145 ( .A(n57), .B(n51), .Y(ab_3__3_) );
  NOR2X1 U146 ( .A(n60), .B(n51), .Y(ab_3__0_) );
  NOR2X1 U147 ( .A(n9), .B(n52), .Y(ab_2__6_) );
  NOR2X1 U148 ( .A(n11), .B(n52), .Y(ab_2__5_) );
  NOR2X1 U149 ( .A(n57), .B(n52), .Y(ab_2__3_) );
  NOR2X1 U150 ( .A(n59), .B(n52), .Y(ab_2__1_) );
  NOR2X1 U151 ( .A(n60), .B(n52), .Y(ab_2__0_) );
  NOR2X1 U152 ( .A(n8), .B(n39), .Y(ab_15__6_) );
  NOR2X1 U153 ( .A(n11), .B(n39), .Y(ab_15__5_) );
  NOR2X1 U154 ( .A(n57), .B(n39), .Y(ab_15__3_) );
  NOR2X1 U155 ( .A(n12), .B(n39), .Y(ab_15__2_) );
  NOR2X1 U156 ( .A(n13), .B(n39), .Y(ab_15__1_) );
  NOR2X1 U157 ( .A(n60), .B(n39), .Y(ab_15__0_) );
  NOR2X1 U158 ( .A(n9), .B(n40), .Y(ab_14__6_) );
  NOR2X1 U159 ( .A(n57), .B(n40), .Y(ab_14__3_) );
  NOR2X1 U160 ( .A(n12), .B(n40), .Y(ab_14__2_) );
  NOR2X1 U161 ( .A(n13), .B(n40), .Y(ab_14__1_) );
  NOR2X1 U162 ( .A(n60), .B(n40), .Y(ab_14__0_) );
  NOR2X1 U163 ( .A(n8), .B(n41), .Y(ab_13__6_) );
  NOR2X1 U164 ( .A(n57), .B(n41), .Y(ab_13__3_) );
  NOR2X1 U165 ( .A(n12), .B(n41), .Y(ab_13__2_) );
  NOR2X1 U166 ( .A(n13), .B(n41), .Y(ab_13__1_) );
  NOR2X1 U167 ( .A(n60), .B(n41), .Y(ab_13__0_) );
  NOR2X1 U168 ( .A(n9), .B(n42), .Y(ab_12__6_) );
  NOR2X1 U169 ( .A(n57), .B(n42), .Y(ab_12__3_) );
  NOR2X1 U170 ( .A(n12), .B(n42), .Y(ab_12__2_) );
  NOR2X1 U171 ( .A(n13), .B(n42), .Y(ab_12__1_) );
  NOR2X1 U172 ( .A(n60), .B(n42), .Y(ab_12__0_) );
  NOR2X1 U173 ( .A(n8), .B(n43), .Y(ab_11__6_) );
  NOR2X1 U174 ( .A(n11), .B(n43), .Y(ab_11__5_) );
  NOR2X1 U175 ( .A(n57), .B(n43), .Y(ab_11__3_) );
  NOR2X1 U176 ( .A(n12), .B(n43), .Y(ab_11__2_) );
  NOR2X1 U177 ( .A(n13), .B(n43), .Y(ab_11__1_) );
  NOR2X1 U178 ( .A(n60), .B(n43), .Y(ab_11__0_) );
  NOR2X1 U179 ( .A(n9), .B(n44), .Y(ab_10__6_) );
  NOR2X1 U180 ( .A(n57), .B(n44), .Y(ab_10__3_) );
  NOR2X1 U181 ( .A(n12), .B(n44), .Y(ab_10__2_) );
  NOR2X1 U182 ( .A(n13), .B(n44), .Y(ab_10__1_) );
  NOR2X1 U183 ( .A(n60), .B(n44), .Y(ab_10__0_) );
  NOR2X1 U184 ( .A(n57), .B(n54), .Y(ab_0__3_) );
  AND3X1 U185 ( .A(ab_1__1_), .B(B[0]), .C(A[0]), .Y(CARRYB_1__0_) );
endmodule


module multi16_0 ( clk, rst_n, in_17bit, in_8bit, out );
  input [16:0] in_17bit;
  input [7:0] in_8bit;
  output [16:0] out;
  input clk, rst_n;
  wire   N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N39, N40, N41, N42, N43, N44, flag, N52, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N71, N72, N73, N74,
         N75, N76, N77, N78, N79, N80, N81, N82, N83, N84, N85, N86, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163;
  wire   [16:0] in_17bit_b;
  wire   [7:0] in_8bit_b;
  wire   [21:6] sum;
  wire   [23:8] sum_b;
  wire   [15:2] sub_add_97_b0_carry;
  wire   [6:2] sub_add_61_b0_carry;
  wire   [15:2] sub_add_52_b0_carry;
  tri   clk;
  tri   rst_n;

  multi16_0_DW02_mult_0 mult_79 ( .A(in_17bit_b[15:0]), .B(in_8bit_b[6:0]), 
        .PRODUCT_21_(N69), .PRODUCT_20_(N68), .PRODUCT_19_(N67), .PRODUCT_18_(
        N66), .PRODUCT_17_(N65), .PRODUCT_16_(N64), .PRODUCT_15_(N63), 
        .PRODUCT_14_(N62), .PRODUCT_13_(N61), .PRODUCT_12_(N60), .PRODUCT_11_(
        N59), .PRODUCT_10_(N58), .PRODUCT_9_(N57), .PRODUCT_8_(N56), 
        .PRODUCT_7_(N55), .PRODUCT_6_(N54) );
  DFFRHQX1 in_8bit_b_reg_7_ ( .D(n1), .CK(clk), .RN(rst_n), .Q(in_8bit_b[7])
         );
  DFFRHQX1 in_17bit_b_reg_16_ ( .D(n2), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[16]) );
  DFFRHQX1 sum_b_reg_23_ ( .D(flag), .CK(clk), .RN(rst_n), .Q(sum_b[23]) );
  DFFRHQX1 sum_b_reg_22_ ( .D(sum[21]), .CK(clk), .RN(rst_n), .Q(sum_b[22]) );
  DFFRHQX1 out_reg_16_ ( .D(n3), .CK(clk), .RN(rst_n), .Q(out[16]) );
  DFFRHQX1 out_reg_15_ ( .D(n103), .CK(clk), .RN(rst_n), .Q(out[15]) );
  DFFRHQX1 sum_b_reg_21_ ( .D(sum[20]), .CK(clk), .RN(rst_n), .Q(sum_b[21]) );
  DFFRHQX1 sum_b_reg_20_ ( .D(sum[19]), .CK(clk), .RN(rst_n), .Q(sum_b[20]) );
  DFFRHQX1 sum_b_reg_19_ ( .D(sum[18]), .CK(clk), .RN(rst_n), .Q(sum_b[19]) );
  DFFRHQX1 sum_b_reg_18_ ( .D(sum[17]), .CK(clk), .RN(rst_n), .Q(sum_b[18]) );
  DFFRHQX1 sum_b_reg_17_ ( .D(sum[16]), .CK(clk), .RN(rst_n), .Q(sum_b[17]) );
  DFFRHQX1 out_reg_14_ ( .D(n104), .CK(clk), .RN(rst_n), .Q(out[14]) );
  DFFRHQX1 out_reg_13_ ( .D(n105), .CK(clk), .RN(rst_n), .Q(out[13]) );
  DFFRHQX1 out_reg_12_ ( .D(n106), .CK(clk), .RN(rst_n), .Q(out[12]) );
  DFFRHQX1 out_reg_11_ ( .D(n107), .CK(clk), .RN(rst_n), .Q(out[11]) );
  DFFRHQX1 in_17bit_b_reg_15_ ( .D(n43), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[15]) );
  DFFRHQX1 in_17bit_b_reg_14_ ( .D(n44), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[14]) );
  DFFRHQX1 in_17bit_b_reg_13_ ( .D(n45), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[13]) );
  DFFRHQX1 sum_b_reg_16_ ( .D(sum[15]), .CK(clk), .RN(rst_n), .Q(sum_b[16]) );
  DFFRHQX1 sum_b_reg_15_ ( .D(sum[14]), .CK(clk), .RN(rst_n), .Q(sum_b[15]) );
  DFFRHQX1 sum_b_reg_14_ ( .D(sum[13]), .CK(clk), .RN(rst_n), .Q(sum_b[14]) );
  DFFRHQX1 sum_b_reg_13_ ( .D(sum[12]), .CK(clk), .RN(rst_n), .Q(sum_b[13]) );
  DFFRHQX1 out_reg_10_ ( .D(n108), .CK(clk), .RN(rst_n), .Q(out[10]) );
  DFFRHQX1 out_reg_9_ ( .D(n109), .CK(clk), .RN(rst_n), .Q(out[9]) );
  DFFRHQX1 out_reg_8_ ( .D(n110), .CK(clk), .RN(rst_n), .Q(out[8]) );
  DFFRHQX1 out_reg_7_ ( .D(n111), .CK(clk), .RN(rst_n), .Q(out[7]) );
  DFFRHQX1 in_17bit_b_reg_12_ ( .D(n46), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[12]) );
  DFFRHQX1 in_17bit_b_reg_11_ ( .D(n47), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[11]) );
  DFFRHQX1 in_17bit_b_reg_10_ ( .D(n48), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[10]) );
  DFFRHQX1 sum_b_reg_12_ ( .D(sum[11]), .CK(clk), .RN(rst_n), .Q(sum_b[12]) );
  DFFRHQX1 sum_b_reg_11_ ( .D(sum[10]), .CK(clk), .RN(rst_n), .Q(sum_b[11]) );
  DFFRHQX1 sum_b_reg_10_ ( .D(sum[9]), .CK(clk), .RN(rst_n), .Q(sum_b[10]) );
  DFFRHQX1 sum_b_reg_9_ ( .D(sum[8]), .CK(clk), .RN(rst_n), .Q(sum_b[9]) );
  DFFRHQX1 sum_b_reg_8_ ( .D(sum[7]), .CK(clk), .RN(rst_n), .Q(sum_b[8]) );
  DFFRHQX1 sum_b_reg_7_ ( .D(sum[6]), .CK(clk), .RN(rst_n), .Q(N71) );
  DFFRHQX1 out_reg_6_ ( .D(n112), .CK(clk), .RN(rst_n), .Q(out[6]) );
  DFFRHQX1 out_reg_5_ ( .D(n113), .CK(clk), .RN(rst_n), .Q(out[5]) );
  DFFRHQX1 out_reg_4_ ( .D(n114), .CK(clk), .RN(rst_n), .Q(out[4]) );
  DFFRHQX1 out_reg_3_ ( .D(n115), .CK(clk), .RN(rst_n), .Q(out[3]) );
  DFFRHQX1 out_reg_2_ ( .D(n116), .CK(clk), .RN(rst_n), .Q(out[2]) );
  DFFRHQX1 in_17bit_b_reg_9_ ( .D(n49), .CK(clk), .RN(rst_n), .Q(in_17bit_b[9]) );
  DFFRHQX1 in_17bit_b_reg_8_ ( .D(n89), .CK(clk), .RN(rst_n), .Q(in_17bit_b[8]) );
  DFFRHQX1 in_17bit_b_reg_7_ ( .D(n90), .CK(clk), .RN(rst_n), .Q(in_17bit_b[7]) );
  DFFRHQX1 out_reg_1_ ( .D(n117), .CK(clk), .RN(rst_n), .Q(out[1]) );
  DFFRHQX1 in_17bit_b_reg_6_ ( .D(n91), .CK(clk), .RN(rst_n), .Q(in_17bit_b[6]) );
  DFFRHQX1 in_17bit_b_reg_5_ ( .D(n92), .CK(clk), .RN(rst_n), .Q(in_17bit_b[5]) );
  DFFRHQX1 in_17bit_b_reg_4_ ( .D(n93), .CK(clk), .RN(rst_n), .Q(in_17bit_b[4]) );
  DFFRHQX1 out_reg_0_ ( .D(n120), .CK(clk), .RN(rst_n), .Q(out[0]) );
  DFFRHQX1 in_17bit_b_reg_3_ ( .D(n94), .CK(clk), .RN(rst_n), .Q(in_17bit_b[3]) );
  DFFRHQX1 in_17bit_b_reg_2_ ( .D(n95), .CK(clk), .RN(rst_n), .Q(in_17bit_b[2]) );
  DFFRHQX1 in_8bit_b_reg_0_ ( .D(n118), .CK(clk), .RN(rst_n), .Q(in_8bit_b[0])
         );
  DFFRHQX1 in_8bit_b_reg_6_ ( .D(n97), .CK(clk), .RN(rst_n), .Q(in_8bit_b[6])
         );
  DFFRHQX1 in_8bit_b_reg_5_ ( .D(n98), .CK(clk), .RN(rst_n), .Q(in_8bit_b[5])
         );
  DFFRHQX1 flag_reg ( .D(N52), .CK(clk), .RN(rst_n), .Q(flag) );
  DFFRHQX1 sum_reg_15_ ( .D(N63), .CK(clk), .RN(rst_n), .Q(sum[15]) );
  DFFRHQX1 sum_reg_14_ ( .D(N62), .CK(clk), .RN(rst_n), .Q(sum[14]) );
  DFFRHQX1 sum_reg_13_ ( .D(N61), .CK(clk), .RN(rst_n), .Q(sum[13]) );
  DFFRHQX1 sum_reg_12_ ( .D(N60), .CK(clk), .RN(rst_n), .Q(sum[12]) );
  DFFRHQX1 sum_reg_11_ ( .D(N59), .CK(clk), .RN(rst_n), .Q(sum[11]) );
  DFFRHQX1 sum_reg_10_ ( .D(N58), .CK(clk), .RN(rst_n), .Q(sum[10]) );
  DFFRHQX1 sum_reg_9_ ( .D(N57), .CK(clk), .RN(rst_n), .Q(sum[9]) );
  DFFRHQX1 sum_reg_8_ ( .D(N56), .CK(clk), .RN(rst_n), .Q(sum[8]) );
  DFFRHQX1 sum_reg_7_ ( .D(N55), .CK(clk), .RN(rst_n), .Q(sum[7]) );
  DFFRHQX1 sum_reg_6_ ( .D(N54), .CK(clk), .RN(rst_n), .Q(sum[6]) );
  DFFRHQX1 sum_reg_20_ ( .D(N68), .CK(clk), .RN(rst_n), .Q(sum[20]) );
  DFFRHQXL sum_reg_21_ ( .D(N69), .CK(clk), .RN(rst_n), .Q(sum[21]) );
  DFFRHQXL sum_reg_16_ ( .D(N64), .CK(clk), .RN(rst_n), .Q(sum[16]) );
  DFFRHQXL sum_reg_17_ ( .D(N65), .CK(clk), .RN(rst_n), .Q(sum[17]) );
  DFFRHQXL sum_reg_19_ ( .D(N67), .CK(clk), .RN(rst_n), .Q(sum[19]) );
  DFFRHQXL sum_reg_18_ ( .D(N66), .CK(clk), .RN(rst_n), .Q(sum[18]) );
  DFFRHQX4 in_8bit_b_reg_3_ ( .D(n100), .CK(clk), .RN(rst_n), .Q(in_8bit_b[3])
         );
  DFFRHQX4 in_17bit_b_reg_0_ ( .D(n122), .CK(clk), .RN(rst_n), .Q(
        in_17bit_b[0]) );
  DFFRHQX4 in_8bit_b_reg_2_ ( .D(n101), .CK(clk), .RN(rst_n), .Q(in_8bit_b[2])
         );
  DFFRHQX4 in_8bit_b_reg_1_ ( .D(n102), .CK(clk), .RN(rst_n), .Q(in_8bit_b[1])
         );
  DFFRHQX4 in_17bit_b_reg_1_ ( .D(n96), .CK(clk), .RN(rst_n), .Q(in_17bit_b[1]) );
  DFFRHQX2 in_8bit_b_reg_4_ ( .D(n99), .CK(clk), .RN(rst_n), .Q(in_8bit_b[4])
         );
  INVX1 U3 ( .A(n2), .Y(n123) );
  INVX1 U4 ( .A(in_17bit[0]), .Y(n4) );
  INVX1 U5 ( .A(n143), .Y(n43) );
  AOI22X1 U6 ( .A0(n2), .A1(N20), .B0(in_17bit[15]), .B1(n123), .Y(n143) );
  INVX1 U7 ( .A(in_17bit[15]), .Y(n19) );
  INVX1 U8 ( .A(n140), .Y(n46) );
  AOI22X1 U9 ( .A0(N17), .A1(n2), .B0(in_17bit[12]), .B1(n123), .Y(n140) );
  INVX1 U10 ( .A(n141), .Y(n45) );
  AOI22X1 U11 ( .A0(N18), .A1(n2), .B0(in_17bit[13]), .B1(n123), .Y(n141) );
  INVX1 U12 ( .A(n142), .Y(n44) );
  AOI22X1 U13 ( .A0(N19), .A1(n2), .B0(in_17bit[14]), .B1(n123), .Y(n142) );
  INVX1 U14 ( .A(in_17bit[1]), .Y(n5) );
  INVX1 U15 ( .A(in_17bit[2]), .Y(n6) );
  INVX1 U16 ( .A(in_17bit[3]), .Y(n7) );
  INVX1 U17 ( .A(in_17bit[4]), .Y(n8) );
  INVX1 U18 ( .A(n135), .Y(n90) );
  AOI22X1 U19 ( .A0(N12), .A1(n2), .B0(in_17bit[7]), .B1(n123), .Y(n135) );
  INVX1 U20 ( .A(n136), .Y(n89) );
  AOI22X1 U21 ( .A0(N13), .A1(n2), .B0(in_17bit[8]), .B1(n123), .Y(n136) );
  INVX1 U22 ( .A(n137), .Y(n49) );
  AOI22X1 U23 ( .A0(N14), .A1(n2), .B0(in_17bit[9]), .B1(n123), .Y(n137) );
  INVX1 U24 ( .A(n138), .Y(n48) );
  AOI22X1 U25 ( .A0(N15), .A1(n2), .B0(in_17bit[10]), .B1(n123), .Y(n138) );
  INVX1 U26 ( .A(n139), .Y(n47) );
  AOI22X1 U27 ( .A0(N16), .A1(n2), .B0(in_17bit[11]), .B1(n123), .Y(n139) );
  INVX1 U28 ( .A(in_17bit[5]), .Y(n9) );
  INVX1 U29 ( .A(in_17bit[6]), .Y(n10) );
  INVX1 U30 ( .A(in_17bit[7]), .Y(n11) );
  INVX1 U31 ( .A(in_17bit[8]), .Y(n12) );
  INVX1 U32 ( .A(n131), .Y(n94) );
  AOI22X1 U33 ( .A0(N8), .A1(n2), .B0(in_17bit[3]), .B1(n123), .Y(n131) );
  INVX1 U34 ( .A(n132), .Y(n93) );
  AOI22X1 U35 ( .A0(N9), .A1(n2), .B0(in_17bit[4]), .B1(n123), .Y(n132) );
  INVX1 U36 ( .A(n133), .Y(n92) );
  AOI22X1 U37 ( .A0(N10), .A1(n2), .B0(in_17bit[5]), .B1(n123), .Y(n133) );
  INVX1 U38 ( .A(n134), .Y(n91) );
  AOI22X1 U39 ( .A0(N11), .A1(n2), .B0(in_17bit[6]), .B1(n123), .Y(n134) );
  INVX1 U40 ( .A(in_17bit[9]), .Y(n13) );
  INVX1 U41 ( .A(in_17bit[10]), .Y(n14) );
  INVX1 U42 ( .A(in_17bit[11]), .Y(n15) );
  INVX1 U43 ( .A(in_17bit[12]), .Y(n16) );
  INVX1 U44 ( .A(in_17bit[13]), .Y(n17) );
  INVX1 U45 ( .A(n129), .Y(n96) );
  AOI22X1 U46 ( .A0(N6), .A1(n2), .B0(in_17bit[1]), .B1(n123), .Y(n129) );
  INVX1 U47 ( .A(n130), .Y(n95) );
  AOI22X1 U48 ( .A0(N7), .A1(n2), .B0(in_17bit[2]), .B1(n123), .Y(n130) );
  INVX1 U49 ( .A(n1), .Y(n119) );
  BUFX3 U50 ( .A(in_17bit[16]), .Y(n2) );
  INVX1 U51 ( .A(in_8bit[0]), .Y(n20) );
  INVX1 U52 ( .A(n144), .Y(n118) );
  AOI22X1 U53 ( .A0(in_8bit[0]), .A1(n1), .B0(in_8bit[0]), .B1(n119), .Y(n144)
         );
  INVX1 U54 ( .A(n145), .Y(n102) );
  AOI22X1 U55 ( .A0(N39), .A1(n1), .B0(in_8bit[1]), .B1(n119), .Y(n145) );
  INVX1 U56 ( .A(n146), .Y(n101) );
  AOI22X1 U57 ( .A0(N40), .A1(n1), .B0(in_8bit[2]), .B1(n119), .Y(n146) );
  INVX1 U58 ( .A(n147), .Y(n100) );
  AOI22X1 U59 ( .A0(N41), .A1(n1), .B0(in_8bit[3]), .B1(n119), .Y(n147) );
  INVX1 U60 ( .A(n148), .Y(n99) );
  AOI22X1 U61 ( .A0(N42), .A1(n1), .B0(in_8bit[4]), .B1(n119), .Y(n148) );
  INVX1 U62 ( .A(n149), .Y(n98) );
  AOI22X1 U63 ( .A0(N43), .A1(n1), .B0(in_8bit[5]), .B1(n119), .Y(n149) );
  INVX1 U64 ( .A(n150), .Y(n97) );
  AOI22X1 U65 ( .A0(n1), .A1(N44), .B0(in_8bit[6]), .B1(n119), .Y(n150) );
  INVX1 U66 ( .A(in_8bit[6]), .Y(n26) );
  INVX1 U67 ( .A(n128), .Y(n122) );
  AOI22X1 U68 ( .A0(in_17bit[0]), .A1(n2), .B0(in_17bit[0]), .B1(n123), .Y(
        n128) );
  INVX1 U69 ( .A(in_8bit[1]), .Y(n21) );
  INVX1 U70 ( .A(in_8bit[2]), .Y(n22) );
  INVX1 U71 ( .A(in_8bit[3]), .Y(n23) );
  INVX1 U72 ( .A(in_8bit[4]), .Y(n24) );
  INVX1 U73 ( .A(in_8bit[5]), .Y(n25) );
  INVX1 U74 ( .A(in_17bit[14]), .Y(n18) );
  INVX1 U75 ( .A(n3), .Y(n121) );
  INVX1 U76 ( .A(n162), .Y(n107) );
  AOI22X1 U77 ( .A0(N82), .A1(n3), .B0(sum_b[18]), .B1(n121), .Y(n162) );
  INVX1 U78 ( .A(n125), .Y(n105) );
  AOI22X1 U79 ( .A0(N84), .A1(n3), .B0(sum_b[20]), .B1(n121), .Y(n125) );
  INVX1 U80 ( .A(n163), .Y(n106) );
  AOI22X1 U81 ( .A0(n3), .A1(N83), .B0(sum_b[19]), .B1(n121), .Y(n163) );
  INVX1 U82 ( .A(N71), .Y(n27) );
  INVX1 U83 ( .A(sum_b[8]), .Y(n28) );
  INVX1 U84 ( .A(sum_b[9]), .Y(n29) );
  INVX1 U85 ( .A(sum_b[10]), .Y(n30) );
  INVX1 U86 ( .A(sum_b[11]), .Y(n31) );
  INVX1 U87 ( .A(sum_b[12]), .Y(n32) );
  INVX1 U88 ( .A(n126), .Y(n104) );
  AOI22X1 U89 ( .A0(N85), .A1(n3), .B0(sum_b[21]), .B1(n121), .Y(n126) );
  INVX1 U90 ( .A(n127), .Y(n103) );
  AOI22X1 U91 ( .A0(N86), .A1(n3), .B0(sum_b[22]), .B1(n121), .Y(n127) );
  INVX1 U92 ( .A(sum_b[22]), .Y(n42) );
  INVX1 U93 ( .A(n158), .Y(n111) );
  AOI22X1 U94 ( .A0(N78), .A1(n3), .B0(sum_b[14]), .B1(n121), .Y(n158) );
  INVX1 U95 ( .A(n159), .Y(n110) );
  AOI22X1 U96 ( .A0(N79), .A1(n3), .B0(sum_b[15]), .B1(n121), .Y(n159) );
  INVX1 U97 ( .A(n160), .Y(n109) );
  AOI22X1 U98 ( .A0(N80), .A1(n3), .B0(sum_b[16]), .B1(n121), .Y(n160) );
  INVX1 U99 ( .A(n161), .Y(n108) );
  AOI22X1 U100 ( .A0(N81), .A1(n3), .B0(sum_b[17]), .B1(n121), .Y(n161) );
  BUFX3 U101 ( .A(in_8bit[7]), .Y(n1) );
  INVX1 U102 ( .A(sum_b[13]), .Y(n33) );
  INVX1 U103 ( .A(sum_b[14]), .Y(n34) );
  INVX1 U104 ( .A(sum_b[15]), .Y(n35) );
  INVX1 U105 ( .A(sum_b[16]), .Y(n36) );
  INVX1 U106 ( .A(n153), .Y(n116) );
  AOI22X1 U107 ( .A0(N73), .A1(n3), .B0(sum_b[9]), .B1(n121), .Y(n153) );
  INVX1 U108 ( .A(n154), .Y(n115) );
  AOI22X1 U109 ( .A0(N74), .A1(n3), .B0(sum_b[10]), .B1(n121), .Y(n154) );
  INVX1 U110 ( .A(n155), .Y(n114) );
  AOI22X1 U111 ( .A0(N75), .A1(n3), .B0(sum_b[11]), .B1(n121), .Y(n155) );
  INVX1 U112 ( .A(n156), .Y(n113) );
  AOI22X1 U113 ( .A0(N76), .A1(n3), .B0(sum_b[12]), .B1(n121), .Y(n156) );
  INVX1 U114 ( .A(n157), .Y(n112) );
  AOI22X1 U115 ( .A0(N77), .A1(n3), .B0(sum_b[13]), .B1(n121), .Y(n157) );
  INVX1 U116 ( .A(sum_b[17]), .Y(n37) );
  INVX1 U117 ( .A(sum_b[18]), .Y(n38) );
  INVX1 U118 ( .A(sum_b[19]), .Y(n39) );
  INVX1 U119 ( .A(sum_b[20]), .Y(n40) );
  INVX1 U120 ( .A(sum_b[21]), .Y(n41) );
  BUFX3 U121 ( .A(sum_b[23]), .Y(n3) );
  INVX1 U122 ( .A(n151), .Y(n120) );
  AOI22X1 U123 ( .A0(N71), .A1(n3), .B0(N71), .B1(n121), .Y(n151) );
  INVX1 U124 ( .A(n152), .Y(n117) );
  AOI22X1 U125 ( .A0(N72), .A1(n3), .B0(sum_b[8]), .B1(n121), .Y(n152) );
  XOR2X1 U126 ( .A(in_8bit_b[7]), .B(in_17bit_b[16]), .Y(N52) );
  XOR2X1 U127 ( .A(n42), .B(sub_add_97_b0_carry[15]), .Y(N86) );
  AND2X1 U128 ( .A(sub_add_97_b0_carry[14]), .B(n41), .Y(
        sub_add_97_b0_carry[15]) );
  XOR2X1 U129 ( .A(n41), .B(sub_add_97_b0_carry[14]), .Y(N85) );
  AND2X1 U130 ( .A(sub_add_97_b0_carry[13]), .B(n40), .Y(
        sub_add_97_b0_carry[14]) );
  XOR2X1 U131 ( .A(n40), .B(sub_add_97_b0_carry[13]), .Y(N84) );
  AND2X1 U132 ( .A(sub_add_97_b0_carry[12]), .B(n39), .Y(
        sub_add_97_b0_carry[13]) );
  XOR2X1 U133 ( .A(n39), .B(sub_add_97_b0_carry[12]), .Y(N83) );
  AND2X1 U134 ( .A(sub_add_97_b0_carry[11]), .B(n38), .Y(
        sub_add_97_b0_carry[12]) );
  XOR2X1 U135 ( .A(n38), .B(sub_add_97_b0_carry[11]), .Y(N82) );
  AND2X1 U136 ( .A(sub_add_97_b0_carry[10]), .B(n37), .Y(
        sub_add_97_b0_carry[11]) );
  XOR2X1 U137 ( .A(n37), .B(sub_add_97_b0_carry[10]), .Y(N81) );
  AND2X1 U138 ( .A(sub_add_97_b0_carry[9]), .B(n36), .Y(
        sub_add_97_b0_carry[10]) );
  XOR2X1 U139 ( .A(n36), .B(sub_add_97_b0_carry[9]), .Y(N80) );
  AND2X1 U140 ( .A(sub_add_97_b0_carry[8]), .B(n35), .Y(sub_add_97_b0_carry[9]) );
  XOR2X1 U141 ( .A(n35), .B(sub_add_97_b0_carry[8]), .Y(N79) );
  AND2X1 U142 ( .A(sub_add_97_b0_carry[7]), .B(n34), .Y(sub_add_97_b0_carry[8]) );
  XOR2X1 U143 ( .A(n34), .B(sub_add_97_b0_carry[7]), .Y(N78) );
  AND2X1 U144 ( .A(sub_add_97_b0_carry[6]), .B(n33), .Y(sub_add_97_b0_carry[7]) );
  XOR2X1 U145 ( .A(n33), .B(sub_add_97_b0_carry[6]), .Y(N77) );
  AND2X1 U146 ( .A(sub_add_97_b0_carry[5]), .B(n32), .Y(sub_add_97_b0_carry[6]) );
  XOR2X1 U147 ( .A(n32), .B(sub_add_97_b0_carry[5]), .Y(N76) );
  AND2X1 U148 ( .A(sub_add_97_b0_carry[4]), .B(n31), .Y(sub_add_97_b0_carry[5]) );
  XOR2X1 U149 ( .A(n31), .B(sub_add_97_b0_carry[4]), .Y(N75) );
  AND2X1 U150 ( .A(sub_add_97_b0_carry[3]), .B(n30), .Y(sub_add_97_b0_carry[4]) );
  XOR2X1 U151 ( .A(n30), .B(sub_add_97_b0_carry[3]), .Y(N74) );
  AND2X1 U152 ( .A(sub_add_97_b0_carry[2]), .B(n29), .Y(sub_add_97_b0_carry[3]) );
  XOR2X1 U153 ( .A(n29), .B(sub_add_97_b0_carry[2]), .Y(N73) );
  AND2X1 U154 ( .A(n27), .B(n28), .Y(sub_add_97_b0_carry[2]) );
  XOR2X1 U155 ( .A(n28), .B(n27), .Y(N72) );
  XOR2X1 U156 ( .A(n26), .B(sub_add_61_b0_carry[6]), .Y(N44) );
  AND2X1 U157 ( .A(sub_add_61_b0_carry[5]), .B(n25), .Y(sub_add_61_b0_carry[6]) );
  XOR2X1 U158 ( .A(n25), .B(sub_add_61_b0_carry[5]), .Y(N43) );
  AND2X1 U159 ( .A(sub_add_61_b0_carry[4]), .B(n24), .Y(sub_add_61_b0_carry[5]) );
  XOR2X1 U160 ( .A(n24), .B(sub_add_61_b0_carry[4]), .Y(N42) );
  AND2X1 U161 ( .A(sub_add_61_b0_carry[3]), .B(n23), .Y(sub_add_61_b0_carry[4]) );
  XOR2X1 U162 ( .A(n23), .B(sub_add_61_b0_carry[3]), .Y(N41) );
  AND2X1 U163 ( .A(sub_add_61_b0_carry[2]), .B(n22), .Y(sub_add_61_b0_carry[3]) );
  XOR2X1 U164 ( .A(n22), .B(sub_add_61_b0_carry[2]), .Y(N40) );
  AND2X1 U165 ( .A(n20), .B(n21), .Y(sub_add_61_b0_carry[2]) );
  XOR2X1 U166 ( .A(n21), .B(n20), .Y(N39) );
  XOR2X1 U167 ( .A(n19), .B(sub_add_52_b0_carry[15]), .Y(N20) );
  AND2X1 U168 ( .A(sub_add_52_b0_carry[14]), .B(n18), .Y(
        sub_add_52_b0_carry[15]) );
  XOR2X1 U169 ( .A(n18), .B(sub_add_52_b0_carry[14]), .Y(N19) );
  AND2X1 U170 ( .A(sub_add_52_b0_carry[13]), .B(n17), .Y(
        sub_add_52_b0_carry[14]) );
  XOR2X1 U171 ( .A(n17), .B(sub_add_52_b0_carry[13]), .Y(N18) );
  AND2X1 U172 ( .A(sub_add_52_b0_carry[12]), .B(n16), .Y(
        sub_add_52_b0_carry[13]) );
  XOR2X1 U173 ( .A(n16), .B(sub_add_52_b0_carry[12]), .Y(N17) );
  AND2X1 U174 ( .A(sub_add_52_b0_carry[11]), .B(n15), .Y(
        sub_add_52_b0_carry[12]) );
  XOR2X1 U175 ( .A(n15), .B(sub_add_52_b0_carry[11]), .Y(N16) );
  AND2X1 U176 ( .A(sub_add_52_b0_carry[10]), .B(n14), .Y(
        sub_add_52_b0_carry[11]) );
  XOR2X1 U177 ( .A(n14), .B(sub_add_52_b0_carry[10]), .Y(N15) );
  AND2X1 U178 ( .A(sub_add_52_b0_carry[9]), .B(n13), .Y(
        sub_add_52_b0_carry[10]) );
  XOR2X1 U179 ( .A(n13), .B(sub_add_52_b0_carry[9]), .Y(N14) );
  AND2X1 U180 ( .A(sub_add_52_b0_carry[8]), .B(n12), .Y(sub_add_52_b0_carry[9]) );
  XOR2X1 U181 ( .A(n12), .B(sub_add_52_b0_carry[8]), .Y(N13) );
  AND2X1 U182 ( .A(sub_add_52_b0_carry[7]), .B(n11), .Y(sub_add_52_b0_carry[8]) );
  XOR2X1 U183 ( .A(n11), .B(sub_add_52_b0_carry[7]), .Y(N12) );
  AND2X1 U184 ( .A(sub_add_52_b0_carry[6]), .B(n10), .Y(sub_add_52_b0_carry[7]) );
  XOR2X1 U185 ( .A(n10), .B(sub_add_52_b0_carry[6]), .Y(N11) );
  AND2X1 U186 ( .A(sub_add_52_b0_carry[5]), .B(n9), .Y(sub_add_52_b0_carry[6])
         );
  XOR2X1 U187 ( .A(n9), .B(sub_add_52_b0_carry[5]), .Y(N10) );
  AND2X1 U188 ( .A(sub_add_52_b0_carry[4]), .B(n8), .Y(sub_add_52_b0_carry[5])
         );
  XOR2X1 U189 ( .A(n8), .B(sub_add_52_b0_carry[4]), .Y(N9) );
  AND2X1 U190 ( .A(sub_add_52_b0_carry[3]), .B(n7), .Y(sub_add_52_b0_carry[4])
         );
  XOR2X1 U191 ( .A(n7), .B(sub_add_52_b0_carry[3]), .Y(N8) );
  AND2X1 U192 ( .A(sub_add_52_b0_carry[2]), .B(n6), .Y(sub_add_52_b0_carry[3])
         );
  XOR2X1 U193 ( .A(n6), .B(sub_add_52_b0_carry[2]), .Y(N7) );
  AND2X1 U194 ( .A(n4), .B(n5), .Y(sub_add_52_b0_carry[2]) );
  XOR2X1 U195 ( .A(n5), .B(n4), .Y(N6) );
endmodule


module butterfly_DW01_sub_0 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  INVX1 U1 ( .A(A[0]), .Y(n1) );
  INVX1 U2 ( .A(B[2]), .Y(n16) );
  INVX1 U3 ( .A(B[3]), .Y(n15) );
  INVX1 U4 ( .A(B[4]), .Y(n14) );
  INVX1 U5 ( .A(B[5]), .Y(n13) );
  INVX1 U6 ( .A(B[6]), .Y(n12) );
  INVX1 U7 ( .A(B[7]), .Y(n11) );
  INVX1 U8 ( .A(B[8]), .Y(n10) );
  INVX1 U9 ( .A(B[9]), .Y(n9) );
  INVX1 U10 ( .A(B[10]), .Y(n8) );
  INVX1 U11 ( .A(B[11]), .Y(n7) );
  INVX1 U12 ( .A(B[12]), .Y(n6) );
  INVX1 U13 ( .A(B[13]), .Y(n5) );
  INVX1 U14 ( .A(B[14]), .Y(n4) );
  INVX1 U15 ( .A(B[15]), .Y(n3) );
  INVX1 U16 ( .A(B[1]), .Y(n17) );
  NAND2X1 U17 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U18 ( .A(B[16]), .Y(n2) );
  INVX1 U19 ( .A(B[0]), .Y(n18) );
  XNOR2X1 U20 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
endmodule


module butterfly_DW01_add_0 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_add_1 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_sub_1 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  INVX1 U1 ( .A(A[0]), .Y(n1) );
  INVX1 U2 ( .A(B[2]), .Y(n16) );
  INVX1 U3 ( .A(B[3]), .Y(n15) );
  INVX1 U4 ( .A(B[4]), .Y(n14) );
  INVX1 U5 ( .A(B[5]), .Y(n13) );
  INVX1 U6 ( .A(B[6]), .Y(n12) );
  INVX1 U7 ( .A(B[7]), .Y(n11) );
  INVX1 U8 ( .A(B[8]), .Y(n10) );
  INVX1 U9 ( .A(B[9]), .Y(n9) );
  INVX1 U10 ( .A(B[10]), .Y(n8) );
  INVX1 U11 ( .A(B[11]), .Y(n7) );
  INVX1 U12 ( .A(B[12]), .Y(n6) );
  INVX1 U13 ( .A(B[13]), .Y(n5) );
  INVX1 U14 ( .A(B[14]), .Y(n4) );
  INVX1 U15 ( .A(B[15]), .Y(n3) );
  INVX1 U16 ( .A(B[1]), .Y(n17) );
  NAND2X1 U17 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U18 ( .A(B[16]), .Y(n2) );
  INVX1 U19 ( .A(B[0]), .Y(n18) );
  XNOR2X1 U20 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
endmodule


module butterfly_DW01_sub_2 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  INVX1 U1 ( .A(A[0]), .Y(n1) );
  INVX1 U2 ( .A(B[2]), .Y(n16) );
  INVX1 U3 ( .A(B[3]), .Y(n15) );
  INVX1 U4 ( .A(B[4]), .Y(n14) );
  INVX1 U5 ( .A(B[5]), .Y(n13) );
  INVX1 U6 ( .A(B[6]), .Y(n12) );
  INVX1 U7 ( .A(B[7]), .Y(n11) );
  INVX1 U8 ( .A(B[8]), .Y(n10) );
  INVX1 U9 ( .A(B[9]), .Y(n9) );
  INVX1 U10 ( .A(B[10]), .Y(n8) );
  INVX1 U11 ( .A(B[11]), .Y(n7) );
  INVX1 U12 ( .A(B[12]), .Y(n6) );
  INVX1 U13 ( .A(B[13]), .Y(n5) );
  INVX1 U14 ( .A(B[14]), .Y(n4) );
  INVX1 U15 ( .A(B[15]), .Y(n3) );
  INVX1 U16 ( .A(B[1]), .Y(n17) );
  NAND2X1 U17 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U18 ( .A(B[16]), .Y(n2) );
  INVX1 U19 ( .A(B[0]), .Y(n18) );
  XNOR2X1 U20 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
endmodule


module butterfly_DW01_sub_3 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  INVX1 U1 ( .A(A[0]), .Y(n1) );
  INVX1 U2 ( .A(B[2]), .Y(n16) );
  INVX1 U3 ( .A(B[3]), .Y(n15) );
  INVX1 U4 ( .A(B[4]), .Y(n14) );
  INVX1 U5 ( .A(B[5]), .Y(n13) );
  INVX1 U6 ( .A(B[6]), .Y(n12) );
  INVX1 U7 ( .A(B[7]), .Y(n11) );
  INVX1 U8 ( .A(B[8]), .Y(n10) );
  INVX1 U9 ( .A(B[9]), .Y(n9) );
  INVX1 U10 ( .A(B[10]), .Y(n8) );
  INVX1 U11 ( .A(B[11]), .Y(n7) );
  INVX1 U12 ( .A(B[12]), .Y(n6) );
  INVX1 U13 ( .A(B[13]), .Y(n5) );
  INVX1 U14 ( .A(B[14]), .Y(n4) );
  INVX1 U15 ( .A(B[15]), .Y(n3) );
  INVX1 U16 ( .A(B[1]), .Y(n17) );
  NAND2X1 U17 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U18 ( .A(B[16]), .Y(n2) );
  INVX1 U19 ( .A(B[0]), .Y(n18) );
  XNOR2X1 U20 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
endmodule


module butterfly_DW01_add_2 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_add_3 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_sub_4 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  INVX1 U1 ( .A(B[4]), .Y(n14) );
  INVX1 U2 ( .A(B[5]), .Y(n13) );
  INVX1 U3 ( .A(B[6]), .Y(n12) );
  INVX1 U4 ( .A(B[7]), .Y(n11) );
  INVX1 U5 ( .A(B[8]), .Y(n10) );
  INVX1 U6 ( .A(B[9]), .Y(n9) );
  INVX1 U7 ( .A(B[10]), .Y(n8) );
  INVX1 U8 ( .A(B[15]), .Y(n3) );
  INVX1 U9 ( .A(B[16]), .Y(n2) );
  INVX1 U10 ( .A(B[0]), .Y(n18) );
  INVX1 U11 ( .A(A[0]), .Y(n1) );
  INVX1 U12 ( .A(B[2]), .Y(n16) );
  INVX1 U13 ( .A(B[3]), .Y(n15) );
  INVX1 U14 ( .A(B[11]), .Y(n7) );
  INVX1 U15 ( .A(B[12]), .Y(n6) );
  INVX1 U16 ( .A(B[13]), .Y(n5) );
  INVX1 U17 ( .A(B[14]), .Y(n4) );
  NAND2X1 U18 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U19 ( .A(B[1]), .Y(n17) );
  XNOR2X1 U20 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
endmodule


module butterfly_DW01_sub_5 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  INVX1 U1 ( .A(B[3]), .Y(n15) );
  INVX1 U2 ( .A(B[4]), .Y(n14) );
  INVX1 U3 ( .A(B[5]), .Y(n13) );
  INVX1 U4 ( .A(B[6]), .Y(n12) );
  INVX1 U5 ( .A(B[7]), .Y(n11) );
  INVX1 U6 ( .A(B[8]), .Y(n10) );
  INVX1 U7 ( .A(B[9]), .Y(n9) );
  INVX1 U8 ( .A(B[10]), .Y(n8) );
  INVX1 U9 ( .A(B[11]), .Y(n7) );
  INVX1 U10 ( .A(B[12]), .Y(n6) );
  INVX1 U11 ( .A(B[15]), .Y(n3) );
  INVX1 U12 ( .A(B[16]), .Y(n2) );
  INVX1 U13 ( .A(B[0]), .Y(n18) );
  INVX1 U14 ( .A(A[0]), .Y(n1) );
  INVX1 U15 ( .A(B[2]), .Y(n16) );
  INVX1 U16 ( .A(B[13]), .Y(n5) );
  INVX1 U17 ( .A(B[14]), .Y(n4) );
  NAND2X1 U18 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U19 ( .A(B[1]), .Y(n17) );
  XNOR2X1 U20 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
endmodule


module butterfly_DW01_add_4 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_add_5 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_sub_6 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[15]), .Y(n3) );
  INVX1 U3 ( .A(B[16]), .Y(n2) );
  INVX1 U4 ( .A(B[2]), .Y(n16) );
  INVX1 U5 ( .A(B[3]), .Y(n15) );
  INVX1 U6 ( .A(B[4]), .Y(n14) );
  INVX1 U7 ( .A(B[5]), .Y(n13) );
  INVX1 U8 ( .A(B[6]), .Y(n12) );
  INVX1 U9 ( .A(B[7]), .Y(n11) );
  INVX1 U10 ( .A(B[8]), .Y(n10) );
  INVX1 U11 ( .A(B[9]), .Y(n9) );
  INVX1 U12 ( .A(B[10]), .Y(n8) );
  INVX1 U13 ( .A(B[11]), .Y(n7) );
  INVX1 U14 ( .A(B[12]), .Y(n6) );
  INVX1 U15 ( .A(B[13]), .Y(n5) );
  INVX1 U16 ( .A(B[14]), .Y(n4) );
  INVX1 U17 ( .A(B[1]), .Y(n17) );
  NAND2X1 U18 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U19 ( .A(A[0]), .Y(n1) );
  INVX1 U20 ( .A(B[0]), .Y(n18) );
endmodule


module butterfly_DW01_sub_7 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[15]), .Y(n3) );
  INVX1 U3 ( .A(B[16]), .Y(n2) );
  INVX1 U4 ( .A(B[2]), .Y(n16) );
  INVX1 U5 ( .A(B[3]), .Y(n15) );
  INVX1 U6 ( .A(B[4]), .Y(n14) );
  INVX1 U7 ( .A(B[5]), .Y(n13) );
  INVX1 U8 ( .A(B[6]), .Y(n12) );
  INVX1 U9 ( .A(B[7]), .Y(n11) );
  INVX1 U10 ( .A(B[8]), .Y(n10) );
  INVX1 U11 ( .A(B[9]), .Y(n9) );
  INVX1 U12 ( .A(B[10]), .Y(n8) );
  INVX1 U13 ( .A(B[11]), .Y(n7) );
  INVX1 U14 ( .A(B[12]), .Y(n6) );
  INVX1 U15 ( .A(B[13]), .Y(n5) );
  INVX1 U16 ( .A(B[14]), .Y(n4) );
  INVX1 U17 ( .A(B[1]), .Y(n17) );
  NAND2X1 U18 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U19 ( .A(A[0]), .Y(n1) );
  INVX1 U20 ( .A(B[0]), .Y(n18) );
endmodule


module butterfly_DW01_add_6 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_add_7 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_sub_8 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[3]), .Y(n15) );
  INVX1 U3 ( .A(B[4]), .Y(n14) );
  INVX1 U4 ( .A(B[5]), .Y(n13) );
  INVX1 U5 ( .A(B[6]), .Y(n12) );
  INVX1 U6 ( .A(B[7]), .Y(n11) );
  INVX1 U7 ( .A(B[8]), .Y(n10) );
  INVX1 U8 ( .A(B[9]), .Y(n9) );
  INVX1 U9 ( .A(B[10]), .Y(n8) );
  INVX1 U10 ( .A(B[11]), .Y(n7) );
  INVX1 U11 ( .A(B[12]), .Y(n6) );
  INVX1 U12 ( .A(B[13]), .Y(n5) );
  INVX1 U13 ( .A(B[14]), .Y(n4) );
  INVX1 U14 ( .A(B[15]), .Y(n3) );
  INVX1 U15 ( .A(B[16]), .Y(n2) );
  INVX1 U16 ( .A(B[0]), .Y(n18) );
  INVX1 U17 ( .A(B[1]), .Y(n17) );
  NAND2X1 U18 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U19 ( .A(A[0]), .Y(n1) );
  INVX1 U20 ( .A(B[2]), .Y(n16) );
endmodule


module butterfly_DW01_add_8 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_add_9 ( A, B, SUM );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  wire   n1;
  wire   [7:2] carry;

  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  XOR3X2 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_sub_9 ( A, B, DIFF );
  input [7:0] A;
  input [7:0] B;
  output [7:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [7:1] carry;

  ADDFX2 U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  XOR3X2 U2_7 ( .A(A[7]), .B(n2), .C(carry[7]), .Y(DIFF[7]) );
  XNOR2X1 U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[0]), .Y(n9) );
  INVX1 U3 ( .A(B[7]), .Y(n2) );
  INVX1 U4 ( .A(B[1]), .Y(n8) );
  NAND2X1 U5 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U6 ( .A(A[0]), .Y(n1) );
  INVX1 U7 ( .A(B[2]), .Y(n7) );
  INVX1 U8 ( .A(B[3]), .Y(n6) );
  INVX1 U9 ( .A(B[4]), .Y(n5) );
  INVX1 U10 ( .A(B[5]), .Y(n4) );
  INVX1 U11 ( .A(B[6]), .Y(n3) );
endmodule


module butterfly_DW01_sub_10 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[16]), .Y(n2) );
  INVX1 U3 ( .A(B[0]), .Y(n18) );
  INVX1 U4 ( .A(B[2]), .Y(n16) );
  INVX1 U5 ( .A(B[3]), .Y(n15) );
  INVX1 U6 ( .A(B[4]), .Y(n14) );
  INVX1 U7 ( .A(B[5]), .Y(n13) );
  INVX1 U8 ( .A(B[6]), .Y(n12) );
  INVX1 U9 ( .A(B[7]), .Y(n11) );
  INVX1 U10 ( .A(B[8]), .Y(n10) );
  INVX1 U11 ( .A(B[9]), .Y(n9) );
  INVX1 U12 ( .A(B[10]), .Y(n8) );
  INVX1 U13 ( .A(B[11]), .Y(n7) );
  INVX1 U14 ( .A(B[12]), .Y(n6) );
  INVX1 U15 ( .A(B[13]), .Y(n5) );
  INVX1 U16 ( .A(B[14]), .Y(n4) );
  INVX1 U17 ( .A(B[15]), .Y(n3) );
  INVX1 U18 ( .A(B[1]), .Y(n17) );
  NAND2X1 U19 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U20 ( .A(A[0]), .Y(n1) );
endmodule


module butterfly_DW01_sub_11 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[3]), .Y(n15) );
  INVX1 U3 ( .A(B[4]), .Y(n14) );
  INVX1 U4 ( .A(B[5]), .Y(n13) );
  INVX1 U5 ( .A(B[6]), .Y(n12) );
  INVX1 U6 ( .A(B[7]), .Y(n11) );
  INVX1 U7 ( .A(B[8]), .Y(n10) );
  INVX1 U8 ( .A(B[9]), .Y(n9) );
  INVX1 U9 ( .A(B[10]), .Y(n8) );
  INVX1 U10 ( .A(B[11]), .Y(n7) );
  INVX1 U11 ( .A(B[12]), .Y(n6) );
  INVX1 U12 ( .A(B[13]), .Y(n5) );
  INVX1 U13 ( .A(B[14]), .Y(n4) );
  INVX1 U14 ( .A(B[15]), .Y(n3) );
  INVX1 U15 ( .A(B[16]), .Y(n2) );
  INVX1 U16 ( .A(B[0]), .Y(n18) );
  INVX1 U17 ( .A(B[1]), .Y(n17) );
  NAND2X1 U18 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U19 ( .A(A[0]), .Y(n1) );
  INVX1 U20 ( .A(B[2]), .Y(n16) );
endmodule


module butterfly_DW01_add_10 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_sub_12 ( A, DIFF, B_6_, B_5_, B_4_, B_3_, B_2_, B_1_, 
        B_0_ );
  input [7:0] A;
  output [7:0] DIFF;
  input B_6_, B_5_, B_4_, B_3_, B_2_, B_1_, B_0_;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [7:1] carry;

  ADDFX2 U2_1 ( .A(A[1]), .B(n7), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n3), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n4), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n5), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n6), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n2), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  XNOR2X1 U1 ( .A(n8), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B_6_), .Y(n2) );
  XNOR2X1 U3 ( .A(A[7]), .B(carry[7]), .Y(DIFF[7]) );
  INVX1 U4 ( .A(B_0_), .Y(n8) );
  INVX1 U5 ( .A(A[0]), .Y(n1) );
  INVX1 U6 ( .A(B_2_), .Y(n6) );
  INVX1 U7 ( .A(B_3_), .Y(n5) );
  INVX1 U8 ( .A(B_4_), .Y(n4) );
  INVX1 U9 ( .A(B_5_), .Y(n3) );
  INVX1 U10 ( .A(B_1_), .Y(n7) );
  NAND2X1 U11 ( .A(B_0_), .B(n1), .Y(carry[1]) );
endmodule


module butterfly_DW01_sub_13 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[16]), .Y(n2) );
  INVX1 U3 ( .A(B[0]), .Y(n18) );
  INVX1 U4 ( .A(B[1]), .Y(n17) );
  NAND2X1 U5 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U6 ( .A(A[0]), .Y(n1) );
  INVX1 U7 ( .A(B[2]), .Y(n16) );
  INVX1 U8 ( .A(B[3]), .Y(n15) );
  INVX1 U9 ( .A(B[4]), .Y(n14) );
  INVX1 U10 ( .A(B[5]), .Y(n13) );
  INVX1 U11 ( .A(B[6]), .Y(n12) );
  INVX1 U12 ( .A(B[7]), .Y(n11) );
  INVX1 U13 ( .A(B[8]), .Y(n10) );
  INVX1 U14 ( .A(B[9]), .Y(n9) );
  INVX1 U15 ( .A(B[10]), .Y(n8) );
  INVX1 U16 ( .A(B[11]), .Y(n7) );
  INVX1 U17 ( .A(B[12]), .Y(n6) );
  INVX1 U18 ( .A(B[13]), .Y(n5) );
  INVX1 U19 ( .A(B[14]), .Y(n4) );
  INVX1 U20 ( .A(B[15]), .Y(n3) );
endmodule


module butterfly_DW01_sub_14 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[13]), .Y(n5) );
  INVX1 U3 ( .A(B[14]), .Y(n4) );
  INVX1 U4 ( .A(B[15]), .Y(n3) );
  INVX1 U5 ( .A(B[16]), .Y(n2) );
  INVX1 U6 ( .A(B[0]), .Y(n18) );
  INVX1 U7 ( .A(B[1]), .Y(n17) );
  NAND2X1 U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U9 ( .A(A[0]), .Y(n1) );
  INVX1 U10 ( .A(B[2]), .Y(n16) );
  INVX1 U11 ( .A(B[3]), .Y(n15) );
  INVX1 U12 ( .A(B[4]), .Y(n14) );
  INVX1 U13 ( .A(B[5]), .Y(n13) );
  INVX1 U14 ( .A(B[6]), .Y(n12) );
  INVX1 U15 ( .A(B[7]), .Y(n11) );
  INVX1 U16 ( .A(B[8]), .Y(n10) );
  INVX1 U17 ( .A(B[9]), .Y(n9) );
  INVX1 U18 ( .A(B[10]), .Y(n8) );
  INVX1 U19 ( .A(B[11]), .Y(n7) );
  INVX1 U20 ( .A(B[12]), .Y(n6) );
endmodule


module butterfly_DW01_add_11 ( A, B, SUM );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  wire   n1;
  wire   [16:2] carry;

  XOR3X2 U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .Y(SUM[16]) );
  ADDFX2 U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFX2 U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFX2 U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFX2 U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFX2 U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(SUM[9])
         );
  ADDFX2 U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8])
         );
  ADDFX2 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7])
         );
  ADDFX2 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFX2 U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFX2 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module butterfly_DW01_add_12 ( SUM, A_5_, A_4_, A_3_, A_2_, A_1_, A_0_, B_6_, 
        B_5_, B_4_, B_3_, B_2_, B_1_, B_0_ );
  output [7:0] SUM;
  input A_5_, A_4_, A_3_, A_2_, A_1_, A_0_, B_6_, B_5_, B_4_, B_3_, B_2_, B_1_,
         B_0_;
  wire   n1;
  wire   [6:2] carry;

  ADDFX2 U1_4 ( .A(A_4_), .B(B_4_), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2 U1_3 ( .A(A_3_), .B(B_3_), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2 U1_2 ( .A(A_2_), .B(B_2_), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2 U1_1 ( .A(A_1_), .B(B_1_), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2 U1_5 ( .A(A_5_), .B(B_5_), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  AND2X2 U1 ( .A(B_0_), .B(A_0_), .Y(n1) );
  OR2X2 U2 ( .A(B_6_), .B(carry[6]), .Y(SUM[7]) );
  XOR2X1 U3 ( .A(B_0_), .B(A_0_), .Y(SUM[0]) );
  XNOR2X1 U4 ( .A(B_6_), .B(carry[6]), .Y(SUM[6]) );
endmodule


module butterfly_DW01_sub_15 ( DIFF, A_5_, A_4_, A_3_, A_2_, A_1_, A_0_, B_6_, 
        B_5_, B_4_, B_3_, B_2_, B_1_, B_0_ );
  output [7:0] DIFF;
  input A_5_, A_4_, A_3_, A_2_, A_1_, A_0_, B_6_, B_5_, B_4_, B_3_, B_2_, B_1_,
         B_0_;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [6:1] carry;

  ADDFX2 U2_4 ( .A(A_4_), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_3 ( .A(A_3_), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  ADDFX2 U2_2 ( .A(A_2_), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  ADDFX2 U2_1 ( .A(A_1_), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  ADDFX2 U2_5 ( .A(A_5_), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  AND2X2 U1 ( .A(B_6_), .B(n2), .Y(DIFF[7]) );
  XNOR2X1 U2 ( .A(n4), .B(carry[6]), .Y(DIFF[6]) );
  INVX1 U3 ( .A(carry[6]), .Y(n2) );
  XNOR2X1 U4 ( .A(n10), .B(A_0_), .Y(DIFF[0]) );
  INVX1 U5 ( .A(B_5_), .Y(n5) );
  INVX1 U6 ( .A(B_1_), .Y(n9) );
  NAND2X1 U7 ( .A(B_0_), .B(n3), .Y(carry[1]) );
  INVX1 U8 ( .A(B_0_), .Y(n10) );
  INVX1 U9 ( .A(A_0_), .Y(n3) );
  INVX1 U10 ( .A(B_2_), .Y(n8) );
  INVX1 U11 ( .A(B_3_), .Y(n7) );
  INVX1 U12 ( .A(B_4_), .Y(n6) );
  INVX1 U13 ( .A(B_6_), .Y(n4) );
endmodule


module butterfly_DW01_sub_16 ( A, B, DIFF );
  input [16:0] A;
  input [16:0] B;
  output [16:0] DIFF;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18;
  wire   [16:1] carry;

  ADDFX2 U2_1 ( .A(A[1]), .B(n17), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2 U2_15 ( .A(A[15]), .B(n3), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFX2 U2_14 ( .A(A[14]), .B(n4), .CI(carry[14]), .CO(carry[15]), .S(
        DIFF[14]) );
  ADDFX2 U2_13 ( .A(A[13]), .B(n5), .CI(carry[13]), .CO(carry[14]), .S(
        DIFF[13]) );
  ADDFX2 U2_12 ( .A(A[12]), .B(n6), .CI(carry[12]), .CO(carry[13]), .S(
        DIFF[12]) );
  ADDFX2 U2_11 ( .A(A[11]), .B(n7), .CI(carry[11]), .CO(carry[12]), .S(
        DIFF[11]) );
  ADDFX2 U2_10 ( .A(A[10]), .B(n8), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  ADDFX2 U2_9 ( .A(A[9]), .B(n9), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n10), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  ADDFX2 U2_7 ( .A(A[7]), .B(n11), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2 U2_6 ( .A(A[6]), .B(n12), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  ADDFX2 U2_5 ( .A(A[5]), .B(n13), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2 U2_4 ( .A(A[4]), .B(n14), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2 U2_3 ( .A(A[3]), .B(n15), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2 U2_2 ( .A(A[2]), .B(n16), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  XOR3X2 U2_16 ( .A(A[16]), .B(n2), .C(carry[16]), .Y(DIFF[16]) );
  XNOR2X1 U1 ( .A(n18), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U2 ( .A(B[16]), .Y(n2) );
  INVX1 U3 ( .A(B[0]), .Y(n18) );
  INVX1 U4 ( .A(B[2]), .Y(n16) );
  INVX1 U5 ( .A(B[3]), .Y(n15) );
  INVX1 U6 ( .A(B[4]), .Y(n14) );
  INVX1 U7 ( .A(B[5]), .Y(n13) );
  INVX1 U8 ( .A(B[6]), .Y(n12) );
  INVX1 U9 ( .A(B[7]), .Y(n11) );
  INVX1 U10 ( .A(B[8]), .Y(n10) );
  INVX1 U11 ( .A(B[9]), .Y(n9) );
  INVX1 U12 ( .A(B[10]), .Y(n8) );
  INVX1 U13 ( .A(B[11]), .Y(n7) );
  INVX1 U14 ( .A(B[12]), .Y(n6) );
  INVX1 U15 ( .A(B[13]), .Y(n5) );
  INVX1 U16 ( .A(B[14]), .Y(n4) );
  INVX1 U17 ( .A(B[15]), .Y(n3) );
  INVX1 U18 ( .A(B[1]), .Y(n17) );
  NAND2X1 U19 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX1 U20 ( .A(A[0]), .Y(n1) );
endmodule


module butterfly ( clk, rst_n, calc_in, rotation, calc_out );
  input [135:0] calc_in;
  input [2:0] rotation;
  output [135:0] calc_out;
  input clk, rst_n;
  wire   N33, N34, N35, N36, N37, N38, N39, N40, N41, n43, n44, n45, n46, n47;
  wire   [15:0] rotation_factor1;
  wire   [15:0] rotation_factor2;
  wire   [15:0] rotation_factor3;
  wire   [16:0] row3_4_real;
  wire   [16:0] row3_4_imag;
  wire   [16:0] row3_3_real;
  wire   [16:0] row3_3_imag;
  wire   [16:0] row3_2_real;
  wire   [16:0] row3_2_imag;
  wire   [16:0] row3_1_real;
  wire   [16:0] row3_1_imag;
  wire   [16:0] in_17bit_1_1;
  wire   [16:0] comp_part_1;
  wire   [7:0] in_8bit_1_2;
  wire   [16:0] row1_2_real_b;
  wire   [7:0] in_8bit_1_3;
  wire   [16:0] row1_2_imag_b;
  wire   [16:0] in_17bit_2_1;
  wire   [16:0] comp_part_2;
  wire   [7:0] in_8bit_2_2;
  wire   [16:0] row1_3_real_b;
  wire   [16:0] row1_3_imag_b;
  wire   [16:0] in_17bit_3_1;
  wire   [16:0] comp_part_3;
  wire   [7:0] in_8bit_3_2;
  wire   [16:0] row1_4_real_b;
  wire   [7:0] in_8bit_3_3;
  wire   [16:0] row1_4_imag_b;
  wire   [16:0] row1_2_real;
  wire   [16:0] row1_2_imag;
  wire   [16:0] row1_3_real;
  wire   [16:0] row1_3_imag;
  wire   [16:0] row1_4_real;
  wire   [16:0] row1_4_imag;
  wire   [16:0] row2_1_real;
  wire   [16:0] row2_1_imag;
  wire   [16:0] row2_2_real;
  wire   [16:0] row2_2_imag;
  wire   [16:0] row2_3_real;
  wire   [16:0] row2_3_imag;
  wire   [16:0] row2_4_real;
  wire   [16:0] row2_4_imag;
  tri   clk;
  tri   rst_n;
  tri   [135:0] calc_out;

  multi16_8 multi1_2_1 ( .clk(clk), .rst_n(rst_n), .in_17bit(in_17bit_1_1), 
        .in_8bit({1'b0, 1'b1, rotation_factor1[13:8]}), .out(comp_part_1) );
  multi16_7 multi1_2_2 ( .clk(clk), .rst_n(rst_n), .in_17bit(calc_in[50:34]), 
        .in_8bit(in_8bit_1_2), .out(row1_2_real_b) );
  multi16_6 multi1_2_3 ( .clk(clk), .rst_n(rst_n), .in_17bit(calc_in[67:51]), 
        .in_8bit(in_8bit_1_3), .out(row1_2_imag_b) );
  multi16_5 multi1_3_1 ( .clk(clk), .rst_n(rst_n), .in_17bit(in_17bit_2_1), 
        .in_8bit(rotation_factor2[15:8]), .out(comp_part_2) );
  multi16_4 multi1_3_2 ( .clk(clk), .rst_n(rst_n), .in_17bit(calc_in[84:68]), 
        .in_8bit(in_8bit_2_2), .out(row1_3_real_b) );
  multi16_3 multi1_3_3 ( .clk(clk), .rst_n(rst_n), .in_17bit(calc_in[67:51]), 
        .in_8bit(in_8bit_1_3), .out(row1_3_imag_b) );
  multi16_2 multi1_4_1 ( .clk(clk), .rst_n(rst_n), .in_17bit(in_17bit_3_1), 
        .in_8bit(rotation_factor3[15:8]), .out(comp_part_3) );
  multi16_1 multi1_4_2 ( .clk(clk), .rst_n(rst_n), .in_17bit(calc_in[118:102]), 
        .in_8bit(in_8bit_3_2), .out(row1_4_real_b) );
  multi16_0 multi1_4_3 ( .clk(clk), .rst_n(rst_n), .in_17bit(calc_in[135:119]), 
        .in_8bit(in_8bit_3_3), .out(row1_4_imag_b) );
  butterfly_DW01_sub_0 sub_346 ( .A(row2_2_imag), .B(row2_4_real), .DIFF(
        row3_4_imag) );
  butterfly_DW01_add_0 add_345 ( .A(row2_2_real), .B(row2_4_imag), .SUM(
        row3_4_real) );
  butterfly_DW01_add_1 add_343 ( .A(row2_2_imag), .B(row2_4_real), .SUM(
        row3_3_imag) );
  butterfly_DW01_sub_1 sub_342 ( .A(row2_2_real), .B(row2_4_imag), .DIFF(
        row3_3_real) );
  butterfly_DW01_sub_2 sub_340 ( .A(row2_1_imag), .B(row2_3_imag), .DIFF(
        row3_2_imag) );
  butterfly_DW01_sub_3 sub_339 ( .A(row2_1_real), .B(row2_3_real), .DIFF(
        row3_2_real) );
  butterfly_DW01_add_2 add_337 ( .A(row2_1_imag), .B(row2_3_imag), .SUM(
        row3_1_imag) );
  butterfly_DW01_add_3 add_336 ( .A(row2_1_real), .B(row2_3_real), .SUM(
        row3_1_real) );
  butterfly_DW01_sub_4 sub_332 ( .A(row1_2_imag), .B(row1_4_imag), .DIFF(
        row2_4_imag) );
  butterfly_DW01_sub_5 sub_331 ( .A(row1_2_real), .B(row1_4_real), .DIFF(
        row2_4_real) );
  butterfly_DW01_add_4 add_329 ( .A(row1_2_imag), .B(row1_4_imag), .SUM(
        row2_3_imag) );
  butterfly_DW01_add_5 add_328 ( .A(row1_2_real), .B(row1_4_real), .SUM(
        row2_3_real) );
  butterfly_DW01_sub_6 sub_326 ( .A(calc_in[16:0]), .B(row1_3_imag), .DIFF(
        row2_2_imag) );
  butterfly_DW01_sub_7 sub_325 ( .A(calc_in[33:17]), .B(row1_3_real), .DIFF(
        row2_2_real) );
  butterfly_DW01_add_6 add_323 ( .A(calc_in[16:0]), .B(row1_3_imag), .SUM(
        row2_1_imag) );
  butterfly_DW01_add_7 add_322 ( .A(calc_in[33:17]), .B(row1_3_real), .SUM(
        row2_1_real) );
  butterfly_DW01_sub_8 sub_318 ( .A(row1_4_imag_b), .B(comp_part_3), .DIFF(
        row1_4_imag) );
  butterfly_DW01_add_8 add_317 ( .A(row1_4_real_b), .B(comp_part_3), .SUM(
        row1_4_real) );
  butterfly_DW01_add_9 add_314 ( .A(rotation_factor3[15:8]), .B(
        rotation_factor3[7:0]), .SUM(in_8bit_3_3) );
  butterfly_DW01_sub_9 sub_311 ( .A(rotation_factor3[15:8]), .B(
        rotation_factor3[7:0]), .DIFF(in_8bit_3_2) );
  butterfly_DW01_sub_10 sub_309 ( .A(calc_in[135:119]), .B(calc_in[118:102]), 
        .DIFF(in_17bit_3_1) );
  butterfly_DW01_sub_11 sub_306 ( .A(row1_3_imag_b), .B(comp_part_2), .DIFF(
        row1_3_imag) );
  butterfly_DW01_add_10 add_305 ( .A(row1_3_real_b), .B(comp_part_2), .SUM(
        row1_3_real) );
  butterfly_DW01_sub_12 sub_299 ( .A(rotation_factor2[15:8]), .DIFF(
        in_8bit_2_2), .B_6_(rotation_factor2[6]), .B_5_(rotation_factor2[5]), 
        .B_4_(rotation_factor2[4]), .B_3_(rotation_factor2[3]), .B_2_(
        rotation_factor2[2]), .B_1_(rotation_factor2[1]), .B_0_(
        rotation_factor2[0]) );
  butterfly_DW01_sub_13 sub_297 ( .A(calc_in[101:85]), .B(calc_in[84:68]), 
        .DIFF(in_17bit_2_1) );
  butterfly_DW01_sub_14 sub_294 ( .A(row1_2_imag_b), .B(comp_part_1), .DIFF(
        row1_2_imag) );
  butterfly_DW01_add_11 add_293 ( .A(row1_2_real_b), .B(comp_part_1), .SUM(
        row1_2_real) );
  butterfly_DW01_add_12 add_290 ( .SUM(in_8bit_1_3), .A_5_(
        rotation_factor1[13]), .A_4_(rotation_factor1[12]), .A_3_(
        rotation_factor1[11]), .A_2_(rotation_factor1[10]), .A_1_(
        rotation_factor1[9]), .A_0_(rotation_factor1[8]), .B_6_(
        rotation_factor1[6]), .B_5_(rotation_factor1[5]), .B_4_(
        rotation_factor1[4]), .B_3_(rotation_factor1[3]), .B_2_(
        rotation_factor1[2]), .B_1_(rotation_factor1[1]), .B_0_(
        rotation_factor1[0]) );
  butterfly_DW01_sub_15 sub_287 ( .DIFF(in_8bit_1_2), .A_5_(
        rotation_factor1[13]), .A_4_(rotation_factor1[12]), .A_3_(
        rotation_factor1[11]), .A_2_(rotation_factor1[10]), .A_1_(
        rotation_factor1[9]), .A_0_(rotation_factor1[8]), .B_6_(
        rotation_factor1[6]), .B_5_(rotation_factor1[5]), .B_4_(
        rotation_factor1[4]), .B_3_(rotation_factor1[3]), .B_2_(
        rotation_factor1[2]), .B_1_(rotation_factor1[1]), .B_0_(
        rotation_factor1[0]) );
  butterfly_DW01_sub_16 sub_285 ( .A(calc_in[67:51]), .B(calc_in[50:34]), 
        .DIFF(in_17bit_1_1) );
  DFFHQX1 rotation_factor2_reg_6_ ( .D(N33), .CK(clk), .Q(rotation_factor2[6])
         );
  DFFHQX1 rotation_factor2_reg_5_ ( .D(n45), .CK(clk), .Q(rotation_factor2[5])
         );
  DFFHQX1 rotation_factor2_reg_4_ ( .D(N33), .CK(clk), .Q(rotation_factor2[4])
         );
  DFFTRX1 rotation_factor2_reg_15_ ( .D(n44), .RN(n43), .CK(clk), .Q(
        rotation_factor2[15]) );
  DFFTRX1 rotation_factor1_reg_5_ ( .D(rotation[2]), .RN(rotation[0]), .CK(clk), .Q(rotation_factor1[5]) );
  DFFTRX1 rotation_factor1_reg_4_ ( .D(rotation[2]), .RN(n43), .CK(clk), .Q(
        rotation_factor1[4]) );
  DFFTRX1 rotation_factor3_reg_7_ ( .D(n44), .RN(n43), .CK(clk), .Q(
        rotation_factor3[7]) );
  DFFTRX1 rotation_factor3_reg_5_ ( .D(n47), .RN(n44), .CK(clk), .Q(
        rotation_factor3[5]) );
  DFFHQX1 rotation_factor3_reg_6_ ( .D(N40), .CK(clk), .Q(rotation_factor3[6])
         );
  DFFHQX1 rotation_factor3_reg_4_ ( .D(N33), .CK(clk), .Q(rotation_factor3[4])
         );
  DFFHQX1 rotation_factor2_reg_14_ ( .D(N35), .CK(clk), .Q(
        rotation_factor2[14]) );
  DFFHQX1 rotation_factor2_reg_13_ ( .D(N34), .CK(clk), .Q(
        rotation_factor2[13]) );
  DFFHQX1 rotation_factor2_reg_12_ ( .D(N35), .CK(clk), .Q(
        rotation_factor2[12]) );
  DFFTRX1 rotation_factor3_reg_15_ ( .D(rotation[2]), .RN(n43), .CK(clk), .Q(
        rotation_factor3[15]) );
  DFFHQX1 rotation_factor1_reg_6_ ( .D(N33), .CK(clk), .Q(rotation_factor1[6])
         );
  DFFHQX1 rotation_factor1_reg_13_ ( .D(N38), .CK(clk), .Q(
        rotation_factor1[13]) );
  DFFHQX1 rotation_factor3_reg_14_ ( .D(N35), .CK(clk), .Q(
        rotation_factor3[14]) );
  DFFHQX1 rotation_factor3_reg_13_ ( .D(N37), .CK(clk), .Q(
        rotation_factor3[13]) );
  DFFHQX1 rotation_factor3_reg_12_ ( .D(N39), .CK(clk), .Q(
        rotation_factor3[12]) );
  DFFHQX1 rotation_factor2_reg_3_ ( .D(N33), .CK(clk), .Q(rotation_factor2[3])
         );
  DFFHQX1 rotation_factor2_reg_2_ ( .D(n45), .CK(clk), .Q(rotation_factor2[2])
         );
  DFFHQX1 rotation_factor2_reg_1_ ( .D(N33), .CK(clk), .Q(rotation_factor2[1])
         );
  DFFHQX1 rotation_factor2_reg_0_ ( .D(n45), .CK(clk), .Q(rotation_factor2[0])
         );
  DFFTRX1 rotation_factor1_reg_2_ ( .D(n44), .RN(n43), .CK(clk), .Q(
        rotation_factor1[2]) );
  DFFTRX1 rotation_factor1_reg_1_ ( .D(rotation[2]), .RN(n43), .CK(clk), .Q(
        rotation_factor1[1]) );
  DFFTRX1 rotation_factor3_reg_3_ ( .D(rotation[2]), .RN(n43), .CK(clk), .Q(
        rotation_factor3[3]) );
  DFFTRX1 rotation_factor3_reg_2_ ( .D(rotation[2]), .RN(rotation[0]), .CK(clk), .Q(rotation_factor3[2]) );
  DFFHQX1 rotation_factor1_reg_3_ ( .D(n45), .CK(clk), .Q(rotation_factor1[3])
         );
  DFFHQX1 rotation_factor3_reg_1_ ( .D(N33), .CK(clk), .Q(rotation_factor3[1])
         );
  DFFHQX1 rotation_factor2_reg_11_ ( .D(N35), .CK(clk), .Q(
        rotation_factor2[11]) );
  DFFHQX1 rotation_factor2_reg_10_ ( .D(N34), .CK(clk), .Q(
        rotation_factor2[10]) );
  DFFHQX1 rotation_factor2_reg_9_ ( .D(N38), .CK(clk), .Q(rotation_factor2[9])
         );
  DFFTRX1 rotation_factor1_reg_0_ ( .D(n47), .RN(n44), .CK(clk), .Q(
        rotation_factor1[0]) );
  DFFTRX1 rotation_factor3_reg_0_ ( .D(n44), .RN(n43), .CK(clk), .Q(
        rotation_factor3[0]) );
  DFFHQX1 rotation_factor1_reg_12_ ( .D(N37), .CK(clk), .Q(
        rotation_factor1[12]) );
  DFFHQX1 rotation_factor1_reg_11_ ( .D(N36), .CK(clk), .Q(
        rotation_factor1[11]) );
  DFFHQX1 rotation_factor1_reg_10_ ( .D(N35), .CK(clk), .Q(
        rotation_factor1[10]) );
  DFFHQX1 rotation_factor1_reg_9_ ( .D(N37), .CK(clk), .Q(rotation_factor1[9])
         );
  DFFHQX1 rotation_factor3_reg_11_ ( .D(N34), .CK(clk), .Q(
        rotation_factor3[11]) );
  DFFHQX1 rotation_factor3_reg_10_ ( .D(N36), .CK(clk), .Q(
        rotation_factor3[10]) );
  DFFHQX1 rotation_factor3_reg_9_ ( .D(N41), .CK(clk), .Q(rotation_factor3[9])
         );
  DFFHQX1 rotation_factor2_reg_8_ ( .D(N39), .CK(clk), .Q(rotation_factor2[8])
         );
  DFFHQX1 rotation_factor1_reg_8_ ( .D(N34), .CK(clk), .Q(rotation_factor1[8])
         );
  DFFHQX1 rotation_factor3_reg_8_ ( .D(N35), .CK(clk), .Q(rotation_factor3[8])
         );
  DFFRHQX1 calc_out_reg_135_ ( .D(row3_4_real[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[135]) );
  DFFRHQX1 calc_out_reg_134_ ( .D(row3_4_real[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[134]) );
  DFFRHQX1 calc_out_reg_133_ ( .D(row3_4_real[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[133]) );
  DFFRHQX1 calc_out_reg_132_ ( .D(row3_4_real[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[132]) );
  DFFRHQX1 calc_out_reg_131_ ( .D(row3_4_real[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[131]) );
  DFFRHQX1 calc_out_reg_130_ ( .D(row3_4_real[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[130]) );
  DFFRHQX1 calc_out_reg_129_ ( .D(row3_4_real[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[129]) );
  DFFRHQX1 calc_out_reg_128_ ( .D(row3_4_real[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[128]) );
  DFFRHQX1 calc_out_reg_127_ ( .D(row3_4_real[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[127]) );
  DFFRHQX1 calc_out_reg_126_ ( .D(row3_4_real[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[126]) );
  DFFRHQX1 calc_out_reg_125_ ( .D(row3_4_real[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[125]) );
  DFFRHQX1 calc_out_reg_124_ ( .D(row3_4_real[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[124]) );
  DFFRHQX1 calc_out_reg_123_ ( .D(row3_4_real[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[123]) );
  DFFRHQX1 calc_out_reg_122_ ( .D(row3_4_real[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[122]) );
  DFFRHQX1 calc_out_reg_121_ ( .D(row3_4_real[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[121]) );
  DFFRHQX1 calc_out_reg_120_ ( .D(row3_4_real[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[120]) );
  DFFRHQX1 calc_out_reg_119_ ( .D(row3_4_real[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[119]) );
  DFFRHQX1 calc_out_reg_118_ ( .D(row3_4_imag[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[118]) );
  DFFRHQX1 calc_out_reg_117_ ( .D(row3_4_imag[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[117]) );
  DFFRHQX1 calc_out_reg_116_ ( .D(row3_4_imag[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[116]) );
  DFFRHQX1 calc_out_reg_115_ ( .D(row3_4_imag[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[115]) );
  DFFRHQX1 calc_out_reg_114_ ( .D(row3_4_imag[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[114]) );
  DFFRHQX1 calc_out_reg_113_ ( .D(row3_4_imag[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[113]) );
  DFFRHQX1 calc_out_reg_112_ ( .D(row3_4_imag[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[112]) );
  DFFRHQX1 calc_out_reg_111_ ( .D(row3_4_imag[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[111]) );
  DFFRHQX1 calc_out_reg_110_ ( .D(row3_4_imag[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[110]) );
  DFFRHQX1 calc_out_reg_109_ ( .D(row3_4_imag[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[109]) );
  DFFRHQX1 calc_out_reg_108_ ( .D(row3_4_imag[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[108]) );
  DFFRHQX1 calc_out_reg_107_ ( .D(row3_4_imag[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[107]) );
  DFFRHQX1 calc_out_reg_106_ ( .D(row3_4_imag[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[106]) );
  DFFRHQX1 calc_out_reg_105_ ( .D(row3_4_imag[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[105]) );
  DFFRHQX1 calc_out_reg_104_ ( .D(row3_4_imag[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[104]) );
  DFFRHQX1 calc_out_reg_103_ ( .D(row3_4_imag[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[103]) );
  DFFRHQX1 calc_out_reg_102_ ( .D(row3_4_imag[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[102]) );
  DFFRHQX1 calc_out_reg_101_ ( .D(row3_3_real[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[101]) );
  DFFRHQX1 calc_out_reg_100_ ( .D(row3_3_real[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[100]) );
  DFFRHQX1 calc_out_reg_99_ ( .D(row3_3_real[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[99]) );
  DFFRHQX1 calc_out_reg_98_ ( .D(row3_3_real[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[98]) );
  DFFRHQX1 calc_out_reg_97_ ( .D(row3_3_real[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[97]) );
  DFFRHQX1 calc_out_reg_96_ ( .D(row3_3_real[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[96]) );
  DFFRHQX1 calc_out_reg_95_ ( .D(row3_3_real[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[95]) );
  DFFRHQX1 calc_out_reg_94_ ( .D(row3_3_real[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[94]) );
  DFFRHQX1 calc_out_reg_93_ ( .D(row3_3_real[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[93]) );
  DFFRHQX1 calc_out_reg_92_ ( .D(row3_3_real[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[92]) );
  DFFRHQX1 calc_out_reg_91_ ( .D(row3_3_real[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[91]) );
  DFFRHQX1 calc_out_reg_90_ ( .D(row3_3_real[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[90]) );
  DFFRHQX1 calc_out_reg_89_ ( .D(row3_3_real[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[89]) );
  DFFRHQX1 calc_out_reg_88_ ( .D(row3_3_real[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[88]) );
  DFFRHQX1 calc_out_reg_87_ ( .D(row3_3_real[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[87]) );
  DFFRHQX1 calc_out_reg_86_ ( .D(row3_3_real[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[86]) );
  DFFRHQX1 calc_out_reg_85_ ( .D(row3_3_real[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[85]) );
  DFFRHQX1 calc_out_reg_84_ ( .D(row3_3_imag[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[84]) );
  DFFRHQX1 calc_out_reg_83_ ( .D(row3_3_imag[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[83]) );
  DFFRHQX1 calc_out_reg_82_ ( .D(row3_3_imag[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[82]) );
  DFFRHQX1 calc_out_reg_81_ ( .D(row3_3_imag[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[81]) );
  DFFRHQX1 calc_out_reg_80_ ( .D(row3_3_imag[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[80]) );
  DFFRHQX1 calc_out_reg_79_ ( .D(row3_3_imag[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[79]) );
  DFFRHQX1 calc_out_reg_78_ ( .D(row3_3_imag[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[78]) );
  DFFRHQX1 calc_out_reg_77_ ( .D(row3_3_imag[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[77]) );
  DFFRHQX1 calc_out_reg_76_ ( .D(row3_3_imag[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[76]) );
  DFFRHQX1 calc_out_reg_75_ ( .D(row3_3_imag[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[75]) );
  DFFRHQX1 calc_out_reg_74_ ( .D(row3_3_imag[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[74]) );
  DFFRHQX1 calc_out_reg_73_ ( .D(row3_3_imag[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[73]) );
  DFFRHQX1 calc_out_reg_72_ ( .D(row3_3_imag[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[72]) );
  DFFRHQX1 calc_out_reg_71_ ( .D(row3_3_imag[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[71]) );
  DFFRHQX1 calc_out_reg_70_ ( .D(row3_3_imag[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[70]) );
  DFFRHQX1 calc_out_reg_69_ ( .D(row3_3_imag[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[69]) );
  DFFRHQX1 calc_out_reg_68_ ( .D(row3_3_imag[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[68]) );
  DFFRHQX1 calc_out_reg_67_ ( .D(row3_2_real[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[67]) );
  DFFRHQX1 calc_out_reg_66_ ( .D(row3_2_real[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[66]) );
  DFFRHQX1 calc_out_reg_65_ ( .D(row3_2_real[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[65]) );
  DFFRHQX1 calc_out_reg_64_ ( .D(row3_2_real[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[64]) );
  DFFRHQX1 calc_out_reg_63_ ( .D(row3_2_real[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[63]) );
  DFFRHQX1 calc_out_reg_62_ ( .D(row3_2_real[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[62]) );
  DFFRHQX1 calc_out_reg_61_ ( .D(row3_2_real[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[61]) );
  DFFRHQX1 calc_out_reg_60_ ( .D(row3_2_real[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[60]) );
  DFFRHQX1 calc_out_reg_59_ ( .D(row3_2_real[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[59]) );
  DFFRHQX1 calc_out_reg_58_ ( .D(row3_2_real[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[58]) );
  DFFRHQX1 calc_out_reg_57_ ( .D(row3_2_real[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[57]) );
  DFFRHQX1 calc_out_reg_56_ ( .D(row3_2_real[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[56]) );
  DFFRHQX1 calc_out_reg_55_ ( .D(row3_2_real[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[55]) );
  DFFRHQX1 calc_out_reg_54_ ( .D(row3_2_real[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[54]) );
  DFFRHQX1 calc_out_reg_53_ ( .D(row3_2_real[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[53]) );
  DFFRHQX1 calc_out_reg_52_ ( .D(row3_2_real[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[52]) );
  DFFRHQX1 calc_out_reg_51_ ( .D(row3_2_real[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[51]) );
  DFFRHQX1 calc_out_reg_50_ ( .D(row3_2_imag[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[50]) );
  DFFRHQX1 calc_out_reg_49_ ( .D(row3_2_imag[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[49]) );
  DFFRHQX1 calc_out_reg_48_ ( .D(row3_2_imag[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[48]) );
  DFFRHQX1 calc_out_reg_47_ ( .D(row3_2_imag[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[47]) );
  DFFRHQX1 calc_out_reg_46_ ( .D(row3_2_imag[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[46]) );
  DFFRHQX1 calc_out_reg_45_ ( .D(row3_2_imag[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[45]) );
  DFFRHQX1 calc_out_reg_44_ ( .D(row3_2_imag[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[44]) );
  DFFRHQX1 calc_out_reg_43_ ( .D(row3_2_imag[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[43]) );
  DFFRHQX1 calc_out_reg_42_ ( .D(row3_2_imag[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[42]) );
  DFFRHQX1 calc_out_reg_41_ ( .D(row3_2_imag[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[41]) );
  DFFRHQX1 calc_out_reg_40_ ( .D(row3_2_imag[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[40]) );
  DFFRHQX1 calc_out_reg_39_ ( .D(row3_2_imag[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[39]) );
  DFFRHQX1 calc_out_reg_38_ ( .D(row3_2_imag[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[38]) );
  DFFRHQX1 calc_out_reg_37_ ( .D(row3_2_imag[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[37]) );
  DFFRHQX1 calc_out_reg_36_ ( .D(row3_2_imag[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[36]) );
  DFFRHQX1 calc_out_reg_35_ ( .D(row3_2_imag[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[35]) );
  DFFRHQX1 calc_out_reg_34_ ( .D(row3_2_imag[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[34]) );
  DFFRHQX1 calc_out_reg_33_ ( .D(row3_1_real[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[33]) );
  DFFRHQX1 calc_out_reg_32_ ( .D(row3_1_real[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[32]) );
  DFFRHQX1 calc_out_reg_31_ ( .D(row3_1_real[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[31]) );
  DFFRHQX1 calc_out_reg_30_ ( .D(row3_1_real[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[30]) );
  DFFRHQX1 calc_out_reg_29_ ( .D(row3_1_real[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[29]) );
  DFFRHQX1 calc_out_reg_28_ ( .D(row3_1_real[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[28]) );
  DFFRHQX1 calc_out_reg_27_ ( .D(row3_1_real[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[27]) );
  DFFRHQX1 calc_out_reg_26_ ( .D(row3_1_real[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[26]) );
  DFFRHQX1 calc_out_reg_25_ ( .D(row3_1_real[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[25]) );
  DFFRHQX1 calc_out_reg_24_ ( .D(row3_1_real[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[24]) );
  DFFRHQX1 calc_out_reg_23_ ( .D(row3_1_real[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[23]) );
  DFFRHQX1 calc_out_reg_22_ ( .D(row3_1_real[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[22]) );
  DFFRHQX1 calc_out_reg_21_ ( .D(row3_1_real[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[21]) );
  DFFRHQX1 calc_out_reg_20_ ( .D(row3_1_real[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[20]) );
  DFFRHQX1 calc_out_reg_19_ ( .D(row3_1_real[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[19]) );
  DFFRHQX1 calc_out_reg_18_ ( .D(row3_1_real[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[18]) );
  DFFRHQX1 calc_out_reg_17_ ( .D(row3_1_real[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[17]) );
  DFFRHQX1 calc_out_reg_16_ ( .D(row3_1_imag[16]), .CK(clk), .RN(rst_n), .Q(
        calc_out[16]) );
  DFFRHQX1 calc_out_reg_15_ ( .D(row3_1_imag[15]), .CK(clk), .RN(rst_n), .Q(
        calc_out[15]) );
  DFFRHQX1 calc_out_reg_14_ ( .D(row3_1_imag[14]), .CK(clk), .RN(rst_n), .Q(
        calc_out[14]) );
  DFFRHQX1 calc_out_reg_13_ ( .D(row3_1_imag[13]), .CK(clk), .RN(rst_n), .Q(
        calc_out[13]) );
  DFFRHQX1 calc_out_reg_12_ ( .D(row3_1_imag[12]), .CK(clk), .RN(rst_n), .Q(
        calc_out[12]) );
  DFFRHQX1 calc_out_reg_11_ ( .D(row3_1_imag[11]), .CK(clk), .RN(rst_n), .Q(
        calc_out[11]) );
  DFFRHQX1 calc_out_reg_10_ ( .D(row3_1_imag[10]), .CK(clk), .RN(rst_n), .Q(
        calc_out[10]) );
  DFFRHQX1 calc_out_reg_9_ ( .D(row3_1_imag[9]), .CK(clk), .RN(rst_n), .Q(
        calc_out[9]) );
  DFFRHQX1 calc_out_reg_8_ ( .D(row3_1_imag[8]), .CK(clk), .RN(rst_n), .Q(
        calc_out[8]) );
  DFFRHQX1 calc_out_reg_7_ ( .D(row3_1_imag[7]), .CK(clk), .RN(rst_n), .Q(
        calc_out[7]) );
  DFFRHQX1 calc_out_reg_6_ ( .D(row3_1_imag[6]), .CK(clk), .RN(rst_n), .Q(
        calc_out[6]) );
  DFFRHQX1 calc_out_reg_5_ ( .D(row3_1_imag[5]), .CK(clk), .RN(rst_n), .Q(
        calc_out[5]) );
  DFFRHQX1 calc_out_reg_4_ ( .D(row3_1_imag[4]), .CK(clk), .RN(rst_n), .Q(
        calc_out[4]) );
  DFFRHQX1 calc_out_reg_3_ ( .D(row3_1_imag[3]), .CK(clk), .RN(rst_n), .Q(
        calc_out[3]) );
  DFFRHQX1 calc_out_reg_2_ ( .D(row3_1_imag[2]), .CK(clk), .RN(rst_n), .Q(
        calc_out[2]) );
  DFFRHQX1 calc_out_reg_1_ ( .D(row3_1_imag[1]), .CK(clk), .RN(rst_n), .Q(
        calc_out[1]) );
  DFFRHQX1 calc_out_reg_0_ ( .D(row3_1_imag[0]), .CK(clk), .RN(rst_n), .Q(
        calc_out[0]) );
  NAND2X1 U37 ( .A(n47), .B(n44), .Y(N41) );
  OAI21XL U38 ( .A0(N36), .A1(n47), .B0(n46), .Y(N34) );
  NAND2X1 U39 ( .A(N36), .B(N38), .Y(N33) );
  OAI21XL U40 ( .A0(n43), .A1(N36), .B0(N38), .Y(N40) );
  INVX1 U41 ( .A(N36), .Y(n44) );
  NAND2X1 U42 ( .A(n43), .B(n46), .Y(N35) );
  INVX1 U43 ( .A(N39), .Y(n46) );
  NAND2X1 U44 ( .A(n43), .B(n44), .Y(N37) );
  INVX1 U45 ( .A(n43), .Y(n47) );
  INVX1 U46 ( .A(N38), .Y(n45) );
  NAND3BX1 U47 ( .AN(rotation[0]), .B(n43), .C(rotation[2]), .Y(N38) );
  NAND2X1 U48 ( .A(rotation[2]), .B(rotation[0]), .Y(N36) );
  OAI21XL U49 ( .A0(n43), .A1(rotation[0]), .B0(rotation[2]), .Y(N39) );
  BUFX3 U50 ( .A(rotation[1]), .Y(n43) );
endmodule


module fft ( clk, rst_n, data_in, data_out );
  input [33:0] data_in;
  output [33:0] data_out;
  input clk, rst_n;
  wire   s_p_flag, mux_flag, n1, n2;
  wire   [2:0] rotation;
  wire   [135:0] data_1;
  wire   [135:0] data_3;
  tri   clk;
  tri   rst_n;
  tri   [33:0] data_out;
  tri   demux_flag;
  tri   [135:0] data_2;
  tri   [135:0] data_4;

  ctrl ctrl0 ( .clk(clk), .rst_n(rst_n), .s_p_flag_in(s_p_flag), .mux_flag(n1), 
        .rotation(rotation), .demux_flag(demux_flag) );
  s_p s_p0 ( .clk(clk), .rst_n(rst_n), .data_in_1(data_in), .data_out_1(data_1), .s_p_flag_out(s_p_flag), .s_p_flag_mux(n2) );
  mux mux0 ( .mux_flag(mux_flag), .data_in_1(data_2), .data_in_2(data_1), 
        .data_out(data_3) );
  butterfly butterfly0 ( .clk(clk), .rst_n(rst_n), .calc_in(data_3), 
        .rotation(rotation), .calc_out(data_4) );
  reg1 reg10 ( .clk(clk), .rst_n(rst_n), .data_in_2(data_4), .data_out_2(
        data_2), .reg_datain_flag(demux_flag) );
  p_s p_s0 ( .clk(clk), .rst_n(rst_n), .p_s_flag_in(demux_flag), .data_in_3(
        data_4), .data_out_3(data_out) );
  AND2X1 U1 ( .A(n1), .B(n2), .Y(mux_flag) );
endmodule


module fft_chip ( clk, rstn, din, dout );
  input [33:0] din;
  output [33:0] dout;
  input clk, rstn;

  wire   [33:0] net_din;
  tri   net_clk;
  tri   net_rstn;
  tri   [33:0] net_dout;

  PIW PIW_clk ( .PAD(clk), .C(net_clk) );
  PIW PIW_rstn ( .PAD(rstn), .C(net_rstn) );
  PIW PIW_din0 ( .PAD(din[0]), .C(net_din[0]) );
  PIW PIW_din1 ( .PAD(din[1]), .C(net_din[1]) );
  PIW PIW_din2 ( .PAD(din[2]), .C(net_din[2]) );
  PIW PIW_din3 ( .PAD(din[3]), .C(net_din[3]) );
  PIW PIW_din4 ( .PAD(din[4]), .C(net_din[4]) );
  PIW PIW_din5 ( .PAD(din[5]), .C(net_din[5]) );
  PIW PIW_din6 ( .PAD(din[6]), .C(net_din[6]) );
  PIW PIW_din7 ( .PAD(din[7]), .C(net_din[7]) );
  PIW PIW_din8 ( .PAD(din[8]), .C(net_din[8]) );
  PIW PIW_din9 ( .PAD(din[9]), .C(net_din[9]) );
  PIW PIW_din10 ( .PAD(din[10]), .C(net_din[10]) );
  PIW PIW_din11 ( .PAD(din[11]), .C(net_din[11]) );
  PIW PIW_din12 ( .PAD(din[12]), .C(net_din[12]) );
  PIW PIW_din13 ( .PAD(din[13]), .C(net_din[13]) );
  PIW PIW_din14 ( .PAD(din[14]), .C(net_din[14]) );
  PIW PIW_din15 ( .PAD(din[15]), .C(net_din[15]) );
  PIW PIW_din16 ( .PAD(din[16]), .C(net_din[16]) );
  PIW PIW_din17 ( .PAD(din[17]), .C(net_din[17]) );
  PIW PIW_din18 ( .PAD(din[18]), .C(net_din[18]) );
  PIW PIW_din19 ( .PAD(din[19]), .C(net_din[19]) );
  PIW PIW_din20 ( .PAD(din[20]), .C(net_din[20]) );
  PIW PIW_din21 ( .PAD(din[21]), .C(net_din[21]) );
  PIW PIW_din22 ( .PAD(din[22]), .C(net_din[22]) );
  PIW PIW_din23 ( .PAD(din[23]), .C(net_din[23]) );
  PIW PIW_din24 ( .PAD(din[24]), .C(net_din[24]) );
  PIW PIW_din25 ( .PAD(din[25]), .C(net_din[25]) );
  PIW PIW_din26 ( .PAD(din[26]), .C(net_din[26]) );
  PIW PIW_din27 ( .PAD(din[27]), .C(net_din[27]) );
  PIW PIW_din28 ( .PAD(din[28]), .C(net_din[28]) );
  PIW PIW_din29 ( .PAD(din[29]), .C(net_din[29]) );
  PIW PIW_din30 ( .PAD(din[30]), .C(net_din[30]) );
  PIW PIW_din31 ( .PAD(din[31]), .C(net_din[31]) );
  PIW PIW_din32 ( .PAD(din[32]), .C(net_din[32]) );
  PIW PIW_din33 ( .PAD(din[33]), .C(net_din[33]) );
  PO8W PO8W_dout0 ( .I(net_dout[0]), .PAD(dout[0]) );
  PO8W PO8W_dout1 ( .I(net_dout[1]), .PAD(dout[1]) );
  PO8W PO8W_dout2 ( .I(net_dout[2]), .PAD(dout[2]) );
  PO8W PO8W_dout3 ( .I(net_dout[3]), .PAD(dout[3]) );
  PO8W PO8W_dout4 ( .I(net_dout[4]), .PAD(dout[4]) );
  PO8W PO8W_dout5 ( .I(net_dout[5]), .PAD(dout[5]) );
  PO8W PO8W_dout6 ( .I(net_dout[6]), .PAD(dout[6]) );
  PO8W PO8W_dout7 ( .I(net_dout[7]), .PAD(dout[7]) );
  PO8W PO8W_dout8 ( .I(net_dout[8]), .PAD(dout[8]) );
  PO8W PO8W_dout9 ( .I(net_dout[9]), .PAD(dout[9]) );
  PO8W PO8W_dout10 ( .I(net_dout[10]), .PAD(dout[10]) );
  PO8W PO8W_dout11 ( .I(net_dout[11]), .PAD(dout[11]) );
  PO8W PO8W_dout12 ( .I(net_dout[12]), .PAD(dout[12]) );
  PO8W PO8W_dout13 ( .I(net_dout[13]), .PAD(dout[13]) );
  PO8W PO8W_dout14 ( .I(net_dout[14]), .PAD(dout[14]) );
  PO8W PO8W_dout15 ( .I(net_dout[15]), .PAD(dout[15]) );
  PO8W PO8W_dout16 ( .I(net_dout[16]), .PAD(dout[16]) );
  PO8W PO8W_dout17 ( .I(net_dout[17]), .PAD(dout[17]) );
  PO8W PO8W_dout18 ( .I(net_dout[18]), .PAD(dout[18]) );
  PO8W PO8W_dout19 ( .I(net_dout[19]), .PAD(dout[19]) );
  PO8W PO8W_dout20 ( .I(net_dout[20]), .PAD(dout[20]) );
  PO8W PO8W_dout21 ( .I(net_dout[21]), .PAD(dout[21]) );
  PO8W PO8W_dout22 ( .I(net_dout[22]), .PAD(dout[22]) );
  PO8W PO8W_dout23 ( .I(net_dout[23]), .PAD(dout[23]) );
  PO8W PO8W_dout24 ( .I(net_dout[24]), .PAD(dout[24]) );
  PO8W PO8W_dout25 ( .I(net_dout[25]), .PAD(dout[25]) );
  PO8W PO8W_dout26 ( .I(net_dout[26]), .PAD(dout[26]) );
  PO8W PO8W_dout27 ( .I(net_dout[27]), .PAD(dout[27]) );
  PO8W PO8W_dout28 ( .I(net_dout[28]), .PAD(dout[28]) );
  PO8W PO8W_dout29 ( .I(net_dout[29]), .PAD(dout[29]) );
  PO8W PO8W_dout30 ( .I(net_dout[30]), .PAD(dout[30]) );
  PO8W PO8W_dout31 ( .I(net_dout[31]), .PAD(dout[31]) );
  PO8W PO8W_dout32 ( .I(net_dout[32]), .PAD(dout[32]) );
  PO8W PO8W_dout33 ( .I(net_dout[33]), .PAD(dout[33]) );
  fft inst_fft ( .clk(net_clk), .rst_n(net_rstn), .data_in(net_din), 
        .data_out(net_dout) );
endmodule

