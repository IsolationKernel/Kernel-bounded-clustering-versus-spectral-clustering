This is the code of the paper [Kernel-Bounded Clustering: Achieving the Objective of Spectral Clustering without Eigendecomposition](https://github.com/IsolationKernel/.github/blob/main/profile/PDF/KBCAIJ2025.pdf)


## Paper
#  [![Journal](https://img.shields.io/badge/Journal-AIJ-blue.svg)](https://www.sciencedirect.com/science/article/pii/S0004370225001596)       [![PDF](https://img.shields.io/badge/PDF-KBCAIJ2025-red.svg)](https://github.com/IsolationKernel/.github/blob/main/profile/PDF/KBCAIJ2025.pdf) 
# Dependencies
---
Python [![Pypi](https://img.shields.io/badge/Pypi-blue.svg)](https://pypi.org/project/kbc-clustering/)
```bash
Python: pip install kbc-clustering
```




# Usage
---
```python
from kbc import KBC
import numpy as np

X = np.random.rand(1000, 50)
model = KBC(k=5, tau=0.4, psi=64, random_state=42)
labels = model.fit_predict(X)
```

---
MATLAB R2023a: 
*codes/demo_nss_kbc.m* gives an example of clustering using $NSS$-KBC, and *codes/EC_sample.m* implements the $NSS$-KBC algorithm.


# License
---
License.


# Reference
---
Hang Zhang and Kai Ming Ting and Ye Zhu. [Kernel-Bounded Clustering: Achieving the Objective of Spectral Clustering without Eigendecomposition]([https://google.comninini](https://doi.org/10.1016/j.artint.2025.104440)). Artificial Intelligence.

```
@article{zhang2025kernel,
  title={Kernel-Bounded Clustering: Achieving the Objective of Spectral Clustering without Eigendecomposition},
  author={Zhang, Hang and Ting, Kai Ming and Zhu, Ye},
  journal={Artificial Intelligence},
  pages={104440},
  year={2025},
  publisher={Elsevier}
}
```



