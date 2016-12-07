DIR=`pwd`
#cd /afs/cern.ch/work/c/cirkovic/kirill_21-09-2016/CMSSW_7_4_7/src
#cd /afs/cern.ch/work/c/cirkovic/kcombine/CMSSW_7_4_7/src
cd /afs/cern.ch/work/c/cirkovic/kcombine_10-11-2016/CMSSW_7_4_7/src/
eval `scramv1 runtime -sh`
cd $DIR

#PS=""
S0=${1} #S0
if [[ "$S0" == "-S0" ]]; then
    S0="-S 0"
fi

#rm higgsCombineTest.Asymptotic.mH125.root
rm OUTPUT_*.txt

for i in `ls *.card.txt`;
do
#    combine $i -M Asymptotic -m 125.7 $S0 > OUTPUT_$(( OUTN + 1)).txt &
    combine $i -M Asymptotic -m 125.0 $S0 > OUTPUT_${i} #&
    #PS="$PS $!"
done

#wait $PS

