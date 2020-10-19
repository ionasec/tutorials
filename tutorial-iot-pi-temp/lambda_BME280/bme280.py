#!/usr/bin/python
#--------------------------------------
#    ___  ___  _ ____
#   / _ \/ _ \(_) __/__  __ __
#  / , _/ ___/ /\ \/ _ \/ // /
# /_/|_/_/  /_/___/ .__/\_, /
#                /_/   /___/
#
#           bme280.py
#  Read data from a digital pressure sensor.
#
#  Official datasheet available from :
#  https://www.bosch-sensortec.com/bst/products/all_products/bme280
#
# Author : Matt Hawkins
# Date   : 21/01/2018
#
# https://www.raspberrypi-spy.co.uk/
#
#--------------------------------------
import smbus
import time
import datetime

def readBME280():

#  (chip_id, chip_version) = readBME280ID()
#  print "Chip ID     :", chip_id
#  print "Version     :", chip_version

  temperature = 25
  newstring = "Time:"+str(datetime.datetime.now().isoformat())+ "," + "Temperature:"+str(temperature)
  print(newstring)
  return newstring
#  print "Temperature : ", temperature, "C"
#  print "Pressure : ", pressure, "hPa"
#  print "Humidity : ", humidity, "%"

#if __name__=="__main__":
#   readBME280()

if __name__=="__main__":
   readBME280()
   
   
