#N=10000
#N=30000
#N=20000
N="-N 50000"
#N="-N 100000"
#N="-N 500000"
NP="-l 10"
#NP="-l 40"
Q="-q 1nh"
#INPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/cfg/TREES_74X_100815_MiniIso_25nsMC
#INPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/cfg/SAMPLES/training
#INPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/cfg/SAMPLES/
#INPUT=/afs/cern.ch/work/m/mdjordje/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/25ns
#INPUT=/afs/cern.ch/work/p/peruzzi/ra5trees/TREES_74X_161015_MiniIso
#INPUT=/afs/cern.ch/work/c/cirkovic/Milos_21-10-2015/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/SAMPLES_pow
#INPUT=/afs/cern.ch/work/m/mdjordje/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/25ns
#INPUT=/afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso
#INPUT=/afs/cern.ch/work/c/cirkovic/Milos_14-01-2016/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/TREES_jec
#INPUT=/afs/cern.ch/work/p/peruzzi/tthtrees/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA
#INPUT=/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc
#INPUT=/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc_ttZ
#INPUT=/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc_ttH_ttW
#INPUT=/afs/cern.ch/work/c/cirkovic/Milos_20-01-2016/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/TREES_74X_161015_MiniIso
#INPUT=/afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc
#INPUT=/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/OUTPUT_TTH_TTW_TTZ_LHE
#INPUT=/afs/cern.ch/work/m/mdjordje/TTH/TREES_76X_150216_noLHE_jecV1_noJecUnc
#INPUT=/afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_200216_jecV1M2
#INPUT=/afs/cern.ch/work/c/cirkovic/fcnc/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/OUTPUT
#INPUT=/afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT
INPUT=/afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT
#FTBASE=FTREES_04-11-2015
#FTBASE=FTREES
#FTBASE=FTREES_LO
#FTBASE=FTS_new
#FTBASE=FTREES_new_new
FTBASE=FTREES

RUNSCRIPT=bsub_all_tmp.sh
rm -rf $RUNSCRIPT
touch $RUNSCRIPT

#EXTENSION=eventVars_2lss
#EXTENSION=sort_by_btag
#EXTENSION=L_phi
#EXTENSION=L_phi_iso
#EXTENSION=L_phi_with_iso
#EXTENSION=finalMVA_2lss_categorized
#EXTENSION=finalMVA_2lss_categorized_2D
#EXTENSION=finalMVA_3l_categorized
#EXTENSION=LepMVAFriend
##EXTENSION=finalMVA_2lss_categorized_2D_3l_categorized

##EXTENSION=eventVars_2lss_L_phi_with_iso_sort_by_btag
#EXTENSION=eventVars_2lss_L_phi_with_iso_sort_by_btag_newLepMVA
#EXTENSION=eventVars_2lss_L_phi_with_iso_sort_by_btag_newLepMVA_pow
#EXTENSION=finalMVA_2lss_categorized
#XTENSION=finalMVA_3l_categorized

#EXTENSION=eventVars_2lss_L_phi_with_iso_sort_by_btag
#EXTENSION=finalMVA_2lss_categorized
#EXTENSION=finalMVA_3l_categorized

#EXTENSION=eventVars_angular1
#EXTENSION=finalMVA_2lss_categorized
#EXTENSION=finalMVA_2lss_categorized_1
#EXTENSION=finalMVA_3l_categorized
#EXTENSION=finalMVA_3l_categorized_Nicolas
#EXTENSION=finalMVA_2lss_categorized_ttW_vs_ttbar
#EXTENSION=finalMVA_2lss_categorized_ttW_ttbar_mix
#EXTENSION=finalMVA_2lss_categorized_2D
#EXTENSION=finalMVA_3l_categorized_2D

#EXTENSION=eventVars_angular
#EXTENSION=finalMVA_2lss_categorized_2D
#EXTENSION=finalMVA_3l_categorized_2D
#EXTENSION=jet_vars
#EXTENSION=finalMVA_2lss_categorized_2D_Recl
#EXTENSION=finalMVA_3l_categorized_2D_Recl
#EXTENSION=JetVars
#EXTENSION=BDT2_2lss_categorized_2D
#EXTENSION=finalMVA_2lss_categorized_2D_BDT2
#EXTENSION=eventVars
#EXTENSION=finalMVA_2lss_categorized_2D
#EXTENSION=finalMVA_3l_categorized_2D
#EXTENSION=LHEWeights
#EXTENSION=mvaVars
EXTENSION=MVAVars

