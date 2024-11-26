# Updated-Packages

Our team has tested the DeepInfer tool using Python version 3.12.3. This branch was developed and replicated from linux (wsl) command line. Important to note, the current version of TensorFlow(2.16.0) will not work for Unix systems due to the Unix versioning is behind the linux versioning.
On this branch, we've also updated requirements.txt with package versions compatible with the current Python version. Below, we will outline the installation process for the Python virtual environment and python environment setup.

### Environment Set Up

The following commands will install the necessary dependencies and build Python 3.12.3 from source to ensure compatibility with the project's environment.

```
sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev
wget https://www.python.org/ftp/python/3.12.3/Python-3.12.3.tgz
tar -xzf Python-3.12.3.tgz
cd Python-3.12.3
./configure --enable-optimizations
make -j 2
sudo make install
```

Additionally, ensure that from within the venv, the python version is correct. If you have any system links set to old version of python, it could cause the venv to use said older version.

### Reproducing Results

Once you've set up your Python environment, follow these steps to reproduce the results.

1. Navigate to the Reproducibility Package:

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
