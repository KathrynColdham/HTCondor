#!/bin/bash

ProcessNamesArray=("VV_ZZTo2l2nu"			"VV_ZZTo2l2nu_ext1"			"VV_ZZTo2l2nu_ext2"
		   "VV_ZZTo2l2Q"			"VV_ZZTo4L"				"VV_ZZTo4L_ext"
		   "VV_WZTo2l2Q"			"VV_WZTo3lNu"				"VV_WZTo3lNu_ext"
		   "VV_WZTo1l1Nu2Q"			"VV_WWTo2l2Nu"				"VV_WWToLNuQQ"
		   "VV_WWToLNuQQ_ext"			"VV_WGToLNuG"				"VV_ZGToLLG_ext")

SystematicNamesArray=("Nominal"			      "PU_ScaleUp"              "PU_ScaleDown"           "BTag_ScaleUp"              "BTag_ScaleDown"
                      "JetSmearing_ScaleUp"           "JetSmearing_ScaleDown"   "JEC_ScaleUp"            "JEC_ScaleDown"             "LeptonEfficiencies_ScaleUp"
                      "LeptonEfficiencies_ScaleDown"  "PDF_ScaleUp"             "PDF_ScaleDown"          "ME_ScaleUp"                "ME_ScaleDown"
                      "MET_ScaleUp"                   "MET_ScaleDown"           "isr_ScaleUp"            "isr_ScaleDown"             "fsr_ScaleUp"
                      "fsr_ScaleDown")

#YearArray=("2016" "2017" "2018")
YearArray=("2018")

RegionArray=("SBR" "SR" "ttbarCR" "ZPlusJetsCR" "NoChi2Cut")

ChannelArray=("ee" "mumu")
#ChannelArray=("ee")
#ChannelArray=("mumu")

for i in ${!ProcessNamesArray[@]}; do
#	for j in ${!SystematicNamesArray[@]}; do
		for k in ${!YearArray[@]}; do
			for l in ${!ChannelArray[@]}; do

				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} NoChi2Cut ${SystematicNamesArray[0]} MC NotNPL
		#		./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} ZPlusJetsCR ${SystematicNamesArray[j]} MC NotNPL

			done

		#	./HTCondorFiles.sh ${ProcessNamesArray[i]} "emu" ${YearArray[k]} ttbarCR ${SystematicNamesArray[j]} MC NotNPL
		done
#	done
done
