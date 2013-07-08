#! /bin/bash
#
#  Usage: Just exec like,
#     ./phonopy_vasp.sh >& log &
#  and calc will start immediately
#
#

# make "machines" file which is needed for mpi parallelization
declare hostname=`hostname -a`
echo $hostname > ./FILES/machines
echo $hostname >> ./FILES/machines
echo $hostname >> ./FILES/machines
echo $hostname >> ./FILES/machines

# loop
# repeated number is the number of files which has a name of "POSCAR-###"
for f in `ls | grep POSCAR-` ; do

  num=`echo $f | sed -e s/POSCAR\-//g`

  # make directory where force calculation will be done
  mkdir disp-$num

  # copy input files to the directory
  # INCAR, POTCAR, KPOINTS, machines should be in FILES directory
  cp ./FILES/* disp-$num
  # copy displaced structure file to the directory
  cp $f disp-$num/POSCAR

  # change to the directory and run the calculation.
  cd disp-$num
  mpirun -n 4 -machinefile machines vasp532mpi
  cd ..

  # report the progress to the file
  echo "$f is done!" >> progress.dat
done

# end of the scripts
echo "all calc is done!" >> progress.dat

