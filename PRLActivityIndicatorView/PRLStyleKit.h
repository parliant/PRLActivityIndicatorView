//
//  PRLiOSPaintCodeStyleKit.h
//  PaintCode StyleKit for iOS
//
//  Created by Kevin Hayes on 2014-10-22.
//  Copyright (c) 2014 CompanyName. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface PRLiOSPaintCodeStyleKit : NSObject

// Drawing Methods
+ (void)drawSignalMeterWithSignalMeterColor: (UIColor*)signalMeterColor signalFrameSize: (CGSize)signalFrameSize animationFrame: (CGFloat)animationFrame;
+ (void)drawSignalErrorConditionWithTintColor: (UIColor*)tintColor signalFrameSize: (CGSize)signalFrameSize;
+ (void)drawSentSuccessWithTintColor: (UIColor*)tintColor signalFrameSize: (CGSize)signalFrameSize;

@end
