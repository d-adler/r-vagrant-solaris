ISO_DIR=$PWD/_dl
git clone -b r-dev https://github.com/d-adler/packer-vagrant-builder
cd packer-vagrant-builder
packer build -var "iso_location=${ISO_DIR}" -only=virtualbox-iso solaris10.json
vagrant box add --force --name sol10 build/solaris10-x86_64.box

