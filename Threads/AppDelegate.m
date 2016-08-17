//
//  AppDelegate.m
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Student.h"
#import "StudentOtherApproach.h"


static NSString *firstNames[] = {
    @"Милена",
    @"Инна",
    @"Богдан",
    @"Анатолий",
    @"Тимофей",
    @"Родион",
    @"Альбина",
    @"Семён",
    @"Глеб",
    @"Вячеслав",
    @"Алла",
    @"Василиса",
    @"Анжелика",
    @"Марат",
    @"Владислав",
    @"Ярослав",
    @"Маргарита",
    @"Матвей",
    @"Тимур",
    @"Виталий",
    @"Степан"
};
static int firstNameCount = 21;
@interface AppDelegate ()

@property (nonatomic,strong) NSMutableArray *mArrayAllStudents;
@property (nonatomic,strong) NSMutableArray *mArrayAllStudentsOtherAproach;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = [UIColor cyanColor];
    [self.window makeKeyAndVisible];
    ViewController *vc = [[ViewController alloc] init];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = navC;
    
    
    const int rangeStart = 0;
    const int rangeFinish = 1200000;
    const int guessNumber = rangeStart + arc4random() % rangeFinish;
    
    
    for (int i = 0; i < 5; i++)
    {
        if(!self.mArrayAllStudents)
        {
            self.mArrayAllStudents = [[NSMutableArray alloc]init];
        }
        NSString *firstName = firstNames[arc4random() % firstNameCount];
        
        
        Student *currentStudent =
        [[Student alloc]initWithFirstName:firstName
                              guessNumber:guessNumber
                               rangeStart:rangeStart
                              rangeFinish:rangeFinish
                               totalBlock:^(NSString *firstName,CGFloat timeInterval){
                                   NSLog(@"%@ - student Threads finished %f",firstName,timeInterval);
                               }];
        
        [self.mArrayAllStudents addObject:currentStudent];
    }
    
    for (int i = 0; i < 5; i++)
    {
        if(!self.mArrayAllStudentsOtherAproach)
        {
            self.mArrayAllStudentsOtherAproach = [[NSMutableArray alloc]init];
        }
        NSString *firstName = firstNames[arc4random() % firstNameCount];
        
        StudentOtherApproach *currentStudentOtherApproach =
        [[StudentOtherApproach alloc] initWithFirstName:firstName
                                            guessNumber:guessNumber
                                             rangeStart:rangeStart
                                            rangeFinish:rangeFinish
                                             totalBlock:^(NSString *firstName,CGFloat timeInterval){
                                                NSLog(@"%@ - student NSOperation finished %f",firstName,timeInterval);
                                             }];
        
        [self.mArrayAllStudentsOtherAproach addObject:currentStudentOtherApproach];
    }
    return YES;
}


@end
