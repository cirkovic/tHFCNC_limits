j=0
N=${1}
I=${2}
for i in `ls lsub_2lss*`;
do
    if (( j >= I * N )) ; then
        if (( j < (I+1) * N )) ; then
            echo $i
            sh $i
        fi
    fi
    j=$((j+1))
done
