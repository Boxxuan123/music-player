import { Music } from '../models/music'

// 跳转页面入口函数
@Builder
export function PlayBuilder() {
  Play()
}

@Entry
@Component
struct Play {
  pathStack: NavPathStack = new NavPathStack()
  @State panelHeight: string = '0%'
  songs: Music[] = [
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
  // 当前播放的歌曲
  @State
  playState: Music = this.songs[5]

  @Builder
  deleteButton(index: number) {
    Button('删除')
      .backgroundColor('#ec5c87')
      .fontColor('#fff')
      .width(80)
      .height('100%')
      .type(ButtonType.Normal)

  }

  number2time(number: number) {
    // 毫秒 → 秒 → 分+秒; 先判断是否大于1分钟
    if (number >= 60 * 1000) {
      const s = Math.ceil(number / 1000 % 60)
      const m = Math.floor(number / 1000 / 60)
      const second = s.toString()
        .padStart(2, '0')
      const minute = m.toString()
        .padStart(2, '0')
      return minute + ':' + second
    } else {
      const s = Math.ceil(number / 1000 % 60)
      const second = s.toString()
        .padStart(2, '0')
      return '00:' + second
    }
  }

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom }) { // 播放
        Column() {
          //   播放界面
          Column() {
            // 图片
            Row() {
              Image(this.playState.img).width('70%').borderRadius(400)
            }
            .backgroundImage($r('app.media.ic_cd'))
            .backgroundImageSize(ImageSize.Cover)
            .justifyContent(FlexAlign.Center)
            .width('70%')
            .padding(24)
            .borderRadius(400)
            .aspectRatio(1)
            .margin({ top: 50 })

            Column({ space: 8 }) {
              Text(this.playState.title).fontSize(28).fontWeight(FontWeight.Bold).fontColor(Color.White)
              Text(this.playState.singer).fontSize(18).fontColor(Color.White)
            }.layoutWeight(1).justifyContent(FlexAlign.Center).zIndex(3)

            // 操作
            // Row() {
            //   Image($r("app.media.picture_fill")).fillColor(Color.White).width(24)
            //   Image($r("app.media.heart")).fillColor(Color.White).width(24)
            //   Image($r("app.media.heart")).fillColor(Color.White).width(24)
            //   Image($r("app.media.heart")).fillColor(Color.White).width(24)
            // }.width('100%').justifyContent(FlexAlign.SpaceAround)

          }.layoutWeight(1).width('100%')


          // 进度条
          Row({ space: 4 }) {
            Text("00:00").fontSize(12).fontColor(Color.White)
            Slider({ value: 0, min: 0, max: 0 })
              .layoutWeight(1)
              .blockColor(Color.White)
              .selectedColor(Color.White)
              .trackColor('#ccc5c5c5')
              .trackThickness(2)
            Text("00:00").fontSize(12).fontColor(Color.White)
          }.width('100%').padding(24)

          // 切换
          Row() {
            Image($r('app.media.repeat')).fillColor(Color.White).width(30)
            Image($r("app.media.backward_end_fill")).fillColor(Color.White).width(30)
            // 播放按钮
            Image($r('app.media.play_fill')).fillColor(Color.White).width(50)
            // 下一首
            Image($r('app.media.forward_end_fill')).fillColor(Color.White).width(30)
            // 播放列表
            Image($r('app.media.list_interrupt')).fillColor(Color.White).width(30).onClick(() => {
              this.panelHeight = "100%"
            })
          }.width('100%').padding({ bottom: 24 }).justifyContent(FlexAlign.SpaceAround)

        }.width('100%')


        // 列表
        Column() {
          Column() {
          }.width("100%").height(50).onClick(() => {
            this.panelHeight = "0%"
          })

          Column() {
            Row() {
              Text(`播放列表 ${this.songs.length}`)
                .fontColor('#ffa49a9a')
                .fontSize(14)
                .layoutWeight(1)
                .margin({ left: 8, top: 5 })
              Image($r('app.media.remove_songlist'))
                .fillColor('#ffa49a9a')
                .width(24)
                .margin({ right: 8 })
                .onClick(() => {
                  this.panelHeight = '0%'
                })
            }
            .justifyContent(FlexAlign.Center)
            .height(40)
            .width('100%')
            .backgroundColor('#ff353333')
            .padding(8)
            .border({ width: { bottom: 1 }, color: '#12ec5c87' })
            .borderRadius({ topLeft: 15, topRight: 15 })


            // 播放列表
            List() {
              ForEach(this.songs, (item: Music, index: number) => {
                ListItem() {
                  Row() {
                    Row() {
                      Text((index + 1).toString()).fontColor('#ffa49a9a')
                    }.width(50).aspectRatio(1).justifyContent(FlexAlign.Center)

                    // 列表
                    Row({ space: 10 }) {
                      Column() {
                        Text(item.title).fontSize(14).fontColor('#ffa49a9a')
                        Text(item.singer).fontSize(12).fontColor(Color.Gray)
                      }.layoutWeight(1).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center)
                    }.layoutWeight(1)

                    Image($r('app.media.heart')).width(24).margin({ right: 16 }).fillColor(Color.Gray)
                  }.alignItems(VerticalAlign.Center)
                }.swipeAction({ end: this.deleteButton(index) }).border({ width: { bottom: 1 }, color: '#12ec5c87' })
              })
            }

            .layoutWeight(1)
            .backgroundColor('#ff353333')
            .height(this.panelHeight)
            .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.BOTTOM])
          }
        }.height(this.panelHeight).animation({ duration: 300 })

      }

    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
    .backgroundColor(Color.Transparent)
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImage(this.playState.img)
    .backdropBlur(500)
    .backgroundImagePosition(Alignment.Center)
  }
}