for i in `ls OUTPUT_mvaHutall*.txt`;
do
    python calculate_sigma_limit.py `echo $i` `grep "Expected 50.0%" ${i}` `grep "Observed Limit: r < " ${i}`
done

echo

for i in `ls OUTPUT_mvaHctall*.txt`;
do
    python calculate_sigma_limit.py `echo $i` `grep "Expected 50.0%" ${i}` `grep "Observed Limit: r < " ${i}`
done

