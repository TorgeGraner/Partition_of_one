# Partition of one
Proof of concept of a ray-tracing idea for algebraic varieties in matlab, used in my bachelors thesis (mathematics).

## Rendering
Renders path-component $M$ of the manifold defined by $$\cos(x)+\cos(y)-z^2=1$$ near origin by scaling each point on the standard sphere by using Newtons method. Starts with some parameterization of the unit sphere. For each point $$p:=(x,y,z)\in S^1$$ approximate some $$r\in\mathbb{R}$$, such that $$r\cdot p\in M$$ by approximating a root of the function $$f_p(r):=\cos(rx)+\cos(ry)-z^2-1$$ using Newtons method, i.e. calculating some terms of the sequence defined by

$$r_{n+1}=r_n+\frac{\cos(r_nx)+\cos(r_ny)-(r_nz)^2-1}{x\sin(r_nx)+y\sin(r_ny)+2z^2r_n}\quad\text{with}\quad r_0:=\frac{\pi}{4}\quad(\text{arbitrary if small}).$$

## Coloring
The manifold ist colored corresponding to the sum of the magnitude of six smooth functions $\omega_k:M\to[0,1]$ with compact support, defined locally on one of six open subsets (top, bottom, front, back, left, right) covering $M$. At each point of $M$ at least one of these functions is non-zero. A smooth partition of one $(\vartheta_k)$ on $M$ can be obtained by setting

$$\vartheta_k:=\frac{\omega_k}{\sum_j\omega_j}.$$

![alt text](https://github.com/TorgeGraner/Partition_of_one/blob/main/manifold.PNG)
