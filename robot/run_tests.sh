#!/bin/sh

# In real world we'd clear the database between runs since not all our tests clean up after themselves properly

# echo Resetting database
# wget --spider -q -T 90 $RESET_DB

echo "Executing tests"
pabot --processes 3 --outputdir ./results ./robot/tests/

if [ $? -eq 0 ]
then
  echo "Tests successful, skipping rerun"
  exit 0
fi

for COUNT in 1 2 3
do
  echo "Some tests failed, starting $COUNT. rerun"
  
  #echo "Resetting database"
  # wget --spider -q -T 90 $RESET_DB

  if [ $? -ne 0 ]
  then
    echo "Error resetting database before rerun"
    exit 1
  fi

  echo "Executing failed tests"
  pabot --processes 3 --rerunfailed ./results/output.xml --outputdir ./results --output rerun.xml ./robot/tests/  

  echo "Merging results"
  rebot --outputdir ./results --output output.xml --merge ./results/output.xml ./results/rerun.xml

  if [ $? -eq 0 ]
  then
    echo "All tests passed"
    break
  fi
done
