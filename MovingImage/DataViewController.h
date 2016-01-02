//
//  DataViewController.h
//  MovingImage
//
//  Created by Joachim Valdez on 1/1/16.
//  Copyright © 2016 Joachim Valdez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@property (strong, nonatomic) UIImageView *imageView;

@end

