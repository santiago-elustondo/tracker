#!/usr/bin/env python3

# Specify the directory (relative or absolute) where the acceptance test 
# files are. If nothing is added, current directory is used.
# WARNING: While absolute paths are suported, the oracle may not play nicely
# with them.
root = "../../tracker-project/tests/acceptance/"

# Specify files or directories (relative to root) of the acceptance tests. 
# NOTE: Tests can not be named test.expected.txt 
# NOTE: To run all tests in root directory, uses [""] as the test.
# WARNING: Does not support partial file names with wildcards ie at*.txt
acceptance_tests = [""]

# Should regression testing continue on warnings? If this is set to False,
# regression testing will exit.
ignore_warnings = True

# Should the regression testing proceeds with a list of expected files, or the 
# oracle?	
# When this flag is set True, the the value of 'oracle' is ignored. 
is_expected = False

# Specify where you put the oracle.
oracle = "../oracle.exe"

# Specify the path of the executable built from your project.
executable = "./tr.exe"

# Specify where you want to log the outputs from both the oracle and your 
# executable.
# In the case 'is_expected' is set to True, expected output files are copied 
# from the directory containing 'acceptance_tests' into 'log_dir'
# In the case 'is_expected' is set to False, expected output files are generated
# using 'oracle' into 'log_dir'
log_dir = "./log"

# Set true if you want the comparison to be tolerant on white spaces and empty 
# lines.
# WARNING: While every attempt has been made to make the output return the same
# result as the grading script, there are no guarantees. It is strongly advised
# that you submit a program that passes with the flag set to False.
is_tolerant_on_white_spaces = True
