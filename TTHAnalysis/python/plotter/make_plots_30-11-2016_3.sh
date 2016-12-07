#DATE=12-09-2016
#DATE=20-09-2016
#DATE=16-10-2016
#DATE=06-11-2016
#DATE=15-11-2016
DATEold=15-11-2016
#DATE=16-11-2016
#DATE=17-11-2016
DATE=21-11-2016
DATE=30-11-2016
#INPUT=/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/INPUT
#INPUT=/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/OFLIMITS
INPUT=/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/NAOUTPUT
L=12.9
#L=7.5

for S1 in Hut Hct; do
    for S2 in ST TT; do

        MCA=mca_${S1}${S2}_${DATE}.txt

        #OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
        #OPTIONS=" --plotmode=nostack --legendFontSize 0.035"
        #OPTIONS=" --plotmode=norm  --legendFontSize 0.035 --yrange 0.1 10000000"
        #OPTIONS=" --plotmode=nostack  --legendFontSize 0.035"
        #OPTIONS=" --legendFontSize 0.035"
        #OPTIONS=" --legendFontSize 0.035 --scaleBkgToData TT_TuneCUETP8M1_13TeV-powheg-pythia8 DYJetsToLL_M-50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8 DYJetsToLL_M-10to50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8 ST_t-channel_top_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1 ST_t-channel_antitop_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1 ST_s-channel_4f_leptonDecays_13TeV-amcatnlo-pythia8_TuneCUETP8M1 ST_tW_top_5f_NoFullyHadronicDecays_13TeV-powheg_TuneCUETP8M1 ST_tW_antitop_5f_NoFullyHadronicDecays_13TeV-powheg_TuneCUETP8M1 WJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8 --showIndivSigs --noStackSig --ss 50.0 --showRatio"
        OPTIONS=" --legendFontSize 0.035 --scaleBkgToData TT_TuneCUETP8M1_13TeV-powheg-pythia8 DYJetsToLL_M-50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8 DYJetsToLL_M-10to50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8 ST_t-channel_top_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1 ST_t-channel_antitop_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1 ST_s-channel_4f_leptonDecays_13TeV-amcatnlo-pythia8_TuneCUETP8M1 ST_tW_top_5f_NoFullyHadronicDecays_13TeV-powheg_TuneCUETP8M1 ST_tW_antitop_5f_NoFullyHadronicDecays_13TeV-powheg_TuneCUETP8M1 WJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8 --showIndivSigShapes --noStackSig --showRatio"
        OPTIONS="${OPTIONS} --showMCError systsEnv_${S1}${S2}_${DATE}.txt"
        #OPTIONS="${OPTIONS} --showMCError"
        OUTPUT="~/www/${DATE}/tHFCNC/3"
#        OPTIONS=" --plotmode=norm  --legendFontSize 0.035"
#        OUTPUT="~/www/${DATE}/tHFCNC/2"
        rm -rf ${OUTPUT}
        #COMMAND="python mcPlots_modified_a.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 12.9 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
        for c in b2j3 b2j4 b3j3 b3j4; do
            #COMMAND="python mcPlots_${DATEold//-/}.py -P ${INPUT} -j 8 -l $L -f --maxRatioRange 0 3.7 --poisson ${MCA/.txt/_data.txt} cuts.txt plots_${S1}${S2}_${DATE}.txt --pdir ${OUTPUT}/${S1}${S2}/${c} --tree tr_all_${c} $OPTIONS"
            COMMAND="python mcPlots_${DATEold//-/}.py -P ${INPUT} -j 8 -l $L -f --maxRatioRange 0 3.7 --poisson ${MCA/.txt/_data.txt} cuts.txt ${S1}${S2}_all_${c}_vars.txt --pdir ${OUTPUT}/${S1}${S2}/${c} --tree tr_all_${c} $OPTIONS"
            echo $COMMAND
            #eval $COMMAND &
        done

    done
done

