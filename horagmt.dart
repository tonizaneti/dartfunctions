import 'package:intl/intl.dart';

void main() {
  // Obtém a data e hora atual
  DateTime now = DateTime.now();
  String dataOriginal = DateFormat("yyyy-MM-dd HH:mm:ss").format(now);

  print("Data Original: $dataOriginal");

  // Formata a hora no formato "XXhXXmXXs"
  String novaHora = "${now.hour}h${now.minute}m${now.second}s";
  print("Hora BR: $novaHora");

  int horaBR = now.hour;
  int horaGMT;
  int novoDiaGMT = now.day;

  if (horaBR >= 21) {
    horaGMT = horaBR - 21 + 3;
    novoDiaGMT += 1; // Adiciona um dia se passou da meia-noite no GMT
  } else {
    horaGMT = horaBR + 3;
  }

  // Garante que o dia tenha dois dígitos
  String diaFormatado = novoDiaGMT < 10 ? "0$novoDiaGMT" : "$novoDiaGMT";

  // Formata o horário GMT
  String horarioGMT = "$horaGMT" "h" "${now.minute}" "min" "${now.second}" "s";
  String dataUTC = "${now.year}-${now.month.toString().padLeft(2, '0')}-$diaFormatado $horarioGMT";

  print("Horário GMT: $horarioGMT");
  print("Data UTC: $dataUTC");
}
