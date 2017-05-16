




# Results {.tabset .tabset-fade }


## {} {.tabset .tabset-fade }

The data shows the following concerns based on histogram comparisons:

```{r, echo=FALSE}
#htmltools::includeHTML('./data/{}/concerns.html')
```

<br>

### Dataset Summary

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/summary.html')
```
  
### Probes {.tabset .tabset-fade}

#### Jank {.tabset .tabset-fade .tabset-pills}

##### GC_MAX_PAUSE_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/GC_MAX_PAUSE_MS.html')
```

##### CYCLE_COLLECTOR_MAX_PAUSE

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/CYCLE_COLLECTOR_MAX_PAUSE.html')
```

##### INPUT_EVENT_RESPONSE_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/INPUT_EVENT_RESPONSE_MS.html')
```

#### Tab Switching {.tabset .tabset-fade .tabset-pills}

##### FX_PAGE_LOAD_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/FX_PAGE_LOAD_MS.html')
```


##### FX_TAB_REMOTE_NAVIGATION_DELAY_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/FX_TAB_REMOTE_NAVIGATION_DELAY_MS.html')
```

##### FX_TAB_SWITCH_SPINNER_VISIBLE_LONG_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/FX_TAB_SWITCH_SPINNER_VISIBLE_LONG_MS.html')
```

##### FX_TAB_SWITCH_SPINNER_VISIBLE_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/FX_TAB_SWITCH_SPINNER_VISIBLE_MS.html')
```

##### FX_TAB_SWITCH_TOTAL_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/FX_TAB_SWITCH_TOTAL_MS.html')
```

##### FX_TAB_SWITCH_UPDATE_MS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/FX_TAB_SWITCH_UPDATE_MS.html')
```

#### Memory Usage {.tabset .tabset-fade .tabset-pills}

##### MEMORY_DISTRIBUTION_AMONG_CONTENT

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/MEMORY_DISTRIBUTION_AMONG_CONTENT.html')
```

##### MEMORY_TOTAL

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/MEMORY_TOTAL.html')
```

##### MEMORY_VSIZE_MAX_CONTIGUOUS

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/MEMORY_VSIZE_MAX_CONTIGUOUS.html')
```

#### Slow Scripts {.tabset .tabset-fade .tabset-pills}

##### SLOW_SCRIPT_NOTICE_COUNT

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/SLOW_SCRIPT_NOTICE_COUNT.html')
```

##### SLOW_SCRIPT_PAGE_COUNT

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/SLOW_SCRIPT_PAGE_COUNT.html')
```

##### SLOW_SCRIPT_NOTIFY_DELAY

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/SLOW_SCRIPT_NOTIFY_DELAY.html')
```


### Stacks {.tabset .tabset-fade .tabset-pills}

<br>

Here we look for major stack differences between cohorts. The stacks are sorted by frequency in the left most column which corresponds to the selected tab. For example, in the `webextensions-multiBucket1` tab, the left most column are the top 25 most occuring stacks in that cohort. The percentages for the other cohorts are included for comparison. For each row, if a cell in the left most column is noticeably darker than cells to its right, then that cohort may have a hangs issue. 

<br>


#### webextensions-multiBucket1
```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/wm1.html')
```

#### webextensions-multiBucket4

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/wm4.html')
```

#### MultiBucket1

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/m1.html')
```


#### MultiBucket4

```{r, echo=FALSE}
htmltools::includeHTML('./data/{}/m4.html')
```