class Boat {
  final String model;
  final String owner;
  final String description;
  final Map<String, String> specs;
  final List<String> gallery;
  final String imagePath;

  const Boat({
    this.model,
    this.owner,
    this.description,
    this.specs,
    this.gallery,
    this.imagePath,
  });

  static const _description = "Cum agripeta cantare, omnes humani generises transferre fatalis, gratis gloses.";
  static const _gallery = [
    "assets/img/gallery1.jpg",
    "assets/img/gallery2.jpg",
    "assets/img/gallery3.jpg",
    "assets/img/gallery4.jpg",
    "assets/img/gallery5.jpg",
  ];
  static const _specs = {
    "Boat Length": "24'2",
    "Beam": "102'",
    "Weight": "2765 KG",
    "Fuel Capacity": "322 L"
  };
  static const listBoats = [
    Boat(
        model: "XCLR8 Speed",
        owner: "Tennison",
        imagePath: "assets/img/boat1.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),

    Boat(
        model: "X-FORCE",
        owner: "W - Wilson",
        imagePath: "assets/img/boat2.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),

    Boat(
        model: "X12 Force",
        owner: "Mastercraft",
        imagePath: "assets/img/boat3.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),

    Boat(
        model: "X21 Strength",
        owner: "NeoCraft",
        imagePath: "assets/img/boat4.png",
        description: _description,
        gallery: _gallery,
        specs: _specs),
  ];
}
