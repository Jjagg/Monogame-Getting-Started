


# Testing Concepts


The timing tests presented in this Guide use **Milliseconds** and **Ticks**.


Commonly, frame times are measured using Milliseconds.

At 60 frames per second, this means each frame is 16.6 ms.

But ticks are much smaller than milliseconds.

For example, there are 160,000 ticks in 16ms.


Let's explore ticks and why they are used.


### What is a tick?


A tick is an arbitrary unit for measuring internal system time. 

There is usually an OS-internal counter for ticks.

The current time and date used by various functions of the OS are derived from that counter.


How many milliseconds a tick represents depends on the OS.

This may vary between installations and versions.

On MS Windows, there are 
[10,000 ticks in a millisecond](http://msdn.microsoft.com/en-us/library/system.datetime.ticks.aspx).

On Linux, the number of clock ticks per second can be obtained using 
[sysconf(_SC_CLK_TCK);](http://linux.die.net/man/2/times).


Note that ticks and processor cycles are two different concepts.

Processor cycle length is determined by the hardware (CPU frequency).

Ticks are produced by the OS and use whatever length the OS deems appropriate.


### Why do you use ticks in some of the timing tests?


In order to time certain functions or code paths, sub-millisecond precision is required.


For example, let's imagine we wanted to time how long it takes to update and draw an empty Monogame viewport.

If we time this code path in milliseconds, it's very likely the result will be 0 milliseconds, depending on the hardware.

A mid-range PC will return 0 milliseconds. A high-end PC will also return 0 milliseconds.

But we know that the high-end PC is faster and more powerful.

We need more accurate precision in order to judge the relative power of hardware.


We can also use ticks to compare the relative overhead of the environment a program is executing in.


For example, running a Monogame program with an IDE Debugger active uses up additional ticks per frame.

Running a Monogame program without an active debugger uses less ticks per frame.

In some execution environments, less resources are available- consider a Monogame UWP app running on an Xbox One.

The UWP app has to share hardware resources with other running applications.

If many applications are running, then less resources are available to the Monogame UWP program.

We can determine how many ticks the game is using each frame, and adjust the codepath if necessary.



