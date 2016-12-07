for i in `ls OUTPUT_mvaHutSTall*.txt`;
do
    python calculate_sigma_limit_1.py `echo $i` `grep "Expected  2.5%:" ${i}` `grep "Expected 16.0%:" ${i}` `grep "Expected 50.0%:" ${i}` `grep "Expected 84.0%:" ${i}` `grep "Expected 97.5%:" ${i}`
done

echo

for i in `ls OUTPUT_mvaHutTTall*.txt`;
do
    python calculate_sigma_limit_1.py `echo $i` `grep "Expected  2.5%:" ${i}` `grep "Expected 16.0%:" ${i}` `grep "Expected 50.0%:" ${i}` `grep "Expected 84.0%:" ${i}` `grep "Expected 97.5%:" ${i}`
done

echo

for i in `ls OUTPUT_mvaHctSTall*.txt`;
do
    python calculate_sigma_limit_1.py `echo $i` `grep "Expected  2.5%:" ${i}` `grep "Expected 16.0%:" ${i}` `grep "Expected 50.0%:" ${i}` `grep "Expected 84.0%:" ${i}` `grep "Expected 97.5%:" ${i}`
done

echo

for i in `ls OUTPUT_mvaHctTTall*.txt`;
do
    python calculate_sigma_limit_1.py `echo $i` `grep "Expected  2.5%:" ${i}` `grep "Expected 16.0%:" ${i}` `grep "Expected 50.0%:" ${i}` `grep "Expected 84.0%:" ${i}` `grep "Expected 97.5%:" ${i}`
done

echo 

for i in `ls OUTPUT_mvaHutallcomb*.txt`;
do
    python calculate_sigma_limit_2.py `echo $i` `grep "Expected  2.5%:" ${i}` `grep "Expected 16.0%:" ${i}` `grep "Expected 50.0%:" ${i}` `grep "Expected 84.0%:" ${i}` `grep "Expected 97.5%:" ${i}`
done

echo

for i in `ls OUTPUT_mvaHctallcomb*.txt`;
do
    python calculate_sigma_limit_2.py `echo $i` `grep "Expected  2.5%:" ${i}` `grep "Expected 16.0%:" ${i}` `grep "Expected 50.0%:" ${i}` `grep "Expected 84.0%:" ${i}` `grep "Expected 97.5%:" ${i}`
done

