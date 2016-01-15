vagrant up --no-provision

# Sun 32-bit R without TexLive [ approx. 16 minutes ]
vagrant provision --provision-with solstudio,rdev,rbuild-sun64

# No tex tools but all compile toolstack i.e. Sun and GCC, 32 and 64-bit R 
#vagrant provision --provision-with solstudio,gcc,rdev,rbuild-sun32,rbuild-sun64,rbuild-gcc32,rbuild-gcc64

# Full toolstack i.e. TexLive, Sun and GCC, 32 and 64-bit R [ approx. 5 hours and 10 minutes ]
#vagrant provision --provision-with solstudio,gcc,tex,rdev,rbuild-sun32,rbuild-sun64,rbuild-gcc32,rbuild-gcc64

