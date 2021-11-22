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
elif [ $systematic = 'JetSmearing_ScaleUp' ]
then
        SystematicInt=5

elif [ $systematic = 'JetSmearing_ScaleDown' ]
then
        SystematicInt=6
elif [ $systematic = 'JEC_ScaleUp' ]
then
        SystematicInt=7

elif [ $systematic = 'JEC_ScaleDown' ]
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
	NPLInt=1
else
	NPLInt=0
fi

#getting dataset info from the CMS data aggregation service
if [ $year = '2016' ]
then
	if [ $process = 'tZq' ]
	then
		DATASET=/tZq_ll_4f_ckm_NLO_TuneCP5_PSweights_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=0

	elif [ $process = 'tZq_scaleup' ]
	then
		DATASET=/tZq_ll_4f_scaleup_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=1

	elif [ $process = 'tZq_scaledown' ]
	then
		DATASET=/tZq_ll_4f_scaledown_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=2

	elif [ $process = 'ZPlusJets_M50_aMCatNLO' ]
	then
		DATASET=/DYJetsToLL_M-50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

		ProcessInt=3
	
	elif [ $process = 'ZPlusJets_M50_aMCatNLO_ext' ]
	then
		echo 'No ZPlusJets_M50_aMCatNLO_ext for 2016'
		exit

	elif [ $process = 'ZPlusJets_M50_Madgraph' ]
	then
		DATASET=/DYJetsToLL_M-50_TuneCUETP8M1_13TeV-madgraphMLM-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM
	
		ProcessInt=5

	elif [ $process = 'ZPlusJets_M50_Madgraph_ext' ]
        then
		DATASET=/DYJetsToLL_M-50_TuneCUETP8M1_13TeV-madgraphMLM-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=6
	
	elif [ $process = 'ZPlusJets_M10To50_aMCatNLO' ]
        then
                DATASET=/DYJetsToLL_M-10to50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=7

	elif [ $process = 'ZPlusJets_M10To50_aMCatNLO_ext' ]
        then
                DATASET=/DYJetsToLL_M-10to50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=8

	elif [ $process = 'ZPlusJets_M10To50_Madgraph' ]
	then
		DATASET=/DYJetsToLL_M-10to50_TuneCUETP8M1_13TeV-madgraphMLM-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=9

	elif [ $process = 'ZPlusJets_PtBinned_0To50' ]
	then
		DATASET=/DYJetsToLL_Zpt-0To50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM
		ProcessInt=11
	elif [ $process = 'ZPlusJets_PtBinned_50To100' ]
	then
		DATASET=/DYJetsToLL_Pt-50To100_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=12

	elif [ $process = 'ZPlusJets_PtBinned_50To100_ext' ]
	then
		DATASET=/DYJetsToLL_Pt-50To100_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext3-v1/NANOAODSIM
	
		ProcessInt=13

	elif [ $process = 'ZPlusJets_PtBinned_100To250' ]
	then
		DATASET=/DYJetsToLL_Pt-100To250_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM 
		
		ProcessInt=14

	elif [ $process = 'ZPlusJets_PtBinned_100To250_ext1' ]
        then
                DATASET=/DYJetsToLL_Pt-100To250_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=15

	elif [ $process = 'ZPlusJets_PtBinned_100To250_ext2' ]
        then
                DATASET=/DYJetsToLL_Pt-100To250_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=16

	elif [ $process = 'ZPlusJets_PtBinned_100To250_ext5' ]
        then
                DATASET=/DYJetsToLL_Pt-100To250_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext5-v1/NANOAODSIM

                ProcessInt=17

	elif [ $process = 'ZPlusJets_PtBinned_250To400' ]
        then
                DATASET=/DYJetsToLL_Pt-250To400_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=18

	elif [ $process = 'ZPlusJets_PtBinned_250To400_ext1' ]
        then
                DATASET=/DYJetsToLL_Pt-250To400_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=19
	
	elif [ $process = 'ZPlusJets_PtBinned_250To400_ext2' ]
        then
                DATASET=/DYJetsToLL_Pt-250To400_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=20

	elif [ $process = 'ZPlusJets_PtBinned_250To400_ext5' ]
        then
                DATASET=/DYJetsToLL_Pt-250To400_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext5-v1/NANOAODSIM
                
                ProcessInt=21

	elif [ $process = 'ZPlusJets_PtBinned_400To650' ]
        then
                DATASET=/DYJetsToLL_Pt-400To650_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=22

	elif [ $process = 'ZPlusJets_PtBinned_400To650_ext1' ]
        then
                DATASET=/DYJetsToLL_Pt-400To650_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=23

	elif [ $process = 'ZPlusJets_PtBinned_400To650_ext2' ]
        then
                DATASET=/DYJetsToLL_Pt-400To650_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=24

	elif [ $process = 'ZPlusJets_PtBinned_650ToInf' ]
        then
                DATASET=/DYJetsToLL_Pt-650ToInf_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=25


	elif [ $process = 'ZPlusJets_PtBinned_650ToInf_ext1' ]
        then
                DATASET=/DYJetsToLL_Pt-650ToInf_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=26

	elif [ $process = 'ZPlusJets_PtBinned_650ToInf_ext2' ]
        then
                DATASET=/DYJetsToLL_Pt-650ToInf_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=27

	elif [ $process = 'ttbar_2l2nu' ]
        then
                DATASET=/TTTo2L2Nu_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=28


	elif [ $process = 'ttbar_madgraph' ]
        then
                DATASET=/TTJets_DiLept_TuneCUETP8M1_13TeV-madgraphMLM-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=29

	elif [ $process = 'ttbar_madgraph_ext' ]
        then
                DATASET=/TTJets_DiLept_TuneCUETP8M1_13TeV-madgraphMLM-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=30

	elif [ $process = 'ttbar_TTToHadronic' ]
        then
                DATASET=/TTToHadronic_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM
                
                ProcessInt=31

	elif [ $process = 'ttbar_TTToSemileptonic' ]
        then
                DATASET=/TTToSemiLeptonic_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=33

	elif [ $process = 'ttbar_atMCaNLO' ]
        then
                DATASET=/TTJets_TuneCUETP8M2T4_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=35
	
	elif [ $process = 'ttbar_inc' ]
        then

		DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

		ProcessInt=37

	elif [ $process = 'SingleTop_tchannel_top' ]
        then

                DATASET=/ST_t-channel_top_4f_inclusiveDecays_13TeV-powhegV2-madspin-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v2/NANOAODSIM

                ProcessInt=38

	elif [ $process = 'SingleTop_tchannel_top_ScaleUp' ]
        then

                DATASET=/ST_t-channel_top_4f_scaleup_inclusiveDecays_13TeV-powhegV2-madspin-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=39


	elif [ $process = 'SingleTop_tchannel_top_ScaleDown' ]
        then

                DATASET=/ST_t-channel_top_4f_scaledown_inclusiveDecays_13TeV-powhegV2-madspin-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=40


	elif [ $process = 'SingleTop_tchannel_antitop' ]
        then

                DATASET=/ST_t-channel_antitop_4f_inclusiveDecays_13TeV-powhegV2-madspin-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=41

	elif [ $process = 'SingleTop_tchannel_antitop_ScaleUp' ]
        then
        
                DATASET=/ST_t-channel_antitop_4f_scaleup_inclusiveDecays_13TeV-powhegV2-madspin-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=42


	elif [ $process = 'SingleTop_tchannel_antitop_ScaleDown' ]
        then
        
                DATASET=/ST_t-channel_antitop_4f_scaledown_inclusiveDecays_13TeV-powhegV2-madspin-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=43

	elif [ $process = 'SingleTop_schannel' ]
        then

                DATASET=/ST_s-channel_4f_InclusiveDecays_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=44

	elif [ $process = 'ttbar_hdampUP' ]
        then

                DATASET=/TT_hdampUP_TuneCUETP8M2T4_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=45


	elif [ $process = 'ttbar_hdampUP_ext' ]
        then
        
                DATASET=/TT_hdampUP_TuneCUETP8M2T4_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=46


	elif [ $process = 'ttbar_hdampDOWN' ]
        then
        
                DATASET=/TT_hdampDOWN_TuneCUETP8M2T4_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=47

	elif [ $process = 'ttbar_hdampDOWN_ext' ]
        then

                DATASET=/TT_hdampDOWN_TuneCUETP8M2T4_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=48

	elif [ $process = 'TT_2l2nu_hdampUP' ]
        then
        
                DATASET=/TTTo2L2Nu_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=49

	elif [ $process = 'TT_2l2nu_hdampUP_ext1' ]
        then
        
                DATASET=/TTTo2L2Nu_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM
        
                ProcessInt=50

	elif [ $process = 'TT_2l2nu_hdampUP_ext2' ]
        then
        
                DATASET=/TTTo2L2Nu_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM
        
                ProcessInt=51

	elif [ $process = 'TT_2l2nu_hdampDOWN' ]
        then
        
                DATASET=/TTTo2L2Nu_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM
        
                ProcessInt=52

	elif [ $process = 'TT_2l2nu_hdampDOWN_ext1' ]
        then

                DATASET=/TTTo2L2Nu_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=53

	elif [ $process = 'TT_2l2nu_hdampDOWN_ext2' ]
        then

                DATASET=/TTTo2L2Nu_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=54

	elif [ $process = 'TTToHadronic_hdampUP' ]
        then
        
                DATASET=/TTToHadronic_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=55

	elif [ $process = 'TTToHadronic_hdampDOWN' ]
        then

                DATASET=/TTToHadronic_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=56

	elif [ $process = 'TTToSemileptonic_hdampUP' ]
        then

                DATASET=/TTToSemiLeptonic_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=57

	elif [ $process = 'TTToSemileptonic_hdampDOWN' ]
        then
        
                DATASET=/TTToSemiLeptonic_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM
        
                ProcessInt=58


	elif [ $process = 'SingleTop_tchannel_top_hdampUP' ]
        then
        
                DATASET=/ST_t-channel_top_4f_hdampup_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=60

	elif [ $process = 'SingleTop_tchannel_top_hdampDOWN' ]
        then
        
                DATASET=/ST_t-channel_top_4f_hdampdown_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=61

	elif [ $process = 'SingleTop_tchannel_antitop_hdampUP' ]
        then
        
                DATASET=/ST_t-channel_antitop_4f_hdampup_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=62

	elif [ $process = 'SingleTop_tchannel_antitop_hdampDOWN' ]
        then

                DATASET=/ST_t-channel_antitop_4f_hdampdown_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=63

	elif [ $process = 'ttbar_isr_UP' ]
        then
        
                DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-isrup-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=64

	elif [ $process = 'ttbar_isr_DOWN' ]
        then
        
                DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-isrdown-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=65

	elif [ $process = 'ttbar_isr_DOWN_ext' ]
        then
        
                DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-isrdown-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM
        
                ProcessInt=66

	elif [ $process = 'ttbar_fsr_UP' ]
        then
        
                DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-fsrup-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM
        
                ProcessInt=67


	elif [ $process = 'ttbar_fsr_UP_ext' ]
        then
        
                DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-fsrup-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM
        
                ProcessInt=68


	elif [ $process = 'ttbar_fsr_DOWN' ]
        then
        
                DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-fsrdown-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM
        
                ProcessInt=69

	elif [ $process = 'ttbar_fsr_DOWN_ext' ]
        then

                DATASET=/TT_TuneCUETP8M2T4_13TeV-powheg-fsrdown-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=70

	elif [ $process = 'SingleTop_tW' ]
        then

                DATASET=/ST_tW_top_5f_inclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=71

	elif [ $process = 'SingleTop_tW_ScaleUp' ]
        then

                DATASET=/ST_tW_top_5f_scaleup_inclusiveDecays_13TeV-powheg-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=72

	elif [ $process = 'SingleTop_tW_ScaleDown' ]
        then

                DATASET=/ST_tW_top_5f_scaledown_inclusiveDecays_13TeV-powheg-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=73

	elif [ $process = 'SingleTop_tbarW' ]
        then

                DATASET=/ST_tW_antitop_5f_inclusiveDecays_13TeV-powheg-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=74

        elif [ $process = 'SingleTop_tbarW_ScaleUp' ]
        then

                DATASET=/ST_tW_antitop_5f_scaleup_inclusiveDecays_13TeV-powheg-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=75

        elif [ $process = 'SingleTop_tbarW_ScaleDown' ]
        then

                DATASET=/ST_tW_antitop_5f_scaledown_inclusiveDecays_13TeV-powheg-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=76

	elif [ $process = 'SingleTop_tHq' ]
        then

                DATASET=/THQ_Hincl_13TeV-madgraph-pythia8_TuneCUETP8M1/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=77

        elif [ $process = 'SingleTop_tWZ_tWll' ]
        then

                DATASET=/ST_tWll_5f_LO_13TeV-MadGraph-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=79

        elif [ $process = 'VV_ZZTo2l2nu' ]
        then

                DATASET=/ZZTo2L2Nu_13TeV_powheg_pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=80

	elif [ $process = 'VV_ZZTo2l2Q' ]
        then

                DATASET=/ZZTo2L2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=83

        elif [ $process = 'VV_ZZTo4L' ]
        then

                DATASET=/ZZTo4L_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=84

        elif [ $process = 'VV_WZTo2l2Q' ]
        then

                DATASET=/WZTo2L2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=86

	elif [ $process = 'VV_WZTo1l1Nu2Q' ]
        then

                DATASET=/WZTo1L1Nu2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=89

        elif [ $process = 'VV_WWTo2l2Nu' ]
        then

                DATASET=/WWTo2L2Nu_13TeV-powheg/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=90

        elif [ $process = 'VV_WWToLNuQQ' ]
        then

                DATASET=/WWToLNuQQ_13TeV-powheg/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=91

        elif [ $process = 'VV_WWToLNuQQ_ext' ]
        then

                DATASET=/WWToLNuQQ_13TeV-powheg/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=92

	elif [ $process = 'VVV_WWWTo4F' ]
        then

                DATASET=/WWW_4F_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=98

        elif [ $process = 'VVV_WWZTo4F' ]
        then

                DATASET=/WWZ_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=100

        elif [ $process = 'VVV_WZZ' ]
        then

                DATASET=/WZZ_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=102

        elif [ $process = 'VVV_ZZZ' ]
        then

                DATASET=/ZZZ_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=104

	elif [ $process = 'WPlusJets' ]
        then

                DATASET=/WJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=106

        elif [ $process = 'WPlusJets_ext' ]
        then

                DATASET=/WJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=107

        elif [ $process = 'ttbarV_ttWJetsToLNu' ]
        then

                DATASET=/TTWJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-madspin-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=108

        elif [ $process = 'ttbarV_ttWJetsToLNu_ext' ]
        then

                DATASET=/TTWJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-madspin-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=109

	elif [ $process = 'ttbarV_ttWJetsToQQ' ]
        then

                DATASET=/TTWJetsToQQ_TuneCUETP8M1_13TeV-amcatnloFXFX-madspin-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=110

        elif [ $process = 'ttbarV_ttZToLLNuNu' ]
        then

                DATASET=/TTZToLLNuNu_M-10_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext1-v1/NANOAODSIM

                ProcessInt=113

        elif [ $process = 'ttbarV_ttZToLLNuNu_ext' ]
        then

                DATASET=/TTZToLLNuNu_M-10_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext2-v1/NANOAODSIM

                ProcessInt=114

        elif [ $process = 'ttbarV_ttZToLLNuNu_ext2' ]
        then

                DATASET=/TTZToLLNuNu_M-10_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8_ext3-v1/NANOAODSIM

                ProcessInt=115

	elif [ $process = 'ttbarV_ttZToQQ' ]
        then

                DATASET=/TTZToQQ_TuneCUETP8M1_13TeV-amcatnlo-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=116
	
	elif [ $process = 'ttbarV_ttHTobb' ]
        then

                DATASET=/ttHTobb_M125_TuneCUETP8M2_ttHtranche3_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM

                ProcessInt=118

	elif [ $process = 'ttbarV_ttHToNonbb' ]
        then
        
                DATASET=/ttHToNonbb_M125_TuneCUETP8M2_ttHtranche3_13TeV-powheg-pythia8/RunIISummer16NanoAODv7-PUMoriond17_Nano02Apr2020_102X_mcRun2_asymptotic_v8-v1/NANOAODSIM 

                ProcessInt=120


	elif [ $process = 'Data_DoubleEGRunB' ]
        then

                DATASET=/DoubleEG/Run2016B-22Aug2018ver2-v1/NANOAOD

                ProcessInt=121

	elif [ $process = 'Data_DoubleEGRunC' ]
        then

                DATASET=/DoubleEG/Run2016C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=122

	elif [ $process = 'Data_DoubleEGRunD' ]
        then

                DATASET=/DoubleEG/Run2016D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=123

	elif [ $process = 'Data_DoubleEGRunE' ]
        then

                DATASET=/DoubleEG/Run2016E-Nano25Oct2019-v1/NANOAOD

                ProcessInt=124

        elif [ $process = 'Data_DoubleEGRunF' ]
        then

                DATASET=/DoubleEG/Run2016F-Nano25Oct2019-v1/NANOAOD

                ProcessInt=125

        elif [ $process = 'Data_DoubleEGRunG' ]
        then

                DATASET=/DoubleEG/Run2016G-Nano25Oct2019-v1/NANOAOD

                ProcessInt=126

	elif [ $process = 'Data_DoubleEGRunH' ]
        then

                DATASET=/DoubleEG/Run2016H-Nano25Oct2019-v1/NANOAOD

                ProcessInt=127

        elif [ $process = 'Data_DoubleMuonRunB' ]
        then

                DATASET=/DoubleMuon/Run2016Bver2-Nano14Dec2018ver2-v1/NANOAOD

                ProcessInt=128

        elif [ $process = 'Data_DoubleMuonRunC' ]
        then

                DATASET=/DoubleMuon/Run2016C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=129

	elif [ $process = 'Data_DoubleMuonRunD' ]
        then

                DATASET=/DoubleMuon/Run2016D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=130

        elif [ $process = 'Data_DoubleMuonRunE' ]
        then

                DATASET=/DoubleMuon/Run2016E-Nano25Oct2019-v1/NANOAOD

                ProcessInt=131

        elif [ $process = 'Data_DoubleMuonRunF' ]
        then

                DATASET=/DoubleMuon/Run2016F-Nano25Oct2019-v1/NANOAOD

                ProcessInt=132

	elif [ $process = 'Data_DoubleMuonRunG' ]
        then

                DATASET=/DoubleMuon/Run2016G-Nano25Oct2019-v1/NANOAOD

                ProcessInt=133

        elif [ $process = 'Data_DoubleMuonRunH' ]
        then

                DATASET=/DoubleMuon/Run2016H-Nano25Oct2019-v1/NANOAOD

                ProcessInt=134

        elif [ $process = 'Data_MuonEGRunB' ]
        then

                DATASET=/MuonEG/Run2016B_ver2-Nano14Dec2018_ver2-v1/NANOAOD

                ProcessInt=135

	elif [ $process = 'Data_MuonEGRunC' ]
        then

                DATASET=/MuonEG/Run2016C-Nano14Dec2018-v1/NANOAOD

                ProcessInt=136

        elif [ $process = 'Data_MuonEGRunD' ]
        then

                DATASET=/MuonEG/Run2016D-Nano14Dec2018-v1/NANOAOD

                ProcessInt=137

        elif [ $process = 'Data_MuonEGRunE' ]
        then

                DATASET=/MuonEG/Run2016E-Nano14Dec2018-v1/NANOAOD

                ProcessInt=138

	elif [ $process = 'Data_MuonEGRunF' ]
        then

                DATASET=/MuonEG/Run2016F-Nano14Dec2018-v1/NANOAOD

                ProcessInt=139

        elif [ $process = 'Data_MuonEGRunG' ]
        then

                DATASET=/MuonEG/Run2016G-Nano14Dec2018-v1/NANOAOD

                ProcessInt=140

        elif [ $process = 'Data_MuonEGRunH' ]
        then

                DATASET=/MuonEG/Run2016H-Nano14Dec2018-v1/NANOAOD

                ProcessInt=141

	elif [ $process = 'Data_SingleMuonRunB' ]
        then

                DATASET=/SingleMuon/Run2016Bver2-Nano25Oct2019ver2-v1/NANOAOD

                ProcessInt=142

        elif [ $process = 'Data_SingleMuonRunC' ]
        then

                DATASET=/SingleMuon/Run2016C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=143

        elif [ $process = 'Data_SingleMuonRunD' ]
        then

                DATASET=/SingleMuon/Run2016D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=144

	elif [ $process = 'Data_SingleMuonRunE' ]
        then

                DATASET=/SingleMuon/Run2016E-Nano25Oct2019-v1/NANOAOD

                ProcessInt=145

        elif [ $process = 'Data_SingleMuonRunF' ]
        then

                DATASET=/SingleMuon/Run2016F-Nano25Oct2019-v1/NANOAOD

                ProcessInt=146

        elif [ $process = 'Data_SingleMuonRunG' ]
        then

                DATASET=/SingleMuon/Run2016G-Nano25Oct2019-v1/NANOAOD

                ProcessInt=147

	elif [ $process = 'Data_SingleMuonRunH' ]
        then

                DATASET=/SingleMuon/Run2016H-Nano25Oct2019-v1/NANOAOD

                ProcessInt=148

        elif [ $process = 'Data_SingleElectronRunB' ]
        then

                DATASET=/SingleElectron/Run2016Bver2-Nano25Oct2019ver2-v1/NANOAOD

                ProcessInt=149

        elif [ $process = 'Data_SingleElectronRunC' ]
        then

                DATASET=/SingleElectron/Run2016C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=150

	elif [ $process = 'Data_SingleElectronRunD' ]
        then

                DATASET=/SingleElectron/Run2016D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=151

        elif [ $process = 'Data_SingleElectronRunE' ]
        then

                DATASET=/SingleElectron/Run2016E-Nano25Oct2019-v1/NANOAOD

                ProcessInt=152

        elif [ $process = 'Data_SingleElectronRunF' ]
        then

                DATASET=/SingleElectron/Run2016F-Nano25Oct2019-v1/NANOAOD

                ProcessInt=153

	elif [ $process = 'Data_SingleElectronRunG' ]
        then

                DATASET=/SingleElectron/Run2016G-Nano25Oct2019-v1/NANOAOD

                ProcessInt=154

        elif [ $process = 'Data_SingleElectronRunH' ]
        then

                DATASET=/SingleElectron/Run2016H-Nano25Oct2019-v1/NANOAOD

                ProcessInt=155

	else
		echo 'Check the process name'
		exit
	fi

