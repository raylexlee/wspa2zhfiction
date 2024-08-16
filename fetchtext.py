#!/usr/bin/python3
import sys
import os
from selenium import webdriver
from selenium.webdriver.edge.service import Service
from selenium.webdriver.edge.options import Options
from selenium.webdriver.common.by import By

# 確保提供了 URL 參數
if len(sys.argv) != 2:
    print("Usage: ./fetchtext.py <URL>")
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

# 提取頁面文本
body_text = driver.find_element(By.TAG_NAME, 'body').text
print(body_text)

driver.quit()

