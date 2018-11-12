# AIPM

Artificial Intelligence Package Management is a 
powerful tool, which can help you to install models from
repo server, and run it locally.

With the help of AIPM, you don't need to care about the 
complex environment problem.




### Requirement

####Hardware:
- 20G or more space on disk
- 8G or more RAM

#### Software:
- Docker 18.06.1-ce or later ce version
- CentOS 7 or later stable version
- Git
- python3  (default) 

###Build instruction：
```
1. cd /home 
2. git clone https://github.com/Airzihao/AIPM.git
3. cd /home/AIPM/bin
4. bash aipm_install.sh 
5. source ~/.bashrc
```
Please build the AIPM as root user.

Because of the problems about path, we highly recommend you deployed the AIPM under /home. Don't worry that you will be able to uninstall it easily and thotoughly.

Depening on your network, the progress will take about 15mins, be patient and don't shut the cmd.

### Commands
```angular2html
# The following commands must be run under /home/AIPM/src
aipm install DogOrCat 0.0.1 #the version can be omitted 
aipm run DogOrCat /AIPM/data/images
```



