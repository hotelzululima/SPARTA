#!/bin/bash

# Switch to the sparta virtualenv
source $WORKON_HOME/sparta/bin/activate

DATABASENAME="./phase2_riskreduction_tests/resultsdb.db"
DATAPATH="./phase2_riskreduction_tests/"

TESTNAMES="01_oneofeach_small_k80
02_oneofeach_small_k128
03_oneofeach_singlegatetype
04_oneofeach_medium_k80
05_oneofeach_medium_k128
06_oneofeach_large_k80
07_oneofeach_large_k128
08_oneofeach_additional_k80"

for TESTNAME in ${TESTNAMES}
do
	echo "Generating test ${TESTNAME}..."
	CONFIGFILENAME=${DATAPATH}${TESTNAME}".config"
	python ibm_generate.py -d ${DATABASENAME} -c ${CONFIGFILENAME} -p ${DATAPATH} -t ${TESTNAME}
done

# Exit the virtualenv
deactivate
