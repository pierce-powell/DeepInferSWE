# Docker

Our team has containerized the DeepInfer tool within a Docker image to simplify the setup and ensure reproducibility. Follow these steps to build the Docker image, run the container, and clone the repository inside the container.
Our dockerfile has been created inside this directory (Container). A GitHub workflow that builds the container was created and the container build is successful. The container can be downloaded at at ghcr.io/pierce-powell/deepinfer:latest

### Build the Docker Image

```
docker build ghcr.io/pierce-powell/deepinfer:latest
```

### Run the Docker Image

```
docker run -it ghcr.io/pierce-powell/deepinfer:latest
```

Once insde the container, follow these steps to reproduce the results.

1. Clone the repository inside the docker container:

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
