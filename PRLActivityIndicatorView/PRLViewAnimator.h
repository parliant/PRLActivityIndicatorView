//
//  PRLViewAnimator.h
//  ParliantIntercom
//
//  Created by Kevin Hayes Parliant on 2014-05-29.
//
//	This will call display on a view on a thread over and over in accordance with parameters
//	If the view conforms to the PRLViewAnimatorProtocol it is given a frame number to customize its drawing

#import <Foundation/Foundation.h>

/**
 Implement this protocol in your custom UIView or NSView to allow PRLViewAnimator to animate your view.
 */
@protocol PRLViewAnimatorProtocol <NSObject>
@required
- (void)displayAnimationFrameNumber:(NSNumber *)frameNumber; /** draws the specified frame of your animation */
@end

/**
 PRLViewAnimator will call displayAnimationFrameNumber on your custom view over and over in accordance with the given properties
 */
@interface PRLViewAnimator : NSObject
/** The number of frames of animation in the custom view. */
@property (nonatomic) NSUInteger numberOfFrames;

/** The desired frame rate (in frames per second) of the animation. */
@property (nonatomic) float frameRate;

/** If set to YES the animation will repeat. If no, it will run through the frames one time only and stop. */
@property (nonatomic) BOOL repeating;

/** returns a new instance of PRLViewAnimator 
 @param numberOfFrames the number of frames of animation contained by the custom view
 @param frameRate the number of frames to animate in one second
 @param repeating set YES to repeat the animation indefinitely
 @returns an instance of PRLViewAnimator
 */
+ (instancetype)animatorForNumberOfFrames:(NSUInteger)numberOfFrames atRate:(float)frameRate repeating:(BOOL)repeating;
//- initForNumberOfFrames:(NSUInteger)numberOfFrames atRate:(float)frameRate repeating:(BOOL)repeating;

/** start animating the view
 @param view the view to animate
 */
- (void)startAnimationWithView:(id<PRLViewAnimatorProtocol>)view;

/** stop animating the view */
- (void)stopAnimation;

@end
