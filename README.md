# Learning how to use aenet

This is a repository contaning files and directories used to learn how to use [aenet](http://ann.atomistic.net/).

## Preliminaries

First of all, generate.x, train.x, and predict.x are compiled successfully and path to these programs is properly set.
These executable has different names, depending on the environment and platform they are compiled.
In the working directory, get the data files by typing:

```Bash
git clone https://github.com/ikuhamada/aenet-learn.git
```

Go to ``aenet-learn``, you can find the following subdirectories:

```Bash
01-generate/  02-train/  03-test/  04-predict/	xsf/
```

``01-generate/``, ``02-train/``, ``03-test/``, and ``04-predict`` are used to generate a training set, to train the neural network, to verify the neural network potential, and to predict the energies of given strucures.
``xsf/`` contains the reference structures and energies to learn.

## Directions

### Lenard-Jones potential

Analytic Lenard-Jones potential

### Water dimer

Water dimer calculated with vdW-DF

### Argon dimer

Argon dimer calculated with vdW-DF
