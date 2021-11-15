#!/bin/bash

#checking which process, channel, year and region have been chosen as inputs
process=$1
channel=$2
year=$3
region=$4
systematic=$5
MCOrData=$6
NPL=$7

echo 'process = ' $process
echo 'channel = ' $channel
echo 'year = ' $year
echo 'region = ' $region
echo 'systematic = ' $systematic
echo 'MCOrData = ' $MCOrData
echo 'NPL = ' $NPL

#For the channels
if [ $channel = 'ee' ]
then
	ChannelInt=1
elif [ $channel = 'mumu' ]
then
        ChannelInt=2
elif [ $channel = 'emu' ]
then
        ChannelInt=3
else
	echo 'Check the channel'
	exit
fi

#For the regions
if [ $region = 'SBR' ]
then 
	SBRInt=1
	SRInt=1
	ttbarCRInt=0
	ZPlusJetsCRInt=0

elif [ $region = 'SR' ]
then 
	SBRInt=0
	SRInt=1
	ttbarCRInt=0
	ZPlusJetsCRInt=0

elif [ $region = 'ttbarCR' ]
then
	SBRInt=0
	SRInt=0
	ttbarCRInt=1
	ZPlusJetsCRInt=0

elif [ $region = 'ZPlusJetsCR' ]
then
        SBRInt=0
        SRInt=0
elif [ $region = 'NoChi2Cut' ]
then
        SBRInt=0
        SRInt=0
	ttbarCRInt=0
	ZPlusJetsCRInt=0
fi

echo $systematic

#For the systematics
if [ $systematic = "Nominal" ]
then
	SystematicInt=0
elif [ $systematic = "PU_ScaleUp" ]
then
	echo 'pu scale up'
        SystematicInt=1
elif [ $systematic = 'PU_ScaleDown' ]
then
        SystematicInt=2
elif [ $systematic = 'BTag_ScaleUp' ]
then
        SystematicInt=3

elif [ $systematic = 'BTag_ScaleDown' ]
then
        SystematicInt=4
elif [ $systematic = 'JEC_ScaleUp' ]
then
        SystematicInt=5

elif [ $systematic = 'JEC_ScaleDown' ]
then
        SystematicInt=6
elif [ $systematic = 'JetSmearing_ScaleUp' ]
then
        SystematicInt=7

elif [ $systematic = 'JetSmearing_ScaleDown' ]
then
        SystematicInt=8
elif [ $systematic = 'LeptonEfficiencies_ScaleUp' ]
then
        SystematicInt=9

elif [ $systematic = 'LeptonEfficiencies_ScaleDown' ]
then
        SystematicInt=10
elif [ $systematic = 'PDF_ScaleUp' ]
then
        SystematicInt=11

elif [ $systematic = 'PDF_ScaleDown' ]
then
        SystematicInt=12

elif [ $systematic = 'ME_ScaleUp' ]
then
        SystematicInt=13

elif [ $systematic = 'ME_ScaleDown' ]
then
        SystematicInt=14

elif [ $systematic = 'MET_ScaleUp' ]
then
        SystematicInt=15

elif [ $systematic = 'MET_ScaleDown' ]
then
        SystematicInt=16
elif [ $systematic = 'isr_ScaleUp' ]
then
        SystematicInt=17

elif [ $systematic = 'isr_ScaleDown' ]
then
        SystematicInt=18
elif [ $systematic = 'fsr_ScaleUp' ]
then
        SystematicInt=19

elif [ $systematic = 'fsr_ScaleDown' ]
then
        SystematicInt=20
else
	echo 'Check the systematic'
	exit
	
fi


echo $SystematicInt

#For if the sample is MC or data
if [ $MCOrData = 'MC' ]
then
	MCInt=1
else
	MCInt=0
fi

#For if the job is for NPL or not
if [ $NPL = 'NPL' ]
then
	NPLInt=0
else
	NPLInt=1
fi

#getting dataset info from the CMS data aggregation service
if [ $year = '2016' ]
then
	if [ $process = 'tZq_signal' ]
	then
		DATASET=/tZq_ll_4f_ckm_NLO_TuneCP5_PSweights_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=0

	elif [ $process = 'tZq_scaleup' ]
	then
		DATASET=/tZq_ll_4f_scaleup_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=1

	elif [ $process = 'tZq_scaledown']
	then
		DATASET=/tZq_ll_4f_scaledown_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=2

	else
		echo 'Check the process name'
		exit
	fi
else
	echo 'Check the year'
	exit
fi



#writing the names of all input files to a text file
dasgoclient -query="file dataset=$DATASET" > ${process}_files_${year}.txt

echo ${process}_files_${year}.txt


#creating a bash script for the condor submission
mkdir -p Jobs/Job_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}

#writing the commands to be executed in each bash script
cat <<EOT >> Jobs/Job_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}/sub.sh 
#!/bin/bash
export X509_USER_PROXY=/afs/cern.ch/work/c/coldham/private/HTCondor/x509up_u114218
voms-proxy-info -all
voms-proxy-info -all -file /afs/cern.ch/work/c/coldham/private/HTCondor/x509up_u114218

if [ !-d /afs/cern.ch/work/c/coldham/private/HTCondor/tZq_Dilepton_NanoAOD ]
then
	git clone https://github.com/brunel-physics/tZq_Dilepton_NanoAOD
fi

cd /afs/cern.ch/work/c/coldham/private/HTCondor/tZq_Dilepton_NanoAOD
source /cvmfs/sft.cern.ch/lcg/views/LCG_96/x86_64-slc6-gcc8-opt/setup.sh
make
make clean
./bin/fulleventselectionMain.exe --mc ${MCInt} -y ${year} -p ${ProcessInt} --npl ${NPLInt} --sr ${SRInt} --sbr ${SBRInt} --zjcr ${ZPlusJetsCRInt} --ttcr ${ttbarCRInt} --sys ${SystematicInt} --channel ${ChannelInt} --dcc 0; sleep 18000;

EOT



#creating and writing to the .sub file
cat <<"EOT" >> condor_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}.sub
executable = $(filename)
Proxy_path = /afs/cern.ch/work/c/coldham/private/HTCondor/x509up_u114218
arguments = $(Proxy_path) $Fp(filename) $(ClusterID) $(ProcId)
output = $Fp(filename)file.stdout
error = $Fp(filename)file.stderr
log = $Fp(filename)file.log
EOT

cat <<EOT >> condor_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}.sub
queue filename matching (Jobs/Job_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}/*.sh)
EOT

