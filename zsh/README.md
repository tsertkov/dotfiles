# zsh

## Profiling startup time

Run zsh with `__zprof` environment variable set and zsh will run builtin profiler.

```bash
time __zprof=1 zsh -i -c exit
```

```bash
num  calls                time                       self            name
-----------------------------------------------------------------------------------
 1)    7          76.34    10.91   99.79%     52.01     7.43   67.99%  pmodload
 2)    1           6.95     6.95    9.08%      6.78     6.78    8.87%  _zsh_highlight_load_highlighters
 3)    2           4.49     2.24    5.87%      4.49     2.24    5.87%  promptinit
 4)    1           3.39     3.39    4.43%      3.39     3.39    4.43%  _zsh_highlight_bind_widgets
 5)    1           3.36     3.36    4.39%      3.36     3.36    4.39%  compinit
 6)    1           2.03     2.03    2.66%      2.03     2.03    2.66%  async_init
 7)   14           1.94     0.14    2.54%      1.94     0.14    2.54%  (anon)
 8)   12           0.88     0.07    1.16%      0.88     0.07    1.16%  add-zsh-hook
 9)    2           2.78     1.39    3.63%      0.74     0.37    0.97%  async
10)    2           3.26     1.63    4.26%      0.34     0.17    0.44%  prompt_sorin_setup
11)    3           0.32     0.11    0.41%      0.32     0.11    0.41%  is-at-least
12)    1           3.72     3.72    4.86%      0.13     0.13    0.17%  set_prompt
13)    1           3.80     3.80    4.97%      0.08     0.08    0.11%  prompt

...

__zprof=1 zsh -i -c exit  0.07s user 0.06s system 94% cpu 0.133 total
```
