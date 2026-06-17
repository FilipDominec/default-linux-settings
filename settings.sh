## NOTE: Run this script as the respective user, not root
## NOTE: on notebook, fix for the powerbutton may be needed: sudo vi /etc/systemd/logind.conf

## === Programs from the repository ===

## Accept the EULA by default
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt --reinstall install ttf-mscorefonts-installer

## Basics
sudo apt install -y vim-gtk3 silversearcher-ag htop plocate cstocs testdisk git gitg gnupg  unrar n2n nmap debfoster osdclock baobab  mc xdotool xsel nethogs arandr osdsh libxosd2 libnotify-bin network-manager-pptp curl gparted rename meld sshfs snapd cifs-utils transmission

snap install czkawka
#sudo snap connect czkawka:removable-media



## Graphics and writing
#sudo apt install -y libreoffice-calc libreoffice-writer libreoffice-impress myspell-dictionary-cs hyphen-cs libreoffice-l10n-cs libreoffice-gtk3 libreoffice-style-tango libreoffice-pdfimport 
sudo add-apt-repository ppa:libreoffice # latest LO
sudo apt update

# Gwyddion
sudo add-apt-repository -y ppa:gwyddion-spm/ppa
#sudo apt install gwyddion -y

# Inkscape (or get newest binary from https://inkscape.org/release/inkscape-dev/gnulinux/appimage/dl/ )
#sudo add-apt-repository -y ppa:inkscape.dev/stable
sudo add-apt-repository -y ppa:inkscape.dev/trunk
sudo apt update
sudo apt install inkscape
#sudo apt install inkscape-trunk     # version 1.4 kept crashing...



sudo add-apt-repository ppa:deadsnakes/ppa # latest Python 
sudo apt update
sudo apt install python3.14 python3.14-venv python3.14-dev python3.14-tk
# should also check out python3.14-nogil - will it perform faster?

sudo apt update
sudo apt install libreoffice hyphen-cs hyphen-en-us -y

sudo apt install -y evince gimp inkscape libimage-exiftool-perl rawtherapee hugin 
sudo apt install -y texlive-fonts-extra pdfposter biber texlive-bibtex-extra texlive-lang-czechslovak pdftk imagemagick # djvulibre-bin  #?? pdfjam 
sudo apt install -y texlive-latex-extra dvipng pandoc # for type1cm.sty to make latex+matplotlib work
#note https://ask.libreoffice.org/t/export-directly-to-pdf-only-produces-a-blank-page/56400 may fix empty PDF problem
# TODO try https://github.com/nichtich/pandoc-filter-arrows

# Geeqie had some troubles, get latest appimage
# https://github.com/BestImageViewer/geeqie/releases
wget https://github.com/BestImageViewer/geeqie/releases/download/continuous/Geeqie-latest-x86_64.AppImage -O ~/bin/geeqie
chmod +x ~/bin/geeqie
# move it to ~/bin/geeqie  , chmod +x 


## Multimedia 
sudo apt install -y sound-juicer lame smplayer vlc audacity ffmpeg handbrake
sudo pip install  yt-dlp # (upgraded fork of youtube-dl)




## Programming, electronics and research
sudo apt install -y avr-libc gcc-avr glade avrdude kicad  ## programming and technology

## TODO better get newest matplotlib etc. using pip, see below
sudo apt install -y ipython3 python3-full python3-numpy python3-pip python3-psutil python3-serial python3-imageio python3-opencv
sudo apt install -y libgirepository1.0-dev python3-gi # fixed some error by using: --system-site-packages

## Create one default virtual environment for installing all user-space Python modules using pip3,
## but also accept the system-wide packages installed by `apt`. And get freshest packages.
## (Note that .bashrc will also have to be amended to enter this environment in every new terminal window. 
python3 -m venv --system-site-packages .venv  # check this
pip install scipy
pip install ipython
pip install yt-dlp # (upgraded fork of youtube-dl)
pip install gspread oauth2client

