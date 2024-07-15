mkdir Set50_case3

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g
head -1 $f > Set50_case3/${g}
done

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g

grep P001_WA1 $f >> Set50_case3/${g}
grep P001_WB1 $f >> Set50_case3/${g}
grep P001_WC1 $f >> Set50_case3/${g}
grep P001_WG1 $f >> Set50_case3/${g}
grep P001_WH1 $f >> Set50_case3/${g}
grep P001_WA2 $f >> Set50_case3/${g}
grep P001_WB2 $f >> Set50_case3/${g}
grep P001_WC2 $f >> Set50_case3/${g}
grep P001_WD2 $f >> Set50_case3/${g}
grep P001_WE2 $f >> Set50_case3/${g}
grep P001_WF2 $f >> Set50_case3/${g}
grep P001_WG2 $f >> Set50_case3/${g}
grep P001_WH2 $f >> Set50_case3/${g}
grep P001_WA3 $f >> Set50_case3/${g}
grep P001_WB3 $f >> Set50_case3/${g}
grep P001_WC3 $f >> Set50_case3/${g}
grep P001_WD3 $f >> Set50_case3/${g}
grep P001_WE3 $f >> Set50_case3/${g}
grep P001_WF6 $f >> Set50_case3/${g}
grep P001_WG6 $f >> Set50_case3/${g}
grep P001_WH6 $f >> Set50_case3/${g}
grep P001_WA7 $f >> Set50_case3/${g}
grep P001_WB7 $f >> Set50_case3/${g}
grep P001_WC7 $f >> Set50_case3/${g}
grep P001_WD7 $f >> Set50_case3/${g}
grep P002_WA01 $f >> Set50_case3/${g}
grep P002_WB01 $f >> Set50_case3/${g}
grep P002_WC01 $f >> Set50_case3/${g}
grep P002_WH02 $f >> Set50_case3/${g}
grep P002_WA03 $f >> Set50_case3/${g}
grep P002_WB03 $f >> Set50_case3/${g}
grep P002_WB04 $f >> Set50_case3/${g}
grep P002_WC04 $f >> Set50_case3/${g}
grep P002_WD04 $f >> Set50_case3/${g}
grep P002_WB05 $f >> Set50_case3/${g}
grep P002_WC05 $f >> Set50_case3/${g}
grep P002_WD05 $f >> Set50_case3/${g}

done

cd Set50_case3

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



