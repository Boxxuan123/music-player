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
  playState: Music = this.songs[0]

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
      Column() {
        Stack({ alignContent: Alignment.Bottom }) {
          // 播放
          Stack() {
            // 变色背景
            Image(this.playState.img)
              .width('100%')
              .height('100%')
              .blur(1000)
            // 内容
            Column() {
              // //   播放界面
              Column() {
                // 图片
                Stack({ alignContent: Alignment.Top }) {
                  Row() {
                    Row() {
                      Image($r('app.media.picture_fill'))
                        .width('70%')
                        .borderRadius(400)
                        .geometryTransition('sharedId')
                    }
                    .backgroundImage($r('app.media.heart'))
                    .backgroundImageSize(ImageSize.Cover)
                    .justifyContent(FlexAlign.Center)
                    .width('100%')
                    .borderRadius(400)
                    .clip(true)
                    .aspectRatio(1)
                  }
                  .margin({
                    top: 50
                  })
                  .width('90%')
                  .aspectRatio(1)
                  .justifyContent(FlexAlign.Center)
                  .padding(24)

                  // 唱针
                  Image($r('app.media.ic_stylus'))
                    .width(200)
                    .aspectRatio(1)
                    .rotate({
                      angle: -55,
                      centerX: 100,
                      centerY: 30
                    })
                    .animation({
                      duration: 500
                    })
                }

                // 歌曲信息
                Stack() {
                  // 第一个
                  Column({ space: 8 }) {
                    Text(this.playState.title)
                      .fontSize(28)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#4bb0c4')
                    Text(this.playState.singer)
                      .fontSize(18)
                      .fontColor('#4bb0c4')
                  }
                  .layoutWeight(1)
                  .justifyContent(FlexAlign.Center)
                  .zIndex(1)

                  // 第二个
                  Column({ space: 8 }) {
                    Text(this.playState.title)
                      .fontSize(28)
                      .fontWeight(FontWeight.Bold)
                      .fontColor('#ec5c87')
                    Text(this.playState.singer)
                      .fontSize(18)
                      .fontColor('#ec5c87')
                  }
                  .layoutWeight(1)
                  .justifyContent(FlexAlign.Center)
                  .zIndex(2)

                  // 第三个
                  Column({ space: 8 }) {
                    Text(this.playState.title)
                      .fontSize(28)
                      .fontWeight(FontWeight.Bold)
                      .fontColor(Color.Black)
                    Text(this.playState.singer)
                      .fontSize(18)
                      .fontColor(Color.Black)
                  }
                  .layoutWeight(1)
                  .justifyContent(FlexAlign.Center)
                  .zIndex(3)
                }
                .layoutWeight(1)

                // 操作
                Row() {
                  Badge({ value: '99+', style: { badgeSize: 12, badgeColor: '#45CCCCCC', borderWidth: 0 } }) {
                    Image($r("app.media.picture_fill"))
                      .fillColor(Color.Black)
                      .width(24)

                  }

                  Badge({ value: '10W', style: { badgeSize: 12, badgeColor: '#45cccccc', borderWidth: 0 } }) {
                    Image($r("app.media.heart"))
                      .fillColor(Color.Black)
                      .width(18)
                  }

                  Badge({ value: 'hot', style: { badgeSize: 12, badgeColor: '#a8ff3131', borderWidth: 0 } }) {
                    Image($r("app.media.heart"))
                      .fillColor(Color.Black)
                      .width(24)
                  }

                  Badge({ value: 'vip', style: { badgeSize: 12, badgeColor: '#b7efd371', borderWidth: 0 } }) {
                    Image($r("app.media.heart"))
                      .fillColor(Color.Black)
                      .width(24)
                  }
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceAround)

                // 播放
                Column() {
                  // 进度条
                  Row({ space: 4 }) {
                    Text("00:00")
                      .fontSize(12)
                      .fontColor(Color.Black)
                    Slider({
                      value: 0,
                      min: 0,
                      max: 0
                    })
                      .layoutWeight(1)
                      .blockColor(Color.Black)
                      .selectedColor(Color.Black)
                      .trackColor('#ccc5c5c5')
                      .trackThickness(2)
                    Text("00:00")
                      .fontSize(12)
                      .fontColor(Color.Black)
                  }
                  .width('100%')
                  .padding(24)

                  // 切换
                  Row() {
                    Image($r('app.media.heart'))
                      .fillColor(Color.Black)
                      .width(30)

                    Image($r("app.media.heart"))
                      .fillColor(Color.Black)
                      .width(30)

                    // 播放按钮
                    Image($r('app.media.heart'))
                      .fillColor(Color.Black)
                      .width(50)
                    // 下一首
                    Image($r('app.media.heart'))
                      .fillColor(Color.Black)
                      .width(30)
                    // 播放列表
                    Image($r('app.media.heart'))
                      .fillColor(Color.Black)
                      .width(30)
                  }
                  .width('100%')
                  .padding({
                    bottom: 24
                  })
                  .justifyContent(FlexAlign.SpaceAround)
                }
                .width('100%')
              }
              .layoutWeight(1)
              .width('100%')
            }

          }
          .width('100%')
          .height('100%')
          .backgroundColor(Color.Transparent)

          // 列表
          Column() {
            Column() {

            }
            .width('100%')
            .layoutWeight(1)
            .onClick(() => {
              this.panelHeight = '0%'
            })

            Column() {
              Row() {
                Row() {
                  Image($r("app.media.heart"))
                    .width(20)
                    .fillColor('#ff5186')
                }
                .width(50)
                .aspectRatio(1)
                .justifyContent(FlexAlign.Center)

                Row({ space: 8 }) {
                  Text(`播放列表 (0)`)
                    .fontColor(Color.Black)
                    .fontSize(14)
                }
                .layoutWeight(1)

                Image($r('app.media.heart'))
                  .fillColor('#ffa49a9a')
                  .width(24)
                  .height(24)
                  .margin({ right: 16 })
                  .onClick(() => {
                    this.panelHeight = '0%'
                  })
              }
              .width('100%')
              .backgroundColor('#ff353333')
              .padding(8)
              .border({
                width: { bottom: 1 },
                color: '#12ec5c87'
              })
              .borderRadius({
                topLeft: 4,
                topRight: 4
              })

              // 播放列表
              List() {
                ForEach(this.songs, (item: Music, index: number) => {
                  ListItem() {
                    Row() {
                      Row() {
                        Text((index + 1).toString())
                          .fontColor('#ffa49a9a')
                      }
                      .width(50)
                      .aspectRatio(1)
                      .justifyContent(FlexAlign.Center)

                      // 列表
                      Row({ space: 10 }) {
                        Column() {
                          Text(item.title)
                            .fontSize(14)
                            .fontColor('#ffa49a9a')
                          Text(item.singer)
                            .fontSize(12)
                            .fontColor(Color.Gray)
                        }
                        .layoutWeight(1)
                        .alignItems(HorizontalAlign.Start)
                        .justifyContent(FlexAlign.Center)
                      }
                      .layoutWeight(1)

                      Image($r('app.media.heart'))
                        .width(24)
                        .height(24)
                        .margin({ right: 16 })
                        .fillColor(Color.Gray)
                    }
                    .alignItems(VerticalAlign.Center)
                  }
                  .swipeAction({
                    end: this.deleteButton(index)
                  })
                  .border({
                    width: { bottom: 1 },
                    color: '#12ec5c87'
                  })
                })
              }
              .layoutWeight(1)
              .backgroundColor('#ff353333')

            }
            .height(this.panelHeight)
          }
          .height(this.panelHeight)
          .animation({
            duration: 300
          })

        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Transparent)
      }.height("100%").width("100%")

    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}