pip install -e git+https://github.com/matplotlib/matplotlib.git#egg=matplotlib
# alternate approach:  git clone --depth 1 git@github.com:matplotlib/matplotlib.git  &&  cd matplotlib  &&  python -m pip install -e .
# pip install kiwisolver cycler python-dateutil # are they necessary?  these are pip dependencies of matplotlib
# sudo apt install -y mpb harminv python-h5py paraview		## electromagnetic computation (MEEP will be compiled from scratch, search for python-meep-install on github)


## TODO Mayavi2 had some install troubles as of 2026
# git clone https://github.com/enthought/mayavi.git
# cd mayavi
# pip install -r requirements.txt
# pip install PyQt5  # replace this with any supported toolkit
# python setup.py install  # or develop
# sudo apt install python3-pyqt5.qtsvg     ## this helped
sudo apt install -y 
 
## Alternate approach, also see https://github.com/enthought/mayavi/issues/1230; launching command is `mayavi2` 
#pip install mayavi2 --no-build-isolation  


## === Install non-repository software ===


## LunarVim experiment https://www.lunarvim.org/docs/installation
#sapti neovim npm nodejs cargo ripgrep    # lazygit??
#TODO




## LibOrigin for python
	#sudo apt install -y python3-pip cython doxygen cmake libboost-all-dev
	#sudo pip3 install Cython
	#git clone https://github.com/Saluev/python-liborigin2.git
	#cd python-liborigin2/
	#mkdir build
	#cd build
	#cmake ../
	#make
	#doxygen Doxyfile
	#cd ..
	#python3 setup.py install
	#cd ..

## Esmska
# echo "deb http://repo.palatinus.cz/stable / #Esmska" >> /etc/apt/sources.list
#wget  --quiet -O - http://repo.palatinus.cz/repo.key | sudo apt-key add - > /dev/null
#sudo apt install esmska 
#apt update

## Set up autostart in Lubuntu
mkdir ~/.config/autostart -p
echo -e "[Desktop Entry]\nType=Application\nExec=setxkbmap -option caps:swapescape" > ~/.config/autostart/swapcase.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=setxkbmap cz -variant dvorak-ucw" > ~/.config/autostart/dvorak.desktop
echo -e "" > ~/.config/autostart/light-locker.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=arbtt-capture\n" > ~/.config/autostart/arbtt.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=linphone\n" > ~/.config/autostart/linphone.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=pidgin\n" > ~/.config/autostart/pidgin.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=transmission-gtk\n" > ~/.config/autostart/transmission.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=osd_clock -s 0 -o -13 -c white -tr -f -misc-fixed-bold-r-semicondensed--*-*-*-*-c-*-*-* -F '%u  %y%m%d  %R           '" > ~/.config/autostart/osd_clock.desktop
echo -e "[Desktop Entry]\nType=Application\nExec=osdsh -c red -d 1 -o 0 -a 2 -f -misc-fixed-bold-r-semicondensed--*-*-*-*-c-*-*-*" > ~/.config/autostart/osd.desktop 
#cp	files/osd_cpu.sh ~/.config/autostart/osd_cpu.sh
echo -e "[Desktop Entry]\nType=Application\nExec=bash ~/.config/autostart/osd_cpu.sh" > ~/.config/autostart/osd_cpu.desktop





## Kaitai compiler is useful for parsing binary formats  : TODO has problem with java version ?
### 1. the module for parsing (for users of scientific instrumentation etc.)
sudo pip3 install kaitaistruct	
### 2. the compiler for parsers (for developers) - didn't work as of 2026
#echo "deb https://dl.bintray.com/kaitai-io/debian jessie main" | sudo tee /etc/apt/sources.list.d/kaitai.list
#sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv 379CE192D401AB61
#sudo apt update
#sudo apt install kaitai-struct-compiler  


# if Acrobat reader installed for interactive forms, set evince still as default
# (not doing it here)
xdg-mime default evince.desktop application/pdf


## === System-wide settings (run as root) ===
## Prevent the (purely software-related) error with qemu: Could not access KVM kernel module: Permission denied
#??? chmod o+rw /dev/kvm		# I guess this is safe


## === Custom settings ===
su dominecf
git config --global url.ssh://git@github.com/.insteadOf https://github.com/
git config --global url.ssh://git@bitbucket.org/.insteadOf https://bitbucket.org/


