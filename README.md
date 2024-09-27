## The Effects of COVIDD-19 on Police Issued Tickets

## Overview

This is the repository for the paper "The Effects of COVID-19 on Police Issued Tickets", focusing on the increase of issued speeding tickets. The analysis uses data from reported tickets issued by all divisions of Toronto Police Services between the years 2014-2023. The data was obtained from Open Data Toronto. Analysis of the data suggests an inverse correlation between the number of speeding tickets and the number of vehicles on the road.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from the Open Data Toronto database.
-   `data/analysis_data` contains the cleaned datasets that were constructed.
-   `other` contains sketches of what the data may look like and logs of LLM usage.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

The introduction of the paper was written with the usage of ChatGPT4o. The entire chat history is available in other/llm/usage.txt.