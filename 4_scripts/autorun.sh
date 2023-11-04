#!/bin/bash

str=para

for i in 1 2 3 4 5 6
do

        WorkingDir=${str}$i
        mkdir $WorkingDir
        cd $WorkingDir

        echo $WorkingDir
        cp ../*.mdp .
        cp ../*.top .
        cp ../*.sh .
        cp ../*.pdb .
	cp ../*.itp .

        gmx editconf -f *.pdb -o box.gro -box 10 10 16 -center 5 5 8


        solnum=`cat *.pdb | grep 'SOL B' | tail -n 1 | cut -c 23-26`
        echo 'SOL        ' $solnum >> topol.top
	echo 'SDS      10' >> topol.top
        echo 'success'
	
	gmx grompp -f ions.mdp -p topol.top -o ions.tpr -c box.gro -maxwarn 1
	echo -e '4 \n' | gmx genion -s ions.tpr -p topol.top -o ions.gro -np 20 -pname NA


        sbatch run_md.sh

        cd ..
done

