#combineCards.py incl=MVA_default.card.txt > combined_MVA_default.card.txt
#combineCards.py incl=MVA_TOPHLEPBB.card.txt > combined_MVA_TOPHLEPBB.card.txt

#combineCards.py el=MVA_both_e_default.card.txt \
#                mu=MVA_both_m_default.card.txt > combined_MVA_default.card.txt

#PSs=""

for c in b2j4 b3j3 b3j4; do

    combineCards.py st=MVA_TOPHLEPBB_ST_${c}.card.txt \
                    tt=MVA_TOPHLEPBB_TT_${c}.card.txt > MVA_TOPHLEPBB_${c}.card.txt #&
    #PSs="$PSs $!"

done

#wait $PSs

