1. Setup required for linux:
   Run following command to give executable permission to setup.sh :
	chmod +x setup.sh
   run setup.sh script by following command:
	./setup.sh

2. Two debugger can't be connected at same time.Disconnect other serial devices while using JTAG with this tool on linux based PC.
3. Minimum Jtag frequency is 250KHz and maximum 30MHz.
4. Jtag frequency given from command line is not directly sets all the times sometimes it sets the nearest possible frequency.
5. On Linux: Binary should be run with sudo permission eg (sudo ./Phiprogrammer -dXILINX:XC3S50A -n0 -cjtag -f.<path><name>.bit  -b15000 -i1 -pfl).
6. There are two channels for Jtag 0 and 1.



Revision history
V1.0
Terminal Utility added with RTS-DTR control.
Terminal utility log ascii and hex for the data received, in seperate .txt files.







