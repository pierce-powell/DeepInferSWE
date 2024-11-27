# Docker

Our team has containerized the DeepInfer tool within a Docker image to simplify the setup and allow us to us run the DeepInfer reproducibility package as-is. Follow the steps below to build the Docker image, run the container, and clone the repository inside the container.
Our dockerfile has been created inside this directory (Container). A GitHub workflow that builds the container was created and the container build is successful. The workflow will build the container for the local user and upload it to GitHub Container Registry(ghcr).

# Note Regarding the Team's Branch Structure

The team also looked into newer Python versions and updated package versions for the project Python libraries. Checkout Updated-Packages branch to replicate the results using the newer versions. The replication guide is written in REPLICATION_README.md in the root directory of the Updated-Packaged branch.

### Build the Docker Image

```
cd Container
docker build -t deepinfer:latest .
```

### Run the Docker Image

```
docker run -it deepinfer:latest
```

Once insde the container, follow these steps to reproduce the results.

1. Clone repository inside the docker container then navigate to the directory:

```
cd ReproducibilityPackage/
```

2. Give execution permission using the following command:

```
chmod +x setup.sh
```

3. Run shell script using the following command to create a virtual environment:

```
./setup.sh
```

Please ensure all the following commands (in setup.sh) executed in MacOS (intel) or Linux terminal.
No need to add any new commands in setup.sh:

```
#!/bin/sh

PYTHON_VERSION="3.7"

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
deactivate
source venv/bin/activate
python unseenPredictionDemo.py
```

4. To reproduce an example and key results of table 2 and table 3 using our approach, DeepInfer, please follow below instructions.

### Run the DeepInfer tool on an example model

#### Example Buggy DL programs

Navigate to the ExamplePrograms directory `cd ReproducibilityPackage/` with command line. To execute DeepInfer tool using an example model, execute following commands in the terminal

```
source venv/bin/activate
```

**Example with PD1 model:**

```
python unseenPredictionDemo.py
```

The output will show below results which is also displayed in the 2nd row using the PIMA diabetes dataset in Table 2:

```
Total_GroundTruth_Correct: 119
Total_GroundTruth_Incorrect: 34
Total Violation: 192
Total Satisfied: 1032
Total_DeepInfer_Implication_Correct: 108
Total_DeepInfer_Implication_Incorrect: 43
Total Uncertain: 2
```

# README from the orginal authors of DeepInfer

# DeepInfer

This repository contains the reproducibility package, source code, benchmark, and results for the paper - "Inferring Data Preconditions from Deep Learning Models for Trustworthy Prediction in Deployment", which appeared in ICSE’2024: 2024 IEEE/ACM 46th International Conference on Software Engineering (ICSE ’24), April 14–20, 2024, Lisbon, Portugal.

**Preprint available here:** [Inferring Data Preconditions from Deep Learning Models for Trustworthy Prediction in Deployment](https://arxiv.org/abs/2401.14628)

The structure of this repository is below:

## Index

> 1. Models
> 2. Source Codes
>    > - Data precondition inference with a trained DNN model (inferDataPrecondition.py)
>    > - Unseen data prediction with DeepInfer (unseenPrediction.py)
>    > - Source codes of PIMA diabetes, House Price, German Credit, Bank Customer model prediction
>    > - ReadMe files to execute codes
> 3. INSTALL file with detailed instructions for setup and usage
> 4. STATUS and LICENSE file
> 5. ReproducibilityPackage contains code, data, and additional instructions for reproducing the paper's results
> 6. Appendix with the derivation of wp rules

### Cite the paper as

```
@inproceedings{ahmed24deepinfer,
  author = {Shibbir Ahmed and Hongyang Gao and Hridesh Rajan},
  title = {Inferring Data Preconditions from Deep Learning Models for Trustworthy Prediction in Deployment},
  booktitle = {ICSE'2024: The 31st ACM Joint European Software Engineering Conference and Symposium on the Foundations of Software Engineering},
  location = {Lisbon, Portugal},
  month = {April 14–20},
  year = {2024},
  entrysubtype = {conference},
  abstract = {
    Deep learning models are trained with certain assumptions about the data during the development stage and then used for prediction in the deployment stage. It is important to reason about the trustworthiness of the model’s predictions with unseen data during deployment. Existing methods for specifying and verifying traditional software are insufficient for this task, as they cannot handle the complexity of DNN model architecture and expected outcomes. In this work, we propose a novel technique that uses rules derived from neural network computations to infer data preconditions for a DNN model to determine the trustworthiness of its predictions. Our approach, DeepInfer involves introducing a novel abstraction for a trained DNN model that enables weakest precondition reasoning using Dijkstra’s Predicate Transformer Semantics. By deriving rules over the inductive type of neural network abstract representation, we can overcome the matrix dimensionality issues that arise from the backward non-linear computation from the output layer to the input layer. We utilize the weakest precondition computation using rules of each kind of activation function to compute layer-wise precondition from the given postcondition on the final output of a deep neural network. We extensively evaluated DeepInfer on 29 real-world DNN models using four different datasets collected from five different sources and demonstrated the utility, effectiveness, and performance improvement over closely related work. DeepInfer efficiently detects correct and incorrect predictions of high-accuracy models with high recall (0.98) and high F-1 score (0.84) and has significantly improved over the prior technique, SelfChecker. The average runtime overhead of DeepInfer is low, 0.22 sec for all the unseen datasets. We also compared runtime overhead using the same hardware settings and found that DeepInfer is 3.27 times faster than SelfChecker, the state-of-the-art in this area.
  }
}
```
