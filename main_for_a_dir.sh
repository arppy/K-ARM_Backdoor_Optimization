#!/bin/bash

#example: $1 == "/home/hegedusi/backdoor_models/R18_imagenette_robust/"
suffix=$(basename $1)
for i in $1*pth ; do python main.py --num_classes 10 --local_theta 0.0 --result_filepath "results_"$suffix --examples_dirpath examples_dirpath/ --model_filepath $i; done