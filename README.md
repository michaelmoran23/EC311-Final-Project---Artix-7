# EC311 - Final-Project - Artix-7

**Project Name:**

Multi-function Clock

**Team Members:**

Michael Moran, Karl Carisme, Santos Zuniga, Waseem Ridhuan

**Link to Demo Video:**

**Overview of Project:**

Our Multi-function clock includes a fully functional 24-hour alarm clock and a stopwatch. The alarm clock's time can be manually entered, and it also includes a pre-set minigame to help encourage the user to get up when the alarm goes off. The stopwatch is a standard timing device that can be started, stopped, and reset.

**How to run project:**

The switches on the FPGA board can be used to alter the number of hours, number of minutes, and number of seconds, which can be used to set the alarm clock or reset the stopwatch.

**Overview of code structure:**

EnterTime.v - This module accepts the user's value inputs of hours, minutes, and seconds while the alarm clock and the stopwatch are not running and allows these inputted values to be seen on the 7-segment display. Once the clock or the stopwatch starts running, these inputted values are overridden by the incrementing values.

Clock.v - This module manages the counting of the 24-hour clock.

DisplayDecoder - This module converts the values for hours, minutes, and seconds to separate single digit values that can be pushed to the 7-segment display. For example, 23 hours, 59 minutes, and 55 seconds would be converted to single digit values of 2, 3, 5, 9, 5, and 5.
