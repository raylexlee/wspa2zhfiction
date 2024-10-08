#!/usr/bin/env python3
import sys
import os
from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.edge.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# 確保提供了 URL 參數
if len(sys.argv) != 2:
    print("Usage: ./fetchlinks.py <URL>")
    sys.exit(1)

url = sys.argv[1]

# 獲取當前用戶的主目錄
home_dir = os.path.expanduser("~")
msedgedriver_path = os.path.join(home_dir, 'Downloads', 'msedgedriver')

# 設置無頭模式
options = Options()
options.add_argument("--headless")
service = Service(msedgedriver_path)

# 啟動瀏覽器
driver = webdriver.Edge(service=service, options=options)
driver.get(url)

# 等待頁面完全加載
WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.TAG_NAME, 'body')))

# 提取所有鏈接及其文本
links = driver.find_elements(By.TAG_NAME, 'a')
for link in links:
    text = driver.execute_script("return arguments[0].innerText.replace(/\\s+/g, '_');", link)
    href = link.get_attribute('href')
    print(f"{text} {href}")

driver.quit()

