import matplotlib.pyplot as plt
import numpy as np
import csv

# Import pixel values from csv
values = []
with open("display/result.csv", mode='r') as file:
  csvFile = csv.reader(file)
  for lines in csvFile:
    vals = []
    for el in lines:
      if el != '':
        # Convert value to rgb
        if int(el) == 0:
          vals.append((0,0,0)) #black
        elif int(el) == 1:
          vals.append((130,0,0)) #light red
        elif int(el) == 2:
          vals.append((255,0,0)) #red
        elif int(el) == 3:
          vals.append((255,137,0)) #orange
        elif int(el) == 4:
          vals.append((255,255,0)) #yellow
        elif int(el) == 5:
          vals.append((0,255,0)) #green
        elif int(el) == 6:
          vals.append((255, 0, 255)) #purple
        elif int(el) == 7:
          vals.append((0, 0, 255)) #light blue
        else:
          vals.append((0,0,200)) #blue

    values.append(vals)

# Mirror the pixel values on the y-axis
mirrored_values = np.flipud(values)
for line in (mirrored_values):
  values.append(line)

# Display the array as an image
plt.imshow(values)
plt.savefig("display/mandelbrot_out.png")