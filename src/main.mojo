# Music Genre Classification in Mojo
# Migrated from Keras to Mojo for performance and AI capabilities

from python import *
from models import *

fn main():
    print("Starting Mojo Music Genre Classifier")
    prepare_data()
    let bn_model = create_bn_model()
    let cw_model = create_cw_model()
    train_models(bn_model, cw_model)
    evaluate_models(bn_model, cw_model)

# Data preparation function
fn prepare_data():
    # Interop with Python for data loading
    pandas = Python.import_module("pandas")
    os = Python.import_module("os")
    shutil = Python.import_module("shutil")
    sklearn = Python.import_module("sklearn.model_selection")
    
    # Adapt paths - user needs to set
    original_dataset_directory = "/path/to/your/data"  # TODO: Set local path
    original_train_directory = original_dataset_directory + "/Training"
    
    # Load training labels
    training_lbls = pandas.read_csv(original_dataset_directory + "/training_labels.csv")
    
    # Get images
    imgs = os.listdir(original_train_directory)
    
    # Initialize lists
    genres = []
    img_files = []
    
    # Map images to labels
    for k in range(len(training_lbls)):
        for file in imgs:
            if file == training_lbls["name"][k]:
                genres.append(training_lbls["category"][k])
                img_files.append(file)
    
    # Create dataframe
    df = pandas.DataFrame({"image": img_files, "category": genres})
    
    # Split data
    x_train, x_test1, y_train, y_test1 = sklearn.train_test_split(df["image"], df["category"], test_size=0.2, random_state=42)
    x_test, x_val, y_test, y_val = sklearn.train_test_split(x_test1, y_test1, test_size=0.5, random_state=42)
    
    # Create directories and copy files
    base_dir = "./data_split"
    train_dir = base_dir + "/train"
    test_dir = base_dir + "/test"
    validate_dir = base_dir + "/validate"
    
    for directory in [base_dir, train_dir, test_dir, validate_dir]:
        if not os.path.exists(directory):
            os.mkdir(directory)
    
    # Subdirs for genres
    subdirectories_electronic = []
    subdirectories_rock = []
    subdirectories_hiphop = []
    
    for subdirectory in [train_dir, test_dir, validate_dir]:
        subdirectories_electronic.append(subdirectory + "/electronic")
        if not os.path.exists(subdirectory + "/electronic"):
            os.mkdir(subdirectory + "/electronic")
        subdirectories_rock.append(subdirectory + "/rock")
        if not os.path.exists(subdirectory + "/rock"):
            os.mkdir(subdirectory + "/rock")
        subdirectories_hiphop.append(subdirectory + "/hiphop")
        if not os.path.exists(subdirectory + "/hiphop"):
            os.mkdir(subdirectory + "/hiphop")
    
    # Copy files
    x = [x_train, x_test, x_val]
    y = [y_train, y_test, y_val]
    k = 0
    
    for images, genres in zip(x, y):
        for file, category in zip(images, genres):
            src = original_train_directory + "/" + file
            if category == "electronic":
                dst = subdirectories_electronic[k] + "/" + file
                shutil.copyfile(src, dst)
            elif category == "rock":
                dst = subdirectories_rock[k] + "/" + file
                shutil.copyfile(src, dst)
            else:
                dst = subdirectories_hiphop[k] + "/" + file
                shutil.copyfile(src, dst)
        k += 1
    
    print("Data preparation completed")

# Training function
fn train_models(bn_model: BNModel, cw_model: CWModel):
    # Interop for data generators (placeholder)
    keras = Python.import_module("tensorflow.keras")
    # Assume data generators created in prepare_data
    
    # Training parameters
    epochs = 10
    lr = 1e-4
    
    # For each model
    for model in [bn_model, cw_model]:
        for epoch in range(epochs):
            # Manual training loop
            # Forward pass, loss, backward, update
            # TODO: Implement with MAX
            print("Training epoch", epoch, "for model")
            
            # LR scheduler
            if epoch > 10:
                lr *= 0.1
            if epoch > 20:
                lr *= 0.1
            
            # Callbacks: checkpoint, early stopping (manual)
    
    print("Training completed")

# Evaluation function
fn evaluate_models(bn_model: BNModel, cw_model: CWModel):
    # Plot histories (interop with matplotlib)
    matplotlib = Python.import_module("matplotlib.pyplot")
    
    # Placeholder for histories
    # Plot accuracy/loss for both models
    
    print("Evaluating models - TODO: Implement plots and inference")