COMPONENT="prepareEventVariablesFriendTree_$EXTENSION"

if [[ $EXTENSION == "MVAVars" ]]; then
    for i in b2j4 b3j3 b3j4; do
        OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}/${i}
        rm -rf $OUTPUT
        mkdir -p $OUTPUT
        #FTREES=""
        #FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES/eventVars/evVarFriend_{cname}.root"
        #FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
        #FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
        FTREES=""
        #FTREES="$FTREES -F sf/t /afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
        #FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
        #FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2/evVarFriend_{cname}.root"
        COM="python ${COMPONENT}_${i}.py $Q $N -T 'sf' -t tr_all_${i} $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT"
        eval $COM
    done
fi

if [[ $EXTENSION == "SKIP_MVAVars" ]]; then
for i in b2j4 b3j3 b3j4; do
    OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}/${i}
    rm -rf $OUTPUT
    mkdir -p $OUTPUT
    #FTREES=""
    #FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES/eventVars/evVarFriend_{cname}.root"
    #FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
    #FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
    FTREES=""
    #FTREES="$FTREES -F sf/t /afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
    #FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
    #FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2/evVarFriend_{cname}.root"
    COM="python ${COMPONENT}_${i}.py $Q $N -T 'sf' -t tr_all_${i} $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT"
    #echo $COM
    eval $COM
done
fi

