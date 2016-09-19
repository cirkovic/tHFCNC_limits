#OPTIONS=" --plotmode=nostack"
OUTPUT="~/www/12-09-2016/tHFCNC/0"
OUTPUT="~/www/12-09-2016/tHFCNC/1"
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 30.0 -f --showRatio --maxRatioRange 0 3.7 --poisson mca.txt cuts.txt plots.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND
