#!/bin/bash

[[ `./hello.sh johnny` = "hello johnny!" ]] && (echo "test passed!"; exit 0) || (echo "test failed :-("; exit 1)


