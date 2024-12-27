import csv

# Convert csv to expected pixel values
values = []
with open("display/result.csv", mode='r') as file:
  csvFile = csv.reader(file)
  for lines in csvFile:
      for el in lines:
          if el != '':
              values.append([int(el)])
              
with open('data/expected.dat', 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerows(values)