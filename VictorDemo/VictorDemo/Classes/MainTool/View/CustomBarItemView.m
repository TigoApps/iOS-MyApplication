//
//  CustomBarItemView.m
//  AutoPartsClient
//
//  Created by qzh on 16/9/30.
//  Copyright © 2016年 ZhangyangNetwork. All rights reserved.
//

#import "CustomBarItemView.h"

@interface CustomBarItemView()

@property(nonatomic, strong) UIImageView *iconImageView;

@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation CustomBarItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        MyLinearLayout *rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyLayoutViewOrientation_Vert];
        rootLayout.myMargin = 0;
        [rootLayout setTarget:self action:@selector(onClickedWithType:)];
        rootLayout.highlightedOpacity = 0.5;
        [self addSubview:rootLayout];
        
        [rootLayout addSubview:self.iconImageView];
        [rootLayout addSubview:self.titleLabel];
        
        //添加布局属性
        self.iconImageView.widthDime.equalTo(rootLayout.widthDime).multiply(0.5);
        self.iconImageView.heightDime.equalTo(rootLayout.widthDime).multiply(0.5);
        self.iconImageView.centerXPos.equalTo(rootLayout.centerXPos);
        self.iconImageView.myTopMargin = 10;
        
        self.titleLabel.widthDime.equalTo(rootLayout.widthDime);
        self.titleLabel.myTopMargin = 5;
        self.titleLabel.weight = 0.4;
    }
    return self;
}



-(void)setUpIcon:(NSString *)iconName titleMessage:(NSString *)titleMessage
{
    if (iconName != nil && ![@"" isEqualToString:iconName]) {
        if ([iconName hasPrefix:@"http://"] || [iconName hasPrefix:@"https://"]) {
            [self.iconImageView yy_setImageWithURL:[NSURL URLWithString:[iconName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]] options:YYWebImageOptionProgressiveBlur | YYWebImageOptionSetImageWithFadeAnimation];
        } else {
           self.iconImageView.image = [UIImage imageNamed:iconName];
        }
        
    }
    if (titleMessage != nil && ![@"" isEqualToString:titleMessage]) {
        self.titleLabel.text = titleMessage;
    }
}


#pragma mark -- Action
- (void)onClickedWithType:(id)sender
{
    if (self.tabBarBlock) {
        self.tabBarBlock();
    }
}

#pragma mark -- Setter

-(void)setTitleMessage:(NSString *)titleMessage
{
    _titleMessage = [titleMessage copy];
    self.titleLabel.text = _titleMessage;
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    self.titleLabel.textColor = _titleColor;
}

#pragma mark -- 懒加载
-(UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
//        _iconImageView.image = [UIImage imageNamed:@"icon_location_city"];
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        [_iconImageView sizeThatFits:CGSizeMake(40, 40)];
    }
    return _iconImageView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:TextSize11];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.text = @"东莞";
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}


@end
