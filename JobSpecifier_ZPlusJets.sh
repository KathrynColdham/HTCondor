#!/bin/bash

ProcessNamesArray=("ZPlusJets_M50_aMCatNLO"             "ZPlusJets_M50_aMCatNLO_ext"            "ZPlusJets_M50_Madgraph"
                   "ZPlusJets_M50_Madgraph_ext"         "ZPlusJets_M10To50_aMCatNLO"            "ZPlusJets_M10To50_aMCatNLO_ext"
                   "ZPlusJets_M10To50_Madgraph"         "ZPlusJets_M10To50_Madgraph_ext"        "ZPlusJets_PtBinned_0To50"
                   "ZPlusJets_PtBinned_50To100"         "ZPlusJets_PtBinned_50To100_ext"        "ZPlusJets_PtBinned_100To250"
                   "ZPlusJets_PtBinned_100To250_ext1"   "ZPlusJets_PtBinned_100To250_ext2"      "ZPlusJets_PtBinned_100To250_ext5"
                   "ZPlusJets_PtBinned_250To400"        "ZPlusJets_PtBinned_250To400_ext1"      "ZPlusJets_PtBinned_250To400_ext2"
                   "ZPlusJets_PtBinned_250To400_ext5"   "ZPlusJets_PtBinned_400To650"           "ZPlusJets_PtBinned_400To650_ext1"
                   "ZPlusJets_PtBinned_400To650_ext2"   "ZPlusJets_PtBinned_650ToInf"           "ZPlusJets_PtBinned_650ToInf_ext1"
                   "ZPlusJets_PtBinned_650ToInf_ext2") 


SystematicNamesArray=("Nominal"                       "PU_ScaleUp"              "PU_ScaleDown"           "BTag_ScaleUp"              "BTag_ScaleDown"
                      "JetSmearing_ScaleUp"           "JetSmearing_ScaleDown"   "JEC_ScaleUp"            "JEC_ScaleDown"             "LeptonEfficiencies_ScaleUp"
                      "LeptonEfficiencies_ScaleDown"  "PDF_ScaleUp"             "PDF_ScaleDown"          "ME_ScaleUp"                "ME_ScaleDown"
                      "MET_ScaleUp"                   "MET_ScaleDown"           "isr_ScaleUp"            "isr_ScaleDown"             "fsr_ScaleUp"
                      "fsr_ScaleDown")


for i in ${!ProcessNamesArray[@]}; do
	for j in ${!SystematicNamesArray[@]}; do

		./HTCondorFiles.sh ${ProcessNamesArray[i]} ee 2016 NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL
        	./HTCondorFiles.sh ${ProcessNamesArray[i]} mumu 2016 NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL
		./HTCondorFiles.sh ${ProcessNamesArray[i]} ee 2017 NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL
		./HTCondorFiles.sh ${ProcessNamesArray[i]} mumu 2017 NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL
		./HTCondorFiles.sh ${ProcessNamesArray[i]} ee 2018 NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL
        	./HTCondorFiles.sh ${ProcessNamesArray[i]} mumu 2018 NoChi2Cut ${SystematicNamesArray[j]} MC NotNPL

	done
done
