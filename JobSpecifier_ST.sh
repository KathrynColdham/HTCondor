#!/bin/bash

ProcessNamesArray=("SingleTop_tchannel_top"             "SingleTop_tchannel_top_ScaleUp"        "SingleTop_tchannel_top_ScaleDown"      
                   "SingleTop_tchannel_antitop"         "SingleTop_tchannel_antitop_ScaleUp"    "SingleTop_tchannel_antitop_ScaleDown"  
                   "SingleTop_schannel"                 "SingleTop_tchannel_top_hdampUP"        "SingleTop_tchannel_top_hdampDOWN"	
		   "SingleTop_tchannel_antitop_hdampUP" "SingleTop_tchannel_antitop_hdampDOWN"  "SingleTop_tW"	           
		   "SingleTop_tW_ScaleUp" 	        "SingleTop_tW_ScaleDown"		"SingleTop_tbarW_ScaleUp"	   
		   "SingleTop_tbarW_ScaleDown"          "SingleTop_tHq"			        "SingleTop_tZq_W_lept_Z_had"   "SingleTop_tWZ_tWll") 


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

				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL
				./HTCondorFiles.sh ${ProcessNamesArray[i]} ${ChannelArray[l]} ${YearArray[k]} ZPlusJetsCR ${SystematicNamesArray[j]} MC NotNPL

			done
		done
	done
done
