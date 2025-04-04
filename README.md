# Load Tester

## Introduction

This project provides information on using k6 for load testing.

## Prerequisites

*   k6 on Linux. Check https://grafana.com/docs/k6/latest/set-up/install-k6/

## Project Structure

load-tester/                                                                                                                                                                                                                                                                    
├── deploy/                                                                                                                                                                                                                                                                     
│   ├── start.sh          # Script to run k6 tests                                                                                                                                                                                                                              
│   ├── censored.sh       # Script to censor potential secrets                                                                                                                                                                                                                  
│   └── init.sh           # Script to install prerequisites (example)                                                                                                                                                                                                           
├── k6/                                                                                                                                                                                                                                                                         
│   ├── k8s/                                                                                                                                                                                                                                                                    
│   │   ├── test_plan.js  # k6 test script for k8s                                                                                                                                                                                                                              
│   │   └── config.json   # Configuration for k8s tests                                                                                                                                                                                                                         
│   └── example/                                                                                                                                                                                                                                                                
│       ├── test_plan.js  # k6 test script for example                                                                                                                                                                                                                          
│       └── config.json   # Configuration for example tests                                                                                                                                                                                                                     
├── .gitignore           # Git ignore file                                                                                                                                                                                                                                      
├── README.md            # Project documentation                                                                                                                                                                                                                                
└── pnpm-lock.yaml       # pnpm lock file    

## Usage

*   Run k6 tests: `bash deploy/start.sh`
*   Censor potential secrets: `bash deploy/censored.sh`
*   Initialize prerequisites (Linux): `bash deploy/init.sh`
*   Run a specific k6 test: `k6 run <k6_script_path>`
