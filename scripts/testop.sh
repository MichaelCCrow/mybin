#!/bin/bash

for i; do
    case "$i"
        in
        start) echo starting; shift;;
        stop) echo stopping; shift;;
    esac
done
