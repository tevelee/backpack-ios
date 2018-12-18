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

#import "BPKCalendarWeekdayView.h"
#import "FSCalendar.h"
#import "FSCalendarDynamicHeader.h"
#import "FSCalendarExtensions.h"
#import "BPKSpacing.h"

@implementation BPKCalendarWeekdayView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSArray<UILabel *> *labels = self.weekdayLabels;
    
    NSInteger sideSpacing = 0;
    NSInteger x = sideSpacing;
    for (NSInteger i = 0; i < labels.count; i++) {
        UILabel *label = labels[i];
        CGFloat fullWidth = label.superview.bounds.size.width - 2 * sideSpacing;
        CGFloat width = fullWidth / labels.count;
        label.frame = CGRectMake(x, 0, width, label.frame.size.height);
        x += width;
    }
}

@end