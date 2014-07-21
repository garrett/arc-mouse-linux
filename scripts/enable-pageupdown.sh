#!/bin/bash

ID=`xinput list --short | grep "Microsoft.*Nano.*keyboard" | grep -o "id=[0-9]*" | cut -f2 -d=`

xinput enable $ID
