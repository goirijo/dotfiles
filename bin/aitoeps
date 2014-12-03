base=`basename $1 .ai`
pdftops -level2 -eps $base.ai $base.eps
gs -q -dBATCH -dNOPAUSE -sDEVICE=bbox $base.eps >& $base.bbox
newbox=`grep -v HiRes $base.bbox`
echo -$newbox-
sed 's/%%BoundingBox.*/'"$newbox"'/' < $base.eps > $base.fixed.eps
mv $base.fixed.eps $base.eps
rm $base.bbox