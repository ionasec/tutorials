import pytz
import datetime
import time
from pytz import timezone
from datetime import datetime 


todays_date = datetime.now()

todays_date = datetime.now()
year = todays_date.year
mon = todays_date.month
day = todays_date.day
hour = todays_date.hour


print (str(year) + str(mon))
print (todays_date.strftime("%Y")+ todays_date.strftime("%m"))

test = 'On ' + str(todays_date)

print(test)
# to get hour from datetime
print('Year: ', todays_date.year)

# to get minute from datetime
print('Month: ', todays_date.month)

print('Day: ', todays_date.day)

print('Hour: ', todays_date.hour)


tz = timezone("US/Eastern")

print(tz)

utc = pytz.utc

print (utc)


my_date = datetime.strptime(my_string, "%Y-%m-%d-%h")

  

print (time.time())