elif [ $year = '2017' ]
then
	if [ $process = 'tZq' ]
        then
                DATASET=/tZq_ll_4f_ckm_NLO_TuneCP5_PSweights_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=0

	elif [ $process = 'ZPlusJets_M50_aMCatNLO' ]
        then
                DATASET=/DYJetsToLL_M-50_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=3

	elif [ $process = 'ZPlusJets_M50_aMCatNLO_ext' ]
        then
                DATASET=/DYJetsToLL_M-50_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8_ext1-v1/NANOAODSIM

                ProcessInt=4

	elif [ $process = 'ttbar_2l2nu' ]
        then
                DATASET=/TTTo2L2Nu_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=28

	elif [ $process = 'ttbar_TTToHadronic' ]
        then
                DATASET=/TTToHadronic_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=31

        elif [ $process = 'ttbar_TTToSemileptonic' ]
        then
                DATASET=/TTToSemiLeptonic_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=33

        elif [ $process = 'ttbar_atMCaNLO' ]
        then
                DATASET=35

                ProcessInt=/TTJets_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

	elif [ $process = 'SingleTop_tchannel_top' ]
        then
                DATASET=/ST_t-channel_top_4f_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=38

        elif [ $process = 'SingleTop_tchannel_antitop' ]
        then
                DATASET=/ST_t-channel_antitop_4f_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=41

        elif [ $process = 'SingleTop_schannel' ]
        then
                DATASET=/ST_s-channel_4f_leptonDecays_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=44

	elif [ $process = 'TT_2l2nu_hdampUP' ]
        then
                DATASET=/TTTo2L2Nu_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=49

        elif [ $process = 'TT_2l2nu_hdampDOWN' ]
        then
                DATASET=/TTTo2L2Nu_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=52

        elif [ $process = 'TTToHadronic_hdampUP' ]
        then
                DATASET=/TTToHadronic_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=55

	elif [ $process = 'TTToHadronic_hdampDOWN' ]
        then
                DATASET=/TTToHadronic_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=56

        elif [ $process = 'TTToSemileptonic_hdampUP' ]
        then
                DATASET=/TTToSemiLeptonic_hdampUP_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=57

        elif [ $process = 'TTToSemileptonic_hdampDOWN' ]
        then
                DATASET=/TTToSemiLeptonic_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=58

	elif [ $process = 'TTToSemileptonic_hdampDOWN_ext' ]
        then
                DATASET=/TTToSemiLeptonic_hdampDOWN_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=59

        elif [ $process = 'SingleTop_tchannel_top_hdampUP' ]
        then
                DATASET=/ST_t-channel_top_4f_hdampup_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=60

        elif [ $process = 'SingleTop_tchannel_top_hdampDOWN' ]
        then
                DATASET=/ST_t-channel_top_4f_hdampdown_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=61

	elif [ $process = 'SingleTop_tchannel_antitop_hdampUP' ]
        then
                DATASET=/ST_t-channel_antitop_4f_hdampup_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=62

        elif [ $process = 'SingleTop_tchannel_antitop_hdampDOWN' ]
        then
                DATASET=/ST_t-channel_antitop_4f_hdampdown_InclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=63

        elif [ $process = 'SingleTop_tW' ]
        then
                DATASET=/ST_tW_top_5f_inclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=71

	elif [ $process = 'SingleTop_tbarW' ]
        then
                DATASET=/ST_tW_antitop_5f_inclusiveDecays_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=74

        elif [ $process = 'SingleTop_tHq' ]
        then
                DATASET=/THQ_ctcvcp_4f_Hincl_13TeV_madgraph_pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=77

        elif [ $process = 'SingleTop_tZq_W_lept_Z_had' ]
        then
                DATASET=/tZq_W_lept_Z_hadron_4f_ckm_NLO_13TeV_amcatnlo_pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=78

	elif [ $process = 'SingleTop_tWZ_tWll' ]
        then
                DATASET=/ST_tWll_5f_LO_TuneCP5_PSweights_13TeV-madgraph-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8_ext1-v1/NANOAODSIM

                ProcessInt=79

        elif [ $process = 'VV_ZZTo2l2nu' ]
        then
                DATASET=/ZZTo2L2Nu_13TeV_powheg_pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=80

        elif [ $process = 'VV_ZZTo2l2Q' ]
        then
                DATASET=/ZZTo2L2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=83

	elif [ $process = 'VV_ZZTo4L' ]
        then
                DATASET=/ZZTo4L_13TeV_powheg_pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=84

        elif [ $process = 'VV_WZTo2l2Q' ]
        then
                DATASET=/WZTo2L2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=86

        elif [ $process = 'VV_WZTo3lNu' ]
        then
                DATASET=/WZTo3LNu_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=87

        elif [ $process = 'VV_WZTo1l1Nu2Q' ]
        then
                DATASET=/WZTo1L1Nu2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=89

        elif [ $process = 'VV_WWTo2l2Nu' ]
        then
                DATASET=/WWTo2L2Nu_NNPDF31_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8_ext1-v1/NANOAODSIM

                ProcessInt=90

	elif [ $process = 'VV_WWToLNuQQ' ]
        then
                DATASET=/WWToLNuQQ_NNPDF31_TuneCP5_PSweights_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8_ext1-v1/NANOAODSIM

                ProcessInt=91

	elif [ $process = 'VV_WGToLNuG' ]
        then
                DATASET=/WGToLNuG_TuneCP5_13TeV-madgraphMLM-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=93
	
	elif [ $process = 'VV_ZGToLLG' ]
        then
                DATASET=94

                ProcessInt=/ZGToLLG_01J_5f_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

        elif [ $process = 'VVV_WWWTo4F' ]
        then
                DATASET=/WWW_4F_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=96

        elif [ $process = 'VVV_WWWTo4F_ext' ]
        then
                DATASET=/WWW_4F_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=97

	elif [ $process = 'VVV_WWZTo4F' ]
        then
                DATASET=/WWZ_4F_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=98

        elif [ $process = 'VVV_WWZTo4F_ext' ]
        then
                DATASET=/WWZ_4F_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=99

        elif [ $process = 'VVV_WZZ' ]
        then
                DATASET=/WZZ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=100

	elif [ $process = 'VVV_WZZ_ext' ]
        then
                DATASET=/WZZ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=101

        elif [ $process = 'VVV_ZZZ' ]
        then
                DATASET=/ZZZ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=102

        elif [ $process = 'VVV_ZZZ_ext' ]
        then
                DATASET=/ZZZ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=103
	
	elif [ $process = 'WPlusJets' ]
        then
                DATASET=/WJetsToLNu_TuneCP5_13TeV-madgraphMLM-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=104

        elif [ $process = 'WPlusJets_ext' ]
        then
                DATASET=/WJetsToLNu_TuneCP5_13TeV-madgraphMLM-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=105

        elif [ $process = 'ttbarV_ttWJetsToLNu' ]
        then
                DATASET=/TTWJetsToLNu_TuneCP5_PSweights_13TeV-amcatnloFXFX-madspin-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=106

	elif [ $process = 'ttbarV_ttWJetsToQQ' ]
        then
                DATASET=/TTWJetsToQQ_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM
                
                ProcessInt=108

	elif [ $process = 'ttbarV_ttZToLL' ]
        then
                DATASET=/TTZToLL_M-1to10_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM
                
                ProcessInt=109

	elif [ $process = 'ttbarV_ttZToLL_ext' ]
        then
                DATASET=/TTZToLL_M-1to10_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM
                
                ProcessInt=110

	elif [ $process = 'ttbarV_ttZToLLNuNu' ]
        then
                DATASET=/TTZToLLNuNu_M-10_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM
                
                ProcessInt=111

	elif [ $process = 'ttbarV_ttZToLLNuNu_ext' ]
        then
                DATASET=/TTZToLLNuNu_M-10_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_EXT_102X_mc2017_realistic_v8-v1/NANOAODSIM
                
                ProcessInt=112

        elif [ $process = 'ttbarV_ttZToQQ' ]
        then
                DATASET=/TTZToQQ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=114

        elif [ $process = 'ttbarV_ttZToQQ_ext' ]
        then
                DATASET=/TTZToQQ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8_ext1-v1/NANOAODSIM

                ProcessInt=115

        elif [ $process = 'ttbarV_ttHTobb' ]
        then
                DATASET=/ttHTobb_M125_TuneCP5_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=116

	elif [ $process = 'ttbarV_ttHToNonbb' ]
        then
                DATASET=/ttHToNonbb_M125_TuneCP5_13TeV-powheg-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_new_pmx_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=118

	elif [ $process = 'Data_DoubleEGRunB' ]
        then

                DATASET=/DoubleEG/Run2017B-Nano14Dec2018-v1/NANOAOD

                ProcessInt=121

	elif [ $process = 'Data_DoubleEGRunC' ]
        then

                DATASET=/DoubleEG/Run2017C-Nano14Dec2018-v1/NANOAOD

                ProcessInt=122

	elif [ $process = 'Data_DoubleEGRunD' ]
        then

                DATASET=/DoubleEG/Run2017D-Nano14Dec2018-v1/NANOAOD

                ProcessInt=123

	elif [ $process = 'Data_DoubleEGRunE' ]
        then

                DATASET=/DoubleEG/Run2017E-Nano14Dec2018-v1/NANOAOD

                ProcessInt=124

        elif [ $process = 'Data_DoubleEGRunF' ]
        then

                DATASET=/DoubleEG/Run2017F-Nano14Dec2018-v1/NANOAOD

                ProcessInt=125

        elif [ $process = 'Data_DoubleMuonRunB' ]
        then

                DATASET=/DoubleMuon/Run2017B-Nano14Dec2018-v1/NANOAOD

                ProcessInt=128

        elif [ $process = 'Data_DoubleMuonRunC' ]
        then

                DATASET=/DoubleMuon/Run2017C-Nano14Dec2018-v1/NANOAOD

                ProcessInt=129

	elif [ $process = 'Data_DoubleMuonRunD' ]
        then

                DATASET=/DoubleMuon/Run2017D-Nano14Dec2018-v1/NANOAOD

                ProcessInt=130

        elif [ $process = 'Data_DoubleMuonRunE' ]
        then

                DATASET=/DoubleMuon/Run2017E-Nano14Dec2018-v1/NANOAOD

                ProcessInt=131

        elif [ $process = 'Data_DoubleMuonRunF' ]
        then

                DATASET=/DoubleMuon/Run2017F-Nano14Dec2018-v1/NANOAOD

                ProcessInt=132

        elif [ $process = 'Data_MuonEGRunB' ]
        then

                DATASET=/MuonEG/Run2017B-Nano14Dec2018-v1/NANOAOD

                ProcessInt=135

	elif [ $process = 'Data_MuonEGRunC' ]
        then

                DATASET=/MuonEG/Run2017C-Nano14Dec2018-v1/NANOAOD

                ProcessInt=136

        elif [ $process = 'Data_MuonEGRunD' ]
        then

                DATASET=/MuonEG/Run2017D-Nano14Dec2018-v1/NANOAOD

                ProcessInt=137

        elif [ $process = 'Data_MuonEGRunE' ]
        then

                DATASET=/MuonEG/Run2017E-Nano14Dec2018-v1/NANOAOD

                ProcessInt=138

	elif [ $process = 'Data_MuonEGRunF' ]
        then

                DATASET=/MuonEG/Run2017F-Nano14Dec2018-v1/NANOAOD

                ProcessInt=139

	elif [ $process = 'Data_SingleMuonRunB' ]
        then

                DATASET=/SingleMuon/Run2017B-Nano25Oct2019-v1/NANOAOD

                ProcessInt=142

        elif [ $process = 'Data_SingleMuonRunC' ]
        then

                DATASET=/SingleMuon/Run2017C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=143

        elif [ $process = 'Data_SingleMuonRunD' ]
        then

                DATASET=/SingleMuon/Run2017D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=144

	elif [ $process = 'Data_SingleMuonRunE' ]
        then

                DATASET=/SingleMuon/Run2017E-Nano25Oct2019-v1/NANOAOD

                ProcessInt=145

        elif [ $process = 'Data_SingleMuonRunF' ]
        then

                DATASET=/SingleMuon/Run2017F-Nano25Oct2019-v1/NANOAOD

                ProcessInt=146

        elif [ $process = 'Data_SingleElectronRunB' ]
        then

                DATASET=/SingleElectron/Run2017B-Nano25Oct2019-v1/NANOAOD

                ProcessInt=149

        elif [ $process = 'Data_SingleElectronRunC' ]
        then

                DATASET=/SingleElectron/Run2017C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=150

	elif [ $process = 'Data_SingleElectronRunD' ]
        then

                DATASET=/SingleElectron/Run2017D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=151

        elif [ $process = 'Data_SingleElectronRunE' ]
        then

                DATASET=/SingleElectron/Run2017E-Nano25Oct2019-v1/NANOAOD

                ProcessInt=152

        elif [ $process = 'Data_SingleElectronRunF' ]
        then

                DATASET=/SingleElectron/Run2017F-Nano25Oct2019-v1/NANOAOD

                ProcessInt=153

	else
                echo 'Check the process name'
                exit
        fi

