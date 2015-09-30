# Vagrant Development Environment for R on Solaris 

This development environment provisions a Solaris 10 (u11) Guest OS
with 
- Sun C Compiler (Solaris Studio 12.3) 
- GCC 4.9 (from OpenCSW)
- Texlive
- R 32- and 64-bit versions using the Sun and GNU compiler 

## Prequisites

- Packer (https://packer.io/downloads.html)
- VirtualBox (https://www.virtualbox.org/wiki/Downloads)
- Vagrant (https://www.vagrantup.com/downloads.html)
- POSIX-Shell (on Windows use Cygwin or MinGW)
- CLI Tools: git, curl
- ~20 GB of harddisk space (for downloaded files and VM)

## Getting Started

1. Download following files available from Oracle (You need to be a registered user!)
   - Solaris ISO Image `sol-10-u11-ga-x86-dvd.iso` into `packer/_dl`
   - Solaris Studio Installer `SolarisStudio12.3-solaris-x86-pkg.tar.bz2` into `vagrant/_dl`
2. Run bootstrap script

    ./bootstrap.sh

   This took approx. 10 minutes on my machine.
3. Run provision script
    
    ./provision.sh
   
   This takes a lot more time.  
   Feel free to remove various provisioners in `vagrant/provision.sh` such as `tex` or even remove Compiler installations (`solstudio` or `gcc`) and R builds (`rbuild-*`).

## Login to the Image

To enter the guest OS, use the typical vagrant ssh command:

    $ cd vagrant 
    $ vagrant ssh

## Using R

Four different R versions are compiled and installed on the system.
In order to use a specific R version put its `bin` directory into your `PATH`.

Compiler        | Arch     | Prefix   
--------------- | -------- | ---------------------
Sun Compiler    | 32-bit   | `/usr/R-sun32`
                | 64-bit   | `/usr/R-sun64`
GCC Compiler    | 32-bit   | `/usr/R-gcc32`
                | 64-bit   | `/usr/R-gcc64`
  
### Example

Using the 64-bit R version using the Sun compiler:

    $ PATH=/usr/R-sun64/bin:$PATH
    $ export PATH
    $ R

## Test Host Configurations

- Mac OS X 10.8.5, Packer 0.7.5, Vagrant 1.7.2, VirtualBox 4.3.26

## Warnings during building R

Currently, the following warnings haven't been resolved during configuration of the R source tree:

    configure: WARNING: you cannot build info or HTML versions of the R manuals
    configure: WARNING: I could not determine a browser
    configure: WARNING: I could not determine a PDF viewer


## Troubleshooting

- `bootstrap.sh` fails with:

      ==> virtualbox-iso: ISO download failed.
      Build 'virtualbox-iso' errored: ISO download failed.

  Download Solaris 10 Image and place under 'packer/_dl'. (Re-read 'Getting Started')

- `provision.sh` fails with:

      ==> default: Running provisioner: solstudio (shell)...
      ==> default: bzcat: Can't open input file /vagrant/_dl/SolarisStudio12.3-solaris-x86-pkg.tar.bz2: No such file or directory.

  Download Solaris Studio Installar and place it under 'vagrant/_dl'. (Re-read 'Getting Started')

