class WidgetQuestion {
  final int id;
  final String text;
  final List<WiidgetOption> options;
  bool isLocked;
  WiidgetOption? selectedWiidgetOption;
  WiidgetOption correctAnswer;

  WidgetQuestion({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
  });

  WidgetQuestion copyWith() {
    return WidgetQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              WiidgetOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer,
    );
  }
}

class WiidgetOption {
  final String? text;
  final bool? isCorrect;

  const WiidgetOption({
    this.text,
    this.isCorrect,
  });
}

final widgetQuestionsList = [
  WidgetQuestion(
    text:
        "Memaksa istri untuk berhubungan intim BUKAN termasuk kekerasan seksua",
    options: [
      const WiidgetOption(text: "Betul", isCorrect: false),
      const WiidgetOption(text: "Salah", isCorrect: true),
    ],
    id: 0,
    correctAnswer: const WiidgetOption(text: "Betul", isCorrect: true),
  ),
  WidgetQuestion(
      text:
          "Menceritakan kegiatan seksual pribadi pada orang lain BUKAN termasuk pelecehan seksual",
      options: [
        const WiidgetOption(text: "Betul", isCorrect: false),
        const WiidgetOption(text: "Salah", isCorrect: true),
      ],
      id: 1,
      correctAnswer: const WiidgetOption(text: "Betul", isCorrect: true)),
  WidgetQuestion(
      text: "Yang BUKAN termasuk kekerasan seksual adalah",
      options: [
        const WiidgetOption(text: "Pemaksaan perkawinan", isCorrect: false),
        const WiidgetOption(text: "Pelecehan seksual", isCorrect: false),
        const WiidgetOption(text: "Pemaksaan pendapat", isCorrect: true),
        const WiidgetOption(text: "Cat Calling", isCorrect: false),
      ],
      id: 2,
      correctAnswer:
          const WiidgetOption(text: "Pemaksaan pendapat", isCorrect: true)),
  WidgetQuestion(
      text: "Kekerasan seksual berbentuk verbal diantaranya adalah",
      options: [
        const WiidgetOption(text: "Pemaksaan aborsi", isCorrect: false),
        const WiidgetOption(
            text: "Melontarkan lelucon bernuansa seksual pada seseorang",
            isCorrect: true),
        const WiidgetOption(
            text: "Pemberian hukuman bernuansa seksual", isCorrect: false),
        const WiidgetOption(
            text: "Mengambil foto/video tanpa persetujuan", isCorrect: false),
      ],
      id: 3,
      correctAnswer: const WiidgetOption(
          text: "Melontarkan lelucon bernuansa seksual pada seseorang",
          isCorrect: true)),
  WidgetQuestion(
      text:
          " Memperlihatkan alat kelamin pada orang lain tanpa persetujuan termasuk jenis pelecehan seksual ",
      options: [
        const WiidgetOption(text: "Verbal", isCorrect: false),
        const WiidgetOption(text: "Fisik", isCorrect: false),
        const WiidgetOption(text: "Non fisik", isCorrect: true),
        const WiidgetOption(text: "Jejaring online", isCorrect: false),
      ],
      id: 4,
      correctAnswer: const WiidgetOption(text: "Non fisik", isCorrect: true)),
  WidgetQuestion(
      text: "Memaksa teman menonton video porno termasuk pelecehan seksual",
      options: [
        const WiidgetOption(text: "Betul", isCorrect: true),
        const WiidgetOption(text: "Salah", isCorrect: false),
      ],
      id: 5,
      correctAnswer: const WiidgetOption(text: "Betul", isCorrect: true)),
  WidgetQuestion(
      text:
          " Kekerasan seksual adalah segala perilaku yang menyasar seksual seseorang tanpa persetujuan",
      options: [
        const WiidgetOption(text: "Betul", isCorrect: true),
        const WiidgetOption(text: "Salah", isCorrect: false),
      ],
      id: 6,
      correctAnswer: const WiidgetOption(text: "Betul", isCorrect: true)),
  WidgetQuestion(
      text: "Mengancam menyebarkan video pribadi termasuk pelecehan seksual",
      options: [
        const WiidgetOption(text: "Betul", isCorrect: false),
        const WiidgetOption(text: "Salah", isCorrect: true),
      ],
      id: 7,
      correctAnswer: const WiidgetOption(text: "Salah", isCorrect: true)),
  WidgetQuestion(
      text: "Yang BUKAN termasuk dampak kekerasan seksual pada fisik adalah",
      options: [
        const WiidgetOption(text: "Cedera dan luka di tubuh", isCorrect: false),
        const WiidgetOption(text: "Penyakit menular seksual", isCorrect: false),
        const WiidgetOption(text: "Gangguan tidur", isCorrect: true),
        const WiidgetOption(
            text: "Kehamilan yang tidak dikehendaki", isCorrect: false),
      ],
      id: 8,
      correctAnswer:
          const WiidgetOption(text: "Gangguan tidur", isCorrect: true)),
  WidgetQuestion(
      text:
          "Siapa yang berpotensi melakukan kekerasan seksual? Pilih jawaban yang paling benar?",
      options: [
        const WiidgetOption(text: "Orang tidak dikenal", isCorrect: false),
        const WiidgetOption(text: "Semua orang", isCorrect: true),
        const WiidgetOption(
            text: "Orang dengan riwayat pernah melakukan kekerasan seksual",
            isCorrect: false),
        const WiidgetOption(
            text: "Penyintas kekerasan dan pelecehan seksual",
            isCorrect: false),
      ],
      id: 9,
      correctAnswer: const WiidgetOption(text: "Semua orang", isCorrect: true)),
  WidgetQuestion(
      text:
          "Remaja 17 tahun mau diajak hubungan intim oleh orang dewasa, apakah hal ini termasuk kekerasan seksual?",
      options: [
        const WiidgetOption(
            text: "Bukan kekerasan seksual jika dilandasi suka sama suka",
            isCorrect: false),
        const WiidgetOption(
            text: "Termasuk kekerasan seksual", isCorrect: true),
        const WiidgetOption(
            text: "Bisa termasuk dan bisa juga bukan kekerasan seksual",
            isCorrect: false),
      ],
      id: 10,
      correctAnswer: const WiidgetOption(
          text: "Termasuk kekerasan seksual", isCorrect: true)),
  WidgetQuestion(
      text:
          "Perasaan bersalah, malu, dan takut dipandang buruk oleh masyarakat termasuk dampak psikologis",
      options: [
        const WiidgetOption(text: "Betul", isCorrect: true),
        const WiidgetOption(text: "Salah", isCorrect: false),
      ],
      id: 11,
      correctAnswer: const WiidgetOption(text: "Betul", isCorrect: true)),
  WidgetQuestion(
      text:
          "Remaja korban kekerasan seksual tidak mau keluar rumah karena takut bertemu laki-laki dengan ciri tertentu termasuk dampak ",
      options: [
        const WiidgetOption(text: "Fisik", isCorrect: false),
        const WiidgetOption(text: "Psikologis", isCorrect: true),
        const WiidgetOption(text: "Sosial", isCorrect: false),
      ],
      id: 12,
      correctAnswer: const WiidgetOption(text: "Psikologis", isCorrect: true)),
  WidgetQuestion(
      text:
          "Remaja laki-laki korban kekerasan seksual enggan bersekolah karena takut dicap buruk oleh teman-temannya termasuk dampak",
      options: [
        const WiidgetOption(text: "Fisik", isCorrect: false),
        const WiidgetOption(text: "Psikologis", isCorrect: false),
        const WiidgetOption(text: "Sosial", isCorrect: true),
      ],
      id: 13,
      correctAnswer: const WiidgetOption(text: "Sosial", isCorrect: true)),
];
