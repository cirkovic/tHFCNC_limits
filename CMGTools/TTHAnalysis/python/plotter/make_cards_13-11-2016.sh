#!/bin/bash

if [[ "$HOSTNAME" == "cmsphys05" ]]; then
    T="/data/b/botta/TTHAnalysis/trees/TREES_250513_HADD";
    J=6;
else
    #T="/afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA";
    #T="/afs/cern.ch/work/m/mdjordje/TTH/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    #T="/afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    #T="/afs/cern.ch/work/m/mdjordje/TTH/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    #T="/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    #T="/afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_200216_jecV1M2";
    #T="/afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT";
    #T="/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/INPUT"
    T="/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/OFLIMITS"
    J=4;
fi

SCENARIO=""
if echo "X$1" | grep -q "scenario"; then SCENARIO="$1"; shift; fi
OPTIONS=" -P $T -j $J -l 2.26 -f  --od cards/new "
if [[ "$SCENARIO" != "" ]]; then
    test -d cards/$SCENARIO || mkdir -p cards/$SCENARIO
    OPTIONS=" -P $T -j $J -l 2.26 -f  --od cards/$SCENARIO --project $SCENARIO --asimov";
else
    #OPTIONS=" -P $T -j $J -l 30.0 -f  --od cards/11-09-2016 --tree tr_m --asimov ";
    #OPTIONS=" -P $T -j $J -l 1.65 -f  --od cards/11-09-2016 --tree tr_m --asimov ";
    #OPTIONS=" -P $T -j $J -l 1.65 -f  --od cards/20-09-2016 --tree tr_m --asimov ";
    #OPTIONS=" -P $T -j $J -l 1.65 -f  --od cards/21-09-2016 --tree tr_m --asimov ";
    #OPTIONS=" -P $T -j $J -l 1.65 -f  --od cards/10-11-2016 --tree tr_all_b3j4 --asimov ";
    #OPTIONS=" -P $T -j $J -l 12.9 -f  --od cards/10-11-2016 --tree tr_all_b3j4 --asimov ";
    #OPTIONS=" -P $T -j $J -l 12.9 -f  --od cards/10-11-2016 --asimov ";
    #OPTIONS=" -P $T -j $J -l 7.5 -f  --od cards/10-11-2016 --asimov ";
    #OPTIONS=" -P $T -j $J -l 7.5 -f  --od cards/10-11-2016 ";
    #OPTIONS=" -P $T -j $J -l 12.9 -f  --od cards/10-11-2016 --tree tr_all_b3j4 ";
    #OPTIONS=" -P $T -j $J -l 12.9 -f  --od cards/13-11-2016 --asimov ";
    OPTIONS=" -P $T -j $J -l 7.5 -f  --od cards/13-11-2016 --asimov ";
fi
#SYSTS="systsEnv_2015.txt ../../macros/systematics/btagSysts2.txt"
SYSTS=""
SYSTS="systsEnv.txt"
#SYSTS="systsEnv12.txt"

#BLoose=" -I 2B "
#BAny=" -X 2B "
#BTight="  "

rm cards/13-11-2016/*.root cards/13-11-2016/*.txt

FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root"

#COMMAND="python makeShapeCards_modified_k.py kmca.txt cuts.txt 'MVA_both_e_default' '4,-0.6,0.6' ${OPTIONS} $FTREES $SYSTS -o MVA_both_e_default --s2v"
#echo $COMMAND
#eval $COMMAND

#COMMAND="python makeShapeCards_modified_k.py kmca.txt cuts.txt 'MVA_both_m_default' '4,-0.6,0.6' ${OPTIONS} $FTREES $SYSTS -o MVA_both_m_default --s2v"
#echo $COMMAND
#eval $COMMAND

PSs=""

for S1 in Hut Hct; do
    for S2 in ST TT; do
        MCA=mca_${S1}${S2}_${DATE}.txt
        for c in b2j3 b2j4 b3j3 b3j4; do
            COMMAND="python makeShapeCards_modified_k.py mca_${S1}${S2}_13-11-2016.txt cuts.txt 'mva${S1}${S2}' '10,-1.0,1.0' ${OPTIONS} --tree tr_all_${c} $FTREES ${SYSTS/.txt/_}${S1}${S2}.txt -o mva${S1}${S2}all${c} --s2v"
            echo $COMMAND
            eval $COMMAND &
            PSs="$PSs $!"

        done

    done
done

wait $PSs
