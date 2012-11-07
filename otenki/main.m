//
//  main.m
//  otenki
//
//  Created by heart on 2012/11/06.
//  Copyright (c) 2012年 heart. All rights reserved.
//

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[])
{

    /*@autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
    }*/
    
    NSURL* url;
    url = [NSURL URLWithString:@"http://weather.livedoor.com/forecast/webservice/rest/v1?city=25&day=today"];
    
    //XMLドキュメントを作成します
    NSXMLDocument* document;
    document = [[NSXMLDocument alloc]initWithContentsOfURL:url options:0 error:NULL];
    if (!document) {
        return -1;
    }
    
    // '/lwws/title'の取得
    NSArray* nodes;
    //NSData* data;
    //nodes = [document nodesForXPath:@"/lwws" error:NULL];
    nodes = [document nodesForXPath:@"/lwws/title" error:NULL];
    
    // '/lwws/title'の表示
    for (NSXMLNode*  n in nodes) {
        NSLog(@"%@",[ n stringValue]);
    }
    
    // '/lwws/description'の取得
    nodes = [document nodesForXPath:@"/lwws/description" error:NULL];
    // '/lwws/description'の表示
    for (NSXMLNode*  n in nodes) {
        NSLog(@"%@",[ n stringValue]);
    }
    
    return 0;
}

