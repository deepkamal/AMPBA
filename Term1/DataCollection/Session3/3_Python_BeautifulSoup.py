#downloading a simple page
import requests
page = requests.get("http://dataquestio.github.io/web-scraping-pages/simple.html")
page
#print out the HTML content of the page using the content property:
page.content
#Parsing a page with BeautifulSoup
from bs4 import BeautifulSoup
soup = BeautifulSoup(page.content, 'html.parser')
#We can now print out the HTML content of the page, formatted nicely
print(soup.prettify())
#We can select all the elements at the top level of the page using the children property of soup.
list(soup.children)
#We can now select the html tag and its children by taking the third item in the list
html = list(soup.children)[2]
body = list(html.children)[3]
p = list(body.children)[1]
p.get_text()
#Finding all instances of a tag at once
soup = BeautifulSoup(page.content, 'html.parser')
soup.find_all('p')
#get text of the first p
soup.find_all('p')[0].get_text()
#find first p
soup.find('p')
#Searching for tags by class and id
page = requests.get("http://dataquestio.github.io/web-scraping-pages/ids_and_classes.html")
soup = BeautifulSoup(page.content, 'html.parser')
soup
soup.find_all('p', class_='outer-text')
soup.find_all(class_="outer-text")
soup.find_all(id="first")
#Using CSS Selectors
soup.select("div p")
soup.select("div p")[0].get_text()


import requests
from bs4 import BeautifulSoup

page = requests.get("http://forecast.weather.gov/MapClick.php?lat=37.7772&lon=-122.4168")
soup = BeautifulSoup(page.content, 'html.parser')
seven_day = soup.find(id="seven-day-forecast")
forecast_items = seven_day.find_all(class_="tombstone-container")
tonight = forecast_items[0]
print(tonight.prettify())

period = tonight.find(class_="period-name").get_text()
short_desc = tonight.find(class_="short-desc").get_text()
temp = tonight.find(class_="temp").get_text()

print(period)
print(short_desc)
print(temp)

img = tonight.find("img")
desc = img['title']

print(desc)

period_tags = seven_day.select(".tombstone-container .period-name")
periods = [pt.get_text().encode('utf-8').strip() for pt in period_tags]
periods

short_descs = [sd.get_text().encode('utf-8').strip() for sd in seven_day.select(".tombstone-container .short-desc")]
temps = [t.get_text().encode('utf-8').strip() for t in seven_day.select(".tombstone-container .temp")]
descs = [d["title"].encode('utf-8').strip() for d in seven_day.select(".tombstone-container img")]

print(short_descs)
print(temps)
print(descs)

rows = zip(periods, short_descs, temps, descs)
import csv

with open("weather.csv", "w") as f:
    writer = csv.writer(f)
    for row in rows:
        writer.writerow(row)
