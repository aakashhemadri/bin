#!/bin/bash
#
# SPDX-License-Identifier: GPL-2.0
#
# Copyright(c) Shuah Khan <skhan@linuxfoundation.org>
# License: GPLv2
#
# Generates wiki format table of task list from Document
# build log
# Usage: gen_doc_task_list.sh <doc_build_log_file> <

# Print Table header
echo "| **Task** | **Description** | **Owner** | **Status** | **Commit ID** |"
for f in `egrep "warn|WARN|error|ERROR" $1 | \
        egrep ".c:|.h:|.rst:" | \
        awk -F: '{print $1}' | awk '!a[$0]++' | \
        sed -e "s/^.\///" | sed -e "s/^\/mnt\/data\/lkml\/linux_5.3\///"`
do
        echo "| $f | Fix warns | | | |"
done