elif [ $year = '2018' ]
then
	if [ $process = 'tZq' ]
        then
                DATASET=/tZq_ll_4f_ckm_NLO_TuneCP5_13TeV-madgraph-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM
                ProcessInt=0

	elif [ $process = 'ZPlusJets_M50_aMCatNLO' ]
        then
                DATASET=/DYJetsToLL_M-50_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM
               
		ProcessInt=3

	elif [ $process = 'ZPlusJets_M50_aMCatNLO_ext' ]
        then
                DATASET=/DYJetsToLL_M-50_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext2-v1/NANOAODSIM
               
                ProcessInt=4

	elif [ $process = 'ZPlusJets_M10To50_Madgraph' ]
        then
                DATASET=/DYJetsToLL_M-10to50_TuneCP5_13TeV-madgraphMLM-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM
               
                ProcessInt=9

	elif [ $process = 'ZPlusJets_M10To50_Madgraph_ext' ]
        then
                DATASET=/DYJetsToLL_M-10to50_TuneCP5_13TeV-madgraphMLM-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM
               
                ProcessInt=10

	elif [ $process = 'ttbar_2l2nu' ]
        then
                DATASET=/TTTo2L2Nu_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM
               
                ProcessInt=28

	elif [ $process = 'ttbar_TTToHadronic' ]
        then
                DATASET=/TTToHadronic_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM
               
                ProcessInt=31

        elif [ $process = 'ttbar_TTToHadronic_ext' ]
        then
                DATASET=/TTToHadronic_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext2-v1/NANOAODSIM

                ProcessInt=32

        elif [ $process = 'ttbar_TTToSemileptonic' ]
        then
                DATASET=/TTToSemiLeptonic_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=33

        elif [ $process = 'ttbar_TTToSemileptonic_ext' ]
        then
                DATASET=/TTToSemiLeptonic_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext3-v1/NANOAODSIM

                ProcessInt=34
        
        elif [ $process = 'ttbar_atMCaNLO' ]
        then
                DATASET=/TTJets_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=35

	elif [ $process = 'ttbar_atMCaNLO_ext' ]
        then
                DATASET=/TTJets_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext2-v1/NANOAODSIM
               
                ProcessInt=36

        elif [ $process = 'SingleTop_tchannel_top' ]
        then
                DATASET=/ST_t-channel_top_4f_InclusiveDecays_TuneCP5_13TeV-powheg-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=38

        elif [ $process = 'SingleTop_tchannel_antitop' ]
        then
                DATASET=/ST_t-channel_antitop_4f_InclusiveDecays_TuneCP5_13TeV-powheg-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=41

        elif [ $process = 'SingleTop_schannel' ]
        then
                DATASET=/ST_s-channel_4f_leptonDecays_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=44
        
        elif [ $process = 'TT_2l2nu_hdampUP' ]
        then
                DATASET=/TTTo2L2Nu_hdampUP_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=49

	elif [ $process = 'TT_2l2nu_hdampUP_ext1' ]
        then
                DATASET=/TTTo2L2Nu_hdampUP_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM
               
                ProcessInt=50

        elif [ $process = 'TT_2l2nu_hdampDOWN' ]
        then
                DATASET=/TTTo2L2Nu_hdampDOWN_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=52

        elif [ $process = 'TT_2l2nu_hdampDOWN_ext1' ]
        then
                DATASET=/TTTo2L2Nu_hdampDOWN_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=53

        elif [ $process = 'TT_2l2nu_hdampDOWN_ext2' ]
        then
                DATASET=/TTTo2L2Nu_hdampDOWN_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext2-v1/NANOAODSIM

                ProcessInt=54
        
        elif [ $process = 'TTToHadronic_hdampUP' ]
        then
                DATASET=/TTToHadronic_hdampUP_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=55

	elif [ $process = 'TTToHadronic_hdampDOWN' ]
        then
                DATASET=/TTToHadronic_hdampDOWN_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM
               
                ProcessInt=56

        elif [ $process = 'TTToSemileptonic_hdampUP' ]
        then
                DATASET=/TTToSemiLeptonic_hdampUP_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=57

        elif [ $process = 'TTToSemileptonic_hdampDOWN' ]
        then
                DATASET=/TTToSemiLeptonic_hdampDOWN_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=58

        elif [ $process = 'SingleTop_tchannel_top_hdampUP' ]
        then
                DATASET=/ST_t-channel_top_4f_hdampup_InclusiveDecays_TuneCP5_13TeV-powheg-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=60
        
        elif [ $process = 'SingleTop_tchannel_top_hdampDOWN' ]
        then
                DATASET=/ST_t-channel_top_4f_hdampdown_InclusiveDecays_TuneCP5_13TeV-powheg-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=61

	elif [ $process = 'SingleTop_tchannel_antitop_hdampUP' ]
        then
                DATASET=/ST_t-channel_antitop_4f_hdampup_InclusiveDecays_TuneCP5_13TeV-powheg-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM
               
                ProcessInt=62

        elif [ $process = 'SingleTop_tchannel_antitop_hdampDOWN' ]
        then
                DATASET=/ST_t-channel_antitop_4f_hdampdown_InclusiveDecays_TuneCP5_13TeV-powheg-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=63

        elif [ $process = 'SingleTop_tW' ]
        then
                DATASET=/ST_tW_top_5f_inclusiveDecays_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=71

        elif [ $process = 'SingleTop_tbarW' ]
        then
                DATASET=/ST_tW_antitop_5f_inclusiveDecays_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=74
        
        elif [ $process = 'SingleTop_tHq' ]
        then
                DATASET=/THQ_ctcvcp_4f_Hincl_13TeV_madgraph_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=77

	elif [ $process = 'SingleTop_tZq_W_lept_Z_had' ]
        then
                DATASET=/tZq_Zhad_Wlept_4f_ckm_NLO_TuneCP5_PSweights_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=78

        elif [ $process = 'SingleTop_tWZ_tWll' ]
        then
                DATASET=/ST_tWll_5f_LO_TuneCP5_PSweights_13TeV-madgraph-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=79

        elif [ $process = 'VV_ZZTo2l2nu_ext1' ]
        then
                DATASET=/ZZTo2L2Nu_TuneCP5_13TeV_powheg_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=81

	elif [ $process = 'VV_ZZTo2l2nu_ext2' ]
        then
                DATASET=/ZZTo2L2Nu_TuneCP5_13TeV_powheg_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext2-v1/NANOAODSIM

                ProcessInt=82

        elif [ $process = 'VV_ZZTo2l2Q' ]
        then
                DATASET=/ZZTo2L2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=83

        elif [ $process = 'VV_ZZTo4L' ]
        then
                DATASET=/ZZTo4L_TuneCP5_13TeV_powheg_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=84

	elif [ $process = 'VV_ZZTo4L_ext' ]
        then
                DATASET=/ZZTo4L_TuneCP5_13TeV_powheg_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext2-v1/NANOAODSIM

                ProcessInt=85

        elif [ $process = 'VV_WZTo2l2Q' ]
        then
                DATASET=/WZTo2L2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=86

	elif [ $process = 'VV_WZTo3lNu' ]
        then
                DATASET=/WZTo3LNu_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=87

        elif [ $process = 'VV_WZTo3lNu_ext' ]
        then
                DATASET=/WZTo3LNu_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=88

	elif [ $process = 'VV_WZTo1l1Nu2Q' ]
        then
                DATASET=/WZTo1L1Nu2Q_13TeV_amcatnloFXFX_madspin_pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=89

	elif [ $process = 'VV_WWTo2l2Nu' ]
        then
                DATASET=/WWTo2L2Nu_NNPDF31_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=90

	elif [ $process = 'VV_WWToLNuQQ' ]
        then
                DATASET=/WWToLNuQQ_NNPDF31_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=91

        elif [ $process = 'VV_WGToLNuG' ]
        then
                DATASET=/WGToLNuG_TuneCP5_13TeV-madgraphMLM-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=93

        elif [ $process = 'VV_ZGToLLG' ]
        then
                DATASET=/ZGToLLG_01J_5f_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=94

	elif [ $process = 'VV_ZGToLLG_ext' ]
        then
                DATASET=/ZGToLLG_01J_5f_TuneCP5_13TeV-amcatnloFXFX-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext2-v1/NANOAODSIM

                ProcessInt=95

        elif [ $process = 'VVV_WWWTo4F' ]
        then
                DATASET=/WWW_4F_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=96

        elif [ $process = 'VVV_WWZTo4F' ]
        then
                DATASET=/WWZ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=98

	elif [ $process = 'VVV_WZZ' ]
        then
                DATASET=/WZZ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=100

        elif [ $process = 'VVV_ZZZ' ]
        then
                DATASET=/ZZZ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIFall17NanoAODv7-PU2017_12Apr2018_Nano02Apr2020_102X_mc2017_realistic_v8-v1/NANOAODSIM

                ProcessInt=102

        elif [ $process = 'WPlusJets' ]
        then
                DATASET=/WJetsToLNu_TuneCP5_13TeV-madgraphMLM-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=104

	elif [ $process = 'ttbarV_ttWJetsToLNu' ]
        then
                DATASET=/TTWJetsToLNu_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=106

        elif [ $process = 'ttbarV_ttWJetsToQQ' ]
        then
                DATASET=/TTWJetsToQQ_TuneCP5_13TeV-amcatnloFXFX-madspin-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=108

	elif [ $process = 'ttbarV_ttZToLL' ]
        then
                DATASET=/TTZToLL_M-1to10_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=109

        elif [ $process = 'ttbarV_ttZToLLNuNu' ]
        then
                DATASET=/TTZToLLNuNu_M-10_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=111

	elif [ $process = 'ttbarV_ttZToQQ' ]
        then
                DATASET=/TTZToQQ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=114

	elif [ $process = 'ttbarV_ttZToQQ_ext' ]
        then
                DATASET=/TTZToQQ_TuneCP5_13TeV-amcatnlo-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=115

	elif [ $process = 'ttbarV_ttHTobb' ]
        then
                DATASET=/ttHTobb_M125_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21_ext1-v1/NANOAODSIM

                ProcessInt=116

	elif [ $process = 'ttbarV_ttHTobb_ext' ]
        then
                DATASET=/ttHTobb_M125_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_EXT_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=117

	elif [ $process = 'ttbarV_ttHToNonbb' ]
        then
                DATASET=/ttHToNonbb_M125_TuneCP5_13TeV-powheg-pythia8/RunIIAutumn18NanoAODv7-Nano02Apr2020_102X_upgrade2018_realistic_v21-v1/NANOAODSIM

                ProcessInt=118

        elif [ $process = 'Data_DoubleMuonRunB' ]
        then

                DATASET=/DoubleMuon/Run2018B-Nano14Dec2018-v1/NANOAOD

                ProcessInt=128

        elif [ $process = 'Data_DoubleMuonRunC' ]
        then

                DATASET=/DoubleMuon/Run2018C-Nano14Dec2018-v1/NANOAOD

                ProcessInt=129

	elif [ $process = 'Data_DoubleMuonRunD' ]
        then

                DATASET=/DoubleMuon/Run2018D-Nano14Dec2018-v1/NANOAOD

                ProcessInt=130

        elif [ $process = 'Data_MuonEGRunB' ]
        then

                DATASET=/MuonEG/Run2018B-Nano14Dec2018-v1/NANOAOD

                ProcessInt=135

	elif [ $process = 'Data_MuonEGRunC' ]
        then

                DATASET=/MuonEG/Run2018C-Nano14Dec2018-v1/NANOAOD

                ProcessInt=136

        elif [ $process = 'Data_MuonEGRunD' ]
        then

                DATASET=/MuonEG/Run2018D-Nano14Dec2018-v1/NANOAOD

                ProcessInt=137

	elif [ $process = 'Data_SingleMuonRunB' ]
        then

                DATASET=/SingleMuon/Run2018B-Nano25Oct2019-v1/NANOAOD

                ProcessInt=142

        elif [ $process = 'Data_SingleMuonRunC' ]
        then

                DATASET=/SingleMuon/Run2018C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=143

        elif [ $process = 'Data_SingleMuonRunD' ]
        then

                DATASET=/SingleMuon/Run2018D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=144

	elif [ $process = 'Data_EGRunB' ]
        then

                DATASET=/EGamma/Run2018B-Nano25Oct2019-v1/NANOAOD

                ProcessInt=156

        elif [ $process = 'Data_EGRunC' ]
        then

                DATASET=/EGamma/Run2018C-Nano25Oct2019-v1/NANOAOD

                ProcessInt=157

	elif [ $process = 'Data_EGRunD' ]
        then

                DATASET=/EGamma/Run2018D-Nano25Oct2019-v1/NANOAOD

                ProcessInt=158

	else
		echo 'Check the process'	
		exit
	fi

