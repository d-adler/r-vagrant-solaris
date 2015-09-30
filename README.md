# Vagrant Development Environment for R on Solaris 

This development environment provisions a Solaris 10 (u11) Guest OS
with 
- Sun C Compiler (Solaris Studio 12.3) 
- GCC 4.9 (from OpenCSW)
- Texlive
- R 32- and 64-bit versions compiled using the Sun and GNU compiler 
preinstalled.

## Prequisites

- Packer  (Freely available at https://packer.io/downloads.html)
- VirtualBox (Freely available at https://www.virtualbox.org/wiki/Downloads)
- Vagrant (Freely available at https://www.vagrantup.com/downloads.html)
- POSIX-Shell (on Windows use Cygwin or MinGW)
- Unix CLI Tools: git, curl

## Getting Started

1. Download some files available from Oracle (You need to be a registered user!)
   - Solaris ISO Image `sol-10-u11-ga-x86-dvd.iso` into `packer/_dl`
   - Solaris Studio Installer `SolarisStudio12.3-solaris-x86-pkg.tar.bz2` into `vagrant/_dl`
2. Run bootstrap script
    $ ./bootstrap.sh
3. Run provision script
    $ ./provision.sh

## R Warnings

Currently, the following warnings haven't been resolved during configuration of the R source tree:

    configure: WARNING: you cannot build info or HTML versions of the R manuals
    configure: WARNING: I could not determine a browser
    configure: WARNING: I could not determine a PDF viewer

## Login to the Image

To enter the guest OS, use the typical vagrant ssh command:

    $ cd vagrant 
    $ vagrant ssh

## Using R

Four different R versions are compiled and installed on the system.
In order to use a specific R version put its `bin` directory into your `PATH`.

Compiler        | Arch     | Prefix   
----------------+----------+---------------------
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

