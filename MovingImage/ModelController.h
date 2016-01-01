//
//  ModelController.h
//  MovingImage
//
//  Created by Joachim Valdez on 1/1/16.
//  Copyright © 2016 Joachim Valdez. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;

@end

