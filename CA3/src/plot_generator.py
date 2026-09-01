import numpy as np
import matplotlib.pyplot as plt

def parse_hspice_file(filename):

    raw_data = []
    with open(filename, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith('$') or line.startswith('.') or line.startswith('index'):
                continue
            
            parts = line.split()
            if len(parts) > 1:
                try:
                    row_values = [float(p) for p in parts]
                    raw_data.append(row_values)
                except ValueError:
                    continue
    return np.array(raw_data)

mc0_data = parse_hspice_file('monte_carlo_sim.mc0')
dev_values = mc0_data[:, 1] 
sigma = 0.1
vdd_nominal = 1.0
vdd_values = vdd_nominal + (dev_values * sigma)

mt0_data = parse_hspice_file('monte_carlo_sim.mt0')
tpd_max_values = mt0_data[:, 3] 
p_dyn_values = np.abs(mt0_data[:, 6]) 

fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(14, 5))

ax1.scatter(vdd_values, p_dyn_values * 1e6, color="#0f4064", edgecolor='k', alpha=0.7)
ax1.set_title('Dynamic Power vs. $V_{DD}$', fontsize=12, fontweight='bold')
ax1.set_xlabel('$V_{DD}$ (V)', fontsize=10)
ax1.set_ylabel('Dynamic Power ($\mu$W)', fontsize=10)
ax1.grid(True, linestyle='--', alpha=0.5)

ax2.scatter(vdd_values, tpd_max_values * 1e9, color="#740e0e", edgecolor='k', alpha=0.7)
ax2.set_title('Critical Path Delay vs. $V_{DD}$', fontsize=12, fontweight='bold')
ax2.set_xlabel('$V_{DD}$ (V)', fontsize=10)
ax2.set_ylabel('Max Delay (ns)', fontsize=10)
ax2.grid(True, linestyle='--', alpha=0.5)

plt.tight_layout()
plt.savefig('scatter_plots.png', dpi=300)
plt.show()

fig, (ax3, ax4) = plt.subplots(1, 2, figsize=(14, 5))

ax3.hist(p_dyn_values * 1e6, bins=15, color="#7cc87c", edgecolor='black', alpha=0.7)
ax3.set_title('Dynamic Power Distribution Histogram', fontsize=12, fontweight='bold')
ax3.set_xlabel('Dynamic Power ($\mu$W)', fontsize=10)
ax3.set_ylabel('Frequency', fontsize=10)
ax3.grid(axis='y', linestyle='--', alpha=0.5)

ax4.hist(tpd_max_values * 1e9, bins=15, color="#eda86b", edgecolor='black', alpha=0.7)
ax4.set_title('Delay Distribution Histogram', fontsize=12, fontweight='bold')
ax4.set_xlabel('Max Delay (ns)', fontsize=10)
ax4.set_ylabel('Frequency', fontsize=10)
ax4.grid(axis='y', linestyle='--', alpha=0.5)

plt.tight_layout()
plt.savefig('histograms.png', dpi=300)
plt.show()