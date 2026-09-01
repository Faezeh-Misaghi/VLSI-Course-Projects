import matplotlib.pyplot as plt
import numpy as np

sizes = ['2.5', '3.0', '3.5', '4.0', '4.5', '5.5', '6.0', '6.5', '7.0', '7.5']

total_power_watts = [
    5.501e-04,
    5.527e-04,
    5.570e-04,
    5.616e-04,
    5.666e-04,
    5.783e-04,
    5.842e-04,
    5.904e-04,
    5.967e-04,
    6.032e-04 
]

static_power_watts = [
    3.924e-04, 
    3.941e-04, 
    3.957e-04, 
    3.973e-04,
    3.989e-04,
    4.022e-04, 
    4.038e-04, 
    4.055e-04, 
    4.071e-04, 
    4.087e-04  
]



total_power_uW = [p * 1e6 for p in total_power_watts]
static_power_uW = [p * 1e6 for p in static_power_watts]

x = np.arange(len(sizes))
width = 0.35 

fig, ax = plt.subplots(figsize=(12, 7))
rects1 = ax.bar(x - width/2, total_power_uW, width, label='Total Power (Dynamic + Static)', color='royalblue')
rects2 = ax.bar(x + width/2, static_power_uW, width, label='Static Power (Leakage)', color='lightcoral')

ax.set_ylabel('Power (µW)', fontsize=14)
ax.set_xlabel('NOR3 Gate Size', fontsize=14)
ax.set_title('Total Power vs. Static Power Comparison', fontsize=16)
ax.set_xticks(x)
ax.set_xticklabels(sizes, fontsize=12)
ax.legend(fontsize=12)

ax.bar_label(rects1, padding=3, fmt='%.1f')
ax.bar_label(rects2, padding=3, fmt='%.1f')

fig.tight_layout()
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.show()
