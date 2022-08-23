# Initialization script to use latex-tools with your repository.

# TODO: check that repo is set up properly (has a src/ directory, no
# data/ or build/ directories, etc.)

echo "Setting up latex-tools..."

if [ -f Makefile ]; then
    >&2 echo "Error: Makefile already exists"
    exit 1
elif [ -d build ]; then
    >&2 echo "Error: build/ already exists; delete build directory first"
    exit 1
fi
if [ -d data ]; then
    >&2 echo "Warning: data/ already exists"
fi
if ! [ -d src ]; then
    >&2 echo "Warning: No src/ directory"
fi

cp latex-tools/Makefile .
mkdir -p build
mkdir -p data