if [[ $EXTENSION == "mvaVars" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
#FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES/eventVars/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t tr_m $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "LHEWeights" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES/eventVars/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "finalMVA_2lss_categorized_2D" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
#FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES/eventVars/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "finalMVA_3l_categorized_2D" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
#FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES/eventVars/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
FTREES=""
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${INPUT}/2_recleaner_v8_b1E2/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "eventVars" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi



if [[ $EXTENSION == "finalMVA_2lss_categorized_2D_BDT2" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/2_recleaner_v4_vetoCSVM/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/4_kinMVA_trainMarcoJan27_v1_fix_reliso_conept/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/3_BDT2var_v0/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "JetVars" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "BDT2_2lss_categorized_2D" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
FTREES="$FTREES -F sf/t /afs/cern.ch/work/c/cirkovic/Milos_20-01-2016/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/macros/FTREES/JetVars/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "jet_vars" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "finalMVA_2lss_categorized_2D_Recl" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/FT/Final_MVA_FT/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/FT/3_kinBDTvars_v0/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/FT/2_recleaner_v1/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "finalMVA_3l_categorized_2D_Recl" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/FT/Final_MVA_FT/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/FT/3_kinBDTvars_v0/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/FT/2_recleaner_v1/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi




if [[ $EXTENSION == "eventVars_2lss" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "sort_by_btag" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "L_phi" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "L_phi_iso" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "L_phi_with_iso" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "eventVars_2lss_L_phi_with_iso_sort_by_btag" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "eventVars_angular" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
#PUREWEIGHT=""
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v2_run2015D_unblindedjson/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v3_run2015D_upto258750/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v2_run2015D_unblindedjson/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v3_run2015D_upto258750/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -W vtxWeight"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "eventVars_angular1" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
#PUREWEIGHT=""
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v2_run2015D_unblindedjson/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v3_run2015D_upto258750/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v2_run2015D_unblindedjson/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -F sf/t /afs/cern.ch/work/m/mdjordje/TREES/TREES_74X_161015_MiniIso/1_puWeights_v3_run2015D_upto258750/evVarFriend_{cname}.root"
#PUREWEIGHT="$PUREWEIGHT -W vtxWeight"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES $PUREWEIGHT 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "eventVars_2lss_L_phi_with_iso_sort_by_btag_newLepMVA" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "eventVars_2lss_L_phi_with_iso_sort_by_btag_newLepMVA_pow" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "LepMVAFriend" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES="-F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

#if [[ $EXTENSION == "finalMVA_2lss_categorized" ]]; then
#OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
#rm -rf $OUTPUT
#mkdir -p $OUTPUT
#FTREES=""
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag_newLepMVA/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/25ns/Final_MVA_FT/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/25ns/Final_MVA_FT_L_phi_iso/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/CMSSW_7_4_12_patch4/src/CMGTools/TTHAnalysis/cfg/25ns/Lep_MVA_FT/evVarFriend_{cname}.root"
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/L_phi_with_iso/evVarFriend_{cname}.root"
#python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
#fi

if [[ $EXTENSION == "finalMVA_2lss_categorized" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_angular/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "finalMVA_2lss_categorized_1" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_angular/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi


if [[ $EXTENSION == "finalMVA_2lss_categorized_ttW_vs_ttbar" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_angular/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "finalMVA_2lss_categorized_ttW_ttbar_mix" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_angular/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/finalMVA_2lss_categorized_ttW_vs_ttbar/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

#if [[ $EXTENSION == "finalMVA_2lss_categorized_2D" ]]; then
#OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
#rm -rf $OUTPUT
#mkdir -p $OUTPUT
#FTREES=""
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_angular/evVarFriend_{cname}.root"
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_angular1/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_angular/evVarFriend_{cname}.root"
#python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
#fi

#if [[ $EXTENSION == "finalMVA_3l_categorized_2D" ]]; then
#OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
#rm -rf $OUTPUT
#mkdir -p $OUTPUT
#FTREES=""
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_angular/evVarFriend_{cname}.root"
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_angular1/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_angular/evVarFriend_{cname}.root"
#python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
#fi

#if [[ $EXTENSION == "finalMVA_2lss_categorized_2D" ]]; then
#OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
#rm -rf $OUTPUT
#mkdir -p $OUTPUT
#FTREES=""
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss/evVarFriend_{cname}.root"
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/L_phi_with_iso/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag_newLepMVA/evVarFriend_{cname}.root"
#python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
#fi

#if [[ $EXTENSION == "finalMVA_3l_categorized" ]]; then
#OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}_1
#rm -rf $OUTPUT
#mkdir -p $OUTPUT
#FTREES=""
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss/evVarFriend_{cname}.root"
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/L_phi_with_iso/evVarFriend_{cname}.root"
##FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/sort_by_btag/evVarFriend_{cname}.root"
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag_newLepMVA/evVarFriend_{cname}.root"
#python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
#fi

if [[ $EXTENSION == "finalMVA_3l_categorized" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag/evVarFriend_{cname}.root"
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_3l_angular/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

if [[ $EXTENSION == "finalMVA_3l_categorized_Nicolas" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_3l_angular/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

#if [[ $EXTENSION == "finalMVA_3l_categorized_2D" ]]; then
#OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/${EXTENSION}
#rm -rf $OUTPUT
#mkdir -p $OUTPUT
#FTREES=""
#FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_3l_angular/evVarFriend_{cname}.root"
#python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
#fi

if [[ $EXTENSION == "finalMVA_2lss_categorized_2D_3l_categorized" ]]; then
OUTPUT=${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/$EXTENSION
rm -rf $OUTPUT
mkdir -p $OUTPUT
FTREES=""
FTREES="$FTREES -F sf/t ${CMSSW_BASE}/src/CMGTools/TTHAnalysis/macros/${FTBASE}/eventVars_2lss_L_phi_with_iso_sort_by_btag/evVarFriend_{cname}.root"
python $COMPONENT.py $Q $N -T 'sf' -t treeProducerSusyMultilepton $INPUT $OUTPUT $FTREES 2>&1 | tee -a $RUNSCRIPT
fi

grep "bsub $Q " $RUNSCRIPT > bsub_all.sh
rm -rf bsub_all_tmp.sh
chmod +x bsub_all.sh

cp -f bsub_all.sh lsub_all.sh
sed -i 's/bsub -q 1nh //g' lsub_all.sh
sed -i 's/$/\&\nPS="$PS $!"/' lsub_all.sh

rm -rf scripts_$EXTENSION
mkdir scripts_$EXTENSION

mv bsub_all.sh scripts_$EXTENSION/bsub_2lss_all.sh
mv lsub_all.sh scripts_$EXTENSION/lsub_2lss_all.sh

cd scripts_$EXTENSION
split $NP lsub_2lss_all.sh lsub_2lss
mv lsub_2lss_all.sh Lsub_2lss_all.sh

for i in `ls lsub_2lss*`;
do
    sed -i '1s/^/PS=""\n/' $i
    echo wait \$PS >> $i
done

cp ../run_separate.sh .

