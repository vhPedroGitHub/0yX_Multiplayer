#!/bin/bash

apt-get update 
apt-get install -y dotnet-sdk-8.0
apt-get install -y aspnetcore-runtime-8.0
dotnet tool install -g Amazon.Lambda.Tools
export PATH="$PATH:/root/.dotnet/tools"