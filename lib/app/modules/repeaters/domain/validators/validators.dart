bool validateAmount(double value) {
  if (value <= 0) return false;
  return true;
}

bool validateDeliveryDate(DateTime value) {
  if (value.isAfter(DateTime.now())) return false;
  return true;
}

bool validateValidity(DateTime value) {
  if (value.isBefore(DateTime.now())) return false;
  return true;
}

bool validateInvoiceValue(double value) {
  if (value < 0) return false;
  return true;
}
