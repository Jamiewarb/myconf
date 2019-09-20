#!/bin/bash

if [[ $1 = feature* ]] || [[ $1 = change* ]] || [[ $1 = bugfix* ]] || [[ $1 = hotfix* ]] || [[ $1 = release* ]] || [[ $1 = conflict* ]] || [[ $1 = subtask* ]]; then
    b_target="[32m$1[m"
else
    b_target="[33m$1[m"
fi

if [ $2 = "staging" ] || [ $2 = "production" ]; then
    b_source="[31m$2[m";
elif [ $2 = "master" ]; then
    b_source="[32m$2[m"
else
    b_source="[33m$2[m"
fi

read -p "Branch $b_target from $b_source and push to remote (Y/n)? " answer;
case ${answer:0:3} in
    y|Y|yes|Yes|YES|oui|Oui|OUI|si|Si|SI )
        git checkout -b $1 && git push -u origin $1;
    ;;
    * )
        echo 'Branch was not created'
    ;;
esac
