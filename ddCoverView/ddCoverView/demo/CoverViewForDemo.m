//
//  CoverViewForDemo.m
//  ScrollabelCoverView
//
//  Created by tondyzhang on 16/7/21.
//  Copyright © 2016年 tondy. All rights reserved.
//

#import "CoverViewForDemo.h"

#define kAvatarWidth 60
#define kAvatarCenterYToBottom  100

@interface CoverViewForDemo ()

@property(nonatomic, strong)UIImageView* avatar;
@property(nonatomic, strong)UILabel* nickLabel;
@property(nonatomic, assign)float heightToHideAvatar;
@property(nonatomic, assign)float defaultHeight;

@end

@implementation CoverViewForDemo

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI
{
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"demo_background"]];
    self.leftButton = [[UIButton alloc]initWithFrame:(CGRect){10,20+5,40,20}];
    self.leftButton.backgroundColor = [UIColor clearColor];
    [self.leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightButton = [[UIButton alloc]initWithFrame:(CGRect){self.bounds.size.width - 10 - 40,20+5,40,20}];
    [self.rightButton setTitle:@"完成" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.defaultHeight = self.frame.size.height;
    //add an icon
    [self addAvatar];
    [self addNickLabel];
}

-(void)addAvatar
{
    self.avatar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dog_avatar"]];
    self.avatar.frame = CGRectMake(0, 0, kAvatarWidth, kAvatarWidth);
    self.avatar.layer.masksToBounds = YES;
    self.avatar.layer.borderColor = [UIColor whiteColor].CGColor;
    self.avatar.layer.borderWidth = 0.5;
    self.avatar.layer.cornerRadius = self.avatar.frame.size.width/2;
    [self addSubview:self.avatar];
    self.heightToHideAvatar = kAvatarCenterYToBottom + kAvatarWidth/2;
}

-(void)addNickLabel
{
    self.nickLabel = [[UILabel alloc]init];
    self.nickLabel.text = @"DD";
    self.nickLabel.textColor = [UIColor whiteColor];
    self.nickLabel.font = [UIFont systemFontOfSize:16];
    self.nickLabel.backgroundColor = [UIColor clearColor];
    [self.nickLabel sizeToFit];
    [self addSubview:self.nickLabel];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    //avatar position
    self.avatar.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height - kAvatarCenterYToBottom);
    //avatar alpha
    float alpha = (self.bounds.size.height - self.heightToHideAvatar)/(self.defaultHeight - self.heightToHideAvatar);
    alpha = MIN(1, MAX(alpha, 0)); //0-1.0之间
    self.avatar.alpha = alpha;
    
    self.nickLabel.center = CGPointMake(self.bounds.size.width/2, CGRectGetMaxY(self.avatar.frame) + 10 + self.nickLabel.frame.size.height/2 );
    //上滑时让NickLabel停留在leftButton同一水平线上
    self.nickLabel.center = CGPointMake(self.nickLabel.center.x, MAX(self.leftButton.center.y, self.nickLabel.center.y));
}

@end
