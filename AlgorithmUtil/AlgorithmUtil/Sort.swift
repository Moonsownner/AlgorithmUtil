//
//  Sort.swift
//  JUtil
//
//  Created by J HD on 2016/11/10.
//  Copyright © 2016年 J HD. All rights reserved.
//

import Foundation

public extension Array {
	
	/// 冒泡排序从下往上
	///
	/// - Parameter isOrderedBefore: 排序方式
	/// - Returns: 返回一个新的Array
	public func mergeSortBottomUp(_ isOrderedBefore: (Element, Element) -> Bool) -> [Element] {
		let n = count
		var z = [self, self]		// 1
		var d = 0
		
		var width = 1
		while width < n {	// 2
			
			var i = 0
			while i < n {	// 3
				
				var j = i
				var l = i
				var r = i + width
				
				let lmax = Swift.min(l + width, n)
				let rmax = Swift.min(r + width, n)
				
				while l < lmax && r < rmax {
					if isOrderedBefore(z[d][l], z[d][r]){
						z[1 - d][j] = z[d][l]
						l += 1
					}
					else {
						z[1 - d][j] = z[d][r]
						r += 1
					}
					j += 1
				}
				
				while l < lmax {
					z[1 - d][j] = z[d][l]
					j += 1
					l += 1
				}
				while r < rmax {
					z[1 - d][j] = z[d][r]
					j += 1
					r += 1
				}
				i += width*2
			}
			width *= 2
			d = 1 - d
		}
		return z[d]
	}
	
}
