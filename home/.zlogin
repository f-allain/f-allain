fortune -a | cowsay -f $(cowsay -l | awk 'NR>1 {print $1}' | shuf -n 1) | lolcat
