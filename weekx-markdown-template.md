




# Results {.tabset .tabset-fade }


## {} {.tabset .tabset-fade }

The data shows the following concerns based on histogram comparisons:

```{r, echo=FALSE}
#htmltools::includeHTML('./{}/html/concerns.html')
```

<br>

### Dataset Summary

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/summary.html')
```
  
### Probes {.tabset .tabset-fade}

#### Jank {.tabset .tabset-fade .tabset-pills}

##### GC_MAX_PAUSE_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/GC_MAX_PAUSE_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/GC_MAX_PAUSE_MS.html')
```

##### CYCLE_COLLECTOR_MAX_PAUSE {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/CYCLE_COLLECTOR_MAX_PAUSE.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/CYCLE_COLLECTOR_MAX_PAUSE.html')
```

##### INPUT_EVENT_RESPONSE_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/INPUT_EVENT_RESPONSE_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/INPUT_EVENT_RESPONSE_MS.html')
```

#### Tab Switching {.tabset .tabset-fade .tabset-pills}

##### FX_PAGE_LOAD_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_PAGE_LOAD_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_PAGE_LOAD_MS.html')
```


##### FX_TAB_REMOTE_NAVIGATION_DELAY_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_REMOTE_NAVIGATION_DELAY_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_REMOTE_NAVIGATION_DELAY_MS.html')
```

##### FX_TAB_SWITCH_SPINNER_VISIBLE_LONG_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_SPINNER_VISIBLE_LONG_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_SPINNER_VISIBLE_LONG_MS.html')
```

##### FX_TAB_SWITCH_SPINNER_VISIBLE_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_SPINNER_VISIBLE_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_SPINNER_VISIBLE_MS.html')
```
##### FX_TAB_SWITCH_TOTAL_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_TOTAL_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_TOTAL_MS.html')
```

##### FX_TAB_SWITCH_UPDATE_MS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_UPDATE_MS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/FX_TAB_SWITCH_UPDATE_MS.html')
```

#### Memory Usage {.tabset .tabset-fade .tabset-pills}

##### MEMORY_DISTRIBUTION_AMONG_CONTENT {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/MEMORY_DISTRIBUTION_AMONG_CONTENT.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/MEMORY_DISTRIBUTION_AMONG_CONTENT.html')
```

##### MEMORY_TOTAL {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/MEMORY_TOTAL.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/MEMORY_TOTAL.html')
```

##### MEMORY_VSIZE_MAX_CONTIGUOUS {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/MEMORY_VSIZE_MAX_CONTIGUOUS.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/MEMORY_VSIZE_MAX_CONTIGUOUS.html')
```
#### Slow Scripts {.tabset .tabset-fade .tabset-pills}

##### SLOW_SCRIPT_NOTICE_COUNT {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/SLOW_SCRIPT_NOTICE_COUNT.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/SLOW_SCRIPT_NOTICE_COUNT.html')
```

##### SLOW_SCRIPT_PAGE_COUNT {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/SLOW_SCRIPT_PAGE_COUNT.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/SLOW_SCRIPT_PAGE_COUNT.html')
```

##### SLOW_SCRIPT_NOTIFY_DELAY {.tabset .tabset-fade}

###### 1-3 Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/SLOW_SCRIPT_NOTIFY_DELAY.html')
```

###### 4+ Tabs

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/SLOW_SCRIPT_NOTIFY_DELAY.html')
```

### Stacks {.tabset .tabset-fade .tabset-pills}

<br>

Here we look for major stack differences between cohorts. The stacks are sorted by frequency in the left most column which corresponds to the selected tab. For example, in the `webextensions-multiBucket1` tab, the left most column are the top 25 most occuring stacks in that cohort. The percentages for the other cohorts are included for comparison. For each row, if a cell in the left most column is noticeably darker than cells to its right, then that cohort may have a hangs issue. 

<br>


#### webextensions-multiBucket1
```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/wm1.html')
```

#### webextensions-multiBucket4

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/wm4.html')
```

#### MultiBucket1

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/m1.html')
```


#### MultiBucket4

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/m4.html')
```

#### MPC1

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/mpc1.html')
```

#### MPC4

```{r, echo=FALSE}
htmltools::includeHTML('./{}/html/mpc4.html')
```
