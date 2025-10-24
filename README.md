This is the code of the paper Kernel-Bounded Clustering: Achieving the Objective of Spectral Clustering without Eigendecomposition




# Dependencies
---

```bash
MATLAB R2023a
Python: pip install kbc-clustering
```




# Usage
---
Matlab: 
*codes/demo_nss_kbc.m* gives an example of clustering using $NSS$-KBC, and *codes/EC_sample.m* implements the $NSS$-KBC algorithm.

---
```python
from kbc import KBC
import numpy as np

X = np.random.rand(1000, 50)
model = KBC(k=5, tau=0.4, psi=64, random_state=42)
labels = model.fit_predict(X)
```


# License
---
License.


# Reference
---
Hang Zhang and Kai Ming Ting and Ye Zhu. [Kernel-Bounded Clustering: Achieving the Objective of Spectral Clustering without Eigendecomposition]([https://google.comninini](https://doi.org/10.1016/j.artint.2025.104440)). Artificial Intelligence.

```
@article{ZHANG2025104440,
title = {Kernel-Bounded Clustering: Achieving the Objective of Spectral Clustering without Eigendecomposition},
journal = {Artificial Intelligence},
pages = {104440},
year = {2025},
issn = {0004-3702},
doi = {https://doi.org/10.1016/j.artint.2025.104440},
url = {https://www.sciencedirect.com/science/article/pii/S0004370225001596},
author = {Hang Zhang and Kai Ming Ting and Ye Zhu},
```



