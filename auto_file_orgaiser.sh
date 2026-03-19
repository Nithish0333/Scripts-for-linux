import os
import shutil

source = "/home/user/Downloads"

for file in os.listdir(source):
    if file.endswith(".jpg"):
        os.makedirs(source + "/Images", exist_ok=True)
        shutil.move(source + "/" + file, source + "/Images/" + file)

    elif file.endswith(".pdf"):
        os.makedirs(source + "/PDFs", exist_ok=True)
        shutil.move(source + "/" + file, source + "/PDFs/" + file)
