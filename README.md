# Example-Promela-Spin-a-counter
Modeling in Promela the following system:
• the main thread creates 10 incrementing threads and a counter (integer initialized to zero), • each thread created copies the value of the counter into a local variable, then increments this local variable, and finally writes the value of the counter, ten times in a row
• the main thread waits for the created threads to be terminated and checks the value of the counter.
