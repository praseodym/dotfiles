# SYNOPSIS
#   subl [options] [file ...]        edit the given files
#   subl [options] [directory ...]   open the given directories
#   subl [options]                   edit stdin
#

function subl -d "Open Sublime Text"
  set -l opts
  set -l files
  set -l projects

  # we'll just ignore anything that looks like an option string...
  for file in $argv
    switch $file
      case '-*'
        set opts $opts $file

      case '.*' '*'
        set files $files $file
    end
  end

  # if there's one (and only one) *.sublime-project file in the folder listed, open that instead.
  if [ (count $files) -eq 1 ]
    set projects (find $files[1] -name "*.sublime-project" -maxdepth 1 2> /dev/null)
  end

  if [ (count $projects) -eq 1 ]
    set argv $opts $projects[1]
  end

  /usr/bin/subl -n $argv
end
