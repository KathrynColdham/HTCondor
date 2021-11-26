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
