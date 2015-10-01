# Vagrant Development Environment for R on Solaris 

This development environment provisions a Solaris 10 (u11) x86_64 Guest OS with 
- Sun C/C++/Fortran Compiler (Solaris Studio 12.3) 
- GCC C/C++/Fortran Compiler (Version 4.9 from OpenCSW) 
- Texlive (from OpenCSW) 
- R 32- and 64-bit versions (build from Source) using the Sun and GNU compiler

By default, the 32-bit version of R is compiled with a Sun Compiler and gets installed in `/usr/R-sun32`.

Optionally, the 64-bit version of R 'sun' compiled, TexLive, GCC compiler and 32/64-bit R versions with 'gcc' can be installed.
However, this takes several hours to complete (i.e. 5-6 hours using a fast internet connection, the VM Image growed to 9.5 GB).

## Prequisites

- Packer (https://packer.io/downloads.html)
- VirtualBox (https://www.virtualbox.org/wiki/Downloads)
- Vagrant (https://www.vagrantup.com/downloads.html)
- POSIX-Shell (on Windows use Cygwin or MinGW)
- CLI Tools: git, curl
- ~20 GB of harddisk space (for downloaded files and VM)

## Getting Started

1. Download Files
   The following files need to be downloaded and are available from Oracle (You need to be a registered user!)
   - Solaris ISO Image `sol-10-u11-ga-x86-dvd.iso` into `packer/_dl`
   - Solaris Studio Installer `SolarisStudio12.3-solaris-x86-pkg.tar.bz2` into `vagrant/_dl`
2. Run bootstrap script

   ~~~
   $ ./bootstrap.sh
   ~~~

   After that, you will have a the vagrant base box `sol10` installed in your local vagrant box repository.
   The box only contains the operating system, standard package tools and preparations for vagrant.
   Run `vagrant box list` to verify.
   
   Typically this takes approx. 10 minutes to finish on a test machine with fast internet connection.
   
3. Run provision script with a default 'minimal' setup.
    
   ~~~
   $ ./provision.sh
   ~~~

   After that, the Guest OS VM is running with a pre-installed sun compiler and the R sources and a 32-bit version installed to `/usr/R-sun32`.

   This step took approx. 15 minutes to finish on a test machine with fast internet connection.
   
## Entering the VM

First, change to the `vagrant` directory.

    $ cd vagrant

And from here you can perform various task such as login to the guest os:

    $ vagrant ssh

Further actions:

Action      | Command
----------- | ----------------------
Shutdown VM | `$ vagrant halt`    
Boot VM     | `$ vagrant up`
Suspend VM  | `$ vagrant suspend` 
Resume VM   | `$ vagrant resume` 
Delete VM   | `$ vagrant destroy`

## Starting R 

Enter the Guest OS via `vagrant ssh`, then:

~~~
-bash-3.2$ /usr/R-sun32/bin/R 

R version 3.2.2 (2015-08-14) -- "Fire Safety"
Copyright (C) 2015 The R Foundation for Statistical Computing
Platform: i386-pc-solaris2.10 (32-bit) 
~~~

## Install optional components

Up to four different R versions are compiled and installed on the system.
In order to use a specific R version put its `bin` directory into your `PATH`.

Compiler        | Arch     | Prefix                
--------------- | -------- | --------------------- 
Sun Compiler    | 32-bit   | `/usr/R-sun32`      
                | 64-bit   | `/usr/R-sun64`        
GCC Compiler    | 32-bit   | `/usr/R-gcc32`         
                | 64-bit   | `/usr/R-gcc64`
  

If you want to install all four R versions you can uncomment the full setup - see file `vagrant/provision.sh`
or run provisioners on demand.

~~~
vagrant provision --provision-with <component1>,<component2>,...
~~~

Component      | Description
-------------- | ---------------------------------------------------
`solstudio`    | Sun C/C++/Fortran Compiler
`gcc`          | GCC C/C++/Fortan Compiler
`tex`          | TexLive + Font Extras
`rdev`         | R Development Setup (iconv/readline) + Source code
`rbuild-sun32` | Build R 32-bit with Sun Compiler 
`rbuild-sun64` | Build R 64-bit with Sun Compiler 
`rbuild-gcc32` | Build R 32-bit with GCC Compiler 
`rbuild-gcc64` | Build R 64-bit with GCC Compiler 

For example, building the 64-bit version with sun is done via

~~~
$ vagrant provision --provision-with rbuild-sun64
~~~
   
## Tested Host Configurations

The following configurations have been reported as successful:
- Mac OS X 10.8.5, Packer 0.7.5, Vagrant 1.7.2, VirtualBox 4.3.26

## Troubleshooting

- `bootstrap.sh` fails with:
  
  ~~~
  ==> virtualbox-iso: ISO download failed.
  Build 'virtualbox-iso' errored: ISO download failed.
  ~~~

  Download Solaris 10 Image and place file under `packer/_dl`. (Re-read 'Getting Started')

- `provision.sh` fails with:

  ~~~
  ==> default: Running provisioner: solstudio (shell)...
  ==> default: bzcat: Can't open input file /vagrant/_dl/SolarisStudio12.3-solaris-x86-pkg.tar.bz2: No such file or directory.
  ~~~

  Download Solaris Studio Installer and place file under `vagrant/_dl`. (Re-read 'Getting Started')

- Even with a full tool stack (including Tex) we get warnings during configuration of R:

  ~~~
  configure: WARNING: you cannot build info or HTML versions of the R manuals
  configure: WARNING: I could not determine a browser
  configure: WARNING: I could not determine a PDF viewer
  ~~~
  These haven't been resolved yet, but do not seem to be problematic for development.

