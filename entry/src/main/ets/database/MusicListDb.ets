import { relationalStore, ValuesBucket } from '@kit.ArkData'; // 导入模块
import { UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { window } from '@kit.ArkUI';
import { Music } from '../models/music';


// 隐私笔记数据库封装
class musicListDB {
  // 操作数据库的实例
  private store: relationalStore.RdbStore | null = null
  // 数据库表名
  private tableName = 'music'
  // 创建数据库的语句
  private sqlCreate = `CREATE TABLE IF NOT EXISTS ${this.tableName} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        url TEXT NOT NULL,
        singer TEXT NOT NULL,
      )`

  // 获取数据库操作的实例
  async getStoreInstance() {
    // 如果数据库实例已存在，直接返回，没有才创建实例
    if (this.store) {
      return this.store
    }
    // 获取操作数据库的实例
    const store = await relationalStore.getRdbStore(getContext(), {
      name: 'music_player.db', // 数据库名称
      securityLevel: relationalStore.SecurityLevel.S1 // 安全等级
    })
    // 存储起来方便下次直接获取
    this.store = store
    // 返回 store 实例
    return this.store
  }

  // 类的构造器，new 的时候会自动触发
  constructor() {
    // 创建/打开数据库文件
    this.getStoreInstance()
      .then(store => {
        // 执行创建语句，用于创建数据库的表
        store.executeSql(this.sqlCreate)
      })
  }

  async insert(item: Music) {
    const store = await this.getStoreInstance()
    return store.insert(this.tableName, item)
  }
}

// 通过小写 p 开头的类实例操作数据库，创建数据库，建表，增、删、查、改
export const musicListDb = new musicListDB()
