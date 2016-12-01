#!/usr/bin/env python
#
# Simple script to get a bunch of CSV URLS
#

from bs4 import BeautifulSoup
import requests

page = requests.get("https://data.gov.uk/dataset/financial-transactions-data-dwp")
soup = BeautifulSoup(page.text, 'html.parser')

for link in soup.find_all('a'):
    href = link.get('href')
    if href.endswith(".csv"):
        print href
