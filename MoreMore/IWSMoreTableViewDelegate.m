//
//  IWSMoreTableViewDelegate.m
//  MoreMore
//
//  Created by Stuart Sharpe on 17/02/2014.
//  Copyright (c) 2014 sshrpe. All rights reserved.
//

#import "IWSMoreTableViewDelegate.h"

@interface IWSMoreTableViewDelegate ()

@property (nonatomic, strong) id<UITableViewDelegate> forwardingDelegate;

@end

@implementation IWSMoreTableViewDelegate

- (instancetype)initWithForwardingDelegate:(id<UITableViewDelegate>)delegate
{
    self = [super init];
    if (self) {
        self.forwardingDelegate = delegate;
    }
    return self;
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([[self class] instancesRespondToSelector:aSelector]) {
        return YES;
    }
    return [self.forwardingDelegate respondsToSelector:aSelector];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    return self.forwardingDelegate;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.forwardingDelegate respondsToSelector:_cmd]) {
        [self.forwardingDelegate tableView:tableView willDisplayCell:cell forRowAtIndexPath:indexPath];
    }
    
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor orangeColor];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir" size:18];
    
    cell.imageView.tintColor = [UIColor purpleColor];

    UIView *selectionBackground = [[UIView alloc] initWithFrame:cell.bounds];
    selectionBackground.backgroundColor = [UIColor greenColor];
    cell.selectedBackgroundView = selectionBackground;
    
}

@end
