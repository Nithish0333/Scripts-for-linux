import os

path="/home"

for root, dirs, files in os.walk(path):
    for file in files:
        if file.endswith(".txt"):
            print(os.path.join(root,file))
