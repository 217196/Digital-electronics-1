# Counter
## 1. Table with connection of push buttons on Nexys A7 board
 | **Button name** | **Pin** | **Voltage when off** | **Voltage when on** |
   | :-: | :-: | :-: | :-: |
   | BTNL | P17 | 0V | 3.3V |
   | BTNR | M17 | 0V | 3.3V |
   | BTNU | M18 | 0V | 3.3V |
   | BTND | P18 | 0V | 3.3V |
   | BTNC | N17 | 0V | 3.3V |
   | BTNRES | C12 | 0V | 3.3V |
  
  ## 2. Table with calculated values
  | **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
   | :-: | :-: | :-: | :-: |
   | 2&nbsp;ms | 200 000 | `x"3_0d40"` | `b"0011_0000_1101_0100_0000"` |
   | 4&nbsp;ms | 400 000 | `x"6_1A80"` | `b"0110_0001_1010_1000_0000"` |
   | 10&nbsp;ms | 1 000 000 | `x"F_4240"` | `b"1111_0100_0010_0100_0000"` |
   | 250&nbsp;ms | 25 000 000 | `x"17D_7840"` | `b"0001_0111_1101_0111_1000_0100_0000"` |
   | 500&nbsp;ms | 50 000 000 | `x"2FA_F080"` | `b"0010_1111_1010_1111_0000_1000_0000"` |
   | 1&nbsp;sec | 100 000 000 | `x"5F5_E100"` | `b"0101_1111_0101_1110_0001_0000_0000"` |
   
   ## 3. Bidirectional counter
   ### Listing of VHDL code of the process p_cnt_up_down with syntax highlighting
   ```vhdl 
   p_clk_ena : process(clk)
    begin
        if rising_edge(clk) then        -- Synchronous process (falling_edge - sestupná hrana)

            if (reset = '1') then       -- High active reset
                s_cnt_local <= 0;       -- Clear local counter
                ce_o        <= '0';     -- Set output to low

            -- Test number of clock periods
            elsif (s_cnt_local >= (g_MAX - 1)) then
                s_cnt_local <= 0;       -- Clear local counter
                ce_o        <= '1';     -- Generate clock enable pulse

            else
                s_cnt_local <= s_cnt_local + 1;
                ce_o        <= '0';
            end if;
        end if;
    end process p_clk_ena;
   ```
    
    
 
    
    
   ### Listing of VHDL reset and stimulus processes from testbench file tb_cnt_up_down.vhd with syntax highlighting and asserts
  
  
    ```vhdl
      p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 128 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 53 ns;

        -- Reset deactivated
        s_reset <= '0';

        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
    
    ```
   
### Screenshot with simulated time waveforms
![screenshot](images/ss.png)

## Top level
### Listing of VHDL code from source file top.vhd with all instantiations for the 4-bit bidirectional counter
```vhdl
     --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 100000000        
          )
        port map(
            clk   =>  CLK100MHZ,
            reset =>  BTNC,
            ce_o  =>  s_en
        ); 

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity
    bin_cnt0 : entity work.cnt_up_down
        generic map(
         g_CNT_WIDTH => 4
          
        )
        port map(
           clk      => CLK100MHZ,
           reset    => BTNC,
           en_i     => s_en,
           cnt_up_i => SW(0),
           cnt_o    => s_cnt
        );  

    -- Display input value on LEDs
    LED(3 downto 0) <= s_cnt;
    
    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => s_cnt,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

    -- Connect one common anode to 3.3V
    AN <= b"1111_1110";

   ```
### Image of the top layer including both counters
![top](images/image0.png)
