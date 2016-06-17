//
//  DZProgressIndicatorSlider.h
//  OhMyTube
//
//  Created by Denis Zamataev on 29/05/15.
//  Copyright (c) 2015 Mysterious Organization. All rights reserved.
//

#import <UIKit/UIKit.h>


#if TARGET_OS_TV
@interface DZProgressIndicatorSlider : UIView
#else
@interface DZProgressIndicatorSlider : UISlider
#endif

- (void)setValue:(float)value;
- (void)setValue:(float)value animated:(BOOL)animated;
- (void)setTintColor:(UIColor*)tintColor;
- (float)value;

- (void)setSecondaryValue:(float)value;
- (void)setSecondaryTintColor:(UIColor *)tintColor;
- (float)secondaryValue;

- (void)setProgressViewHeight:(CGFloat)height;

- (void)setTrackColor:(UIColor*)trackColor;

@end
