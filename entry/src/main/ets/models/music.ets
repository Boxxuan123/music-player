import { ValuesBucket } from "@kit.ArkData"

export interface Music extends ValuesBucket {
  id: number | null // 新增时 id 设置为 null ，可实现 id 自增
  title: string | "未知歌名"
  url: string
  singer: string | "未知歌手"
  img:string | null
}