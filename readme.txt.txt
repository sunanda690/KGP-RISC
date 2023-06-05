STEPS TO GENERATE CORES :
-------------------------------

InstrMem :
- Single Port ROM
- Enable 32 bit Address
- Read width as 32 and read depth as 256(just keeping big max prog lines is 30-40,still keeping big to extend to bigger programs if so)
- Use ENA Pin enabled
- Load the coe file


DataMemory:
- Single Port Ram
- Enable 32 bit Address
- Write Width : 32 , Write Depth : 256
- Write First , ALways enabled
- Load the data coe file

COE FIles:
-----------------------
gcd.coe  : COmpute gcd of two numbers (14 and 8)  : Expected Result : 2
gcddata.coe  ;For input to gcd algorithm (set as 14 and 8 in the coe file)
nsum.coe : Compute sum of first n natural numbers(n = 8) :  Expected Result : 36
nsumdata.coe  :For input to nsum(set as 8 in the coe file)

Main top module :
------------------------
KGP_RISC.v
test bench : tb_KGP_RISC.v

