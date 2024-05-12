---
title: "SIR model"
author: "DETAGNON BERNIC GBAGUIDI"
date: "2024-05-07"
output: html_document
---


# About

## What is the SIR Model?

The SIR model is a mathematical model used to understand the spread of infectious diseases in a population. It divides the population into three compartments: Susceptible, Infectious, and Recovered.

The dynamics of the SIR model are governed by the following Ordinary Differential Equations (ODEs):

\[
\begin{align*}
\frac{dS}{dt} & = -\frac{\beta \cdot S \cdot I}{N} \\
\frac{dI}{dt} & = \frac{\beta \cdot S \cdot I}{N} - \gamma \cdot I \\
\frac{dR}{dt} & = \gamma \cdot I
\end{align*}
\]

Where:
- \(S\) is the number of susceptible individuals,
- \(I\) is the number of infectious individuals,
- \(R\) is the number of recovered individuals,
- \(N\) is the total population size,
- \(\beta\) is the transmission rate,
- \(\gamma\) is the recovery rate.

## How Does the Web App Work?

Our web app allows users to simulate the spread of a disease using the SIR model. Users can adjust parameters such as the initial population size, transmission rate, and recovery rate to observe how these factors influence the dynamics of the epidemic.

## Key Features

- Interactive visualization of the epidemic curve.
- Ability to adjust simulation parameters in real-time.
- Downloadable results for further analysis.

## Interpreting the Results

Users can interpret the results of the simulation to understand key metrics such as the infection peak, total infections, and final epidemic size. However, it's important to note that the model simplifies real-world complexities and may not fully capture the dynamics of every disease outbreak.

## Contact Information

For questions or feedback, please contact us at [email@example.com](mailto:email@example.com).
