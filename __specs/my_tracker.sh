#!/bin/sh

student=../tracker-project/tests/acceptance/student
instructor=../tracker-project/tests/acceptance/instructor
s_results=./my_tests/student
i_results=./my_tests/instructor
	if [[ "$OSTYPE" == "linux-gnu" ]]; then
        tracker=../tracker-project/EIFGENs/tracker/W_code/tracker.exe
	elif [[ "$OSTYPE" == "linux" ]]; then
        tracker=../tracker-project/EIFGENs/tracker/W_code/tracker
	fi


mkdir -p $s_results
mkdir -p $i_results

for i in $instructor/*
do
  $tracker -b $i > $i_results/actual.$(basename $i)
  ./oracle.exe -b $i > $i_results/expected.$(basename $i)
  sed -i.bak 's/\r//g' $i_results/actual.$(basename $i)
  diff -qs $i_results/expected.$(basename $i) $i_results/actual.$(basename $i)
done

for i in $student/*
do
  $tracker -b $i > $s_results/actual.$(basename $i)
  ./oracle.exe -b $i > $s_results/expected.$(basename $i)
  sed -i.bak 's/\r//g' $s_results/actual.$(basename $i)
  diff -qs $s_results/expected.$(basename $i) $s_results/actual.$(basename $i)
done

rm -f $s_results/* $i_results/*
