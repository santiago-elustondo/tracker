#!/bin/sh

student=../tests/acceptance/student
instructor=../tests/acceptance/instructor
s_results=./my_tests/student
i_results=./my_tests/instructor
tracker=../EIFGENs/tracker/W_code/tracker

mkdir -p $s_results
mkdir -p $i_results

for i in $instructor/*
do
  $tracker -b $i > $i_results/actual.$(basename $i)
  ./oracle.exe -b $i > $i_results/expected.$(basename $i)
  diff -qs $i_results/expected.$(basename $i) $i_results/actual.$(basename $i)
done

for i in $student/*
do
  $tracker -b $i > $s_results/actual.$(basename $i)
  ./oracle.exe -b $i > $s_results/expected.$(basename $i)
  diff -qs $s_results/expected.$(basename $i) $s_results/actual.$(basename $i)
done

