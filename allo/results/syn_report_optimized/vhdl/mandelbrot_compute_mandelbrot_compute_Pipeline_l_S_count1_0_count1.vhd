-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mandelbrot_compute_mandelbrot_compute_Pipeline_l_S_count1_0_count1 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    count2_2_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    count2_2_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of mandelbrot_compute_mandelbrot_compute_Pipeline_l_S_count1_0_count1 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (2 downto 0) := "001";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (2 downto 0) := "010";
    constant ap_ST_fsm_pp0_stage2 : STD_LOGIC_VECTOR (2 downto 0) := "100";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv30_0 : STD_LOGIC_VECTOR (29 downto 0) := "000000000000000000000000000000";
    constant ap_const_lv10_0 : STD_LOGIC_VECTOR (9 downto 0) := "0000000000";
    constant ap_const_lv10_3E8 : STD_LOGIC_VECTOR (9 downto 0) := "1111101000";
    constant ap_const_lv10_1 : STD_LOGIC_VECTOR (9 downto 0) := "0000000001";
    constant ap_const_lv25_0 : STD_LOGIC_VECTOR (24 downto 0) := "0000000000000000000000000";
    constant ap_const_lv32_31 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110001";
    constant ap_const_lv32_67 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100111";
    constant ap_const_lv55_4000000000000 : STD_LOGIC_VECTOR (54 downto 0) := "0000100000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_19 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011001";
    constant ap_const_lv32_36 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110110";
    constant ap_const_lv32_32 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110010";
    constant ap_const_lv32_68 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001101000";
    constant ap_const_lv55_78000000000000 : STD_LOGIC_VECTOR (54 downto 0) := "1111000000000000000000000000000000000000000000000000000";
    constant ap_const_lv32_1B : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011011";
    constant ap_const_lv32_1D : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011101";
    constant ap_const_lv3_1 : STD_LOGIC_VECTOR (2 downto 0) := "001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (2 downto 0) := "001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage2 : signal is "none";
    signal ap_block_state3_pp0_stage2_iter0 : BOOLEAN;
    signal ap_block_state6_pp0_stage2_iter1 : BOOLEAN;
    signal ap_block_pp0_stage2_subdone : BOOLEAN;
    signal icmp_ln62_reg_446 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage2 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state4_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln62_fu_119_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state2_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_state5_pp0_stage1_iter1 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal v62_V_load_reg_450 : STD_LOGIC_VECTOR (29 downto 0);
    signal v57_V_load_reg_455 : STD_LOGIC_VECTOR (29 downto 0);
    signal v53_V_fu_191_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal v53_V_reg_460 : STD_LOGIC_VECTOR (29 downto 0);
    signal v71_V_fu_245_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal v71_V_reg_465 : STD_LOGIC_VECTOR (29 downto 0);
    signal sext_ln1316_2_fu_263_p1 : STD_LOGIC_VECTOR (104 downto 0);
    signal sext_ln1316_3_fu_281_p1 : STD_LOGIC_VECTOR (104 downto 0);
    signal v34_V_load_reg_482 : STD_LOGIC_VECTOR (29 downto 0);
    signal v37_fu_312_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal v37_reg_487 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal v62_V_fu_64 : STD_LOGIC_VECTOR (29 downto 0);
    signal v79_V_fu_324_p3 : STD_LOGIC_VECTOR (29 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal v57_V_fu_68 : STD_LOGIC_VECTOR (29 downto 0);
    signal v74_V_fu_330_p3 : STD_LOGIC_VECTOR (29 downto 0);
    signal v34_V_fu_72 : STD_LOGIC_VECTOR (29 downto 0);
    signal v85_V_2_fu_395_p3 : STD_LOGIC_VECTOR (29 downto 0);
    signal ap_block_pp0_stage2_11001 : BOOLEAN;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal v38_fu_76 : STD_LOGIC_VECTOR (31 downto 0);
    signal count2_1_fu_336_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_block_pp0_stage2 : BOOLEAN;
    signal count1_fu_80 : STD_LOGIC_VECTOR (9 downto 0);
    signal count1_2_fu_125_p2 : STD_LOGIC_VECTOR (9 downto 0);
    signal ap_block_pp0_stage2_01001 : BOOLEAN;
    signal v42_V_fu_137_p3 : STD_LOGIC_VECTOR (54 downto 0);
    signal v44_V_fu_145_p3 : STD_LOGIC_VECTOR (54 downto 0);
    signal r_V_2_fu_169_p2 : STD_LOGIC_VECTOR (103 downto 0);
    signal v48_V_fu_175_p4 : STD_LOGIC_VECTOR (54 downto 0);
    signal v52_V_fu_185_p2 : STD_LOGIC_VECTOR (54 downto 0);
    signal r_V_fu_201_p0 : STD_LOGIC_VECTOR (54 downto 0);
    signal sext_ln1316_fu_153_p1 : STD_LOGIC_VECTOR (104 downto 0);
    signal r_V_fu_201_p1 : STD_LOGIC_VECTOR (54 downto 0);
    signal r_V_fu_201_p2 : STD_LOGIC_VECTOR (104 downto 0);
    signal r_V_4_fu_217_p0 : STD_LOGIC_VECTOR (54 downto 0);
    signal sext_ln1319_fu_161_p1 : STD_LOGIC_VECTOR (104 downto 0);
    signal r_V_4_fu_217_p1 : STD_LOGIC_VECTOR (54 downto 0);
    signal r_V_4_fu_217_p2 : STD_LOGIC_VECTOR (104 downto 0);
    signal v58_V_fu_207_p4 : STD_LOGIC_VECTOR (54 downto 0);
    signal v66_V_fu_233_p2 : STD_LOGIC_VECTOR (54 downto 0);
    signal v63_V_fu_223_p4 : STD_LOGIC_VECTOR (54 downto 0);
    signal v70_V_fu_239_p2 : STD_LOGIC_VECTOR (54 downto 0);
    signal v73_V_fu_255_p3 : STD_LOGIC_VECTOR (54 downto 0);
    signal grp_fu_267_p0 : STD_LOGIC_VECTOR (54 downto 0);
    signal grp_fu_267_p1 : STD_LOGIC_VECTOR (54 downto 0);
    signal v78_V_fu_273_p3 : STD_LOGIC_VECTOR (54 downto 0);
    signal grp_fu_285_p0 : STD_LOGIC_VECTOR (54 downto 0);
    signal grp_fu_285_p1 : STD_LOGIC_VECTOR (54 downto 0);
    signal tmp_fu_302_p4 : STD_LOGIC_VECTOR (2 downto 0);
    signal v39_fu_318_p2 : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_fu_267_p2 : STD_LOGIC_VECTOR (104 downto 0);
    signal grp_fu_285_p2 : STD_LOGIC_VECTOR (104 downto 0);
    signal v76_V_fu_359_p4 : STD_LOGIC_VECTOR (54 downto 0);
    signal v81_V_fu_369_p4 : STD_LOGIC_VECTOR (54 downto 0);
    signal v84_V_fu_379_p2 : STD_LOGIC_VECTOR (54 downto 0);
    signal v85_V_fu_385_p4 : STD_LOGIC_VECTOR (29 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (2 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_idle_pp0_1to1 : STD_LOGIC;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component mandelbrot_compute_mul_55s_55s_104_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (54 downto 0);
        din1 : IN STD_LOGIC_VECTOR (54 downto 0);
        dout : OUT STD_LOGIC_VECTOR (103 downto 0) );
    end component;


    component mandelbrot_compute_mul_55s_55s_105_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (54 downto 0);
        din1 : IN STD_LOGIC_VECTOR (54 downto 0);
        dout : OUT STD_LOGIC_VECTOR (104 downto 0) );
    end component;


    component mandelbrot_compute_mul_55s_55s_105_5_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR (54 downto 0);
        din1 : IN STD_LOGIC_VECTOR (54 downto 0);
        ce : IN STD_LOGIC;
        dout : OUT STD_LOGIC_VECTOR (104 downto 0) );
    end component;


    component mandelbrot_compute_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    mul_55s_55s_104_1_1_U1 : component mandelbrot_compute_mul_55s_55s_104_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 55,
        din1_WIDTH => 55,
        dout_WIDTH => 104)
    port map (
        din0 => v44_V_fu_145_p3,
        din1 => v42_V_fu_137_p3,
        dout => r_V_2_fu_169_p2);

    mul_55s_55s_105_1_1_U2 : component mandelbrot_compute_mul_55s_55s_105_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 55,
        din1_WIDTH => 55,
        dout_WIDTH => 105)
    port map (
        din0 => r_V_fu_201_p0,
        din1 => r_V_fu_201_p1,
        dout => r_V_fu_201_p2);

    mul_55s_55s_105_1_1_U3 : component mandelbrot_compute_mul_55s_55s_105_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 55,
        din1_WIDTH => 55,
        dout_WIDTH => 105)
    port map (
        din0 => r_V_4_fu_217_p0,
        din1 => r_V_4_fu_217_p1,
        dout => r_V_4_fu_217_p2);

    mul_55s_55s_105_5_1_U4 : component mandelbrot_compute_mul_55s_55s_105_5_1
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 55,
        din1_WIDTH => 55,
        dout_WIDTH => 105)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_267_p0,
        din1 => grp_fu_267_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_267_p2);

    mul_55s_55s_105_5_1_U5 : component mandelbrot_compute_mul_55s_55s_105_5_1
    generic map (
        ID => 1,
        NUM_STAGE => 5,
        din0_WIDTH => 55,
        din1_WIDTH => 55,
        dout_WIDTH => 105)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        din0 => grp_fu_285_p0,
        din1 => grp_fu_285_p1,
        ce => ap_const_logic_1,
        dout => grp_fu_285_p2);

    flow_control_loop_pipe_sequential_init_U : component mandelbrot_compute_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage2,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage2)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    count1_fu_80_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                count1_fu_80 <= ap_const_lv10_0;
            elsif (((icmp_ln62_fu_119_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                count1_fu_80 <= count1_2_fu_125_p2;
            end if; 
        end if;
    end process;

    v34_V_fu_72_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0) and (ap_loop_init = ap_const_logic_1))) then 
                v34_V_fu_72 <= ap_const_lv30_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
                v34_V_fu_72 <= v85_V_2_fu_395_p3;
            end if; 
        end if;
    end process;

    v38_fu_76_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    v38_fu_76 <= ap_const_lv32_0;
                elsif (((icmp_ln62_reg_446 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    v38_fu_76 <= count2_1_fu_336_p3;
                end if;
            end if; 
        end if;
    end process;

    v57_V_fu_68_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    v57_V_fu_68 <= ap_const_lv30_0;
                elsif (((icmp_ln62_reg_446 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    v57_V_fu_68 <= v74_V_fu_330_p3;
                end if;
            end if; 
        end if;
    end process;

    v62_V_fu_64_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    v62_V_fu_64 <= ap_const_lv30_0;
                elsif (((icmp_ln62_reg_446 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    v62_V_fu_64 <= v79_V_fu_324_p3;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                icmp_ln62_reg_446 <= icmp_ln62_fu_119_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln62_reg_446 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                v34_V_load_reg_482 <= v34_V_fu_72;
                v37_reg_487 <= v37_fu_312_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((icmp_ln62_fu_119_p2 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                v53_V_reg_460 <= v52_V_fu_185_p2(54 downto 25);
                v57_V_load_reg_455 <= v57_V_fu_68;
                v62_V_load_reg_450 <= v62_V_fu_64;
                v71_V_reg_465 <= v70_V_fu_239_p2(54 downto 25);
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage2_subdone, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to1, ap_block_pp0_stage1_subdone, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_idle_pp0_1to1 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_pp0_stage2 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                end if;
            when others =>  
                ap_NS_fsm <= "XXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
    ap_CS_fsm_pp0_stage2 <= ap_CS_fsm(2);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage2_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage1_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state6_pp0_stage2_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter0_stage2_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone, icmp_ln62_reg_446)
    begin
        if (((icmp_ln62_reg_446 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_condition_exit_pp0_iter0_stage2 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to1_assign_proc : process(ap_enable_reg_pp0_iter1)
    begin
        if ((ap_enable_reg_pp0_iter1 = ap_const_logic_0)) then 
            ap_idle_pp0_1to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to1 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage2;

    ap_ready_int_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    count1_2_fu_125_p2 <= std_logic_vector(unsigned(count1_fu_80) + unsigned(ap_const_lv10_1));
    count2_1_fu_336_p3 <= 
        v39_fu_318_p2 when (v37_fu_312_p2(0) = '1') else 
        v38_fu_76;
    count2_2_out <= v38_fu_76;

    count2_2_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage2, icmp_ln62_reg_446, ap_block_pp0_stage2_11001)
    begin
        if (((icmp_ln62_reg_446 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            count2_2_out_ap_vld <= ap_const_logic_1;
        else 
            count2_2_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    grp_fu_267_p0 <= sext_ln1316_2_fu_263_p1(55 - 1 downto 0);
    grp_fu_267_p1 <= sext_ln1316_2_fu_263_p1(55 - 1 downto 0);
    grp_fu_285_p0 <= sext_ln1316_3_fu_281_p1(55 - 1 downto 0);
    grp_fu_285_p1 <= sext_ln1316_3_fu_281_p1(55 - 1 downto 0);
    icmp_ln62_fu_119_p2 <= "1" when (count1_fu_80 = ap_const_lv10_3E8) else "0";
    r_V_4_fu_217_p0 <= sext_ln1319_fu_161_p1(55 - 1 downto 0);
    r_V_4_fu_217_p1 <= sext_ln1319_fu_161_p1(55 - 1 downto 0);
    r_V_fu_201_p0 <= sext_ln1316_fu_153_p1(55 - 1 downto 0);
    r_V_fu_201_p1 <= sext_ln1316_fu_153_p1(55 - 1 downto 0);
        sext_ln1316_2_fu_263_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(v73_V_fu_255_p3),105));

        sext_ln1316_3_fu_281_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(v78_V_fu_273_p3),105));

        sext_ln1316_fu_153_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(v42_V_fu_137_p3),105));

        sext_ln1319_fu_161_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(v44_V_fu_145_p3),105));

    tmp_fu_302_p4 <= v34_V_fu_72(29 downto 27);
    v37_fu_312_p2 <= "1" when (signed(tmp_fu_302_p4) < signed(ap_const_lv3_1)) else "0";
    v39_fu_318_p2 <= std_logic_vector(unsigned(v38_fu_76) + unsigned(ap_const_lv32_1));
    v42_V_fu_137_p3 <= (v57_V_fu_68 & ap_const_lv25_0);
    v44_V_fu_145_p3 <= (v62_V_fu_64 & ap_const_lv25_0);
    v48_V_fu_175_p4 <= r_V_2_fu_169_p2(103 downto 49);
    v52_V_fu_185_p2 <= std_logic_vector(unsigned(v48_V_fu_175_p4) + unsigned(ap_const_lv55_4000000000000));
    v53_V_fu_191_p4 <= v52_V_fu_185_p2(54 downto 25);
    v58_V_fu_207_p4 <= r_V_fu_201_p2(104 downto 50);
    v63_V_fu_223_p4 <= r_V_4_fu_217_p2(104 downto 50);
    v66_V_fu_233_p2 <= std_logic_vector(unsigned(v58_V_fu_207_p4) + unsigned(ap_const_lv55_78000000000000));
    v70_V_fu_239_p2 <= std_logic_vector(unsigned(v66_V_fu_233_p2) - unsigned(v63_V_fu_223_p4));
    v71_V_fu_245_p4 <= v70_V_fu_239_p2(54 downto 25);
    v73_V_fu_255_p3 <= (v71_V_fu_245_p4 & ap_const_lv25_0);
    v74_V_fu_330_p3 <= 
        v71_V_reg_465 when (v37_fu_312_p2(0) = '1') else 
        v57_V_load_reg_455;
    v76_V_fu_359_p4 <= grp_fu_267_p2(104 downto 50);
    v78_V_fu_273_p3 <= (v53_V_fu_191_p4 & ap_const_lv25_0);
    v79_V_fu_324_p3 <= 
        v53_V_reg_460 when (v37_fu_312_p2(0) = '1') else 
        v62_V_load_reg_450;
    v81_V_fu_369_p4 <= grp_fu_285_p2(104 downto 50);
    v84_V_fu_379_p2 <= std_logic_vector(unsigned(v76_V_fu_359_p4) + unsigned(v81_V_fu_369_p4));
    v85_V_2_fu_395_p3 <= 
        v85_V_fu_385_p4 when (v37_reg_487(0) = '1') else 
        v34_V_load_reg_482;
    v85_V_fu_385_p4 <= v84_V_fu_379_p2(54 downto 25);
end behav;