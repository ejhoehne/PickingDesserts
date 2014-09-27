//
//  EJHViewController.m
//  PickingDesserts
//
//  Created by Emily Hoehne on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "EJHViewController.h"

@interface EJHViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (nonatomic, strong) UILabel *label;

@end

@implementation EJHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 500)];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    [self.view addSubview:pickerView];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 80)];
    [self.view addSubview:self.label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - PickerView Datasource

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    self.label.text= [NSString stringWithFormat:@"%@ %@ %@",
                  [self data][0][[pickerView selectedRowInComponent:0]],
                  [self data][1][[pickerView selectedRowInComponent:1]],
                  [self data][2][[pickerView selectedRowInComponent:2]]];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
   return self.data[component][row];
}



#pragma mark - PickerView Delegate Methods

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
return [[self data][component] count];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
return self.data.count;
}


#pragma mark - Picker View Data Arrays

- (NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {
    
    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}

@end
