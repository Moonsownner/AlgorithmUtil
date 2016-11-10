//
//  Maximum.swift
//  JUtil
//
//  Created by J HD on 2016/11/10.
//  Copyright © 2016年 J HD. All rights reserved.
//

import Foundation

public extension Array where Element: Comparable {
	
	/// 最大值
	public var maximum: Element?{
		var temp = self
		guard !isEmpty else {
			return nil
		}
		var minimum = temp.removeFirst()
		for element in temp {
			minimum = element < minimum ? element : minimum
		}
		return minimum
	}
	
	/// 最小值
	public var minimum: Element?{
		var temp = self
		guard !isEmpty else {
			return nil
		}
		
		var maximum = temp.removeFirst()
		for element in temp {
			maximum = element > maximum ? element : maximum
		}
		return maximum
	}
	
	/// 最小值+最大值
	public var minimumMaximum: (minimum: Element, maximum: Element)? {
		var temp = self
		guard !isEmpty else {
			return nil
		}
		
		var minimum = temp.first!
		var maximum = temp.first!
		
		let hasOddNumberOfItems = temp.count % 2 != 0
		if hasOddNumberOfItems {
			temp.removeFirst()
		}
		
		while !temp.isEmpty {
			let pair = (temp.removeFirst(), temp.removeFirst())
			if pair.0 > pair.1 {
				if pair.0 > maximum {
					maximum = pair.0
				}
				if pair.1 < minimum {
					minimum = pair.1
				}
			} else {
				if pair.1 > maximum {
					maximum = pair.1
				}
				if pair.0 < minimum {
					minimum = pair.0
				}
			}
		}
		
		return (minimum, maximum)
	}
	
}
