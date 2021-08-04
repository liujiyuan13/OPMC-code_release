# One-pass Multi-view Clustering for Large-scale Data (OPMC)

Matalb implementation for ACM Multimedia paper:
- Jiyuan Liu, Xinwang Liu, Yuexiang Yang, Li Liu, Siqi Wang, Weixuan Liang and Jiangyong Shi: [One-pass Multi-view Clustering for Large-scale Data](https://liujiyuan13.github.io/pubs/OPMC.pdf), IEEE International Conference on Computer Vision, ICCV, 2021. (Accepted Jul. 2021) 

## Introduction
**Abstract**

Existing non-negative matrix factorization based multi-view clustering algorithms compute multiple coefficient matrices respect to different data views, and learn a common consensus concurrently. The final partition is always obtained from the consensus with classical clustering techniques, such as $k$-means. However, the non-negativity constraint prevents from obtaining a more discriminative embedding. Meanwhile, this two-step procedure fails to unify multi-view matrix factorization with partition generation closely, resulting in unpromising performance. Therefore, we propose an one-pass multi-view clustering algorithm by removing the non-negativity constraint and jointly optimize the aforementioned two steps. In this way, the generated partition can guide multi-view matrix factorization to produce more purposive coefficient matrix which, as a feedback, improves the quality of partition. To solve the resultant optimization problem, we design an alternate strategy which is guaranteed to be convergent theoretically. Moreover, the proposed algorithm is free of parameter and of linear complexity, making it practical in applications. In addition, the proposed algorithm is compared with recent advances in literature on benchmarks, demonstrating its effectiveness, superiority and efficiency.


## Citation

If you find our code useful, please cite:

	@inproceedings{conf/iccv/liuopmc21,
	  author    = {Jiyuan Liu and
	               Xinwang Liu and
	               Yuexiang Yang and
	               Li Liu and
	               Siqi Wang and
	               Weixuan Liang and
	               Jiangyong Shi},
	  title     = {One-pass Multi-view Clustering for Large-scale Data},
	  journal   = {IEEE International Conference on Computer Vision (ICCV)},
	  volume    = {},
	  pages     = {},
	  year      = {2021},
	  url       = {},
	  doi       = {}
	}

## More
- For more related researches, please visit my homepage: [https://liujiyuan13.github.io](https://liujiyuan13.github.io).
- For data and discussion, please message me: liujiyuan13@nudt.edu.cn
