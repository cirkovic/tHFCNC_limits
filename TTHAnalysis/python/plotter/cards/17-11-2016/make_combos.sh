#combineCards.py incl=MVA_default.card.txt > combined_MVA_default.card.txt
#combineCards.py incl=MVA_TOPHLEPBB.card.txt > combined_MVA_TOPHLEPBB.card.txt

#combineCards.py el=MVA_both_e_default.card.txt \
#                mu=MVA_both_m_default.card.txt > combined_MVA_default.card.txt

#PSs=""

DIR=`pwd`
#cd /afs/cern.ch/work/c/cirkovic/kirill_21-09-2016/CMSSW_7_4_7/src
#cd /afs/cern.ch/work/c/cirkovic/kcombine/CMSSW_7_4_7/src
cd /afs/cern.ch/work/c/cirkovic/kcombine_10-11-2016/CMSSW_7_4_7/src/
eval `scramv1 runtime -sh`
cd $DIR

#for c in b2j3 b3j3 b2j4 b3j4; do
#
#    combineCards.py st=mvaHutSTall${c}.card.txt \
#                    tt=mvaHutTTall${c}.card.txt > mvaHutall${c}.card.txt #&
#    #PSs="$PSs $!"
#
#    combineCards.py st=mvaHctSTall${c}.card.txt \
#                    tt=mvaHctTTall${c}.card.txt > mvaHctall${c}.card.txt #&
#    #PSs="$PSs $!"
#
#done

#for c in b2j3 b3j3 b2j4 b3j4; do
for c in HutST HutTT HctST HctTT; do


    combineCards.py b2j3=mva${c}allb2j3.card.txt \
                    b3j3=mva${c}allb3j3.card.txt \
                    b2j4=mva${c}allb2j4.card.txt \
                    b3j4=mva${c}allb3j4.card.txt > mva${c}allcomb.card.txt #&
    #PSs="$PSs $!"

done

for c in Hut Hct; do


    combineCards.py STb2j3=mva${c}STallb2j3.card.txt \
                    STb3j3=mva${c}STallb3j3.card.txt \
                    STb2j4=mva${c}STallb2j4.card.txt \
                    STb3j4=mva${c}STallb3j4.card.txt \
                    TTb2j3=mva${c}TTallb2j3.card.txt \
                    TTb3j3=mva${c}TTallb3j3.card.txt \
                    TTb2j4=mva${c}TTallb2j4.card.txt \
                    TTb3j4=mva${c}TTallb3j4.card.txt > mva${c}allcomb.card.txt #&

    #PSs="$PSs $!"

done


#wait $PSs

