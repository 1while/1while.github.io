---
title: "连续子数组最大和"
date: 2022-02-08T22:58:37+08:00
draft: true
---


## 题目描述
给定一个长度为 n n\ n 的数组，数组中的数为整数。
请你选择一个非空连续子数组，使该子数组所有数之和尽可能大。求这个最大值。

## 输入描述
第一行为一个正整数 n n\ n ，代表数组的长度。 $1≤n≤2∗1051\leq n \leq2*10^51≤n≤2∗105$
第二行为 n n\ n 个整数 $aia_iai$​，用空格隔开，代表数组中的每一个数。 ∣ai∣≤102|a_i| \leq 10^2∣ai​∣≤102


## 输出描述
连续子数组的最大之和。

## 解题
### 1. 一般思路, 完全遍历所有字数组, 时间复杂度n^3
```c
int maxSubArray(int* nums, int numsSize){
  int maxSub = nums[0];
  for(int i=0; i<numsSize; i++){
    for(int j=i; j<numsSize; j++){
      int sum = nums[i];
      for(int k=i+1; k<=j; k++){
        sum += nums[k];
      }
      maxSub = maxSub<sum ? sum: maxSub;
    }
  }
  return maxSub;
}
```

### 2. 动态规划, 时间复杂度n
* f(i) 代表以第 i 个数结尾的连续子数组的最大和
* f(i) = max{f(i-1) + nums[i], nums[i]}
n个数可以简化为两个数, n1和n2, 若n1大于0, n1+n2是有可能更大的, 若n1小于0, 则肯定会更小, 所以需要从n2开始重新累加子数组的和
扩展到3个数, 当n1+n2>0, 但n1+n2+n3<0, 对于n3之前的子数组[n1, n2], 如果n1<0, 则一开始就被丢弃了, maxSum已经记录n1, n1+n2, 且max(n1, n1+n2)>n2, 也就不用单独回头遍历计算子数组[n2]了, 这里n1, n2可以扩展为任意长度连续子数组
```c
int maxSubArray(int* nums, int numsSize){
  int sum = nums[0];
  int max = nums[0];
  for(int i=1; i<numsSize; i++) {
    sum = sum>0 ? sum+nums[i] : nums[i];
    max = max<sum ? sum: max;
  }
  return max;
}
```

### 3. 分治法
```c
#define MAX(a,b) ((a)>(b)?a:b)

typedef struct Status{
    int lmax; // 左端点为起点的最大子数组和
    int rmax; // 右端点为终点的最大子数组和
    int max; // 最大子数组和
    int sum; // 当前数组和
}status;

status maxSub(int* nums, int begin, int end){
    if(begin==end) {
        return (status){nums[begin], nums[begin], nums[begin], nums[begin]};
    }
    int mid = (begin+end)/2;
    status larr = maxSub(nums, begin, mid);
    status rarr = maxSub(nums, mid+1, end);
    status marr;
    marr.lmax = MAX(larr.lmax, larr.sum+rarr.lmax);
    marr.rmax = MAX(rarr.rmax, rarr.sum+larr.rmax);
    marr.sum = larr.sum + rarr.sum;
    marr.max = MAX(MAX(larr.max, rarr.max), larr.rmax+rarr.lmax);
    return marr;
}

int maxSubArray(int* nums, int numsSize){
    return maxSub(nums, 0, numsSize-1).max;
}
```
