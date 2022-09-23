#!/bin/bash

if [ -z "$(ip a | grep wg0)" ]; then
        wg-quick up wg0
else
        wg-quick down wg0
fi

