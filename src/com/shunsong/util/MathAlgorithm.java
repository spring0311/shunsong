package com.shunsong.util;

import java.text.DecimalFormat;
import java.util.Arrays;

import com.jcraft.jsch.jce.Random;

/**
 * 数学算法（方差 标准差 中位数）
 * 
 * @author
 *
 */
public class MathAlgorithm {
	private final static double dmax = 999;// Double.MAX_VALUE;//Double类型的最大值，太大的double值，相乘会达到无穷大
	private final static double dmin = Double.MIN_VALUE;// Double类型的最小值
	private final static int n = 100;// 假设求取100个doubl数的方差和标准差

	public static void main(String[] args) {
		/*
		 * Random random = new Random(); double[] x = new double[n];
		 * 
		 * for (int i = 0; i < n; i++) {// 随机生成n个double数 x[i] =
		 * Double.valueOf(Math.floor(random.nextDouble() * (dmax - dmin)));
		 * System.out.println(x[i]); }
		 * 
		 * // 设置doubl字符串输出格式，不以科学计数法输出 DecimalFormat df = new
		 * DecimalFormat("#,##0.00");// 格式化设置 // 计算方差 double dV = Variance(x);
		 * System.out.println("方差=" + df.format(dV)); // 计算标准差 double dS =
		 * StandardDiviation(x); System.out.println("标准差=" + df.format(dS));
		 */

		double[] intArr = { 5.2, 10.3, 15.2, 8.7, 6.6 };
		System.out.println(Arrays.toString(intArr) + " 中位数:" + median(intArr));

		double[] intArr2 = { 5.2, 10.2, 15.4, 8.8, 6.9, 9.834 };
		System.out.println(Arrays.toString(intArr2) + " 中位数:" + median(intArr2));
	}

	/**
	 * 方差s^2=[(x1-x)^2 +...(xn-x)^2]/n
	 * 
	 * @param x
	 * @return
	 */
	public static double Variance(double[] x) {
		int m = x.length;
		double sum = 0;
		for (int i = 0; i < m; i++) {// 求和
			sum += x[i];
		}
		double dAve = sum / m;// 求平均值
		double dVar = 0;
		for (int i = 0; i < m; i++) {// 求方差
			dVar += (x[i] - dAve) * (x[i] - dAve);
		}
		return dVar / m;
	}

	/**
	 * 标准差σ=sqrt(s^2)
	 * 
	 * @param x
	 * @return
	 */
	public static double StandardDiviation(double[] x) {
		int m = x.length;
		double sum = 0;
		for (int i = 0; i < m; i++) {// 求和
			sum += x[i];
		}
		double dAve = sum / m;// 求平均值
		double dVar = 0;
		for (int i = 0; i < m; i++) {// 求方差
			dVar += (x[i] - dAve) * (x[i] - dAve);
		}
		return Math.sqrt(dVar / m);
	}

	/**
	 * 中位数
	 * 
	 * @param nums: A list of integers.
	 * @return: An integer denotes the middle number of the array.
	 */
	public static int median(int[] nums) {
		if (nums.length == 0)
			return 0;
		int start = 0;
		int end = nums.length - 1;
		int index = partition(nums, start, end);
		if (nums.length % 2 == 0) {
			while (index != nums.length / 2 - 1) {
				if (index > nums.length / 2 - 1) {
					index = partition(nums, start, index - 1);
				} else {
					index = partition(nums, index + 1, end);
				}
			}
		} else {
			while (index != nums.length / 2) {
				if (index > nums.length / 2) {
					index = partition(nums, start, index - 1);
				} else {
					index = partition(nums, index + 1, end);
				}
			}
		}
		return nums[index];
	}

	private static int partition(int nums[], int start, int end) {
		int left = start;
		int right = end;
		int pivot = nums[left];
		while (left < right) {
			while (left < right && nums[right] >= pivot) {
				right--;
			}
			if (left < right) {
				nums[left] = nums[right];
				left++;
			}
			while (left < right && nums[left] <= pivot) {
				left++;
			}
			if (left < right) {
				nums[right] = nums[left];
				right--;
			}
		}
		nums[left] = pivot;
		return left;
	}
	
	/**
	 * 中位数
	 * 
	 * @param nums: A list of integers.
	 * @return: An integer denotes the middle number of the array.
	 */
	public static double median(double[] nums) {
		if (nums.length == 0)
			return 0;
		int start = 0;
		int end = nums.length - 1;
		int index = partition(nums, start, end);
		if (nums.length % 2 == 0) {
			while (index != nums.length / 2 - 1) {
				if (index > nums.length / 2 - 1) {
					index = partition(nums, start, index - 1);
				} else {
					index = partition(nums, index + 1, end);
				}
			}
		} else {
			while (index != nums.length / 2) {
				if (index > nums.length / 2) {
					index = partition(nums, start, index - 1);
				} else {
					index = partition(nums, index + 1, end);
				}
			}
		}
		return nums[index];
	}

	private static int partition(double nums[], int start, int end) {
		int left = start;
		int right = end;
		double pivot = nums[left];
		while (left < right) {
			while (left < right && nums[right] >= pivot) {
				right--;
			}
			if (left < right) {
				nums[left] = nums[right];
				left++;
			}
			while (left < right && nums[left] <= pivot) {
				left++;
			}
			if (left < right) {
				nums[right] = nums[left];
				right--;
			}
		}
		nums[left] = pivot;
		return left;
	}

}
