//
//  DZProgressIndicatorSlider.m
//  OhMyTube
//
//  Created by Denis Zamataev on 29/05/15.
//  Copyright (c) 2015 Mysterious Organization. All rights reserved.
//

#import "DZProgressIndicatorSlider.h"

@interface DZProgressIndicatorSlider ()

@end

@implementation DZProgressIndicatorSlider

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self commonInit];
}

- (void)commonInit {
#if !TARGET_OS_TV
    [self setMaximumTrackTintColor:[UIColor clearColor]];
#else
    [self setBackgroundColor:[UIColor clearColor]];
    [[self layer] setCornerRadius:1.0];
#endif
    
    [[self.progressView layer] setCornerRadius:1.0f];
    
    CGFloat hue, sat, bri;
    [[self tintColor] getHue:&hue saturation:&sat brightness:&bri alpha:nil];
    [self.progressView setTintColor:[UIColor colorWithHue:hue saturation:(sat * 0.6f) brightness:bri alpha:1]];
}

#if TARGET_OS_TV
- (void)setValue:(float)value {
    [self setProgress:value];
}
- (void)setValue:(float)value animated:(BOOL)animated {
    [self setProgress:value animated:animated];
}
- (float)value {
    return [self progress];
}
#endif

- (void)setTintColor:(UIColor *)tintColor {
    [super setTintColor:tintColor];
    
    CGFloat hue, sat, bri;
    [[self tintColor] getHue:&hue saturation:&sat brightness:&bri alpha:nil];
    [self.progressView setTintColor:[UIColor colorWithHue:hue saturation:(sat * 0.6f) brightness:bri alpha:1]];
}

- (void)setSecondaryValue:(float)value {
    [self.progressView setProgress:value];
}

- (void)setSecondaryTintColor:(UIColor *)tintColor {
    [self.progressView setTintColor:tintColor];
}

@end
