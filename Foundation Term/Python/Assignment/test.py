import re
import string
print(re.sub("|\\".join((string.punctuation)),'',open("string.txt", 'r').read()))
# print(pattern.sub(lambda m: string.punctuation[re.escape(m.group(0))], open("string.txt", 'r').read()))
#
# def find_position(line):
#     regex = r"[.?!]+"
#     print(line)
#     match = re.search(regex, line)
#     print(match.start())
#     return match
#
#
# f = open("string.txt", 'r')
#
# for line in f:
#     while line:
#         # Find pos of punchuation
#         match = find_position(line)
#         if (match.group() == '.'):
#             pos = match.start()
# f.close()
