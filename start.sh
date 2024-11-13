#!/bin/bash

# Clone the repository
git clone https://github.com/r3gm/SoniTranslate.git
cd SoniTranslate || exit

# Uninstall specific Python packages
pip uninstall chex pandas-stubs ibis-framework albumentations albucore -y -q

# Downgrade pip version
python -m pip install -q pip==23.1.2

# Install git-lfs
apt install git-lfs -y

git lfs install

# Modify requirements file for updated whisperX branch
sed -i 's|git+https://github.com/R3gm/whisperX.git@cuda_11_8|git+https://github.com/R3gm/whisperX.git@cuda_12_x|' requirements_base.txt

# Install requirements
pip install -q -r requirements_base.txt
pip install -q -r requirements_extra.txt

# Install ort-nightly-gpu from specific index URL
pip install -q ort-nightly-gpu --index-url=https://aiinfra.pkgs.visualstudio.com/PublicPackages/_packaging/ort-cuda-12-nightly/pypi/simple/

# Install specific versions of additional packages
pip install -q piper-tts==1.2.0
pip install -q -r requirements_xtts.txt
pip install -q TTS==0.21.1 --no-deps
