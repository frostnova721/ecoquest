class Ranks {
  static getRank(int points) {
      if (points >= 100) {
      return "Eco Legend";
    } else if (points >= 75) {
      return "Green Guardian";
    } else if (points >= 50) {
      return "Eco Warrior";
    } else if (points >= 25) {
      return "Sprout";
    } else {
      return "Seedling";
    }
  }
}