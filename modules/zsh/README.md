# zsh

## Profiling startup time

Run zsh with `__zprof` environment variable set and zsh will run builtin profiler.

```bash
time __zprof=1 zsh -i -c exit
```

```bash
num  calls                time                       self            name
-----------------------------------------------------------------------------------
 1)    7          58.09     8.30   99.65%     34.12     4.87   58.52%  pmodload
 2)    1           5.92     5.92   10.15%      5.76     5.76    9.88%  _zsh_highlight_load_highlighters
 3)    1           4.93     4.93    8.45%      4.93     4.93    8.45%  fasd
 4)    1           3.42     3.42    5.87%      3.42     3.42    5.87%  _zsh_highlight_bind_widgets
 5)    2           2.98     1.49    5.11%      2.98     1.49    5.11%  promptinit
 6)    1           2.66     2.66    4.56%      2.66     2.66    4.56%  compinit
 7)    1           1.31     1.31    2.24%      1.31     1.31    2.24%  async_init
 8)   14           1.20     0.09    2.06%      1.20     0.09    2.06%  (anon)
 9)    2           1.91     0.96    3.28%      0.60     0.30    1.04%  async
10)   12           0.60     0.05    1.02%      0.60     0.05    1.02%  add-zsh-hook
11)    3           0.32     0.11    0.55%      0.32     0.11    0.55%  is-at-least
12)    2           2.26     1.13    3.88%      0.26     0.13    0.44%  prompt_sorin_setup
13)    1           2.52     2.52    4.32%      0.07     0.07    0.12%  set_prompt
14)    1           2.59     2.59    4.44%      0.07     0.07    0.12%  prompt

__zprof=1 zsh -i -c exit  0.05s user 0.04s system 90% cpu 0.095 total
```
