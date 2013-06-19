#!/bin/sh

for I in ORI/*DOAGAIN*.ORI_N*/; do
  echo ''
  mkdir -p ../ORI.tarballs/`basename $I`
  cd $I
  echo 'processing...' $I 
  tar -czvf `basename $I`.tar.gz *
  cd ../../
  mv $I`basename $I`.tar.gz ../ORI.tarballs/`basename $I`
  cd ../ORI.tarballs/`basename $I`
  md5sum `basename $I`.tar.gz > `basename $I`.tar.gz.md5
  cd ../../SDMI.IFSAR.2010.merged_extras
done


#for p in 8bit 16bit; do
#  pushd .
#  cd $p
#  for T in */; do 
#    t=${T/\//}
#    for S in $t/*/; do
#      s=`basename $S`
#      vrt=$p-$t-$s.vrt
#      ovr=$p-$t-$s.vrt.ovr
#      if [ ! -f $vrt ]; then
#        echo "         vrt: $vrt"
#        gdalbuildvrt $vrt  $S/*/*.tif
#      else
#        echo "skipping vrt: $vrt"
#      fi
#  
#      if [[ ! -f $ovr && -f $vrt ]]; then
#        echo "         ovr: $ovr"
#        gdal_translate -outsize 10% 10% -of GTiff \
#                       -co TILED=YES -co COMPRESS=LZW $vrt $ovr
#        add_overviews.rb $ovr
#      else 
#        echo "skipping ovr: $ovr"
#      fi
#    done
#  done
#  popd
#done
