import { MusicList } from './MusicList'
import { My } from './My'

interface tabData {
  text: string,
  icon: Resource
}

// 跳转页面入口函数
@Builder
export function IndexBuilder() {
  Index()
}

@Entry
@ComponentV2
struct Index {
  @Local pathStack: NavPathStack = new NavPathStack()
  @Local currentIndex: number = 0
  tabData: tabData[] = [
    { text: "歌单", icon: $r("app.media.music") },
    { text: "我的", icon: $r("app.media.person_crop_circle_fill_1") }
  ]

  @Builder
  tabBuilder(item: tabData, index: number) {
    Column({ space: 5 }) {
      Image(item.icon).width(24).fillColor(this.currentIndex === index ? "#E85A88" : '#63AAAA')
      Text(item.text).fontSize(14).fontColor(this.currentIndex === index ? "#E85A88" : '#63AAAA')
    }
  }

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.End }) {
        ForEach(this.tabData, (item: tabData, index: number) => {
          TabContent() {
            if (index === 0) {
              MusicList({pathStack:this.pathStack})
              
            } else if (index === 1) {
              My()
            }
          }
          .tabBar(this.tabBuilder(item, index))
          .backgroundColor('#0C0C0C')
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        })
      }
      .backgroundColor('#3B3F42')
      .onChange((index: number) => {
        this.currentIndex = index
      })
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

      .height('100%')
      .width('100%')
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}



