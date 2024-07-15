mkdir Set50_case2

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g
head -1 $f > Set50_case2/${g}
done

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g
grep P001_WD1 $f >> Set50_case2/${g}
grep P001_WE1 $f >> Set50_case2/${g}
grep P001_WF1 $f >> Set50_case2/${g}
grep P001_WF3 $f >> Set50_case2/${g}
grep P001_WG3 $f >> Set50_case2/${g}
grep P001_WH3 $f >> Set50_case2/${g}
grep P002_WD01 $f >> Set50_case2/${g}
grep P002_WE01 $f >> Set50_case2/${g}
grep P002_WF01 $f >> Set50_case2/${g}
grep P002_WG01 $f >> Set50_case2/${g}
grep P002_WH01 $f >> Set50_case2/${g}
grep P002_WA02 $f >> Set50_case2/${g}
grep P002_WB02 $f >> Set50_case2/${g}
grep P002_WC02 $f >> Set50_case2/${g}
grep P002_WD02 $f >> Set50_case2/${g}
grep P002_WE02 $f >> Set50_case2/${g}
grep P002_WF02 $f >> Set50_case2/${g}
grep P002_WG02 $f >> Set50_case2/${g}
grep P002_WE03 $f >> Set50_case2/${g}
grep P002_WF03 $f >> Set50_case2/${g}
grep P002_WG03 $f >> Set50_case2/${g}
grep P002_WH03 $f >> Set50_case2/${g}
grep P002_WA04 $f >> Set50_case2/${g}
done

cd Set50_case2

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



