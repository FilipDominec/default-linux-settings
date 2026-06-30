# Stress-free migration to a new system

Procedure on the old computer:

1. download Lubuntu https://lubuntu.me/downloads/
1. `wget https://github.com/unetbootin/unetbootin/releases/download/702/unetbootin-linux64-702.bin`
1. run unetbootin, make a bootable flash

On the new system:

1. boot from flash, install Lubuntu, choosing Czech: Dvorak-UCW keyboard, giving the system 40GB on a separate partition
1. copy usual directories ( a b d f g p s v t )
1. copy private directories ( .ssh .gnupg .gitconfig )
1. run ` ssh-add ~/.ssh/id_rsa ` once (after restart, only run `ssh-add`)
1. sudo apt-get install git
1. mkdir -p g; cd g
1. `git clone https://github.com/FilipDominec/default-linux-settings'
1. run `settings.sh`, perhaps pasting the commands step-by-step

1. sync passwords
1. check git works (don't generate new keys)
1. check that nothing too important is left behind in old home directory and its other subdirs ( i o k Downloads Desktop )
