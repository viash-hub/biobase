#!/bin/bash

set -e

dir_in="${meta_resources_dir%/}/test_data"

echo "> Run lofreq call"
"$meta_executable" \
  --input "$dir_in/a.bam" \
  --input_bai "$dir_in/a.bai" \
  --ref "$dir_in/genome.fasta" \
  --out "output.vcf" \

echo ">> Checking output"
[ ! -f "output.vcf" ] && echo "Output file output.vcf does not exist" && exit 1

echo ">> Check if output is empty"
[ ! -s "output.vcf" ] && echo "Output file output.vcf is empty" && exit 1

echo "> Test successful"