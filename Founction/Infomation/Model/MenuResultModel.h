//
//  MenuResultModel.h
//  MyCode
//
//  Created by CL on 2018/6/18.
//  Copyright © 2018年 CL. All rights reserved.
//

#import <Foundation/Foundation.h>
@class categoryInfo ,resultModel ,bigChildsModel , childsModel;


@interface MenuResultModel : NSObject

@property(nonatomic, assign)BOOL msg;
@property(nonatomic, strong)resultModel * result;
@property(nonatomic, assign)NSInteger retCode;

@end



@interface resultModel : NSObject

@property(nonatomic, strong)categoryInfo * categoryInfo;
@property(nonatomic, strong)NSArray <bigChildsModel*>* bigChilds;

@end


@interface bigChildsModel : NSObject

@property(nonatomic, strong)categoryInfo * categoryInfo;
@property(nonatomic, strong)NSArray <childsModel*>* childs;

@end


@interface childsModel : NSObject

@property(nonatomic, strong)categoryInfo * categoryInfo;

@end

@interface categoryInfo : NSObject

@property(nonatomic, strong)NSString * ctgId;
@property(nonatomic, strong)NSString * name;
@property(nonatomic, strong)NSString * parentId;

@end

