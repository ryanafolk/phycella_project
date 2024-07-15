mkdir Set50_case1

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g
head -1 $f > Set50_case1/${g}
done

for f in Set50/*.phy; do
g=`echo $f | sed 's/.*\///g'`
echo $g
grep P002_WC03 $f >> Set50_case1/${g}
grep P002_WD03 $f >> Set50_case1/${g}
grep P002_WH05 $f >> Set50_case1/${g}
grep P002_WA06 $f >> Set50_case1/${g}
grep P002_WB06 $f >> Set50_case1/${g}
grep P002_WC06 $f >> Set50_case1/${g}
grep P002_WD06 $f >> Set50_case1/${g}
grep P002_WE06 $f >> Set50_case1/${g}
grep P002_WF06 $f >> Set50_case1/${g}
grep P002_WG06 $f >> Set50_case1/${g}
grep P002_WH06 $f >> Set50_case1/${g}
grep P002_WA07 $f >> Set50_case1/${g}
grep P002_WB07 $f >> Set50_case1/${g}
grep P002_WC07 $f >> Set50_case1/${g}
grep P002_WD07 $f >> Set50_case1/${g}
grep P002_WE07 $f >> Set50_case1/${g}
grep P002_WF07 $f >> Set50_case1/${g}
grep P002_WG07 $f >> Set50_case1/${g}
grep P002_WH07 $f >> Set50_case1/${g}
grep P002_WA08 $f >> Set50_case1/${g}
grep P002_WB08 $f >> Set50_case1/${g}
grep P002_WC08 $f >> Set50_case1/${g}
grep P002_WD08 $f >> Set50_case1/${g}
grep P002_WE08 $f >> Set50_case1/${g}
grep P002_WF08 $f >> Set50_case1/${g}
grep P002_WG08 $f >> Set50_case1/${g}
grep P002_WH08 $f >> Set50_case1/${g}
grep P002_WA09 $f >> Set50_case1/${g}
grep P002_WB09 $f >> Set50_case1/${g}
grep P002_WC09 $f >> Set50_case1/${g}
grep P002_WD09 $f >> Set50_case1/${g}
grep P002_WE09 $f >> Set50_case1/${g}
grep P002_WF09 $f >> Set50_case1/${g}
done

cd Set50_case1
cat *.phy > combined.phy
sed -i 's/^ /\n /g' combined.phy
sed -i 's/^/^/g' combined.phy
sed -i 's/^^ / /g' combined.phy
sed -i '/^^$/d' combined.phy
sed -i 's/^ /\n /g' combined.phy
sed -i 1d combined.phy
sed -i 's/ /  /g' combined.phy
sed -i 's/^  / /g' combined.phy

# change the sequence number to be correct



