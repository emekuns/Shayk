# text_editor

A widget that can display text and adapt to text of varies length.

This widget can run on the web, as well as iOS and Android emulators and devices.

4. In order to achieve sending the text displayed with this widget to an email address as a PDF file, I will follow the following steps:
    - Install the package pdf: ^3.6.1 from https://pub.dev/packages/pdf
    - Use the package to transform the text into a pdf file:
        final pdf = pw.Document();

        pdf.addPage(pw.Page(
              pageFormat: PdfPageFormat.a4,
              build: (pw.Context context) {
                return pw.Center(
                  child: pw.Text("Hello World"),
                ); // Center
              })); // Page
    - Save the pdf file to a temporary directory:
        final file = File("example.pdf");
        await file.writeAsBytes(await pdf.save());
    - Install the package flutter_email_sender: ^5.0.2 from https://pub.dev/packages/flutter_email_sender
    - Send the pdf as an attachment of an e-mail to the specified email address:
        final Email email = Email(
          body: 'Email body',
          subject: 'Email subject',
          recipients: ['example@example.com'],
          cc: ['cc@example.com'],
          bcc: ['bcc@example.com'],
          attachmentPaths: ['/path/to/file.pdf'],
          isHTML: false,
        );

        await FlutterEmailSender.send(email);

5. The assumptions I made are as follows:
    - No access to our own pdf rendering service on the cloud
    - No access to our own SMTP server