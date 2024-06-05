#!/bin/bash

#example: $1 == "/home/hegedusi/backdoor_models/R18_imagenette_robust/"
suffix=$(basename $1)
if [ $# -lt 2 ]; then
  gpu=0
else
  gpu=$2
fi
if [ $# -lt 3 ]; then
  beta=1e+4
else
  beta=$3
fi
for i in $1*pth ; do python main.py --device $gpu --beta $beta --num_classes 10 --local_theta 0.0 --result_filepath "results_"$suffix --examples_dirpath examples_dirpath/ --model_filepath $i; done
