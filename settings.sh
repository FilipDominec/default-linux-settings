## === Programs from the repository ===

## Accept the EULA by default
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
echo wicd-daemon wicd/users multiselect `whoami` | debconf-set-selections ## TESTING

## Basics
sudo apt-get install -y vim-gtk  ack-grep htop  miredo cstocs testdisk git gitg gnupg  unrar n2n nmap debfoster qemu osdclock baobab wicd unetbootin mc arbtt xdotool xsel
sudo apt-get install default-jre # default-jdk
sudo apt-get install -y mtpfs mtp-tools gmtp 
# if it does not help: libmtp-common mtp-tools libmtp-runtime libmtp9

#sudo apt-get install -y wine 


## Internet and communication
sudo apt-get install -y pidgin linphone youtube-dl

## Graphics and writing
sudo apt-get install -y libreoffice-calc libreoffice-writer libreoffice-impress myspell-dictionary-cs hyphen-cs libreoffice-grammarcheck-cs mythes-cs libreoffice-l10n-cs libreoffice-gtk3 libreoffice-style-tango libreoffice-pdfimport 
## Do not forget to change saving to DOCX/XLSX
sudo apt-get install -y gimp inkscape texlive-fonts-extra pdfposter biber texlive-bibtex-extra texlive-lang-czechslovak pdftk imagemagick pdfjam geeqie djvulibre-bin
sudo apt-get install -y texlive-latex-extra dvipng # for type1cm.sty to make latex+matplotlib work

## Multimedia 
sudo apt-get install -y sound-juicer lame gstreamer0.10-plugins-ugly-multiverse smplayer vlc audacity ffmpeg
sudo apt-get install -y handbrake

## Programming, electronics and research
sudo apt-get install -y avr-libc gcc-avr glade avrdude geda-utils  ## programming and technology
sudo apt-get install -y ipython python-numpy python3-numpy python-sympy python-matplotlib  ## computing and plotting
sudo apt-get install -y mpb harminv python-h5py paraview		## electromagnetic computation (MEEP will be compiled from scratch, search for python-meep-install on github)

## === Remove unused default apps ===
sudo apt-get remove -y abiword gnumeric 


## === Install non-repository software ===

## Esmska
# echo "deb http://repo.palatinus.cz/stable / #Esmska" >> /etc/apt/sources.list
#wget  --quiet -O - http://repo.palatinus.cz/repo.key | sudo apt-key add - > /dev/null
#sudo apt-get install esmska 
#apt-get update

## Set up autostart in Lubuntu
mkdir ~/.config/autostart -p
echo -e "[Desktop Entry]\nType=Application\nExec=setxkbmap -option caps:swapescape" > ~/.config/autostart/swapcase.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=setxkbmap cz -variant dvorak-ucw" > ~/.config/autostart/dvorak.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=osd_clock -s 0 -o 16 -c grey -tr -f -misc-fixed-bold-r-semicondensed--*-*-*-*-c-*-*-*" > ~/.config/autostart/osdclock.desktop
echo -e "" > ~/.config/autostart/light-locker.desktop
echo -e "[Desktop Entry]\n Type=Application\n Exec=arbtt-capture\n" > /.config/autostart/arbtt.desktop
echo -e "[Desktop Entry]\n Type=Application\n Exec=linphone\n" > /.config/autostart/linphone.desktop
echo -e "[Desktop Entry]\n Type=Application\n Exec=pidgin\n" > /.config/autostart/pidgin.desktop
echo -e "[Desktop Entry]\n Type=Application\n Exec=transmission-gtk\n" > /.config/autostart/transmission.desktop

## Install the automatic PDF cropping program
wget http://sourceforge.net/projects/briss/files/latest/download -O /tmp/briss.gz
cd ~/bin/
tar xzf /tmp/briss.gz 


## === Custom settings ===
cat ~/.bashrc files/bashrc.append > /tmp/bashrc; mv /tmp/bashrc ~/.bashrc
cp files/vim ~/.vim -r 
cp files/vimrc ~/.vimrc

## VIM modules (pathogen.vim required for semantic highlight)
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle/ && git clone https://github.com/jaxbot/semantic-highlight.vim.git

## HP Printer: connect the printer, use all default settings
# Guide from: http://cd-rw.org/t/fix-the-broken-hp-printer-driver-installation-on-ubuntu-15-04-linux-mint-17-02-and-others/33
wget https://www.openprinting.org/download/printdriver/auxfiles/HP/plugins/hplip-3.15.2-plugin.run.asc
wget https://www.openprinting.org/download/printdriver/auxfiles/HP/plugins/hplip-3.15.2-plugin.run
sudo apt-get install hplip hplip-gui ## For the HP printer
sudo hp-setup -i
sudo sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf
## If there are problems installed or complaining of wrong MD5 sum, install it by compilation http://hplipopensource.com/hplip-web/install/manual/distros/ubuntu.html (needs to run `hp-plugin' and install the binary blob, and THEN, add the printer in a common way?)


## === Notes to manual settings ===

echo "Important files that need to be transferred (No, I will not add them to this git repo ;)"
echo "Move to the old home and run these commands:\n"
echo '  OLDHOME=.'
echo '  NEWHOME=~'
echo '  cp ${OLDHOME}/.gitconfig ${NEWHOME} '
echo '  cp ${OLDHOME}/.gnupg/ ${NEWHOME}/ -r'
echo '  cp ${OLDHOME}/.ssh/ ${NEWHOME}/ -r'
echo '  ssh-add ~/.ssh/id_rsa			## ... so that git does not prompt for a password every time'
echo '  cp ${OLDHOME}/.purple/ ${NEWHOME}/ -r'
echo '  cp ${OLDHOME}/.linphonerc ${NEWHOME}/'

echo 
echo 'In Paraview, one shall switch "Auto apply"'

## REVTeX for publication in APS journals (PRA, PRB, PRX ...) [added 2014-09-02]
## TODO: store revtex4-1-tds.zip in the files/ dir
## needed to be done manually on Ubuntu (Oneiric): download the ZIP installer from the APS website, unzip
## there are wrong hints in the README file, the supposed directory does not exist. However the following works:
# sudo unzip revtex4-1-tds.zip -d /usr/share/texmf-texlive/; sudo mktexlsr /usr/share/texmf-texlive/

#sudo add-apt-repository ppa:finalterm/daily
#sudo apt-get update
#sudo apt-get install finalterm

## To have clear sound input for IP telephony, it must be:
##	1) "Analog duplex stereo" on the Hardware tab, 
##  2) "Mic" in Alsamixer (hit F4, go to the very right, use up/down arrows)

## Colorful bash console:
# sudo echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]#'" >> /root/.bashrc
# other colors: (todo)


# Something like this may be needed to disable screen locking
# sed -i /etc/default/acpi-support -e 's/LOCK_SCREEN=true/# LOCK_SCREEN=true/'


## Experimental: middle-mouse pasting from keyboard; add this in the middle of ~/.config/openbox/lubuntu-rc.xml 
    #<keybind key="C-S-Space">
      #<action name="Execute">
		  #<command>sh -c 'xdotool type --clearmodifiers -- "`xsel`"'</command>
      #</action>
    #</keybind>
#
