#!/bin/bash

set -e

dir_in="$meta_resources_dir/test_data"

echo "> Run featureCounts (with junctions)"
"$meta_executable" \
  --input "$dir_in/a.bam" \
  --annotation "$dir_in/annotation.gtf" \
  --counts "features.tsv" \
  --summary "summary.tsv" \
  --junctions "junction_counts.txt" \
  --ref_fasta "$dir_in/genome.fasta" \
  --overlapping \
  --frac_overlap 0.2 \
  --paired \
  --strand 0 \
  --detailed_results detailed_results \
  --detailed_results_format SAM

echo ">> Checking output"
[ ! -f "features.tsv" ] && echo "Output file features.tsv does not exist" && exit 1
[ ! -f "summary.tsv" ] && echo "Output file summary.tsv does not exist" && exit 1
[ ! -f "junction_counts.txt" ] && echo "Output file junction_counts.txt does not exist" && exit 1
[ ! -d "detailed_results" ] && echo "Output directory detailed_results does not exist" && exit 1
[ ! -f "detailed_results/a.bam.featureCounts.sam" ] && echo "Output file detailed_results/a.bam.featureCounts.sam does not exist" && exit 1

echo ">> Check if output is empty"
[ ! -s "features.tsv" ] && echo "Output file features.tsv is empty" && exit 1
[ ! -s "summary.tsv" ] && echo "Output file summary.tsv is empty" && exit 1
[ ! -s "junction_counts.txt" ] && echo "Output file junction_counts.txt is empty" && exit 1
[ ! -s "detailed_results/a.bam.featureCounts.sam" ] && echo "Output file detailed_results/a.bam.featureCounts.sam is empty" && exit 1

echo "> Run featureCounts (without junctions)"
"$meta_executable" \
  --input "$dir_in/a.bam" \
  --annotation "$dir_in/annotation.gtf" \
  --counts "features.tsv" \
  --summary "summary.tsv" \
  --overlapping \
  --frac_overlap 0.2 \
  --paired \
  --strand 0 \
  --detailed_results detailed_results \
  --detailed_results_format SAM

echo ">> Checking output"
[ ! -f "features.tsv" ] && echo "Output file features.tsv does not exist" && exit 1
[ ! -f "summary.tsv" ] && echo "Output file summary.tsv does not exist" && exit 1
[ ! -d "detailed_results" ] && echo "Output directory detailed_results does not exist" && exit 1
[ ! -f "detailed_results/a.bam.featureCounts.sam" ] && echo "Output file detailed_results/a.bam.featureCounts.sam does not exist" && exit 1

echo ">> Check if output is empty"
[ ! -s "features.tsv" ] && echo "Output file features.tsv is empty" && exit 1
[ ! -s "summary.tsv" ] && echo "Output file summary.tsv is empty" && exit 1
[ ! -s "detailed_results/a.bam.featureCounts.sam" ] && echo "Output file detailed_results/a.bam.featureCounts.sam is empty" && exit 1

echo "> Test successful"