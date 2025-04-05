@Entry
@Component
struct Start {
  pathStack : NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pathStack){
    }.onAppear(() => {
      this.pathStack.pushPathByName("Index", null, false);
    })
    .hideNavBar(true)
  }
}