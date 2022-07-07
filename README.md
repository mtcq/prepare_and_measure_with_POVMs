## Code to accompany: [The classical cost of transmitting a qubit](https://arxiv.org/abs/2207.02244)

#### Martin J. Renner, Armin Tavakoli, and Marco Túlio Quintino


This is a repository for the article [The classical cost of transmitting a qubit](https://arxiv.org/abs/2207.02244).

 This code requires:
- [cvx](http://cvxr.com/) - a free MATLAB toolbox for rapid prototyping of optimization problems.

This repository consists of:

- [qubit_beats_trit_11measurements.m](https://github.com/mtcq/prepare_and_measure_with_POVMs/blob/main/qubit_beats_trit_11measurements.m):
Script which considers a PM scenario where Alice prepares the 6 eigenvectors of Pauli matrices and Bob measures 11 Thomson measurements.
We show that the statistics of this scenario cannot be obtained by classical trits.

- [qubit_beats_trit_snub_cube.m](https://github.com/mtcq/prepare_and_measure_with_POVMs/blob/main/qubit_beats_trit_snub_cube.m):
Script which considers a PM scenario where Alice prepares the 6 eigenvectors of Pauli matrices and Bob measures the 24 snub cube measurements.
We show that the statistics of this scenario cannot be obtained by classical trits.

- [PMmodel_simulation.m](https://github.com/mtcq/prepare_and_measure_with_POVMs/blob/main/PMmodel_simulation.m):
Script that implements our qubit PM model with two bits of communication.

- [Mby11.mat](https://github.com/mtcq/prepare_and_measure_with_POVMs/blob/main/Mby11.mat):
A Matlab file which stores the 11 Thomson measurements use at script [qubit_beats_trit_11measurements.m](https://github.com/mtcq/prepare_and_measure_with_POVMs/blob/main/qubit_beats_trit_11measurements.m).

- [auxiliary_functions](https://github.com/mtcq/prepare_and_measure_with_POVMs/tree/main/auxiliary_functions):
A folder with several auxiliary functions.
