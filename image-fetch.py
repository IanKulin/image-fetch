# download an image from the internet
# then save it to the './data' directory in the current working directory

import requests
import os

url = ('https://www.google.com/images/branding/googlelogo/2x/'
       'googlelogo_color_272x92dp.png')
filepath = './data/google_logo.png'

# create the directory if it doesn't exist
os.makedirs(os.path.dirname(filepath), exist_ok=True)

response = requests.get(url)
with open(filepath, 'wb') as f:
    f.write(response.content)
    print('Image downloaded successfully.')
