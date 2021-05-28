#!/bin/sh

originals_directory=(~/Pictures/Photos\ Library.photoslibrary/originals)
echo "\nOriginals directory: ${originals_directory}\n"

sub_directories=(`cd "${originals_directory}/" && ls -F | grep /`)
echo "Sub directories: ${sub_directories[@]}\n"

read -p 'Provide target directory: ' target_directory_name

echo '\nMaking target directory:'
`cd "${originals_directory}/" && mkdir ${target_directory_name}`

echo '\nMoving files...'
for d in "${sub_directories[@]}"
  do
    # sub directory includes trailing backslash
    files=(`cd "${originals_directory}/" && ls ${d}`)
    # echo $files

    for f in "${files[@]}"
      do    
        echo "$d$f"
        `cd "${originals_directory}/" && mv $d$f ${target_directory_name}/`
    done
done

echo '\nMoving target directory to ~/Desktop ...'
`cd "${originals_directory}/" && mv ${target_directory_name} ~/Desktop/`
