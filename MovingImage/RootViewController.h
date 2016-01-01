//
//  RootViewController.h
//  MovingImage
//
//  Created by Joachim Valdez on 1/1/16.
//  Copyright © 2016 Joachim Valdez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end

