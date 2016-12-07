CURRDIR=`pwd`

cd /afs/cern.ch/work/c/cirkovic/tHFCNC_limits/CMSSW_8_0_19/src
eval `scramv1 runtime -sh`
cd /afs/cern.ch/work/c/cirkovic/tHFCNC_limits/CMSSW_8_0_19/src/CMGTools/TTHAnalysis/python/plotter

##./kmake_cards.sh
./make_cards_21-11-2016.sh

cd $CURRDIR

./make_combos.sh

./run_combine.sh


./check_values1.sh

