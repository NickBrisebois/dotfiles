from datetime import datetime

now = datetime.now().replace(microsecond=0)
date = datetime(2015, 12, 21, 12) #(year, month, day, hour)
delta = date-now;

print delta
