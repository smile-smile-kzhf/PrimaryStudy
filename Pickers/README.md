# PrimaryStudy

学习分页栏和选取器，该应用程序的内容视图将有5种不同的选取器：
1）日期选取器；
2）单滚轮选取器；
3）多滚轮选取器；
4）包含依赖滚轮的选取器；
   从资源文件中加载plist，获取内容信息
5）包含图形的自定义选取器
   音频播放的简单运用：
#import <AudioToolbox/AudioToolbox.h>
SystemSoundID winSoundID;
NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &winSoundID);
AudioServicesPlaySystemSound(winSoundID);


数据源协议方法（UIPickerViewDataSource）,委托协议的方法（UIPickerViewDelegate）：
numberOfComponentsInPickerView:
pickerView: numberOfRowsInComponent:
pickerView: titleForRow: forComponent:
pickerView: didSelectRow: inComponent:
pickerView: viewForRow: forComponent: reusingView: