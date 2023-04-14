#!/bin/bash
declare -A gpus=(
    # 0=renderD128 1=renderD129, 2=renderD130, 3=renderD131, 4=renderD132, 5=renderD133, 6=renderD134, 7=renderD135
    # GPU0
    ["user"]=0
    # GPU1
    ["user2"]=1
    # GPU2
    ["user3"]=2
    # GPU3
    ["user4"]=3
    # GPU4
    ["user5"]=4
    # GPU5
    ["user6"]=5 # only server1
	)


declare -A ports=(
    # 0=renderD128 1=renderD129, 2=renderD130, 3=renderD131, 4=renderD132, 5=re>
    # GPU0
    ["user"]=7880
    # GPU1
    ["user2"]=7881
    # GPU2
    ["user3"]=7882
    # GPU3
    ["user4"]=7883
    # GPU4
    ["user5"]=7884
    # GPU5
    ["user6"]=7885 # only server1
        )
conda env create --name $(whoami)_lab1 -f env.yaml
source ~/miniconda3/bin/activate
conda init bash
conda activate $(whoami)_lab1
export HIP_VISIBLE_DEVICES=${gpus[$(whoami)]}
jupyter notebook --port ${ports[$(whoami)]}
