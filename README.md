# Counter-Debouncer-7-Segment-Display-Driver

There are two modes for counting: manual counting using button presses, and counting every second. These modes are toggled using a switch on the FPGA; please reference the contraints file for the programming of all buttons and switches. This hardware is described for the Nexys A7 Artix-7 FPGA.

Manual Counting Mode
The manual debouncer and counter work to increment the count every time the button is pressed, and will only increment once if the button is held down.

Automatic Counting (1 second)
The count will increment every second.

7-Segment Display
The display on the FPGA shows the count in hexadecimal. The count syncs across both modes and will only reset upon presseing the global reset button on the FPGA.
