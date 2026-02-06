module top (busy,
    clk,
    en,
    rst,
    tx,
    data_in);
 output busy;
 input clk;
 input en;
 input rst;
 output tx;
 input [7:0] data_in;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire \baud_inst.baud_tick ;
 wire \baud_inst.cnt[0] ;
 wire \baud_inst.cnt[10] ;
 wire \baud_inst.cnt[11] ;
 wire \baud_inst.cnt[12] ;
 wire \baud_inst.cnt[1] ;
 wire \baud_inst.cnt[2] ;
 wire \baud_inst.cnt[3] ;
 wire \baud_inst.cnt[4] ;
 wire \baud_inst.cnt[5] ;
 wire \baud_inst.cnt[6] ;
 wire \baud_inst.cnt[7] ;
 wire \baud_inst.cnt[8] ;
 wire \baud_inst.cnt[9] ;
 wire \uart_tx_inst.cnt[0] ;
 wire \uart_tx_inst.cnt[1] ;
 wire \uart_tx_inst.cnt[2] ;
 wire \uart_tx_inst.data_reg[0] ;
 wire \uart_tx_inst.data_reg[1] ;
 wire \uart_tx_inst.data_reg[2] ;
 wire \uart_tx_inst.data_reg[3] ;
 wire \uart_tx_inst.data_reg[4] ;
 wire \uart_tx_inst.data_reg[5] ;
 wire \uart_tx_inst.data_reg[6] ;
 wire \uart_tx_inst.data_reg[7] ;
 wire \uart_tx_inst.state[0] ;
 wire \uart_tx_inst.state[1] ;
 wire \uart_tx_inst.state[2] ;
 wire \uart_tx_inst.state[3] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;

 sky130_fd_sc_hd__inv_2 _110_ (.A(net17),
    .Y(_034_));
 sky130_fd_sc_hd__inv_2 _111_ (.A(net17),
    .Y(_035_));
 sky130_fd_sc_hd__inv_2 _112_ (.A(net17),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _113_ (.A(net17),
    .Y(_037_));
 sky130_fd_sc_hd__inv_2 _114_ (.A(net15),
    .Y(_038_));
 sky130_fd_sc_hd__inv_2 _115_ (.A(net15),
    .Y(_039_));
 sky130_fd_sc_hd__inv_2 _116_ (.A(net15),
    .Y(_040_));
 sky130_fd_sc_hd__inv_2 _117_ (.A(net16),
    .Y(_041_));
 sky130_fd_sc_hd__inv_2 _118_ (.A(net16),
    .Y(_042_));
 sky130_fd_sc_hd__inv_2 _119_ (.A(net16),
    .Y(_043_));
 sky130_fd_sc_hd__inv_2 _120_ (.A(net16),
    .Y(_044_));
 sky130_fd_sc_hd__inv_2 _121_ (.A(net16),
    .Y(_045_));
 sky130_fd_sc_hd__inv_2 _122_ (.A(net16),
    .Y(_046_));
 sky130_fd_sc_hd__inv_2 _123_ (.A(net16),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _124_ (.A(net18),
    .Y(_048_));
 sky130_fd_sc_hd__inv_2 _125_ (.A(\uart_tx_inst.cnt[2] ),
    .Y(_061_));
 sky130_fd_sc_hd__inv_2 _126_ (.A(\baud_inst.baud_tick ),
    .Y(_062_));
 sky130_fd_sc_hd__inv_2 _127_ (.A(net9),
    .Y(_063_));
 sky130_fd_sc_hd__inv_2 _128_ (.A(\baud_inst.cnt[0] ),
    .Y(_005_));
 sky130_fd_sc_hd__inv_2 _129_ (.A(\baud_inst.cnt[5] ),
    .Y(_064_));
 sky130_fd_sc_hd__inv_2 _130_ (.A(\baud_inst.cnt[7] ),
    .Y(_065_));
 sky130_fd_sc_hd__inv_2 _131_ (.A(\baud_inst.cnt[11] ),
    .Y(_066_));
 sky130_fd_sc_hd__inv_2 _132_ (.A(net15),
    .Y(_018_));
 sky130_fd_sc_hd__nand2b_1 _133_ (.A_N(\uart_tx_inst.state[1] ),
    .B(\uart_tx_inst.state[0] ),
    .Y(_067_));
 sky130_fd_sc_hd__and2_1 _134_ (.A(\uart_tx_inst.state[1] ),
    .B(\baud_inst.baud_tick ),
    .X(_068_));
 sky130_fd_sc_hd__nand2_1 _135_ (.A(\uart_tx_inst.state[1] ),
    .B(\baud_inst.baud_tick ),
    .Y(_069_));
 sky130_fd_sc_hd__and3_1 _136_ (.A(net13),
    .B(net14),
    .C(_068_),
    .X(_070_));
 sky130_fd_sc_hd__o21a_1 _137_ (.A1(\uart_tx_inst.cnt[2] ),
    .A2(_070_),
    .B1(_067_),
    .X(_060_));
 sky130_fd_sc_hd__and3_1 _138_ (.A(\uart_tx_inst.cnt[2] ),
    .B(\uart_tx_inst.cnt[1] ),
    .C(net14),
    .X(_071_));
 sky130_fd_sc_hd__o21a_1 _139_ (.A1(_069_),
    .A2(_071_),
    .B1(_067_),
    .X(_072_));
 sky130_fd_sc_hd__nor2_1 _140_ (.A(net13),
    .B(net14),
    .Y(_073_));
 sky130_fd_sc_hd__a21o_1 _141_ (.A1(net13),
    .A2(net14),
    .B1(_069_),
    .X(_074_));
 sky130_fd_sc_hd__a2bb2o_1 _142_ (.A1_N(_073_),
    .A2_N(_074_),
    .B1(net13),
    .B2(_072_),
    .X(_059_));
 sky130_fd_sc_hd__mux2_1 _143_ (.A0(_068_),
    .A1(_072_),
    .S(\uart_tx_inst.cnt[0] ),
    .X(_058_));
 sky130_fd_sc_hd__nand2_4 _144_ (.A(\uart_tx_inst.state[0] ),
    .B(net9),
    .Y(_075_));
 sky130_fd_sc_hd__mux2_1 _145_ (.A0(net8),
    .A1(\uart_tx_inst.data_reg[7] ),
    .S(_075_),
    .X(_057_));
 sky130_fd_sc_hd__mux2_1 _146_ (.A0(net7),
    .A1(\uart_tx_inst.data_reg[6] ),
    .S(_075_),
    .X(_056_));
 sky130_fd_sc_hd__mux2_1 _147_ (.A0(net6),
    .A1(\uart_tx_inst.data_reg[5] ),
    .S(_075_),
    .X(_055_));
 sky130_fd_sc_hd__mux2_1 _148_ (.A0(net5),
    .A1(\uart_tx_inst.data_reg[4] ),
    .S(_075_),
    .X(_054_));
 sky130_fd_sc_hd__mux2_1 _149_ (.A0(net4),
    .A1(\uart_tx_inst.data_reg[3] ),
    .S(_075_),
    .X(_053_));
 sky130_fd_sc_hd__mux2_1 _150_ (.A0(net3),
    .A1(\uart_tx_inst.data_reg[2] ),
    .S(_075_),
    .X(_052_));
 sky130_fd_sc_hd__mux2_1 _151_ (.A0(net2),
    .A1(\uart_tx_inst.data_reg[1] ),
    .S(_075_),
    .X(_051_));
 sky130_fd_sc_hd__mux2_1 _152_ (.A0(net1),
    .A1(\uart_tx_inst.data_reg[0] ),
    .S(_075_),
    .X(_050_));
 sky130_fd_sc_hd__mux2_1 _153_ (.A0(net11),
    .A1(net9),
    .S(\uart_tx_inst.state[0] ),
    .X(_076_));
 sky130_fd_sc_hd__or3_1 _154_ (.A(\uart_tx_inst.state[3] ),
    .B(\uart_tx_inst.state[1] ),
    .C(_076_),
    .X(_049_));
 sky130_fd_sc_hd__nand2_1 _155_ (.A(\baud_inst.baud_tick ),
    .B(_071_),
    .Y(_077_));
 sky130_fd_sc_hd__a22o_1 _156_ (.A1(\uart_tx_inst.state[3] ),
    .A2(_062_),
    .B1(_070_),
    .B2(\uart_tx_inst.cnt[2] ),
    .X(_003_));
 sky130_fd_sc_hd__a21bo_1 _157_ (.A1(_062_),
    .A2(\uart_tx_inst.state[2] ),
    .B1_N(_075_),
    .X(_002_));
 sky130_fd_sc_hd__a22o_1 _158_ (.A1(\baud_inst.baud_tick ),
    .A2(\uart_tx_inst.state[2] ),
    .B1(_077_),
    .B2(\uart_tx_inst.state[1] ),
    .X(_001_));
 sky130_fd_sc_hd__a22o_1 _159_ (.A1(\uart_tx_inst.state[3] ),
    .A2(\baud_inst.baud_tick ),
    .B1(_063_),
    .B2(\uart_tx_inst.state[0] ),
    .X(_000_));
 sky130_fd_sc_hd__and2_1 _160_ (.A(\baud_inst.cnt[1] ),
    .B(\baud_inst.cnt[0] ),
    .X(_078_));
 sky130_fd_sc_hd__nand2_1 _161_ (.A(\baud_inst.cnt[2] ),
    .B(_078_),
    .Y(_079_));
 sky130_fd_sc_hd__or3b_1 _162_ (.A(\baud_inst.cnt[8] ),
    .B(\baud_inst.cnt[11] ),
    .C_N(\baud_inst.cnt[10] ),
    .X(_080_));
 sky130_fd_sc_hd__and4b_1 _163_ (.A_N(\baud_inst.cnt[5] ),
    .B(\baud_inst.cnt[4] ),
    .C(\baud_inst.cnt[6] ),
    .D(\baud_inst.cnt[12] ),
    .X(_081_));
 sky130_fd_sc_hd__or4b_1 _164_ (.A(\baud_inst.cnt[7] ),
    .B(\baud_inst.cnt[9] ),
    .C(_080_),
    .D_N(_081_),
    .X(_082_));
 sky130_fd_sc_hd__or3_2 _165_ (.A(\baud_inst.cnt[3] ),
    .B(_079_),
    .C(_082_),
    .X(_083_));
 sky130_fd_sc_hd__inv_2 _166_ (.A(_083_),
    .Y(_004_));
 sky130_fd_sc_hd__nor2_1 _167_ (.A(\baud_inst.cnt[1] ),
    .B(\baud_inst.cnt[0] ),
    .Y(_084_));
 sky130_fd_sc_hd__nor2_1 _168_ (.A(_078_),
    .B(_084_),
    .Y(_009_));
 sky130_fd_sc_hd__xor2_1 _169_ (.A(\baud_inst.cnt[2] ),
    .B(_078_),
    .X(_010_));
 sky130_fd_sc_hd__or3b_1 _170_ (.A(\baud_inst.cnt[3] ),
    .B(_079_),
    .C_N(_082_),
    .X(_085_));
 sky130_fd_sc_hd__a21bo_1 _171_ (.A1(\baud_inst.cnt[3] ),
    .A2(_079_),
    .B1_N(_085_),
    .X(_011_));
 sky130_fd_sc_hd__and4_1 _172_ (.A(\baud_inst.cnt[1] ),
    .B(\baud_inst.cnt[0] ),
    .C(\baud_inst.cnt[3] ),
    .D(\baud_inst.cnt[2] ),
    .X(_086_));
 sky130_fd_sc_hd__nand2_1 _173_ (.A(\baud_inst.cnt[4] ),
    .B(_086_),
    .Y(_087_));
 sky130_fd_sc_hd__or2_1 _174_ (.A(\baud_inst.cnt[4] ),
    .B(_086_),
    .X(_088_));
 sky130_fd_sc_hd__and3_1 _175_ (.A(_083_),
    .B(_087_),
    .C(_088_),
    .X(_012_));
 sky130_fd_sc_hd__and3_1 _176_ (.A(\baud_inst.cnt[5] ),
    .B(\baud_inst.cnt[4] ),
    .C(_086_),
    .X(_089_));
 sky130_fd_sc_hd__a21oi_1 _177_ (.A1(_064_),
    .A2(_087_),
    .B1(_089_),
    .Y(_013_));
 sky130_fd_sc_hd__or2_1 _178_ (.A(\baud_inst.cnt[6] ),
    .B(_089_),
    .X(_090_));
 sky130_fd_sc_hd__nand2_1 _179_ (.A(\baud_inst.cnt[6] ),
    .B(_089_),
    .Y(_091_));
 sky130_fd_sc_hd__and3_1 _180_ (.A(_083_),
    .B(_090_),
    .C(_091_),
    .X(_014_));
 sky130_fd_sc_hd__and2_1 _181_ (.A(\baud_inst.cnt[7] ),
    .B(\baud_inst.cnt[6] ),
    .X(_092_));
 sky130_fd_sc_hd__and4_2 _182_ (.A(\baud_inst.cnt[5] ),
    .B(\baud_inst.cnt[4] ),
    .C(_086_),
    .D(_092_),
    .X(_093_));
 sky130_fd_sc_hd__a21oi_1 _183_ (.A1(_065_),
    .A2(_091_),
    .B1(_093_),
    .Y(_015_));
 sky130_fd_sc_hd__and2_1 _184_ (.A(\baud_inst.cnt[8] ),
    .B(_093_),
    .X(_094_));
 sky130_fd_sc_hd__nor2_1 _185_ (.A(\baud_inst.cnt[8] ),
    .B(_093_),
    .Y(_095_));
 sky130_fd_sc_hd__nor2_1 _186_ (.A(_094_),
    .B(_095_),
    .Y(_016_));
 sky130_fd_sc_hd__and3_1 _187_ (.A(\baud_inst.cnt[9] ),
    .B(\baud_inst.cnt[8] ),
    .C(_093_),
    .X(_096_));
 sky130_fd_sc_hd__o21ba_1 _188_ (.A1(\baud_inst.cnt[9] ),
    .A2(_094_),
    .B1_N(_096_),
    .X(_017_));
 sky130_fd_sc_hd__nand4_1 _189_ (.A(\baud_inst.cnt[9] ),
    .B(\baud_inst.cnt[8] ),
    .C(\baud_inst.cnt[10] ),
    .D(_093_),
    .Y(_097_));
 sky130_fd_sc_hd__o211a_1 _190_ (.A1(\baud_inst.cnt[10] ),
    .A2(_096_),
    .B1(_097_),
    .C1(_083_),
    .X(_006_));
 sky130_fd_sc_hd__and4_1 _191_ (.A(\baud_inst.cnt[9] ),
    .B(\baud_inst.cnt[8] ),
    .C(\baud_inst.cnt[11] ),
    .D(\baud_inst.cnt[10] ),
    .X(_098_));
 sky130_fd_sc_hd__a22oi_1 _192_ (.A1(_066_),
    .A2(_097_),
    .B1(_098_),
    .B2(_093_),
    .Y(_007_));
 sky130_fd_sc_hd__nand3_1 _193_ (.A(\baud_inst.cnt[12] ),
    .B(_093_),
    .C(_098_),
    .Y(_099_));
 sky130_fd_sc_hd__a21o_1 _194_ (.A1(_093_),
    .A2(_098_),
    .B1(\baud_inst.cnt[12] ),
    .X(_100_));
 sky130_fd_sc_hd__and3_1 _195_ (.A(_083_),
    .B(_099_),
    .C(_100_),
    .X(_008_));
 sky130_fd_sc_hd__and3b_1 _196_ (.A_N(net13),
    .B(net14),
    .C(\uart_tx_inst.data_reg[5] ),
    .X(_101_));
 sky130_fd_sc_hd__and3b_1 _197_ (.A_N(net14),
    .B(\uart_tx_inst.data_reg[6] ),
    .C(net13),
    .X(_102_));
 sky130_fd_sc_hd__a311o_1 _198_ (.A1(net13),
    .A2(net14),
    .A3(\uart_tx_inst.data_reg[7] ),
    .B1(_101_),
    .C1(_102_),
    .X(_103_));
 sky130_fd_sc_hd__a211o_1 _199_ (.A1(\uart_tx_inst.data_reg[4] ),
    .A2(_073_),
    .B1(_103_),
    .C1(_061_),
    .X(_104_));
 sky130_fd_sc_hd__and3b_1 _200_ (.A_N(net14),
    .B(\uart_tx_inst.data_reg[2] ),
    .C(net13),
    .X(_105_));
 sky130_fd_sc_hd__and3b_1 _201_ (.A_N(net13),
    .B(net14),
    .C(\uart_tx_inst.data_reg[1] ),
    .X(_106_));
 sky130_fd_sc_hd__a311o_1 _202_ (.A1(net13),
    .A2(net14),
    .A3(\uart_tx_inst.data_reg[3] ),
    .B1(_105_),
    .C1(_106_),
    .X(_107_));
 sky130_fd_sc_hd__a211o_1 _203_ (.A1(\uart_tx_inst.data_reg[0] ),
    .A2(_073_),
    .B1(_107_),
    .C1(\uart_tx_inst.cnt[2] ),
    .X(_108_));
 sky130_fd_sc_hd__a311o_1 _204_ (.A1(\uart_tx_inst.state[1] ),
    .A2(_104_),
    .A3(_108_),
    .B1(\uart_tx_inst.state[0] ),
    .C1(\uart_tx_inst.state[3] ),
    .X(_109_));
 sky130_fd_sc_hd__inv_2 _205_ (.A(net15),
    .Y(_019_));
 sky130_fd_sc_hd__inv_2 _206_ (.A(net15),
    .Y(_020_));
 sky130_fd_sc_hd__inv_2 _207_ (.A(net15),
    .Y(_021_));
 sky130_fd_sc_hd__inv_2 _208_ (.A(net15),
    .Y(_022_));
 sky130_fd_sc_hd__inv_2 _209_ (.A(net15),
    .Y(_023_));
 sky130_fd_sc_hd__inv_2 _210_ (.A(net15),
    .Y(_024_));
 sky130_fd_sc_hd__inv_2 _211_ (.A(net17),
    .Y(_025_));
 sky130_fd_sc_hd__inv_2 _212_ (.A(net17),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _213_ (.A(net17),
    .Y(_027_));
 sky130_fd_sc_hd__inv_2 _214_ (.A(net17),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _215_ (.A(net17),
    .Y(_029_));
 sky130_fd_sc_hd__inv_2 _216_ (.A(net17),
    .Y(_030_));
 sky130_fd_sc_hd__inv_2 _217_ (.A(net16),
    .Y(_031_));
 sky130_fd_sc_hd__inv_2 _218_ (.A(net18),
    .Y(_032_));
 sky130_fd_sc_hd__inv_2 _219_ (.A(net18),
    .Y(_033_));
 sky130_fd_sc_hd__dfrtp_2 _220_ (.CLK(clk),
    .D(_004_),
    .RESET_B(_018_),
    .Q(\baud_inst.baud_tick ));
 sky130_fd_sc_hd__dfrtp_1 _221_ (.CLK(clk),
    .D(_005_),
    .RESET_B(_019_),
    .Q(\baud_inst.cnt[0] ));
 sky130_fd_sc_hd__dfrtp_1 _222_ (.CLK(clk),
    .D(_009_),
    .RESET_B(_020_),
    .Q(\baud_inst.cnt[1] ));
 sky130_fd_sc_hd__dfrtp_1 _223_ (.CLK(clk),
    .D(_010_),
    .RESET_B(_021_),
    .Q(\baud_inst.cnt[2] ));
 sky130_fd_sc_hd__dfrtp_1 _224_ (.CLK(clk),
    .D(_011_),
    .RESET_B(_022_),
    .Q(\baud_inst.cnt[3] ));
 sky130_fd_sc_hd__dfrtp_1 _225_ (.CLK(clk),
    .D(_012_),
    .RESET_B(_023_),
    .Q(\baud_inst.cnt[4] ));
 sky130_fd_sc_hd__dfrtp_1 _226_ (.CLK(clk),
    .D(_013_),
    .RESET_B(_024_),
    .Q(\baud_inst.cnt[5] ));
 sky130_fd_sc_hd__dfrtp_1 _227_ (.CLK(clk),
    .D(_014_),
    .RESET_B(_025_),
    .Q(\baud_inst.cnt[6] ));
 sky130_fd_sc_hd__dfrtp_1 _228_ (.CLK(clk),
    .D(_015_),
    .RESET_B(_026_),
    .Q(\baud_inst.cnt[7] ));
 sky130_fd_sc_hd__dfrtp_1 _229_ (.CLK(clk),
    .D(_016_),
    .RESET_B(_027_),
    .Q(\baud_inst.cnt[8] ));
 sky130_fd_sc_hd__dfrtp_1 _230_ (.CLK(clk),
    .D(_017_),
    .RESET_B(_028_),
    .Q(\baud_inst.cnt[9] ));
 sky130_fd_sc_hd__dfrtp_1 _231_ (.CLK(clk),
    .D(_006_),
    .RESET_B(_029_),
    .Q(\baud_inst.cnt[10] ));
 sky130_fd_sc_hd__dfrtp_1 _232_ (.CLK(clk),
    .D(_007_),
    .RESET_B(_030_),
    .Q(\baud_inst.cnt[11] ));
 sky130_fd_sc_hd__dfrtp_1 _233_ (.CLK(clk),
    .D(_008_),
    .RESET_B(_031_),
    .Q(\baud_inst.cnt[12] ));
 sky130_fd_sc_hd__dfstp_1 _234_ (.CLK(clk),
    .D(_000_),
    .SET_B(_032_),
    .Q(\uart_tx_inst.state[0] ));
 sky130_fd_sc_hd__dfrtp_1 _235_ (.CLK(clk),
    .D(_001_),
    .RESET_B(_033_),
    .Q(\uart_tx_inst.state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _236_ (.CLK(clk),
    .D(_002_),
    .RESET_B(_034_),
    .Q(\uart_tx_inst.state[2] ));
 sky130_fd_sc_hd__dfrtp_1 _237_ (.CLK(clk),
    .D(_003_),
    .RESET_B(_035_),
    .Q(\uart_tx_inst.state[3] ));
 sky130_fd_sc_hd__dfrtp_1 _238_ (.CLK(clk),
    .D(_049_),
    .RESET_B(_036_),
    .Q(net11));
 sky130_fd_sc_hd__dfstp_1 _239_ (.CLK(clk),
    .D(_109_),
    .SET_B(_037_),
    .Q(net12));
 sky130_fd_sc_hd__dfrtp_1 _240_ (.CLK(clk),
    .D(_050_),
    .RESET_B(_038_),
    .Q(\uart_tx_inst.data_reg[0] ));
 sky130_fd_sc_hd__dfrtp_1 _241_ (.CLK(clk),
    .D(_051_),
    .RESET_B(_039_),
    .Q(\uart_tx_inst.data_reg[1] ));
 sky130_fd_sc_hd__dfrtp_1 _242_ (.CLK(clk),
    .D(_052_),
    .RESET_B(_040_),
    .Q(\uart_tx_inst.data_reg[2] ));
 sky130_fd_sc_hd__dfrtp_1 _243_ (.CLK(clk),
    .D(_053_),
    .RESET_B(_041_),
    .Q(\uart_tx_inst.data_reg[3] ));
 sky130_fd_sc_hd__dfrtp_1 _244_ (.CLK(clk),
    .D(_054_),
    .RESET_B(_042_),
    .Q(\uart_tx_inst.data_reg[4] ));
 sky130_fd_sc_hd__dfrtp_1 _245_ (.CLK(clk),
    .D(_055_),
    .RESET_B(_043_),
    .Q(\uart_tx_inst.data_reg[5] ));
 sky130_fd_sc_hd__dfrtp_1 _246_ (.CLK(clk),
    .D(_056_),
    .RESET_B(_044_),
    .Q(\uart_tx_inst.data_reg[6] ));
 sky130_fd_sc_hd__dfrtp_1 _247_ (.CLK(clk),
    .D(_057_),
    .RESET_B(_045_),
    .Q(\uart_tx_inst.data_reg[7] ));
 sky130_fd_sc_hd__dfrtp_1 _248_ (.CLK(clk),
    .D(_058_),
    .RESET_B(_046_),
    .Q(\uart_tx_inst.cnt[0] ));
 sky130_fd_sc_hd__dfrtp_1 _249_ (.CLK(clk),
    .D(_059_),
    .RESET_B(_047_),
    .Q(\uart_tx_inst.cnt[1] ));
 sky130_fd_sc_hd__dfrtp_1 _250_ (.CLK(clk),
    .D(_060_),
    .RESET_B(_048_),
    .Q(\uart_tx_inst.cnt[2] ));
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Right_0 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Right_1 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Right_2 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Right_3 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Right_4 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Right_5 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Right_6 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Right_7 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Right_8 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Right_9 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Right_10 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Right_11 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Right_12 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Right_13 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Right_14 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Right_15 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Right_16 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Right_17 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Right_18 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Right_19 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_0_Left_20 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_1_Left_21 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_2_Left_22 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_3_Left_23 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_4_Left_24 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_5_Left_25 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_6_Left_26 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_7_Left_27 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_8_Left_28 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_9_Left_29 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_10_Left_30 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_11_Left_31 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_12_Left_32 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_13_Left_33 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_14_Left_34 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_15_Left_35 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_16_Left_36 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_17_Left_37 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_18_Left_38 ();
 sky130_fd_sc_hd__decap_3 PHY_EDGE_ROW_19_Left_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_0_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_1_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_2_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_3_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_4_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_5_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_6_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_7_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_8_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_9_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_10_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_11_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_12_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_13_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_14_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_15_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_16_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_17_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_18_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_TAPCELL_ROW_19_83 ();
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(data_in[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(data_in[1]),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(data_in[2]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(data_in[3]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_1 input5 (.A(data_in[4]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(data_in[5]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_1 input7 (.A(data_in[6]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_1 input8 (.A(data_in[7]),
    .X(net8));
 sky130_fd_sc_hd__clkbuf_2 input9 (.A(en),
    .X(net9));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(rst),
    .X(net10));
 sky130_fd_sc_hd__buf_2 output11 (.A(net11),
    .X(busy));
 sky130_fd_sc_hd__buf_2 output12 (.A(net12),
    .X(tx));
 sky130_fd_sc_hd__clkbuf_2 fanout13 (.A(\uart_tx_inst.cnt[1] ),
    .X(net13));
 sky130_fd_sc_hd__clkbuf_2 fanout14 (.A(\uart_tx_inst.cnt[0] ),
    .X(net14));
 sky130_fd_sc_hd__buf_4 fanout15 (.A(net16),
    .X(net15));
 sky130_fd_sc_hd__clkbuf_4 fanout16 (.A(net18),
    .X(net16));
 sky130_fd_sc_hd__buf_4 fanout17 (.A(net18),
    .X(net17));
 sky130_fd_sc_hd__clkbuf_2 fanout18 (.A(net10),
    .X(net18));
endmodule
