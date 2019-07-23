String invoiceNo = request.getParameter();
InvoiceReportPdf printInvoice = new InvoiceReportPdf(invoiceNo);
ArrayList invoiceData = printInvoice.getInvoiceData();