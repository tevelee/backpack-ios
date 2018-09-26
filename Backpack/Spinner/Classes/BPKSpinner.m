/*
 * Backpack - Skyscanner's Design System
 *
 * Copyright 2018 Skyscanner Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "BPKSpinner.h"
#import "Color.h"
#import "Spacing.h"

NS_ASSUME_NONNULL_BEGIN

@interface BPKSpinner()

@end

@implementation BPKSpinner

- (instancetype)initWithStyle:(BPKSpinnerStyle)style size:(BPKSpinnerSize)size {
    self = [super initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    if (self) {
        [self setupWithStyle:style size:size];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupWithStyle:BPKSpinnerStylePrimary size:BPKSpinnerSizeDefault];
    }
    return self;
}

- (void)setSize:(BPKSpinnerSize)size {
    _size = size;
    [self render];
    [self setNeedsLayout];
}

- (void)setStyle:(BPKSpinnerStyle)style {
    _style = style;
    [self render];
}

- (void)setupWithStyle:(BPKSpinnerStyle)style size:(BPKSpinnerSize)size {
    _style = style;
    _size = size;
    [self render];
}

- (void)render {
    self.activityIndicatorViewStyle = [self.class styleForSpinnerSize:self.size];
    self.color = [self.class colorForSpinnerStyle:self.style];
    [self setNeedsDisplay];
}

+ (UIActivityIndicatorViewStyle)styleForSpinnerSize:(BPKSpinnerSize)size {
    switch (size) {
        case BPKSpinnerSizeDefault:
            return UIActivityIndicatorViewStyleWhiteLarge;
        case BPKSpinnerSizeSmall:
            return UIActivityIndicatorViewStyleWhite;
        default:
            NSAssert(NO, @"Undefined size: %d", (int) size);
            break;
    }
}

+ (UIColor *)colorForSpinnerStyle:(BPKSpinnerStyle)style {
    switch (style) {
        case BPKSpinnerStylePrimary:
            return BPKColor.blue500;
        case BPKSpinnerStyleDark:
            return BPKColor.gray700;
        case BPKSpinnerStyleLight:
            return BPKColor.white;
        default:
            NSAssert(NO, @"Undefined style: %d", (int) style);
            break;
    }
}

@end

NS_ASSUME_NONNULL_END