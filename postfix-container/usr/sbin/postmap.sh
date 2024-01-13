#/bin/bash
search_dir=/pre-install/postmap
#if the folder is empty do nothing
for entry in "$search_dir"/* ; do
  #the if is only executed if a file was found not a folder or anything else
  if [ -f $entry ]; then
    #copy the files to the postmap folder
    filename=$(echo $entry | sed -e 's/\/.*\///g')
    echo "copying" $filename
    cp $search_dir/$filename /etc/postfix
    #execute postmap command for the file
    echo "apply postmap"
    postmap /etc/postfix/$filename
  fi
  #for files there is an explicit if statement above.
  #everything else is not mentioned. The loop will
  #walk through these items but not do anything which is good.
done
