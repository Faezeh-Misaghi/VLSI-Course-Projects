import numpy as np
import matplotlib.pyplot as plt
import os

temperatures = [15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90]

delay_vs_temp = []
power_vs_temp = []

base_filename = "temperature_sim"

def extract_measurements_from_file(filepath):
    data = []
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    for line in lines:
        parts = line.strip().split()

        if len(parts) < 4:
            continue

        numeric = True
        row = []

        for p in parts:
            try:
                row.append(float(p))
            except:
                numeric = False
                break

        if numeric:
            data.extend(row)

    return data if len(data) > 0 else None

for i in range(len(temperatures)):
    filename = f"{base_filename}.mt{i}"
    if os.path.exists(filename):
        row_data = extract_measurements_from_file(filename)
        if row_data is not None and len(row_data) >= 6:
            delay_vs_temp.append(row_data[2])
            power_vs_temp.append(abs(row_data[5]))
        else:
            delay_vs_temp.append(np.nan)
            power_vs_temp.append(np.nan)
    else:
        delay_vs_temp.append(np.nan)
        power_vs_temp.append(np.nan)


for i, val in enumerate(delay_vs_temp):
    print(i, val)

delay_vs_temp = np.array(delay_vs_temp)
power_vs_temp = np.array(power_vs_temp)

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))

ax1.plot(temperatures, delay_vs_temp * 1e9, marker='o', linewidth=2)
ax1.set_title('Critical Path Delay vs. Temperature')
ax1.set_xlabel('Temperature (°C)')
ax1.set_ylabel('Max Delay (ns)')
ax1.grid(True)

ax2.plot(temperatures, power_vs_temp * 1e6, marker='s', linewidth=2)
ax2.set_title('Dynamic Power vs. Temperature')
ax2.set_xlabel('Temperature (°C)')
ax2.set_ylabel(r'Dynamic Power ($\mu$W)')
ax2.grid(True)

plt.tight_layout()
plt.savefig('temperature_analysis.png', dpi=300)
plt.show()