# Start simulation
vsim\
-novopt\
-t ps\
work.tb

radix -hexadecimal

log -r /*

# Add waveform
do wave.do

# Run the simulation
run -all
