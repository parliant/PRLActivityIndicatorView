//
//  PRLViewAnimator.m
//  ParliantIntercom
//
//  Created by Kevin Hayes at Parliant on 2014-05-29.
//
//

#import "PRLViewAnimator.h"

@interface PRLViewAnimator ()
{
	NSUInteger _currentFrame;
	NSThread *_animationThread;
	NSObject <PRLViewAnimatorProtocol> *_view;
	BOOL _isAnimating;
}
@end

@implementation PRLViewAnimator
+ (instancetype)animatorForNumberOfFrames:(NSUInteger)numberOfFrames atRate:(float)frameRate repeating:(BOOL)repeating
{
	PRLViewAnimator *animator = [[self alloc] initForNumberOfFrames:numberOfFrames atRate:frameRate repeating:repeating];

	return animator;
}

- initForNumberOfFrames:(NSUInteger)numberOfFrames atRate:(float)frameRate repeating:(BOOL)repeating
{
	if (self = [super init])
	{
		self.repeating = repeating;
		self.numberOfFrames = numberOfFrames;
		self.frameRate = frameRate;
		_animationThread = nil;
	}
	return self;
}

- (void)startAnimationWithView:(NSObject<PRLViewAnimatorProtocol>*)view
{
	_view = view;
	_animationThread = [[NSThread alloc] initWithTarget:self selector:@selector(animationThread) object:nil];
	_isAnimating = YES;
	[_animationThread start];
}

- (void)animationThread
{
	_currentFrame = 0;

	do
	{
		if (self.repeating)
		{
			_currentFrame = _currentFrame % self.numberOfFrames;
		}
		[_view performSelectorOnMainThread:@selector(displayAnimationFrameNumber:) withObject:[NSNumber numberWithInteger:_currentFrame] waitUntilDone:NO];
		if (self.frameRate)
			usleep(1000000 / self.frameRate);
		_currentFrame++;
	} while ((![[NSThread currentThread] isCancelled]) || _currentFrame >= self.numberOfFrames);

	_isAnimating = NO;
}

- (void)stopAnimation
{
	_view = nil;
	if (_animationThread)
	{
		[_animationThread cancel];
		_animationThread = nil;
	}
}

- (void)dealloc
{
	[self stopAnimation];
}
@end
