//
//  DataViewController.m
//  MovingImage
//
//  Created by Joachim Valdez on 1/1/16.
//  Copyright © 2016 Joachim Valdez. All rights reserved.
//

#import "DataViewController.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // TODO: I think there's a cleaner way to do this than having to call pathForResource
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    // Load image
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"dirk"
                                                         ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];

    
    // Load image view
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:screenRect];
    myImageView.contentMode = UIViewContentModeScaleAspectFill;
    [myImageView setImage:image];
    [self.view addSubview:myImageView];
    [self.view sendSubviewToBack:myImageView];
    CGFloat sx = myImageView.frame.size.width / image.size.width;
    CGFloat sy = myImageView.frame.size.height / image.size.height;
    CGFloat resizedImageScale = fmaxf(sx, sy);
    
    // Add animation to image view
    // This code only works if sy > sx i.e. resizedImageSize.height is about equal to screenHeight
    CGSize resizedImageSize = CGSizeMake(resizedImageScale * image.size.width,
                                         resizedImageScale * image.size.height);
    if (sy > sx) {
        // Start so image's left edge is touching the left side of the screen
        myImageView.frame = CGRectMake((resizedImageSize.width - myImageView.frame.size.width) / 2,
                                       0.0,
                                       myImageView.frame.size.width,
                                       myImageView.frame.size.height);
        // Move image to the left until the right edge of the image is touching the right side of
        // the screen, then reverse and repeat
        [UIView animateWithDuration:45.0f
                                  delay:0.0f
                                options:UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                             animations:^{
                                 [myImageView setFrame:CGRectMake((myImageView.frame.size.width - resizedImageSize.width) / 2, 0.0f, screenWidth, screenHeight)];
                             }
                             completion:nil];
    }

    self.view.clipsToBounds = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];

}

@end
