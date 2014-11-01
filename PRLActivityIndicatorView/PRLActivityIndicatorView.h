//
//  PRLActivityIndicatorView.h
//
//  Created by Kevin Hayes on 2014-09-25.
//  Copyright (c) 2014 Parliant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRLViewAnimator.h"

/**
 Error Statuses
 */
typedef NS_ENUM(NSUInteger, PRLActivityIndicatorStatus) {
    PRLActivityIndicatorStatusNoError = 0, /** No errors. When set to this, view will be hidden */
	PRLActivityIndicatorStatusInProgress, /** In progress, shows the default signal. */
    PRLActivityIndicatorStatusError, /** shows an error symbol */
    PRLActivityIndicatorStatusSuccess, /** shows a success symbol */
};

/**
 PRLActivityIndicatorView is an alternative view to UIActivityIndicatorView. It animates signal lines radiating out from a center and cycles.
 */
IB_DESIGNABLE
@interface PRLActivityIndicatorView : UIView <PRLViewAnimatorProtocol>
/** sets the color in which the view is drawn */
@property (nonatomic,strong) IBInspectable UIColor *tintColor;

/** set the status to a value of PRLActivityIndicatorStatus to display the appropriate status. Setting to PRLActivityStatusNoError will hide the view */
@property (nonatomic) PRLActivityIndicatorStatus status;

@end
