class ReviewListData {
  String nameOfCamping;
  String review;
  double rating;

  ReviewListData({
    this.nameOfCamping = "",
    this.review = "",
    this.rating = 3,
  });

  static List<ReviewListData> myReviewList = [
    ReviewListData(
      nameOfCamping : "Baia degli Aranci",
      review : "Posto bellissimo, bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla bla",
      rating : 4
    ),
    ReviewListData(
      nameOfCamping : "Baia degli Arancioni",
      review : "Posto di merda, bla bla bla",
      rating : 1
    )
  ];
}