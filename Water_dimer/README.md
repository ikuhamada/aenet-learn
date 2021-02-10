# Water dimer

The water dimer based on the structures by Molnar et al. [J. Chem. Phys. 131, 065102 (2009)] and energies calculated by using Quantum-ESPRESSO with the rev-vdW-DF2 functional of Hamada [Phys. Rev. B 89, 121103 (2014)]. See also: Callsen and Hamada, Phys. Rev. B 91, 195103 (2015).

## Directories
- 01-generate/	: Generate a training set
- 02-train/	: Train the potential
- 03-test/	: Validate the potential
- 04-predict/	: Predict the energies of given structure
- references/   : Reference data
- xsf/		: Total energies and structues to be used in the learning
