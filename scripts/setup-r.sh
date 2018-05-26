## Step 1: Setting Up APT
sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -

##Step 2: Installing R
sudo apt-get update

sudo apt-get -y install -f r-base

##Step 3: Installing R Packages from CRAN
sudo su - -c "R -e \"install.packages('shiny', repos = 'http://cran.rstudio.com/')\""

##Step 4: Step 4 — Installing devtools Package
sudo apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev
sudo su - -c "R -e \"install.packages('devtools', repos='http://cran.rstudio.com/')\""
