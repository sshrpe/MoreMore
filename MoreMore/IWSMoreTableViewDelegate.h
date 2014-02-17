//
//  IWSMoreTableViewDelegate.h
//  MoreMore
//
//  Created by Stuart Sharpe on 17/02/2014.
//  Copyright (c) 2014 sshrpe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWSMoreTableViewDelegate : NSObject <UITableViewDelegate>

- (instancetype)initWithForwardingDelegate:(id<UITableViewDelegate>)delegate;

@end
