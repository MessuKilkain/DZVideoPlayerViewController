//
//  DZProgressIndicatorSlider.h
//  OhMyTube
//
//  Created by Denis Zamataev on 29/05/15.
//  Copyright (c) 2015 Mysterious Organization. All rights reserved.
//

#import <UIKit/UIKit.h>

#if TARGET_OS_TV
@interface DZProgressIndicatorSlider : UIProgressView
-(void)setValue:(float)value;
-(void)setValue:(float)value animated:(BOOL)animated;
-(float)value;
#else
@interface DZProgressIndicatorSlider : UISlider
#endif

@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

- (void)setSecondaryValue:(float)value;
- (void)setSecondaryTintColor:(UIColor *)tintColor;
@end
