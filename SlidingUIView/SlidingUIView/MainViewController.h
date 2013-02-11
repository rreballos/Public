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

@property (strong, nonatomic) IBOutlet MKMapView *mkMapView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
