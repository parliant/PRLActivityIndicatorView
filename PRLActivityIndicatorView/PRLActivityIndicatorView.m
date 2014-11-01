//
//  PRLActivityIndicatorView.h.m
//
//  Created by Kevin Hayes on 2014-09-25.
//  Copyright (c) 2014 Parliant. All rights reserved.
//

#import "PRLActivityIndicatorView.h"
#import "PRLStyleKit.h"

@interface PRLActivityIndicatorView()
{
	NSUInteger _animationFrame;
	PRLViewAnimator *_animator;
}
@end

@implementation PRLActivityIndicatorView

@synthesize status = _status;

- (void)postInit
{
	self.backgroundColor = [UIColor clearColor];
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self postInit];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self)
	{
		[self postInit];
	}
	return self;
}

- (void)setStatus:(PRLActivityIndicatorStatus)errorMode
{
	switch (errorMode)
	{
		case PRLActivityIndicatorStatusInProgress:
		{
			self.hidden = NO;
			[self startAnimation];
			break;
		}
		case PRLActivityIndicatorStatusError:
		{
			self.hidden = NO;
			[self stopAnimation];
			break;
		}
		case PRLActivityIndicatorStatusSuccess:
		{
			self.hidden = NO;
			[self stopAnimation];
			break;
		}
		case PRLActivityIndicatorStatusNoError:
		{
			[self stopAnimation];
			self.hidden = YES;
			break;
		}
	}
	if (errorMode == PRLActivityIndicatorStatusInProgress)
	{
		[self startAnimation];
	}
	if (errorMode != PRLActivityIndicatorStatusInProgress)
	{
		[self stopAnimation];
	}
	if (errorMode != PRLActivityIndicatorStatusNoError)
	{
		self.hidden = NO;
	}
	_status = errorMode;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
#if TARGET_INTERFACE_BUILDER
	[PRLiOSPaintCodeStyleKit drawSignalMeterWithSignalMeterColor:self.tintColor signalFrameSize:rect.size animationFrame:0];
#endif
	switch (self.status)
	{
		case PRLActivityIndicatorStatusInProgress:
		{
			[PRLiOSPaintCodeStyleKit drawSignalMeterWithSignalMeterColor:self.tintColor signalFrameSize:rect.size animationFrame:_animationFrame];
			break;
		}
		case PRLActivityIndicatorStatusError:
		{
			[PRLiOSPaintCodeStyleKit drawSignalErrorConditionWithTintColor:self.tintColor signalFrameSize:rect.size];
			break;
		}
		case PRLActivityIndicatorStatusSuccess:
		{
			[PRLiOSPaintCodeStyleKit drawSentSuccessWithTintColor:self.tintColor signalFrameSize:rect.size];
			break;
		}
		default:
		{
			break;
		}
	}
}

- (void)displayAnimationFrameNumber:(NSNumber *)frameNumber
{
	_animationFrame = [frameNumber integerValue];
	[self setNeedsDisplay];
}

- (void)startAnimation;
{
	if (!self.tintColor)
		self.tintColor = [UIColor blackColor];

	if (_animator)
	{
		[self stopAnimation];
	}

	_animator = [PRLViewAnimator animatorForNumberOfFrames:3 atRate:2 repeating:YES];
	[_animator startAnimationWithView:self];
}

- (void)stopAnimation
{
	if (_animator)
	{
		[_animator stopAnimation];
		_animator = nil;
	}
}

- (void)dealloc
{
	[self stopAnimation];
}

@end
