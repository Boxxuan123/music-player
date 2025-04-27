import { picker } from "@kit.CoreFileKit";
import { BusinessError } from "@kit.BasicServicesKit";
import { common } from "@kit.AbilityKit";
import { relationalStore } from "@kit.ArkData";
import { Music } from "../models/music";

interface egDivider {
  strokeWidth: Length;
  color?: ResourceColor | undefined;
  startMargin?: Length | undefined;
  endMargin?: Length | undefined;
}


@ComponentV2
export struct MusicList {
  @Require @Param pathStack: NavPathStack
  store: relationalStore.RdbStore | undefined = undefined;
  @Local musicList: Music[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg',
      title: '直到世界的尽头',
      singer: 'WANDS',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.m4a',
      id: 0
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',
      title: '画',
      singer: '赵磊',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3',
      id: 1
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg',
      title: 'Sweet Dreams',
      singer: 'TPaul Sax / Eurythmics',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.mp3',
      id: 2
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
      title: '奢香夫人',
      singer: '凤凰传奇',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
      id: 3
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
      title: '空心',
      singer: '光泽',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
      id: 4
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg',
      title: '反转地球',
      singer: '潘玮柏',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.mp3',
      id: 5
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg',
      title: 'No.9',
      singer: 'T-ara',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.m4a',
      id: 6
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg',
      title: '孤独',
      singer: 'G.E.M.邓紫棋',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.m4a',
      id: 7
    },

    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg',
      title: 'Lose Control',
      singer: 'Hedley',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.m4a',
      id: 8
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg',
      title: '倩女幽魂',
      singer: '张国荣',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a',
      id: 9
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg',
      title: '北京北京',
      singer: '汪峰',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.m4a',
      id: 10
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
      title: '苦笑',
      singer: '汪苏泷',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
      id: 11
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
      title: '一生所爱',
      singer: '卢冠廷 / 莫文蔚',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
      id: 12
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
      title: '月半小夜曲',
      singer: '李克勤',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
      id: 13
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
      title: 'Rolling in the Deep',
      singer: 'Adele',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
      id: 14
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
      title: '海阔天空',
      singer: 'Beyond',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
      id: 15
    }
  ]

  songDetails(): void {
    console.log("点击了songDetails");
  }

  playSong() {
    console.log("点击了playSong");
    this.pathStack.pushPath({ name: 'Play' }, false)
  }

  selectAudio(): string[] {
    let selectAudio: string[] = []
    let context = getContext(this) as common.Context;
    const documentSelectOptions = new picker.DocumentSelectOptions();

    documentSelectOptions.maxSelectNumber = 50;
    documentSelectOptions.fileSuffixFilters = ['音频|.mp3,.wav,.m4a'];
    let audioPicker = new picker.DocumentViewPicker(context);
    audioPicker.select(documentSelectOptions)
      .then((audioSelectResult: string[]) => {
        selectAudio = audioSelectResult
        console.info('[MusicList] 文件选择成功，选择文件的 uri: ' + JSON.stringify(audioSelectResult));
        return audioSelectResult
      }).catch((err: BusinessError) => {
      console.error('[MusicList] 文件选择失败 err: ' + JSON.stringify(err));
      throw Error("文件选择失败")
    });
    return selectAudio
  }

  @Builder
  musicListItem(title: string, singer: string, img: string | null) {
    Button({ type: ButtonType.Normal, stateEffect: true }) {
      Row() {

        Image(img ? img : $r("app.media.picture_fill"))
          .backgroundColor('#0C0C0C')
          .width(35)
          .margin({ top: 10, right: 10, bottom: 10 })
          .geometryTransition('sharedId')


        Column({ space: 5 }) {
          Text(title).fontColor("#F3F3F3").fontSize(18)
          Text(singer).fontColor("#696969").fontSize(12)
        }.alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Button() {
          Image($r("app.media.dot_grid_1x2")).backgroundColor('#0C0C0C').fillColor("#C6C6C6").width(35)
        }.onClick(() => {
          this.songDetails()
        })

      }.justifyContent(FlexAlign.Center)
    }.borderRadius(8).backgroundColor('#0C0C0C').onClick(() => {
      this.playSong()
    })
  }

  build() {
    RelativeContainer() {
      Column() {
        Row() {
          Text("歌单列表").fontSize(24).fontWeight(600).fontColor("#D4D4D4")
          Blank()
          Button({ type: ButtonType.Circle, stateEffect: false }) {
            Image($r('app.media.plus')).width(30).height(30).backgroundColor("#131215")
          }
          .onClick(() => {
            let selectAudioList: string[] = this.selectAudio()
          })
        }.width('100%').margin({ bottom: 20 })

        List() {
          if (this.musicList.length === 0) {
            ListItem() {
              Text('没有歌曲')
                .fontSize(20).fontColor("#fff")
            }.align(Alignment.Center)
            .width("100%")
          }
          ForEach(this.musicList, (item: Music, index: number) => {
            ListItem() {
              this.musicListItem(item.title, item.singer, item.img)
            }
          })
        }
        .divider({
          strokeWidth: 1,
          startMargin: 5,
          endMargin: 10,
          color: '#323232'
        })
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 12, right: 12 })
  }
}