Obj-C ZERO-WIDTH-SPACE
=========

[**Zero-width space**](http://en.wikipedia.org/wiki/Zero-width_space) 是肉眼無法發現的空白
當你按下 `→` 但游標並沒有移動的時候，代表兩個字元中間有一個 Zero-width space
當使用escape 則會出現 `%E2%80%8E`

文字使用用並不會引響，但在一些情況下會造成錯誤
 - URL
 - URLEncode 


>通常是透過WORD、預覽程式等等的文件編輯器複製貼上造成的

--------------

這URL含有兩個 Zero-width space
```objective-c
#define AP_URL @"​​http://www.lamb-mei.com"
```
----

使用escape 檢查是否有隱藏字元
```objective-c
    [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
```
----
移除 Zero-width space
```objective-c
    NSString* pString = @"\u200B";
    [string stringByReplacingOccurrencesOfString:pString withString:@""];
```


