//
//  Utils.h
//  InitialDesign
//
//  Created by Basem Elazzabi on 2/23/14.
//  Copyright (c) 2014 Azadi Sean Walsh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (UIImage*)scaleAndPreserveRatioForImage:(UIImage*)image
                                  toWidth:(float)width andHeight:(float) height;

@end
