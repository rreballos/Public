//
//  ViewController.h
//  SlidingUIView
//
//  Created by Puru Shukla on 10/02/13.
//  Copyright (c) 2013 YourCompany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *primaryView;
@property (strong, nonatomic) IBOutlet UIView *secondaryView;

- (IBAction)menuItemAction:(id)sender;


@end
