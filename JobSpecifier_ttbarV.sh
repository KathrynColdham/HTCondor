#!/bin/bash

ProcessNamesArray=("ttbarV_ttWJetsToLNu"                "ttbarV_ttWJetsToLNu_ext"
                   "ttbarV_ttWJetsToQQ"                 "ttbarV_ttZToLL"                        "ttbarV_ttZToLL_ext"
                   "ttbarV_ttZToLLNuNu"                 "ttbarV_ttZToLLNuNu_ext"                "ttbarV_ttZToLLNuNu_ext2"
                   "ttbarV_ttZToQQ"                     "ttbarV_ttZToQQ_ext"                    "ttbarV_ttHTobb"
                   "ttbarV_ttHTobb_ext"                 "ttbarV_ttHToNonbb") 


SystematicNamesArray=("Nominal"                       "PU_ScaleUp"             "PU_ScaleDown"           "BTag_ScaleUp"              "BTag_ScaleDown"
                      "JetSmearing_ScaleUp"           "JetSmearing_ScaleDown"   "JEC_ScaleUp"            "JEC_ScaleDown"             "LeptonEfficiencies_ScaleUp"
                      "LeptonEfficiencies_ScaleDown"  "PDF_ScaleUp"             "PDF_ScaleDown"          "ME_ScaleUp"                "ME_ScaleDown"
                      "MET_ScaleUp"                   "MET_ScaleDown"           "isr_ScaleUp"            "isr_ScaleDown"             "fsr_ScaleUp"
                      "fsr_ScaleDown") 

YearArray=("2018")
#YearArray=("2018")

RegionArray=("SBR" "SR" "ttbarCR" "ZPlusJetsCR" "NoChi2Cut")

#ChannelArray=("ee" "mumu")
ChannelArray=("ee")

for i in ${!ProcessNamesArray[@]}; do
	#for j in ${!SystematicNamesArray[@]}; do
		for k in ${!YearArray[@]}; do
#			for l in ${!ChannelArray[@]}; do

				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} NoChi2Cut ${SystematicNamesArray[0]} MC NotNPL
#				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} ZPlusJetsCR ${SystematicNamesArray[0]} MC NotNPL

#			done

#			./HTCondorFiles.sh ${ProcessNamesArray[i]} "emu" ${YearArray[k]} ttbarCR ${SystematicNamesArray[0]} MC NotNPL
		done
#	done
done
