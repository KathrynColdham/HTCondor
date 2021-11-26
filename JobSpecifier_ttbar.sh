#!/bin/bash

ProcessNamesArray=("ttbar_madgraph_ext"                 "ttbar_TTToHadronic"                    "ttbar_TTToHadronic_ext"
                   "ttbar_TTToSemileptonic"             "ttbar_TTToSemileptonic_ext"            "ttbar_atMCaNLO"
                   "ttbar_atMCaNLO_ext"                 "ttbar_inc"			        "ttbar_hdampUP"			
		   "ttbar_hdampUP_ext"			"ttbar_hdampDOWN"		        "ttbar_hdampDOWN_ext"		
		   "TT_2l2nu_hdampUP_ext1"		"TT_2l2nu_hdampUP_ext2"                 "TT_2l2nu_hdampDOWN"	        
		   "TT_2l2nu_hdampDOWN_ext1"		"TT_2l2nu_hdampDOWN_ext2"               "TTToHadronic_hdampUP"		
		   "TTToHadronic_hdampDOWN"		"TTToSemileptonic_hdampUP"		"TTToSemileptonic_hdampDOWN"        
		   "TTToSemileptonic_hdampDOWN_ext"     "ttbar_isr_UP"			        "ttbar_isr_DOWN" 			
		   "ttbar_isr_DOwN_ext"                 "ttbar_fsr_UP"			        "ttbar_fsr_UP_ext"			
		   "ttbar_fsr_DOWN"		        "ttbar_fsr_DOWN_ext")	

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
