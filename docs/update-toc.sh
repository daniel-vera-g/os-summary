#!/bin/sh

# Remove current toc:
# 1. Use sed to remove everything till the first heading
# 2. Write it to tmp file
# 3. When no errors merge it with index file
sed -n  '/^#/,$p' index.md > tmp \
  && yes | mv tmp index.md

# Create table of contents:
# 1. Create toc with markdown-toc and save in tmp file
# 2. Add linebreak at the end of the toc file
# 3. Concatenate tmp back with the index file
# 4. When no errors occurred in concatenation process, merge tmp with index
# markdown-toc index.md > tmp && \
#   echo \ >> tmp && \
#   cat tmp index.md > tmp && \
#   yes | mv tmp index.md

markdown-toc index.md > tmp && echo \ >> tmp && cat tmp index.md > tmp2 && yes | mv tmp2 index.md

# cleanup
rm tmp
