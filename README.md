============
phonopy_vasp
============

Description:

This is a bash script which enable us to calculate forces of 
displaced crystal structures made by Phonopy using VASP code.
It should be used on a Linux cluster system.

Usage:

Firstly, you have to create FILES directory, and put INCAR,
POTCAR, KPOINTS files there. You also need to run phonopy
to create displaced crystal structures as a pre-process.
It should be like,
  phonopy -d --dim="x y z" POSCAR
where x, y, and z are integer numbers of expansion of the lattice.

Then just execute this script file like,

  ./phoopy_vasp.sh >& log &

and the force calculations will start.
machines file for mpirun will be created by this script.
