#DATE=12-09-2016
#DATE=20-09-2016
#DATE=16-10-2016
#DATE=06-11-2016
#DATE=15-11-2016
DATEold=15-11-2016
#DATE=16-11-2016
#DATE=17-11-2016
DATE=21-11-2016
#INPUT=/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/INPUT
#INPUT=/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/OFLIMITS
INPUT=/afs/cern.ch/work/c/cirkovic/fcnc_ana/CMSSW_8_0_12/src/tHFCNC/NtupleAnalyzer/test/NAOUTPUT
L=12.9
#L=7.5

for S1 in Hut Hct; do
    for S2 in ST TT; do

        MCA=mca_${S1}${S2}_${DATE}.txt

        #OPTIONS=" --plotmode=norm --yrange 0.001 10 --legendFontSize 0.035"
        #OPTIONS=" --plotmode=nostack --legendFontSize 0.035"
        #OPTIONS=" --plotmode=norm  --legendFontSize 0.035 --yrange 0.1 10000000"
        #OPTIONS=" --plotmode=nostack  --legendFontSize 0.035"
        OPTIONS=" --legendFontSize 0.035"
        OUTPUT="~/www/${DATE}/tHFCNC/1"
#        OPTIONS=" --plotmode=norm  --legendFontSize 0.035"
#        OUTPUT="~/www/${DATE}/tHFCNC/2"
        rm -rf ${OUTPUT}
        #COMMAND="python mcPlots_modified_a.py -P /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/INPUT -j 8 -l 12.9 -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plotsLogy_a.txt -F sf/t /afs/cern.ch/work/c/cirkovic/FCNC/CMSSW_8_0_12/src/CMGTools/TTHAnalysis/macros/FTREES/mvaVars/evVarFriend_{cname}.root --pdir ${OUTPUT} --tree tr_m $OPTIONS"
        for c in b2j3 b2j4 b3j3 b3j4; do
            #COMMAND="python mcPlots_${DATEold//-/}.py -P ${INPUT} -j 8 -l $L -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt plots_${S1}${S2}_${DATE}.txt --pdir ${OUTPUT}/${S1}${S2}/${c} --tree tr_all_${c} $OPTIONS"
            COMMAND="python mcPlots_${DATEold//-/}.py -P ${INPUT} -j 8 -l $L -f --maxRatioRange 0 3.7 --poisson ${MCA} cuts.txt ${S1}${S2}_all_${c}_vars.txt --pdir ${OUTPUT}/${S1}${S2}/${c} --tree tr_all_${c} $OPTIONS"
            echo $COMMAND
            eval $COMMAND &
        done

    done
done

