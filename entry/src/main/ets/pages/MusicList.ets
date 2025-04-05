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
  @Require @Param pathStack : NavPathStack
  store: relationalStore.RdbStore | undefined = undefined;
  @Local musicList: Music[] = [
    {
    id: 1,
    title: "song",
    url: "fd/wer",
    singer: "singer",
    img:null
  }, {
    id: 1,
    title: "song",
    url: "fd/wer",
    singer: "singer",
    img:null
  }]

  songDetails(): void {
    console.log("点击了songDetails");
  }

  playSong() {
    console.log("点击了playSong");
    this.getUIContext()?.animateTo({ duration: 1000 }, () => {
      this.pathStack.pushPath({ name: 'Play' }, false)
    })
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
  musicListItem(title: string, singer: string,img:string|null) {
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
        }.onClick(() => { this.songDetails() })

      }.justifyContent(FlexAlign.Center)
    }.borderRadius(8).backgroundColor('#0C0C0C').onClick(() => { this.playSong() })
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
              this.musicListItem(item.title, item.singer,item.img)
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