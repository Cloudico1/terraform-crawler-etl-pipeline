#!/bin/bash
git filter-branch -f --index-filter 'git rm --cached -r --ignore-unmatch .terraform/'