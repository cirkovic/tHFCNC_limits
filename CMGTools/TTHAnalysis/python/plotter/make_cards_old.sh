#!/bin/bash

if [[ "$HOSTNAME" == "cmsphys05" ]]; then
    T="/data/b/botta/TTHAnalysis/trees/TREES_250513_HADD";
    J=6;
else
    #T="/afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA";
    #T="/afs/cern.ch/work/m/mdjordje/TTH/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    #T="/afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    T="/afs/cern.ch/work/m/mdjordje/TTH/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    #T="/afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/cfg/TREES_76X_150216_noLHE_jecV1_noJecUnc";
    T="/afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_200216_jecV1M2";
    J=4;
fi

MVA_2LSS_TTBAR=kinMVA_2lss_ttbar
MVA_2LSS_TTV=kinMVA_2lss_ttV
MVA_3L_TTBAR=kinMVA_3l_ttbar
MVA_3L_TTV=kinMVA_3l_ttV

MVA_2LSS_TTBAR=MVA_2LSS_2lss_ttbar_default_0
MVA_2LSS_TTV=MVA_2LSS_2lss_ttV_default_0
MVA_3L_TTBAR=MVA_3L_3l_ttbar_default_0
MVA_3L_TTV=MVA_3L_3l_ttV_default_0

SCENARIO=""
if echo "X$1" | grep -q "scenario"; then SCENARIO="$1"; shift; fi
OPTIONS=" -P $T -j $J -l 2.26 -f  --od cards/new "
if [[ "$SCENARIO" != "" ]]; then
    test -d cards/$SCENARIO || mkdir -p cards/$SCENARIO
    OPTIONS=" -P $T -j $J -l 2.26 -f  --od cards/$SCENARIO --project $SCENARIO --asimov";
else
    OPTIONS=" -P $T -j $J -l 2.26 -f  --od cards/2DMVA_cats_marco_binning_new --tree treeProducerSusyMultilepton --asimov --mcc BINS_new/lepchoice-ttH-FO.txt --mcc BINS_new/ttH_2lss3l_triggerdefs.txt";
fi
SYSTS="systsEnv_2015.txt ../../macros/systematics/btagSysts2.txt"

#BLoose=" -I 2B "
#BAny=" -X 2B "
#BTight="  "

if [[ "$1" == "" ]] || echo $1 | grep -q 2lss; then
    OPTIONS="${OPTIONS} "
    #OPT_2L="${OPTIONS} -W puWeight*Eff_2lep*SF_btag*SF_LepMVATight_2l*SF_LepTightCharge_2l*SF_trig2l_new"
    OPT_2L="${OPTIONS} "
    #RECL="-F  sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/2_recleaner_v6_vetoCSVM_eleIdEmuPt30_PtRatio030orMVA/evVarFriend_{cname}.root"  
#    VARS="-F  sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/4_kinMVA_trainMarcoJan27_v1_fix_reliso_conept/evVarFriend_{cname}.root"
    FTREES=""
#    FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
    FTREES="$FTREES -F sf/t ${T}/2_recleaner_v8_b1E2/evVarFriend_{cname}.root"
#    FTREES="$FTREES -F sf/t /afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
    MVA_2D="-F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES_new_new/finalMVA_2lss_categorized_2D/evVarFriend_{cname}.root "
    #PU="-F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/1_puweight_true_2015_v0/evVarFriend_{cname}.root -W 'vtxWeight'"
    POS=" -A pt2010 positive LepGood1_charge>0 "
    NEG=" -A pt2010 positive LepGood1_charge<0 "
###    for X in 2lss_{mumu,ee,em}; do 
        #if [[ "$X" == "2lss_mumu" ]]; then continue; fi
        echo $X; #~gpetrucc/sh/bann $X
        # ---- MVA separated by charge (for nominal result) ----	


# 0tau	

    #bloose&btight (merged)
    CUT="-E ee -E 0tau"
    
        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_ee_0tau_BCat_MVA_pos  $MVA_2D $CUT $POS $BAny  --s2v &
        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_ee_0tau_BCat_MVA_neg  $MVA_2D $CUT $NEG $BAny  --s2v &

    #bloose
    CUT="-E em -E BLoose -E 0tau"

        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_em_0tau_bl_BCat_MVA_pos  $MVA_2D $CUT $POS $BAny  --s2v &
        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_em_0tau_bl_BCat_MVA_neg  $MVA_2D $CUT $NEG $BAny  --s2v &

    #btight
    CUT="-E em -E BTight -E 0tau"

        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_em_0tau_bt_BCat_MVA_pos  $MVA_2D $CUT $POS $BAny  --s2v &
        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_em_0tau_bt_BCat_MVA_neg  $MVA_2D $CUT $NEG $BAny  --s2v &

    #bloose
    CUT="-E mm -E BLoose -E 0tau"

        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_mumu_0tau_bl_BCat_MVA_pos  $MVA_2D $CUT $POS $BAny  --s2v &
        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_mumu_0tau_bl_BCat_MVA_neg  $MVA_2D $CUT $NEG $BAny  --s2v &

    #btight
    CUT="-E mm -E BTight -E 0tau"

        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_mumu_0tau_bt_BCat_MVA_pos  $MVA_2D $CUT $POS $BAny  --s2v &
        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_mumu_0tau_bt_BCat_MVA_neg  $MVA_2D $CUT $NEG $BAny  --s2v &

