cd /afs/cern.ch/work/c/cirkovic/tHFCNC_limits/CMSSW_8_0_19/src
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/c/cirkovic/tHFCNC_limits/CMSSW_8_0_19/src/CMGTools/TTHAnalysis/python/plotter

##./kmake_cards.sh
./make_cards_16-11-2016.sh

cd /afs/cern.ch/work/c/cirkovic/tHFCNC_limits/CMSSW_8_0_19/src/CMGTools/TTHAnalysis/python/plotter/cards/17-11-2016

./make_combos.sh

./run_combine.sh


./check_values1.sh






























exit

for i in `ls OUTPUT_mvaHutall*.txt`;
do
    echo $i
    grep "Expected 50.0%" ${i}
    grep "Observed Limit: r < " ${i}
    echo
done

for i in `ls OUTPUT_mvaHctall*.txt`;
do
    echo $i
    grep "Expected 50.0%" ${i}
    grep "Observed Limit: r < " ${i}
    echo
done

exit

rm OUTPUT_MVA_TOPHLEPBB_ST_*.card.txt OUTPUT_MVA_TOPHLEPBB_TT_*.card.txt

for i in `ls OUTPUT_*.txt`;
do
    echo $i
    grep "Expected 50.0%" ${i}
    grep "Observed Limit: r < " ${i}
    echo
done

