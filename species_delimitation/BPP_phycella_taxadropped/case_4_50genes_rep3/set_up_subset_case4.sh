mkdir Set50_case4

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g
head -1 $f > Set50_case4/${g}
done

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g

grep P001_WA4 $f >> Set50_case4/${g}
grep P001_WB4 $f >> Set50_case4/${g}
grep P001_WC4 $f >> Set50_case4/${g}
grep P001_WD4 $f >> Set50_case4/${g}
grep P001_WE4 $f >> Set50_case4/${g}
grep P001_WF4 $f >> Set50_case4/${g}
grep P001_WG4 $f >> Set50_case4/${g}
grep P001_WH4 $f >> Set50_case4/${g}
grep P001_WA5 $f >> Set50_case4/${g}
grep P001_WB5 $f >> Set50_case4/${g}
grep P001_WC5 $f >> Set50_case4/${g}
grep P001_WD5 $f >> Set50_case4/${g}
grep P001_WE5 $f >> Set50_case4/${g}
grep P001_WF5 $f >> Set50_case4/${g}
grep P001_WG5 $f >> Set50_case4/${g}
grep P001_WH5 $f >> Set50_case4/${g}
grep P001_WA6 $f >> Set50_case4/${g}
grep P001_WB6 $f >> Set50_case4/${g}
grep P001_WC6 $f >> Set50_case4/${g}
grep P001_WD6 $f >> Set50_case4/${g}
grep P001_WE6 $f >> Set50_case4/${g}
grep P001_WE7 $f >> Set50_case4/${g}
grep P001_WF7 $f >> Set50_case4/${g}
grep P001_WG7 $f >> Set50_case4/${g}
grep P001_WH7 $f >> Set50_case4/${g}
grep P001_WA8 $f >> Set50_case4/${g}
grep P001_WB8 $f >> Set50_case4/${g}
grep P001_WC8 $f >> Set50_case4/${g}
grep P001_WD8 $f >> Set50_case4/${g}
grep P001_WE8 $f >> Set50_case4/${g}
grep P001_WF8 $f >> Set50_case4/${g}
grep P001_WG8 $f >> Set50_case4/${g}
grep P001_WH8 $f >> Set50_case4/${g}
grep P001_WA9 $f >> Set50_case4/${g}
grep P001_WB9 $f >> Set50_case4/${g}
grep P001_WC9 $f >> Set50_case4/${g}
grep P002_WE04 $f >> Set50_case4/${g}
grep P002_WF04 $f >> Set50_case4/${g}
grep P002_WG04 $f >> Set50_case4/${g}
grep P002_WH04 $f >> Set50_case4/${g}
grep P002_WA05 $f >> Set50_case4/${g}
grep P002_WE05 $f >> Set50_case4/${g}
grep P002_WF05 $f >> Set50_case4/${g}
grep P002_WG05 $f >> Set50_case4/${g}

done

cd Set50_case4

# Convert to fasta then back to phy to get correct headers
for f in *.phy; do
pxs2fa -s ${f} > ${f}.fasta
pxs2phy -s ${f}.fasta > ${f}.fasta.temp
done

cat *.phy.fasta.temp > combined.phy

for i in {0..9}; do 
sed -i "s/^${i}/\n${i}/" combined.phy
done
sed -i 's/^/^/g' combined.phy
sed -i '/^^$/d' combined.phy
for i in {0..9}; do 
sed -i "s/^^${i}/${i}/" combined.phy
done

rm *.phy.fasta
rm *.phy.fasta.temp



