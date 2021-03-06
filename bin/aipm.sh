#!/usr/bin/env bash
option=$1
arg1=$2
arg2=$3


DIR=`S=\`readlink "$0"\`; [ -z "$S" ] && S=$0; dirname $S` &&
root_dir=$(cd $(dirname $DIR);  pwd)

case $option in

    listmodels)
        python $root_dir/aipmLib/listModels.py
        ;;
    install)
        if [ ! $arg1 ]; then
        echo 'Input the Model you are to install please. For example: aipm install fake_model1'
        elif [ ! $arg2 ]; then
        arg2='default'
        fi ;
        docker kill aipm_base ;
        docker start aipm_base ;
        docker exec -t aipm_base python $root_dir/aipmLib/InstallModel.py $arg1 $arg2 &&
        bash $root_dir/bin/docker_start.sh $arg1 ;


        ;;
    run)
        if [ ! $arg1 ]; then
        echo 'Input the model you are to run please.'
        exit
        fi
        if [ ! $arg2 ]; then
        echo 'Input the data you are to deal with please.'
        exit
        fi
        docker start aipm_$arg1 ;
        docker exec -t aipm_$arg1 python -W ignore $root_dir/src/$arg1.py $arg2 ;
        docker kill aipm_$arg1
        ;;
    *)
        echo 'Illegal instruction, check your input please.'
        echo 'Maybe you need aipm -help'
    exit 
    ;;
    esac
