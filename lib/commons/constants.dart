class Constants {
  static const isProduction =
      String.fromEnvironment('app.flavor') == "production";

  static const host = isProduction
      ? "https://bo-api.uenafood.com"
      : "https://bo-api-staging.uenafood.com";

  static String svgAsset(String path) => "assets/images/$path.svg";
  static String pngAsset(String path) => "assets/images/$path.png";
  static String webpAsset(String path) => "assets/images/$path.webp";
}
