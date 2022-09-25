from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
import sys

PATH="C:\Program Files (x86)\chromedriver.exe"
def getLogfile(filename, link):
  driver = webdriver.Chrome(PATH)
  driver.get(link)
  body = driver.find_element(By.TAG_NAME, "body")
  input("Press Enter to get "+filename)
  innerText = body.get_property('innerText')
  f = open(filename, "w", encoding='utf-8')
  f.write(innerText)
  f.close()
  driver.close()

if __name__ == "__main__":
    a = sys.argv[1]
    b = sys.argv[2]
    getLogfile(a, b)  