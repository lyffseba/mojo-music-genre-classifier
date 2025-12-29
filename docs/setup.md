# Setup Guide for Mojo Music Genre Classifier

## Prerequisites
- Python 3.x with libraries: pandas, scikit-learn, matplotlib, tensorflow, keras
- Modular CLI installed
- Mojo installed via `modular install mojo`

## Installation
1. Clone the repo: `git clone https://github.com/lyffseba/mojo-music-genre-classifier.git`
2. Install Python deps: `pip install pandas scikit-learn matplotlib tensorflow`
3. Install Mojo: `modular install mojo` (if not already)

## Data Setup
1. Download the original dataset from the source repo.
2. Place in a directory, e.g., `/path/to/data`
3. Update `original_dataset_directory` in `src/main.mojo`

## Running
- `mojo src/main.mojo`

## Notes
- Current implementation uses placeholders; full MAX integration pending Mojo updates.
- For issues, check GitHub issues.