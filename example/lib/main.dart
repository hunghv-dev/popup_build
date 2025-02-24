import 'package:flutter/material.dart';
import 'package:popup_build/popup_build.dart';

extension PopupIconExt on Popup {
  Popup get all10 => spacing(
        padding: const EdgeInsets.all(10.0),
        contentPadding: const EdgeInsets.all(10.0),
        buttonSpacing: 10.0,
      );

  Popup get handle => icon(const Icon(
        Icons.drag_handle,
        color: Colors.grey,
      ));

  Popup get back => button(Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const BackButton()));

  Popup get close => button(Container(
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: const CloseButton()));
}

class PopupSelection extends PopupBottomSheet {
  PopupSelection({super.key, required List<Widget> widgets})
      : super(
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: ListView.separated(
              itemBuilder: (_, index) => Container(
                alignment: Alignment.center,
                height: 40.0,
                child: widgets[index],
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: widgets.length,
              shrinkWrap: true,
            ),
          ),
          backgroundColor: Colors.transparent,
        ) {
    spacing(
      padding: const EdgeInsets.all(20.0),
      contentPadding: const EdgeInsets.only(bottom: 20.0),
    ).close;
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Builder(
                builder: (context) => Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () => PopupBottomSheet(const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Bottom Sheet'),
                                      TextField(),
                                    ],
                                  )).all10.handle.back.close.show(context),
                              child: const Text('Bottom Sheet')),
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () => PopupSelection(
                                    widgets: const [
                                      Text('Item 1'),
                                      Text('Item 2'),
                                      Text('Item 3'),
                                    ],
                                  ).show(context),
                              child: const Text('Bottom Selection')),
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () => PopupDialog(const Text('Dialog'))
                                  .all10
                                  .close
                                  .show(context),
                              child: const Text('Dialog')),
                        ),
                      ],
                    )),
          ),
        ),
      ),
    ));
