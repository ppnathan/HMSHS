scp ../../problems/NoObsDrivingModel/OutFiles/policyfile.txt ./
mv policyfile.txt policyfile_noobs.txt
scp ../../problems/ObsDrivingModel/OutFiles/policyfile.txt ./
mv policyfile.txt policyfile_obs.txt
scp -rp ./ ppnathan@schubert.eecs.berkeley.edu:~/MyFiles/MURI/HMSHS/Simulator/MultiModeDriverModelSimulator/
