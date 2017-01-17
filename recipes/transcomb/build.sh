#!/bin/bash

set -x -e

mkdir -p "${PREFIX}/bin"

export INCLUDE_PATH="${PREFIX}/include/:${PREFIX}/include/bamtools/"
export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"
export BOOST_INCLUDE_DIR="${PREFIX}/include"
export BOOST_LIBRARY_DIR="${PREFIX}/lib"

export LIBS='-lboost_math_c99 -lboost_program_options -lboost_regex -lboost_graph -lboost_thread -lboost_system -lboost_filesystem'

export BAMTOOLS_INCLUDE_DIR="${PREFIX}/include/bamtools/"
export BAMTOOLS_LIBRARY_DIR="${PREFIX}/lib/"

export CXXFLAGS="-DUSE_BOOST -I${BOOST_INCLUDE_DIR} -L${BOOST_LIBRARY_DIR}"
export LDFLAGS="-L${BOOST_LIBRARY_DIR} ${LIBS}"

mkdir build
cd build
cmake ../src
make

cd ..

cp TransComb $PREFIX/bin
cp build/Assemble $PREFIX/bin
cp build/CorrectName $PREFIX/bin
cp build/Pre_Alignment $PREFIX/bin
