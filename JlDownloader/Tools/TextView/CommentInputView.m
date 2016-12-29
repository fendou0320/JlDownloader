//
//  CommentInputView.m
//  JlDownloader
//
//  Created by 王江亮 on 16/12/28.
//  Copyright © 2016年 WangJiangliang. All rights reserved.
//

#import "CommentInputView.h"

@implementation CommentInputView

+ (instancetype)commentInputViewWithframe:(CGRect)frame{

    CommentInputView *view = [[CommentInputView alloc] initWithFrame:frame];
    return view;
}

- (id)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
        [self creatSubview];
        
        UIButton *expressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        expressBtn.frame = CGRectMake(self.frame.size.width-50, self.frame.size.height-30, 50, 30);
        [expressBtn setTitle:@"发表" forState:UIControlStateNormal];
        expressBtn.backgroundColor = [UIColor blueColor];
        [expressBtn addTarget:self action:@selector(expressAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:expressBtn];
        
        self.numLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-30, 70, 30)];
        self.numLabel.text = @"0/400";
        self.numLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:self.numLabel];
        
    }
    return self;
}

- (void)creatSubview{
    
//    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-30)];
//    [self addSubview:self.textField];
//    //设置边框样式，只有设置了才会显示边框样式
//    self.textField.borderStyle = UITextBorderStyleBezel;
//    self.textField.backgroundColor = [UIColor whiteColor];
////    self.textField.placeholder = @"您想写点什么";
//    self.textField.adjustsFontSizeToFitWidth = NO;
//    self.textField.delegate = self;
//    [self.textField addTarget:self action:@selector(textFielddidChanged:) forControlEvents:UIControlEventEditingChanged];
//    self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    self.textView = [[IQTextView  alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height-30)]; //初始化大小并自动释放
    self.textView.delegate = self;//设置它的委托方法
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    self.textView.textColor = [UIColor blackColor];//设置textview里面的字体颜色

    self.textView.layer.borderColor = [UIColor blackColor].CGColor;
    self.textView.layer.borderWidth =1.0;
    self.textView.layer.cornerRadius =5.0;
    self.textView.scrollEnabled = YES;
    
    [self addSubview: self.textView];//加入到整个页面中

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:_textView];

}

- (void)expressAction: (UIButton *)btn{

//    if (self.clickBlock) {
//        self.clickBlock(_textField.text);
//    }
    if (self.clickBlock) {
        self.clickBlock(_textView.text);
    }

}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if (range.location>=10)
    {
        return  NO;
    }
    else
    {
        return YES;
    }
}


//#pragma mark - UITextFieldDelegate的使用
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if (range.location>=399)
//    {
//        return  NO;
//    }
//    else
//    {
//        return YES;
//    }
//}
//
//
//- (void)textFielddidChanged:(id) sender{
//
//    NSInteger num = [self convertToByte:_textField.text];
//    self.numLabel.text = [NSString stringWithFormat:@"%ld/400", num/2];
//}

- (void)textDidChange{
    
    NSInteger num = [self convertToByte:_textView.text];
    self.numLabel.text = [NSString stringWithFormat:@"%ld/400", num/2];
    
}


- (int)convertToByte:(NSString*)str {
    
    int strlength = 0;
    NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    char *p = (char*)[str cStringUsingEncoding:gbkEncoding];
    
    for (int i=0 ; i<[str lengthOfBytesUsingEncoding:gbkEncoding] ;i++) {
        
        if (p) {
            p++;
            strlength++;
        }else {
            p++;
        }
    }
    return strlength;
}



@end
