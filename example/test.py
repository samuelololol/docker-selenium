#!/usr/bin/env python
# -*- coding: utf-8 -*-
__date__ = 'Mar 25, 2017 '
__author__ = 'samuel'

from selenium import webdriver
# from pyvirtualdisplay import Display
from xvfbwrapper import Xvfb


def main():
    # display = Display(visible=0, size=(800, 600))
    # display.start()
    with Xvfb():
        chrome_options = webdriver.ChromeOptions()
        chrome_options.add_argument('--no-sandbox')
        driver = webdriver.Chrome('/app/chromedriver', chrome_options=chrome_options)
        driver.get('http://samuelololol.github.io')
        driver.save_screenshot('screenshot.png')
        driver.quit()
    # display.stop()


if __name__ == '__main__':
    main()
