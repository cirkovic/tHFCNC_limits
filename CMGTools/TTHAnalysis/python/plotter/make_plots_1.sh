DATE=12-09-2016
DATE=20-09-2016

#OPTIONS=" --plotmode=norm"
#OUTPUT="~/www/${DATE}/tHFCNC/0"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson mca.txt cuts.txt plots.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS" &
#echo $COMMAND
#eval $COMMAND

#OPTIONS=""
#OUTPUT="~/www/${DATE}/tHFCNC/1"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson mca.txt cuts.txt plots.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS" &
#echo $COMMAND
#eval $COMMAND


#MCA=mca_200.txt

##OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
#OPTIONS=" --plotmode=nostack --yrange 0.1 10000 --legendFontSize 0.035"
#OUTPUT="~/www/${DATE}/tHFCNC/3"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
#echo $COMMAND
#eval $COMMAND &

#OPTIONS=" --yrange 1 100000 --legendFontSize 0.035"
#OUTPUT="~/www/${DATE}/tHFCNC/4"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy1.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
#echo $COMMAND
#eval $COMMAND &

MCA=mca_ST_1.txt

#OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
OPTIONS=" --plotmode=nostack --yrange 0.1 1000000 --ss 200.0 --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNC/5"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

MCA=mca_200_ST.txt

OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNC/6"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

OPTIONS=" --yrange 1 10000 --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNC/7"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy1.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &





MCA=mca_TT_1.txt

#OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
OPTIONS=" --plotmode=nostack --yrange 0.1 1000000 --ss 200.0 --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNC/8"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

MCA=mca_200_TT.txt

OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNC/9"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

OPTIONS=" --yrange 1 10000 --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNC/10"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy1.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

