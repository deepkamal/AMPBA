#Imports regular expression,
# finds the SUM of a list of Numbers
# extracted from List of Numbers stored as String,
# which was obtained from a file by regex parsing
import re;
#print(sum([int(x) for x in re.findall('[0-9]+',open('regex_sum_42.txt').read())]))
c_name='Bolivia (Plurinational State of)'

print(re.sub('\(.+\)','',c_name)+".")