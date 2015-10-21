#!/usr/bin/env python
import sys

def timereps(reps, func):
    from time import time
    start = time()
    for i in range(0, reps):
        func()
    end = time()
    return (end - start) / reps

def print_result():
   result = original(1000)
   time = timereps(10, lambda: original(1000))
   print("Result: {0}, in {1}".format(result, time))

def original(limit):
	return sum([x for x in range(limit) if x % 3 == 0 or x % 5 == 0])

if __name__ == '__main__':
	sys.exit(print_result())
