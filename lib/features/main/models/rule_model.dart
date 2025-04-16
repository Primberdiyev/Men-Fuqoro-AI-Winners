class RuleModel {
  final String name;
  final String fullLaw;
  final List<String> question;

  RuleModel(
      {required this.name, required this.fullLaw, required this.question});
}

List lows = [
  RuleModel(
      name: 'Mehnat kodeksi 2-modda',
      fullLaw: "Ushbu Kodeksning asosiy vazifalari quyidagilardan iborat:\n"
          "- xodimlar mehnat huquqlari va erkinliklarining, shu jumladan mehnat qilishga, erkin ish tanlashga, adolatli va xavfsiz mehnat sharoitlariga hamda ishsizlikdan himoyalanishga bo‘lgan huquqining davlat kafolatlarini belgilash;\n"
          "- ish beruvchilarning kadrlarni tanlash, joy-joyiga qo‘yish va samarali mehnat jarayonini tashkil etish sohasidagi huquqlari amalga oshirilishini ta’minlash;\n"
          "- mehnat sohasida ijtimoiy sheriklikni rag‘batlantirish va rivojlantirish;\n"
          "- xodimlar va ish beruvchilarning huquqlari hamda qonuniy manfaatlari himoya qilinishini ta’minlash;\n"
          "- mehnat bozorining samarali faoliyat ko‘rsatishiga ko‘maklashish.",
      question: [])
];
