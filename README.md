# Exploring the Impact of 15 Surfactants on Foam Stability: Insights from Molecular Dynamics Simulations in Critical and Metastable Foam

## Data and Relation Files Index

### 1. molecular_structure

All the 15 surfactants molecular structure files are available here.

Each structure file was modeled by Gauss View 6.0 software, and optimized under B3LYP/6-31G(d) using Gaussian 16, then saved as PDB format.

Structure files named by the surfactants' abbreviation.

### 2. molecular_forcefiled

All the 15 surfactants' molecular forcefiled file are available here.

Forcefiled files were created by [LigParGen](http://zarbi.chem.yale.edu/ligpargen/index.html) and saved as ITP format.

Atomic charges is calculated by [Multiwfn](http://sobereva.com/multiwfn/) and replaced [charge] column in ITP files.

### 3.  simulation_files

The parameter files used in the simulation are available here

**1_ions.mdp** : used to add ions into system. 

**2_minim.mdp** : used in energy minimization process.

**3_eq.mdp** : used in pre-equilibrium process.

**4_md.mdp** : used in MD simulation.

### 4. scripts

some scripts in python3.7 or shell are aveilable here, which are aimed to make simulation easier.

**pywaterfilm.py** : a python script for quick detection of  film rupture. It is worked by dividing the water film structure into 16 units in the x-y plane and calculating the density difference between the units. This method can quickly determine whether there is a cavity in the water film.

- you can use this script by typing:
  
  ```
  ./pywaterfilm.py -i 134
  ```

- You need to make sure that your file structure looks something like this:

```
- pywaterfilm.py
- 134
  - para1
    - prod.gro
  - para2
    - prod.gro
  - para3
    - prod.gro
  - para4
    - prod.gro
  - para5
    - prod.gro
  - para6
    - prod.gro
```

- modified the scripts for your jobs.

**autorun.sh & run_md.sh** : used to make a series of parallel simulations. need [Slurm](https://slurm.schedmd.com/documentation.html) and gromacs

## About Me
### Hello, I'm [Xingze Zhao] 👋

- 🏢 I work at the College of Materials Science and Engineering and the Center for Advanced Chemical Engineering and Advanced Materials at China University of Petroleum (East China).
- 🧪 My research focuses on molecular simulations of nanomaterials and chemicals for enhanced oil recovery (*EOR*).
- ✉️ You can reach me at [xingzezhao@gmail.com](mailto:xingzezhao@gmail.com).

Feel free to explore my research work and contributions!

