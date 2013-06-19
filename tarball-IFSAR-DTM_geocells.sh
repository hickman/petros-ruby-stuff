#!/bin/sh

for I in DTM/*DTM_N*/; do
  mkdir -p ../SDMI.IFSAR.WIGGLE_ROOM/DTM.tarballs/`basename $I`
  cd $I
  echo processing... 
  pwd
  echo tar -czvf `basename $I`.tar.gz *	 
  tar -czvf `basename $I`.tar.gz *
  cd ../../
  pwd
  echo mv $I`basename $I`.tar.gz ../SDMI.IFSAR.WIGGLE_ROOM/DTM.tarballs/`basename $I`
  mv $I`basename $I`.tar.gz ../SDMI.IFSAR.WIGGLE_ROOM/DTM.tarballs/`basename $I`
  echo " " 
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
