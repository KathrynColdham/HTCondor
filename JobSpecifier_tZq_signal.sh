#!/bin/bash

ProcessNamesArray=("tZq")

SystematicNamesArray=("Nominal"			      "PU_ScaleUp"              "PU_ScaleDown"           "BTag_ScaleUp"              "BTag_ScaleDown"
                      "JetSmearing_ScaleUp"           "JetSmearing_ScaleDown"   "JEC_ScaleUp"            "JEC_ScaleDown"             "LeptonEfficiencies_ScaleUp"
                      "LeptonEfficiencies_ScaleDown"  "PDF_ScaleUp"             "PDF_ScaleDown"          "ME_ScaleUp"                "ME_ScaleDown"
                      "MET_ScaleUp"                   "MET_ScaleDown"           "isr_ScaleUp"            "isr_ScaleDown"             "fsr_ScaleUp"
                      "fsr_ScaleDown")


#YearArray=("2016" "2017" "2018")
#YearArray=("2016" "2017")
YearArray=("2016")

RegionArray=("SBR" "SR" "ttbarCR" "ZPlusJetsCR" "NoChi2Cut")

#ChannelArray=("ee" "mumu")
ChannelArray=("mumu")

for i in ${!ProcessNamesArray[@]}; do
#	for j in ${!SystematicNamesArray[@]}; do
		for k in ${!YearArray[@]}; do
			for l in ${!ChannelArray[@]}; do

				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} NoChi2Cut ${SystematicNamesArray[0]} MC NotNPL
#				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} ZPlusJetsCR ${SystematicNamesArray[0]} MC NotNPL
		
			done

#			./HTCondorFiles.sh ${ProcessNamesArray[i]} "emu" ${YearArray[k]} ttbarCR ${SystematicNamesArray[0]} MC NotNPL
		done
#	done
done
