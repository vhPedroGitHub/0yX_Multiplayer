#!/bin/bash

mkdir -p .terraform/${3}
aws codeartifact login --tool dotnet --repository vision-nuget-source --domain vision --domain-owner 211125774910 --region us-east-1
dotnet lambda package --project-location "${1}" --package-type zip --output-package .terraform/${3}/${2}