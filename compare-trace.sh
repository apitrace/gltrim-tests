#/bin/bash

if [ "x$DISPLAY" = "x" ]; then
   exit 0
fi

trim="$1/gltrim"
apitrace="$1/apitrace"
datadir="$2"
trace="$3"
frame=$4
orig_img=$5

if [ ! -r "${datadir}/${trace}" ]; then
  echo "test $trace skipped because trace is not available"
  exit 0
fi

testname=${trace}-${frame}

echo "Run test $testname"

rm ${testname}*.png
rm ${testname}*.md5
rm trim-{testname}

${trim} "${datadir}/${trace}" --frames ${frame} -o trim-${testname} || exit 1
$XRUN ${apitrace} replay --headless "${datadir}/${trace}" --snapshot=${orig_img} --snapshot-prefix=${testname}orig || exit 1
$XRUN ${apitrace} replay --headless trim-${testname} --snapshot=frame --snapshot-prefix=${testname} || exit 1

orig=$(printf "${testname}orig%010d.png" ${orig_img})
trim_array_=$(ls ${testname}0*.png)
trim_array=( $trim_array_ )
trim=${trim_array[1]}

if [ "x$trim" = "x" ]; then
  exit 1
fi

md5sum ${orig} | sed -s "s/ .*//" >${testname}.orig.md5
md5sum ${trim} | sed -s "s/ .*//" >${testname}.trim.md5

diff -q ${testname}.orig.md5 ${testname}.trim.md5 && exit 0 || exit 1

