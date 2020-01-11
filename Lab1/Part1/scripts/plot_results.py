import seaborn as sns
import matplotlib.pyplot as plt

fig, ax = plt.subplots()

time = list()
program = list()
programs = ['phods', 'phods_optimized', 'phods_DSE', 'phods_DSE_rectangle']
for i in range(2, 6):
    name = 'results/results_' + str(i) + '.txt'
    with open(name, 'r') as f:
        for l in f.readlines():
            time.append(float(l))
            program.append(programs[i-2])


sns.boxplot(x=program, y=time, ax=ax)
plt.savefig('results/esults_boxplots.pdf')