#!/bin/sh

# In real world we'd clear the database between runs since not all our tests clean up after themselves properly
# echo Resetting database
# wget --spider -q -T 90 $RESET_DB && break

echo Executing tests

pabot --processes 3 --outputdir ./results ./robot/tests/

if [ $? -eq 0 ]
then
  echo Tests successful, skipping rerun
  exit 0
fi

echo Some tests failed, starting rerunfailed
# echo Resetting database
# wget --spider -q -T 90 $RESET_DB && break

echo Executing failed tests
pabot --processes 3 --rerunfailed ./results/output.xml --outputdir ./results --output rerun.xml ./robot/tests/

echo Merging results
rebot --outputdir ./results --output output.xml --merge ./results/output.xml ./results/rerun.xml
