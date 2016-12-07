for i in `ls OUTPUT_mvaHutSTall*.txt OUTPUT_mvaHutSTallcomb*.txt`;
do
    python calculate_sigma_limit.py `echo $i` `grep "Expected 50.0%" ${i}` `grep "Observed Limit: r < " ${i}`
done

echo

for i in `ls OUTPUT_mvaHutTTall*.txt OUTPUT_mvaHutTTallcomb*.txt`;
do
    python calculate_sigma_limit.py `echo $i` `grep "Expected 50.0%" ${i}` `grep "Observed Limit: r < " ${i}`
done


echo

for i in `ls OUTPUT_mvaHctSTall*.txt OUTPUT_mvaHctSTallcomb*.txt`;
do
    python calculate_sigma_limit.py `echo $i` `grep "Expected 50.0%" ${i}` `grep "Observed Limit: r < " ${i}`
done

echo

for i in `ls OUTPUT_mvaHctTTall*.txt OUTPUT_mvaHctTTallcomb*.txt`;
do
    python calculate_sigma_limit.py `echo $i` `grep "Expected 50.0%" ${i}` `grep "Observed Limit: r < " ${i}`
done

