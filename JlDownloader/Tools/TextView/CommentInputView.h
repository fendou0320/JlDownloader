//
//  CommentInputView.h
//  JlDownloader
//
//  Created by 王江亮 on 16/12/28.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IQTextView.h"

typedef void(^CommentInputViewClickBlock)(NSString *contentStr);

@interface CommentInputView : UIView<UITextFieldDelegate, UITextViewDelegate>

/**
 *  点击事件block
 */
@property (nonatomic,copy) CommentInputViewClickBlock clickBlock;
/**
 输入框
 */
//@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) IQTextView *textView;
/**
 数字标注
 */
@property (nonatomic, strong) UILabel *numLabel;
/**
 CommentInputView

 @param frame frame

 @return CommentInputView
 */
+ (instancetype)commentInputViewWithframe:(CGRect)frame;

@end