# 1tau
    CUT="-E 1tau"

        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_1tau_BCat_MVA_pos  $MVA_2D $CUT $POS $BAny  --s2v &
        python makeShapeCards.py mca_2015.txt BINS_new/2lss_tight.txt 'ttH_MVAto1D_6_2lss('${MVA_2LSS_TTBAR}','${MVA_2LSS_TTV}',1,1)'  '6, 0.5, 6.5' $RECL $FTREES $PU $SYSTS $OPT_2L -o 2lss_1tau_BCat_MVA_neg  $MVA_2D $CUT $NEG $BAny  --s2v &



fi

if [[ "$1" == "" || "$1" == "3l_tight" ]]; then
    OPTIONS="${OPTIONS} "
    #OPT_3L="${OPTIONS} -W  puWeight*Eff_3lep*SF_btag*SF_LepMVATight_3l*SF_LepTightCharge_3l"
    OPT_3L="${OPTIONS} "
    #RECL="-F  sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/2_recleaner_v6_vetoCSVM_eleIdEmuPt30_PtRatio030orMVA/evVarFriend_{cname}.root"  
#    VARS="-F  sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/4_kinMVA_trainMarcoJan27_v1_fix_reliso_conept/evVarFriend_{cname}.root"
    FTREES=""
    #FTREES="$FTREES -F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_76X_150216_noLHE_jecV1_noJecUnc/2_recleaner_v8_b1E2_approx/evVarFriend_{cname}.root"
    FTREES="$FTREES -F sf/t ${T}/2_recleaner_v8_b1E2/evVarFriend_{cname}.root"
#    FTREES="$FTREES -F sf/t /afs/cern.ch/work/p/peruzzi/tthtrees/TREES_76X_150216_noLHE_jecV1_noJecUnc/4_kinMVA_74XtrainingMilosJan31_v3_reclv8/evVarFriend_{cname}.root"
    MVA_2D="-F sf/t /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_6_3/src/CMGTools/TTHAnalysis/macros/FTREES_new_new/finalMVA_3l_categorized_2D/evVarFriend_{cname}.root "
    #PU="-F sf/t /afs/cern.ch/work/m/mdjordje/TTH/TREES_74X_140116_MiniIso_tauClean_Mor16lepMVA/1_puweight_true_2015_v0/evVarFriend_{cname}.root -W 'vtxWeight'"
    POS=" -A pt2010 positive LepGood1_charge+LepGood2_charge+LepGood3_charge>0 "
    NEG=" -A pt2010 positive LepGood1_charge+LepGood2_charge+LepGood3_charge<0 "

    # ---- MVA separated by charge (for nominal result) ----

    #bloose
    CUT="-E BLoose"
      
       python makeShapeCards.py mca_2015.txt BINS_new/3l_tight.txt 'ttH_MVAto1D_4_3l('${MVA_3L_TTBAR}','${MVA_3L_TTV}')'  '4, 0.5, 4.5' $RECL $FTREES $PU $SYSTS $OPT_3L -o 3lBCat_bl_MVA_pos $MVA_3L $MVA_2D $CUT $POS $BAny  --s2v &
       python makeShapeCards.py mca_2015.txt BINS_new/3l_tight.txt 'ttH_MVAto1D_4_3l('${MVA_3L_TTBAR}','${MVA_3L_TTV}')'  '4, 0.5, 4.5' $RECL $FTREES $PU $SYSTS $OPT_3L -o 3lBCat_bl_MVA_neg $MVA_3L $MVA_2D $CUT $NEG $BAny  --s2v &

    #btight
    CUT="-E BTight"

       python makeShapeCards.py mca_2015.txt BINS_new/3l_tight.txt 'ttH_MVAto1D_4_3l('${MVA_3L_TTBAR}','${MVA_3L_TTV}')'  '4, 0.5, 4.5' $RECL $FTREES $PU $SYSTS $OPT_3L -o 3lBCat_bt_MVA_pos $MVA_3L $MVA_2D $CUT $POS $BAny  --s2v &
       python makeShapeCards.py mca_2015.txt BINS_new/3l_tight.txt 'ttH_MVAto1D_4_3l('${MVA_3L_TTBAR}','${MVA_3L_TTV}')'  '4, 0.5, 4.5' $RECL $FTREES $PU $SYSTS $OPT_3L -o 3lBCat_bt_MVA_neg $MVA_3L $MVA_2D $CUT $NEG $BAny  --s2v &


fi

