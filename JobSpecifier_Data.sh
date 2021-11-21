#!/bin/bash

ProcessNamesArray=("Data_DoubleEGRunB"       "Data_DoubleEGRunC"       "Data_DoubleEGRunD"       "Data_DoubleEGRunE"   
		   "Data_DoubleEGRunG"       "Data_DoubleEGRunH"       "Data_DoubleMuonRunB"     "Data_DoubleMuonRunC" 
		   "Data_DoubleMuonRunD"     "Data_DoubleMuonRunE"     "Data_DoubleMuonRunF"     "Data_DoubleMuonRunG" 
		   "Data_DoubleMuonRunH"     "Data_MuonEGRunB"         "Data_MuonEGRunC"         "Data_MuonEGRunD"     
		   "Data_MuonEGRunE"         "Data_MuonEGRunF"         "Data_MuonEGRunG"         "Data_MuonEGRunH"
		   "Data_SingleMuonRunB"     "Data_SingleMuonRunC"     "Data_SingleMuonRunD"     "Data_SingleMuonRunE" 
		   "Data_SingleMuonRunF"     "Data_SingleMuonRunG"     "Data_SingleMuonRunH"     "Data_SingleElectronRunB" 
		   "Data_SingleElectronRunC" "Data_SingleElectronRunD" "Data_SingleElectronRunE" "Data_SingleElectronRunF" 
		   "Data_SingleElectronRunG" "Data_SingleElectronRunH" "Data_EGRunB"		 "Data_EGRunC"
		   "Data_EGRunD")

YearArray=("2016" "2017" "2018")

RegionArray=("SBR" "SR" "ttbarCR" "ZPlusJetsCR" "NoChi2Cut")

ChannelArray=("ee" "mumu")

for i in ${!ProcessNamesArray[@]}; do
	for k in ${!YearArray[@]}; do
		for l in ${!ChannelArray[@]}; do

			./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} NoChi2Cut Nominal Data NotNPL

		done
	done
done