cat ~/.bashrc files/bashrc.append > /tmp/bashrc; mv /tmp/bashrc ~/.bashrc
cp files/ssh/* ~/.ssh/ -r
cp files/vim/ ~/.vim/ -r
cp files/vimrc ~/.vimrc

sed s/allDesktops>yes<\/allDesktops/allDesktops>no<\/allDesktops/ -i ~/.config/openbox/lxqt-rc.xml
#sudo sed s/#user_allow_other/user_allow_other/ -i /etc/ssh ##???


## Enable imagemagick to export to PDF, solving the "convert-im6.q16: not authorized" error
sudo mv /etc/ImageMagick-6/policy.xml /etc/ImageMagick-6/policy.xmlout

## VIM modules (pathogen.vim required for semantic highlight, multicursor etc.)
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
pushd ~/.vim/bundle 
git clone --depth 1 git://github.com/godlygeek/tabular.git
git clone --depth 1 https://gitlab.famillewallon.com/ines/custom-vim.git
git clone --depth 1 https://github.com/jaxbot/semantic-highlight.vim.git
popd
#curl -LSso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
#?? cd ~/.vim/bundle/ && git clone https://github.com/jaxbot/semantic-highlight.vim.git


## === Notes to manual settings ===

echo "Important files that need to be transferred (No, I will not add them to this git repo ;)"
echo "Change working directory to the old home and run these commands:\n"
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

## Desktop manager settings
if [ -f ~/.config/openbox/lubuntu-rc.xml ]; then
	## More desktops
	sed -i ~/.config/openbox/lubuntu-rc.xml -e 's;ber>2</num;ber>6</num;' 

	## Experimental: middle-mouse clipboard paste activated by keyboard; add this in the middle of  
	sed -i ~/.config/openbox/lubuntu-rc.xml -e '/<keyboard>/r lubuntu-rc.append'
	sed -i ~/.config/openbox/lubuntu-rc.xml -e '/<applications>/r lubuntu-rc.append2'

	## Note: change AllDesktops to 'false' to disable Alt-Tab switching windows over all desktops
	# vi  ~/.config/openbox/rc.xml
fi

## Lower the default threshold for scientific notation in ipython
echo "c = get_config()" >> ~/.ipython/profile_default/ipython_config.py
echo "c.InteractiveShellApp.exec_lines = ['%precision %.6g']" >> ~/.ipython/profile_default/ipython_config.py




# Can evince pdf reader be setup to do larger zoom than 400%?
gsettings set org.gnome.Evince page-cache-size 2014

## Origin viewer
#sudo apt install -y wine-development #TODO test 
# cp ./files/wine/syswow64/mfc110u.dll ~/.wine/syswow64/ ### FIXME missing? 
# get the DLL from https://wikidll.com/download/14122 (md5 = b8de851298e99a005bfd34aa906b3fe8)
## TODO get it from https://www.originlab.com/viewer/dl.aspx 



# Experimental: pdf tools, see  https://archive-pdf-tools.readthedocs.io/en/latest/index.html
#  I would need to somehow generate a "hOCR" file from a PDF, not going to do it now
#  reported my troubles here: https://github.com/internetarchive/archive-pdf-tools/issues/67

# sudo apt install -y libleptonica-dev libopenjp2-tools libxml2-dev libxslt-dev python3-dev python3-pip
# git clone https://github.com/agl/jbig2enc
# cd jbig2enc
# ./autogen.sh
# ./configure && make
# sudo make install
# recode_pdf --version ## OK, this writes: internetarchivepdf 1.5.2


## Install the automatic PDF cropping program
wget http://sourceforge.net/projects/briss/files/latest/download -O /tmp/briss.gz
unzip -q /tmp/briss.gz 
mkdir -p ~/bin
mv briss* ~/bin/

## OCR for documents
#sudo snap install jbig2enc --edge
#sudo apt install -y tesseract-ocr ocrmypdf

## Re-flow of PDF for mobile/e-ink readers ### TODO test
sudo apt install -y k2pdfopt
pushd ~/bin/
git clone https://github.com/pwang7/rebook --depth 1
ln -s `which k2pdfopt` .
popd

# persistent swapescape settings:
dconf write "/org/gnome/desktop/input-sources/xkb-options" "['caps:swapescape']"


# Unnecessary?
# todo https://www.vim.org/scripts/script.php?script_id=3282
# todo install unetbootin or similar?
#sudo apt install -y default-jre # default-jdk  
#sudo apt install -y mtpfs mtp-tools gmtp  
# if it does not help: libmtp-common mtp-tools libmtp-runtime libmtp9
#echo wicd-daemon wicd/users multiselect `whoami` | debconf-set-selections ## TESTING
#sudo apt install -y wicd 
## === Remove unused default apps ===
#sudo apt remove -y abiword gnumeric 
## Internet and communication
#sudo apt install -y pidgin pidgin-bot-sentry linphone youtube-dl


## REVTeX for publication in APS journals (PRA, PRB, PRX ...) [added 2014-09-02]
## TODO: store revtex4-1-tds.zip in the files/ dir
## needed to be done manually on Ubuntu (Oneiric): download the ZIP installer from the APS website, unzip
## there are wrong hints in the README file, the supposed directory does not exist. However the following works:
# sudo unzip revtex4-1-tds.zip -d /usr/share/texmf-texlive/; sudo mktexlsr /usr/share/texmf-texlive/

#sudo add-apt-repository -y ppa:finalterm/daily
#sudo apt update
#sudo apt install finalterm

## To have clear sound input for IP telephony, it must be:
##	1) "Analog duplex stereo" on the Hardware tab, 
##  2) "Mic" in Alsamixer (hit F4, go to the very right, use up/down arrows)

## Colorful bash console:
# sudo echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u\[\033[01;32m\]@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]#'" >> /root/.bashrc
# other colors: (todo)


# Something like this may be needed to disable screen locking
# sed -i /etc/default/acpi-support -e 's/LOCK_SCREEN=true/# LOCK_SCREEN=true/'

## Experiment: bluetooth autoconnect:  In /etc/bluetooth/network.conf uncomment #DisableSecurity=true


## HP Printer: connect the printer, use all default settings
# Guide from: http://cd-rw.org/t/fix-the-broken-hp-printer-driver-installation-on-ubuntu-15-04-linux-mint-17-02-and-others/33
# wget https://www.openprinting.org/download/printdriver/auxfiles/HP/plugins/hplip-3.15.2-plugin.run.asc
# wget https://www.openprinting.org/download/printdriver/auxfiles/HP/plugins/hplip-3.15.2-plugin.run
# sudo apt install hplip hplip-gui ## For the HP printer
# sudo hp-setup -i
# sudo sed -i 's/#user_allow_other/user_allow_other/g' /etc/fuse.conf
## If there are problems with installation or complaining of wrong MD5 sum, install it by compilation http://hplipopensource.com/hplip-web/install/manual/distros/ubuntu.html (needs to run `hp-plugin' and install the binary blob, and THEN, add the printer in a common way?)


## Secure Boot - sbctl, to be tested
echo 'deb http://download.opensuse.org/repositories/home:/jloeser:/secureboot/xUbuntu_24.04/ /' | sudo tee /etc/apt/sources.list.d/home:jloeser:secureboot.list
curl -fsSL https://download.opensuse.org/repositories/home:jloeser:secureboot/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_jloeser_secureboot.gpg > /dev/null
sudo apt update
sudo apt install sbctl

## Swapping escape and CapsLock permanently - works easily on Lubuntu, couldn't make it permanent on Mate
# Option 1: put 
# dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']" # AOEUaoeuAEOU # AOUE
# Option 2: put 
#Section "InputClass"
        #MatchIsKeyboard "on"
        #Option "XkbOptions" "caps:escape"
#EndSection
# ... into:  sudo vi /etc/X11/xorg.conf.d/00-keyboard.conf -- broke the system ? 
# 
# Firefox stop popups manually
# go:    about:config,   search popup_allowed_events,  clear all of them
#

# VPN & connection to work
sudo apt install wireguard resolvconf

xdg-mime default vim.desktop text/x-python
