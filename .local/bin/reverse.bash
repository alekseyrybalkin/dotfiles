#!/bin/bash

if [ -e reverser.bash ]; then
  echo "reverser.bash exists"
  exit 1
fi
echo "#!/bin/bash" > reverser.bash

cnt=`ls *.mp3 2>/dev/null | wc -l`
for i in $(seq $cnt); do
  if [ $i -lt 10 ]; then
    songnum_shouldbe=0$i
  else
    songnum_shouldbe=$i
  fi
  song=`ls *.mp3 | head -n $i | tail -n 1`
  songnum=${song:0:2}
  songname=${song:2}
  if [ $songnum == $songnum_shouldbe ]; then
    let newnum=$cnt-$i+1
    if [ $newnum -lt 10 ]; then
      newnum=0$newnum
    else
      newnum=$newnum
    fi
    newfile=$newnum$songname
    if [ ! -e "$newfile" ]; then
      echo "mv '$song' '$newfile'" >> reverser.bash
    else
      echo "$newfile already exists. not moving"
    fi
  fi
done
. reverser.bash
rm reverser.bash
