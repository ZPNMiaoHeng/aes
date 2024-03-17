verdiDockWidgetDisplay -dock widgetDock_WelcomePage
verdiDockWidgetRestore -dock widgetDock_WelcomePage
wvCreateWindow
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 {/home/qst/workspace2021/aes/vcs_afterpr/aestop.fsdb}
wvGetSignalOpen -win $_nWave2
wvGetSignalSetScope -win $_nWave2 "/SEN_ADDF42_0P5"
wvGetSignalSetScope -win $_nWave2 "/aestop_tb2"
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvAddSignal -win $_nWave2 -clear
wvAddSignal -win $_nWave2 -group {"G1" \
{/aestop_tb2/clk} \
{/aestop_tb2/din\[7:0\]} \
{/aestop_tb2/dout\[7:0\]} \
{/aestop_tb2/load_shift} \
{/aestop_tb2/loadkey} \
{/aestop_tb2/rst} \
{/aestop_tb2/stadec} \
{/aestop_tb2/staenc} \
}
wvAddSignal -win $_nWave2 -group {"G2" \
}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 )} 
wvSetPosition -win $_nWave2 {("G1" 8)}
wvGetSignalClose -win $_nWave2
