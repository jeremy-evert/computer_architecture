import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
ax.plot([0,1,2,3],[0,1,4,9],marker='o')
ax.set(title='Computer Architecture Python Readiness',xlabel='Input',ylabel='Input squared')
fig.tight_layout()
fig.savefig(r'D:\git\computer_architecture\readiness\raw\2026-08-27_10-47-51\01-Test-PythonCapability\matplotlib-smoke-test.png')
print(matplotlib.__version__)
