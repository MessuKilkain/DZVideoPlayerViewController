//
//  DZProgressIndicatorSlider.m
//  OhMyTube
//
//  Created by Denis Zamataev on 29/05/15.
//  Copyright (c) 2015 Mysterious Organization. All rights reserved.
//

#import "DZProgressIndicatorSlider.h"

@interface DZProgressIndicatorSlider ()

@property (weak, nonatomic) IBOutlet UIProgressView *primaryProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *progressView_HeightConstraint;

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
    [super setTintColor:[UIColor clearColor]];
    [self setMaximumTrackTintColor:[UIColor clearColor]];
#endif
    [self setBackgroundColor:[UIColor clearColor]];

    if( [self progressView] == nil )
    {
        UIProgressView* progressView = [[UIProgressView alloc] init];
        [progressView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:progressView];
        [self setProgressView:progressView];
    }

    if( [self primaryProgressView] == nil )
    {
        UIProgressView* primaryProgressView = [[UIProgressView alloc] init];
        [primaryProgressView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:primaryProgressView];
        [self setPrimaryProgressView:primaryProgressView];
    }

    CGFloat hue, sat, bri;
    [[self tintColor] getHue:&hue saturation:&sat brightness:&bri alpha:nil];

    if( [self progressView] != nil )
    {
        UIProgressView* progressView = [self progressView];
        [[progressView layer] setCornerRadius:1.0f];
        [progressView setTintColor:[UIColor colorWithHue:hue saturation:(sat * 0.6f) brightness:bri alpha:1]];
        {
            NSLayoutConstraint* heightConstraint =
            [NSLayoutConstraint
             constraintWithItem:progressView
             attribute:NSLayoutAttributeHeight
             relatedBy:NSLayoutRelationEqual
             toItem:nil
             attribute:NSLayoutAttributeNotAnAttribute
             multiplier:0
             constant:[progressView frame].size.height
             ];
            [heightConstraint setPriority:UILayoutPriorityDefaultHigh];
            [progressView addConstraint:heightConstraint];
        }
        {
            NSLayoutConstraint* leftConstraint =
            [NSLayoutConstraint
             constraintWithItem:self
             attribute:NSLayoutAttributeLeft
             relatedBy:NSLayoutRelationEqual
             toItem:progressView
             attribute:NSLayoutAttributeLeft
             multiplier:1
             constant:0
             ];
            [leftConstraint setPriority:UILayoutPriorityDefaultHigh];
            [self addConstraint:leftConstraint];
        }
        {
            NSLayoutConstraint* rightConstraint =
            [NSLayoutConstraint
             constraintWithItem:progressView
             attribute:NSLayoutAttributeRight
             relatedBy:NSLayoutRelationEqual
             toItem:self
             attribute:NSLayoutAttributeRight
             multiplier:1
             constant:0
             ];
            [rightConstraint setPriority:UILayoutPriorityDefaultHigh];
            [self addConstraint:rightConstraint];
        }
        {
            NSLayoutConstraint* verticalCenterConstraint =
            [NSLayoutConstraint
             constraintWithItem:progressView
             attribute:NSLayoutAttributeCenterY
             relatedBy:NSLayoutRelationEqual
             toItem:self
             attribute:NSLayoutAttributeCenterY
             multiplier:1
             constant:0
             ];
            [verticalCenterConstraint setPriority:UILayoutPriorityDefaultHigh];
            [self addConstraint:verticalCenterConstraint];
        }
    }
    if( [self primaryProgressView] != nil )
    {
        UIProgressView* progressView = [self primaryProgressView];
        [progressView setBackgroundColor:[UIColor clearColor]];
        [[progressView layer] setCornerRadius:1.0f];
        if( [self progressView] != nil )
        {
            NSLayoutConstraint* heightConstraint =
            [NSLayoutConstraint
             constraintWithItem:[self primaryProgressView]
             attribute:NSLayoutAttributeHeight
             relatedBy:NSLayoutRelationEqual
             toItem:progressView
             attribute:NSLayoutAttributeHeight
             multiplier:1
             constant:0
             ];
            [heightConstraint setPriority:UILayoutPriorityDefaultHigh];
            [self addConstraint:heightConstraint];
        }
        {
            NSLayoutConstraint* leftConstraint =
            [NSLayoutConstraint
             constraintWithItem:self
             attribute:NSLayoutAttributeLeft
             relatedBy:NSLayoutRelationEqual
             toItem:progressView
             attribute:NSLayoutAttributeLeft
             multiplier:1
             constant:0
             ];
            [leftConstraint setPriority:UILayoutPriorityDefaultHigh];
            [self addConstraint:leftConstraint];
        }
        {
            NSLayoutConstraint* rightConstraint =
            [NSLayoutConstraint
             constraintWithItem:progressView
             attribute:NSLayoutAttributeRight
             relatedBy:NSLayoutRelationEqual
             toItem:self
             attribute:NSLayoutAttributeRight
             multiplier:1
             constant:0
             ];
            [rightConstraint setPriority:UILayoutPriorityDefaultHigh];
            [self addConstraint:rightConstraint];
        }
        {
            NSLayoutConstraint* verticalCenterConstraint =
            [NSLayoutConstraint
             constraintWithItem:progressView
             attribute:NSLayoutAttributeCenterY
             relatedBy:NSLayoutRelationEqual
             toItem:self
             attribute:NSLayoutAttributeCenterY
             multiplier:1
             constant:0
             ];
            [verticalCenterConstraint setPriority:UILayoutPriorityDefaultHigh];
            [self addConstraint:verticalCenterConstraint];
        }
    }
}

-(void)setValue:(float)value
{
#if !TARGET_OS_TV
    [super setValue:value];
#endif
    if( [self primaryProgressView] != nil )
    {
        [[self primaryProgressView] setProgress:value];
    }
}
-(void)setValue:(float)value animated:(BOOL)animated
{
#if !TARGET_OS_TV
    [super setValue:value animated:animated];
#endif
    if( [self primaryProgressView] != nil )
    {
        [[self primaryProgressView] setProgress:value animated:animated];
    }
}
- (void)setTintColor:(UIColor *)tintColor {
    // [super setTintColor:tintColor];

    if( [self primaryProgressView] != nil )
    {
        [[self primaryProgressView] setTintColor:tintColor];
    }
}
-(float)value
{
#if !TARGET_OS_TV
    return [super value];
#else
    if( [self primaryProgressView] != nil )
    {
        return [[self primaryProgressView] progress];
    }
    else
    {
        return 0;
    }
#endif
}

- (void)setSecondaryValue:(float)value {
    if( [self progressView] != nil )
    {
        [[self progressView] setProgress:value];
    }
}
- (void)setSecondaryTintColor:(UIColor *)tintColor {
    if( [self progressView] != nil )
    {
        [[self progressView] setTintColor:tintColor];
    }
}
- (float)secondaryValue
{
    if( [self progressView] != nil )
    {
        return [[self progressView] progress];
    }
    else
    {
        return 0;
    }
}

- (void)setProgressViewHeight:(CGFloat)height
{
    if( [self progressView_HeightConstraint] != nil )
    {
        [[self progressView_HeightConstraint] setConstant:height];
    }
}

- (void)setTrackColor:(UIColor*)trackColor
{
    if( [self progressView] != nil )
    {
        [[self progressView] setTrackTintColor:trackColor];
    }
}

@end
