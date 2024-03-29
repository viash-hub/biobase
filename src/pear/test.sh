#!/bin/bash

set -e

dir_in="${meta_resources_dir%/}/test_data"

echo "> Run PEAR"
"$meta_executable" \
  --forward_fastq "$dir_in/a.1.fastq" \
  --reverse_fastq "$dir_in/a.2.fastq" \
  --assembled "test.assembled.fastq.gz" \
  --unassembled_forward "test.unassembled.forward.fastq.gz" \
  --unassembled_reverse "test.unassembled.reverse.fastq.gz" \
  --discarded "test.discarded.fastq.gz" \
  --p_value 0.01

echo ">> Checking output"
[ ! -f "test.assembled.fastq.gz" ] && echo "Output file test.assembled.fastq.gz does not exist" && exit 1
[ ! -f "test.unassembled.forward.fastq.gz" ] && echo "Output file test.unassembled.forward.fastq.gz does not exist" && exit 1
[ ! -f "test.unassembled.reverse.fastq.gz" ] && echo "Output file test.unassembled.reverse.fastq.gz does not exist" && exit 1
[ ! -f "test.discarded.fastq.gz" ] && echo "Output file ftest.discarded.fastq.gz does not exist" && exit 1

echo "> Test successful"