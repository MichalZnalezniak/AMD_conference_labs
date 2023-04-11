#!/bin/bash
declare -A gpus=(
    # 0=renderD128 1=renderD129, 2=renderD130, 3=renderD131, 4=renderD132, 5=renderD133, 6=renderD134, 7=renderD135
    # GPU0
    ["user"]="renderD128"
    # GPU1
    ["user2"]="renderD129"
    # GPU2
    ["user3"]="renderD130"
    # GPU3
    ["user4"]="renderD131"
    # GPU4
    ["user5"]="renderD132"
    # GPU5
    ["user6"]="renderD133" # only server1
	)
    
echo "AMD GPU machine";
sudo docker run -it --network=host -v /home/$(whoami)/upscalers_pytorch:/home/$(whoami)/upscalers_pytorch --env USER=$USER --device=/dev/kfd --device=/dev/dri/${gpus[$(whoami)]} --security-opt seccomp=unconfined --cap-add=SYS_PTRACE -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v /home/$(whoami)/.ssh:/home/$(whoami)/.ssh:ro -v /home/$(whoami)/.jupyter:/home/$(whoami)/.jupyter --group-add video --ipc=host --shm-size 8G --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name $(whoami)_amd --user $(id -u):$(id -g) $(whoami)_amd;