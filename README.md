# Image-Based Music Genre Classification in Mojo

This project refactors the original Keras-based music genre classifier (from [GitHub](https://github.com/juansgv/Image-Based-Music-Genre-Classification-Using-Convolutional-Neural-Networks)) to Mojo for improved performance and AI capabilities.

## Overview
Classifies vinyl album covers into 3 genres (electronic, rock, hiphop) using CNNs. Includes two models: standard with batch normalization and enhanced with concept whitening for interpretability.

## Setup
1. Install Mojo: Follow [Modular docs](https://docs.modular.com/mojo/).
2. Clone and run: `mojo src/main.mojo`

## Migration Notes
- From Keras/TensorFlow to Mojo/MAX for speed and parallelism.
- Preserves accuracy and outputs (plots, CSVs).

## Original Reference
See `notebooks/original.ipynb` for Keras version.