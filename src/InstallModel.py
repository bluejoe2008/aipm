import requests
import sys
import os
import configparser
sys.path.append(os.path.abspath('.'))
from GetModel import downloadModel

# read the repo config
cp = configparser.ConfigParser()
cp.read(os.path.abspath('..')+'/setting.conf')
repo_url = cp.get('repo','url');

# get the model name and version, default to be latest
model_name = sys.argv[1]
if( sys.argv[2] == 'default' or len(sys.argv) == 2 ):
    print("No version input, default to be latest.");
    version = "0.0.3";
else:
    version = sys.argv[2]


model_dir = repo_url + model_name +'/' + version # the model dir in the server system
model_url = model_dir + '/' + model_name + '.model'
dependency_url = model_dir + '/'+'dependency'
local_dependency_url = os.path.abspath('..')+"/model/"+model_name+'/'+version + '/dependency'

downloadModel(model_name,version, model_url);

# Download the dockerfile
r = requests.get(dependency_url)
if (r.status_code==404):
    exit("The resource doesn't exist, make sure your modelname and version are right.")
with open(local_dependency_url,"wb") as dependency:
    dependency.write(r.content)
