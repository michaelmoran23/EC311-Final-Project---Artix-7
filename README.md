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

MINIGAME OVERVIEW The game starts when a button is pressed, initializing the 8-digit 7-segment display to show all zeros. The player must input a pre-defined 8-member code using slide switches. Each switch's state is visually represented by an LED above it. Successfully inputting the correct code completes the game, indicated by the display showing all ones. Using various modules such as a Minigame_Logic Module, in charge of game state and outputting game_activate signals Display Control Module, For visual representation, shows 0s to show beginning of game and 1s to mark completeness Preset_Check Module, Continuosly monitoring the slide switches against pre-set code LED_Control Module, assigned to each switch based on swith position it would light up and it would all be instantiated in a Top_Level Module.

***Stopwatch Module***

The logic behind the stopwatch module designed for the digital alarm clock on the FPGA, involves three primary buttons: start, stop, and reset. The reset button is programmed to reset the counter to zero, initializing the stopwatch to its default state. The start button, once pressed, triggers the stopwatch to begin counting. It does this by incrementing the counter by one every second, providing a precise measurement of elapsed time.

***Purpose of the Stopwatch module*** 
The primary purpose of this stopwatch was to offer users a reliable tool for measuring time intervals, suitable for various activities such as studying, exercising, or any task that requires tracking time duration. This functionality enhances the utility of the digital alarm clock, making it not just a device to wake up to, but also a handy companion for time management and productivity.

***Successes and Failures***
In the development of this stopwatch module, there has been success and challenge. The best achievement was the successful simulation of the test bench on Vivado, which demonstrated that the logic of the stopwatch was functioning as intended. This was a crucial step in verifying the design and functionality of the module. However, the project encountered difficulties in transferring this logic onto the FPGA for practical use.

**Credits:**
Some content to produce sounds was taken from https://www.fpga4fun.com/MusicBox1.html and altered to fit our needs.
