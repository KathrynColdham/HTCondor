#!/bin/bash

ProcessNamesArray=("tZq_scaleup" "tZq_scaledown")

SystematicNamesArray=("Nominal"                       "PU_ScaleUp"              "PU_ScaleDown"           "BTag_ScaleUp"              "BTag_ScaleDown"
                      "JetSmearing_ScaleUp"           "JetSmearing_ScaleDown"   "JEC_ScaleUp"            "JEC_ScaleDown"             "LeptonEfficiencies_ScaleUp"
                      "LeptonEfficiencies_ScaleDown"  "PDF_ScaleUp"             "PDF_ScaleDown"          "ME_ScaleUp"                "ME_ScaleDown"
                      "MET_ScaleUp"                   "MET_ScaleDown"           "isr_ScaleUp"            "isr_ScaleDown"             "fsr_ScaleUp"
                      "fsr_ScaleDown")

YearArray=("2016" "2017" "2018")

RegionArray=("SBR" "SR" "ttbarCR" "ZPlusJetsCR" "NoChi2Cut")

ChannelArray=("ee" "mumu")

for i in ${!ProcessNamesArray[@]}; do
	for j in ${!SystematicNamesArray[@]}; do
		for k in ${!YearArray[@]}; do
			for l in ${!ChannelArray[@]}; do

				#./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL
				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} ZPlusJetsCR ${SystematicNamesArray[j]} MC NotNPL

			done

			./HTCondorFiles.sh ${ProcessNamesArray[i]} "emu" ${YearArray[k]} ttbarCR ${SystematicNamesArray[j]} MC NotNPL
	
		done
	done
done
