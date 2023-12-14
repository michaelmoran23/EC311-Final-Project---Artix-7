# EC311 - Final-Project - Artix-7

**Project Name:**
Digital Clock

**Team Members:**
Michael Moran, Karl Carisme, Santos Zuniga, Waseem Ridhuan

**Link to Demo Video:** https://drive.google.com/file/d/1f2v_y8bROQ1f6bDfif2bKO4Wk9d_oLJj/view?usp=sharing


**Overview of Project:**
Our goal was to make a 24-hour alarm clock with a stopwatch and a video game, but unfortunately we only managed to implement the 24-hour clock onto the FPGA.

**How to run project:**
The switches on the FPGA board can be used to alter the number of hours, number of minutes, and number of seconds, which can be used to set the clock.

**Overview of code structure:**
EnterTime.v - This module accepts the user's value inputs of hours, minutes, and seconds while the clock is not running and allows these inputted values to be seen on the 7-segment display. Once the clock starts running, these inputted values are overridden by the incrementing values.

Clock.v - This module manages the counting of the 24-hour clock.

DisplayDecoder.v - This module converts the values for hours, minutes, and seconds to separate single digit values that can be pushed to the 7-segment display. For example, 23 hours, 59 minutes, and 55 seconds would be converted to single digit values of 2, 3, 5, 9, 5, and 5.

**Credits:**
Some content to produce sounds was taken from https://www.fpga4fun.com/MusicBox1.html and altered to fit our needs.
