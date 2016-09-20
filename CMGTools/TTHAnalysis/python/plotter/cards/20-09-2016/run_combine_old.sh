DIR=`pwd`
#cd /afs/cern.ch/work/c/cirkovic/Milos_18-11-2015/CMSSW_7_1_5/src
cd /afs/cern.ch/work/c/cirkovic/Milos_14-02-2016/CMSSW_7_1_5/src
eval `scramv1 runtime -sh`
cd $DIR

sh ../make_combos_2DMVA_cats.sh chargeBCat

#exit

PS=""
S0=${1} #S0
if [[ "$S0" == "-S0" ]]; then
    S0="-S 0"
fi

for i in `ls ttH_*.card.txt` combBCat_QMVA.card.txt;
do
#    combine $i -M Asymptotic -m 125.7 $S0 > OUTPUT_$(( OUTN + 1)).txt &
    combine $i -M Asymptotic -m 125.0 $S0 > OUTPUT_${i} &
    PS="$PS $!"
done

wait $PS


#for i in `ls ttH_*.card.txt`;
for i in ttH_2lss_ee_0tau_BCat_QMVA.card.txt ttH_2lss_em_0tau_bl_BCat_QMVA.card.txt ttH_2lss_em_0tau_bt_BCat_QMVA.card.txt ttH_2lss_em_0tau_BCat_QMVA.card.txt ttH_2lss_mumu_0tau_bl_BCat_QMVA.card.txt ttH_2lss_mumu_0tau_bt_BCat_QMVA.card.txt ttH_2lss_mumu_0tau_BCat_QMVA.card.txt ttH_2lss_0tau_BCat_QMVA.card.txt ttH_2lss_1tau_BCat_QMVA.card.txt ttH_2lss_BCat_QMVA.card.txt ttH_3lBCat_bl_QMVA.card.txt ttH_3lBCat_bt_QMVA.card.txt ttH_3lBCat_QMVA.card.txt combBCat_QMVA.card.txt;
#for i in combBCat_QMVA.card.txt;
do
    echo $i
    grep "Expected 50.0%: r < " OUTPUT_${i}
    echo
done