else
	echo 'Check the year'
	exit
fi



#writing the names of all input files to a text file
if [ ! -f ${process}_files_${year}.txt ]
then 
	dasgoclient -query="file dataset=$DATASET" > ${process}_files_${year}.txt
fi



#creating a bash script for the condor submission
mkdir -p Jobs/Job_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}

#writing the commands to be executed in each bash script
cat <<EOT >> Jobs/Job_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}/sub.sh 
#!/bin/bash
export X509_USER_PROXY=/afs/cern.ch/work/c/coldham/private/HTCondor/x509up_u114218
voms-proxy-info -all
voms-proxy-info -all -file /afs/cern.ch/work/c/coldham/private/HTCondor/x509up_u114218

if [ ! -d "/afs/cern.ch/work/c/coldham/private/HTCondor/tZq_Dilepton_NanoAOD" ]
then
	git clone https://github.com/brunel-physics/tZq_Dilepton_NanoAOD
fi

cd /afs/cern.ch/work/c/coldham/private/HTCondor/tZq_Dilepton_NanoAOD
pwd
source /cvmfs/sft.cern.ch/lcg/views/LCG_96/x86_64-slc6-gcc8-opt/setup.sh

if [ ! -d "/afs/cern.ch/work/c/coldham/private/HTCondor/tZq_Dilepton_NanoAOD/bin" ]
then
	echo "recompiling"
	make clean
	make
fi
 
./bin/fulleventselectionMain.exe --mc ${MCInt} -y ${year} -p ${ProcessInt} --npl ${NPLInt} --sr ${SRInt} --sbr ${SBRInt} --zjcr ${ZPlusJetsCRInt} --ttcr ${ttbarCRInt} --sys ${SystematicInt} --channel ${ChannelInt} --dcc 0

EOT



#creating and writing to the .sub file
cat <<"EOT" >> condor_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}.sub
executable = $(filename) 
Proxy_path = /afs/cern.ch/work/c/coldham/private/HTCondor/x509up_u114218
arguments = $(Proxy_path) $Fp(filename) $(ClusterID) $(ProcId)
output = $Fp(filename)file.stdout
error = $Fp(filename)file.stderr
log = $Fp(filename)file.log
+MaxRuntime = 2592000
EOT

cat <<EOT >> condor_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}.sub
queue filename matching (Jobs/Job_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}/*.sh)
EOT


#submitting the condor job
condor_submit /afs/cern.ch/work/c/coldham/private/HTCondor/condor_${process}_${channel}_${year}_${region}_${systematic}_${MCOrData}_${NPL}.sub
