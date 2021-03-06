cd /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/python/plotter

./kmake_cards.sh

cd /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/python/plotter/cards/21-09-2016

DIR=`pwd`
#cd /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_7_1_5/src/HiggsAnalysis/CombinedLimit/src
#cd /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_7_1_5/src/
cd /afs/cern.ch/work/c/cirkovic/kirill_21-09-2016/CMSSW_7_4_7/src
eval `scramv1 runtime -sh`
cd $DIR

sh make_combos.sh

PS=""
S0=${1} #S0
if [[ "$S0" == "-S0" ]]; then
    S0="-S 0"
fi

rm higgsCombineTest.Asymptotic.mH125.root
rm OUTPUT_*.txt

for i in `ls *.card.txt`;
do
#    combine $i -M Asymptotic -m 125.7 $S0 > OUTPUT_$(( OUTN + 1)).txt &
    combine $i -M Asymptotic -m 125.0 $S0 > OUTPUT_${i} &
    PS="$PS $!"
done

wait $PS

for i in `ls OUTPUT_*.txt`;
do
    echo $i
    grep "Expected" ${i}
    #grep "Observed Limit: r < " ${i}
    echo
done

