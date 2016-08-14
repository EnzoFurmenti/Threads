//
//  Student.h
//  Threads
//
//  Created by EnzoF on 14.08.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic,strong) NSString *firstName;

- (void)isRightResponse:(NSInteger) randomNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish;

- (id)initWithFirstName:(NSString*)firstName
           randomNumber:(NSInteger) randomNumber
             rangeStart:(NSInteger)rangeStart
            rangeFinish:(NSInteger)rangeFinish;

@end
