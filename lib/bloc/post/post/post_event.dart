class PostEvent {
  bool isPrioritized, hasSortRquest;
  String selectedSort = "";

  set setSortRequest(bool value) {
    hasSortRquest = value;
  }

  set setSelectedSort(String value) {
    selectedSort = value;
  }

  PostEvent(hasSortRquest, selectedSort) {
    this.hasSortRquest = hasSortRquest;
    this.selectedSort = selectedSort;
  }
}
