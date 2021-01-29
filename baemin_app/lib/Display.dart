class Display {
  /// 표시될 타일들의 길이
  int length;

  /// # 붙은 항목들이 있는 위치
  int hashTagsIndex;

  /// 영상이 아닌 아이콘으로 존재하는 타일들
  List<int> iconIndexes;

  /// 외부링크 영상이 아닌 gif를 보여주는 방식의 타일들
  List<int> gifIndexes;

  /// 외부 링크로 영상이 걸린 타일들
  List<int> linkIndexes;

  /// 뭐먹지 서비스 법적고지사항 안내 위치
  int infoIndex;

  Display(int length, int hashTagsIndex, List<int> iconIndexes, List<int> gifIndexes, List<int> linkIndexes, int infoIndex) {
    this.length = length;
    this.hashTagsIndex = hashTagsIndex;
    this.iconIndexes = iconIndexes;
    this.gifIndexes = gifIndexes;
    this.linkIndexes = linkIndexes;
    this.infoIndex = infoIndex;
  }
}