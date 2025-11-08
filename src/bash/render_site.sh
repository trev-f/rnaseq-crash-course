#!/usr/bin/env bash


################
# Configure
################
# quarto container in which `quarto render` is run
readonly quarto_image="oras://ghcr.io/trev-f/rstudio_4.5:v0.2.0"


################
# Main
################
apptainer exec --cleanenv "${quarto_image}" quarto render
