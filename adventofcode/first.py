f = open("InputFirst.txt", "r")
content = f.read()
f.close

#print(len(content))

content = content.split(', ')
#print(len(content))

for i in content:
    print(i)
