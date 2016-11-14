DATE=12-09-2016
DATE=20-09-2016

#OPTIONS=" --plotmode=norm"
#OUTPUT="~/www/${DATE}/tHFCNCa/0"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson mca.txt cuts.txt plots.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS" &
#echo $COMMAND
#eval $COMMAND

#OPTIONS=""
#OUTPUT="~/www/${DATE}/tHFCNCa/1"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson mca.txt cuts.txt plots.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS" &
#echo $COMMAND
#eval $COMMAND


#MCA=mca_200.txt

##OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
#OPTIONS=" --plotmode=nostack --yrange 0.1 10000 --legendFontSize 0.035"
#OUTPUT="~/www/${DATE}/tHFCNCa/3"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
#echo $COMMAND
#eval $COMMAND &

#OPTIONS=" --yrange 1 100000 --legendFontSize 0.035"
#OUTPUT="~/www/${DATE}/tHFCNCa/4"
#rm -rf ${OUTPUT}
#COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --showRatio --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy1_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
#echo $COMMAND
#eval $COMMAND &

#MCA=mca_ST_2a.txt
MCA=mca_ST_3a.txt

#OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
#OPTIONS=" --plotmode=nostack --legendFontSize 0.035"
OPTIONS=" --plotmode=norm  --legendFontSize 0.035 --yrange 0.1 10000000"
OUTPUT="~/www/${DATE}/tHFCNCa/5"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified_a.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

MCA=mca_ST_3a.txt

OPTIONS=" --plotmode=norm --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNCa/6"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

OPTIONS=" --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNCa/7"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy1_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &





MCA=mca_TT_3a.txt

#OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
#OPTIONS=" --plotmode=nostack --legendFontSize 0.035"
OPTIONS=" --plotmode=norm  --legendFontSize 0.035 --yrange 0.1 10000000"
OUTPUT="~/www/${DATE}/tHFCNCa/8"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified_a.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

MCA=mca_TT_3a.txt

OPTIONS=" --plotmode=norm --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNCa/9"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

OPTIONS=" --legendFontSize 0.035"
OUTPUT="~/www/${DATE}/tHFCNCa/10"
rm -rf ${OUTPUT}
COMMAND="python mcPlots_modified.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 1.65 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy1_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
echo $COMMAND
eval $COMMAND &

