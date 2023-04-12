// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:translate/models/language_code_model.dart';
import 'package:translate/ui/widgets/modal_widget.dart';
import 'package:translate/utils/helper/helper.dart';
import 'package:translator/translator.dart';

import '../api/api.dart';
import 'widgets/text_field_widget.dart';
import 'widgets/rich_text_widgets.dart';
import 'widgets/translate_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //for translated
  final TextEditingController _translatedEditingController =
      TextEditingController();

  //google translator
  final translator = GoogleTranslator();

  List<LanguageCodeModel>? languageCodeList;
  List<String>? languageNameList;

  String? selectedFrom;
  String? selectedTo;


  //slected from and to language code set english has default

  String  slcfromLcode =  'en';
  String slctoLcode = 'en';

  // length of textfield
  int currentLength = 0;

  //input text
  String? inputText;

  //isloading
  bool isloading = false;

  @override
  void initState() {
    getLaanguageList();

    _translatedEditingController.text = '';

    super.initState();
  }

  //get all language list

  Future getLaanguageList() async {
    isloading = true;
    languageCodeList = await getLanguages();

    setState(() {});
  }

  //for text translate

  Future textTranslation() async {

    if (inputText == null || inputText == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('please input your data')));
    } else {
      final translation = await translator.translate(inputText!,
          from: slcfromLcode, to: slctoLcode);
      _translatedEditingController.text = translation.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: languageCodeList == null
              ? const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Text Translation',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //from
                        TranslateButton(
                          onPressed: () async {
                            slcfromLcode = await showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ModalSheet(
                                  itemsList: languageCodeList,
                                );
                              },
                            );
                            selectedFrom = getLanguageName(slcfromLcode); 

                            setState(() {});
                          },
                          text: selectedFrom??'from',
                        ),
                        const Icon(
                          Icons.sync_alt,
                          size: 16,
                        ),

                        //to
                        TranslateButton(
                          text: selectedTo ?? 'to',
                          onPressed: () async {
                            slctoLcode = await showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return ModalSheet(
                                  itemsList: languageCodeList,
                                );
                              },
                            );

                            selectedTo = getLanguageName(slctoLcode);

                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    RichTextWidget(
                      text: 'Translate From',
                      subText: selectedFrom ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //input your language
                    TextFieldWidget(
                      maxlength: 2000,
                      currentLength: currentLength,
                      onChanged: (value) async {
                        inputText = value;
                        setState(() {
                          currentLength = value.length;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //translate button
                    SizedBox(
                      width: double.maxFinite,
                      child: TranslateButton(
                          text: 'Translate', onPressed: () {

                            textTranslation();
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichTextWidget(
                      text: 'Translated To',
                      subText: selectedTo ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //translated
                    TextFieldWidget(
                      textController: _translatedEditingController,
                      maxlength: 2000,
                      readOnly: true,
                      currentLength: _translatedEditingController.text.length,
                    )
                  ],
                ),
        )),
      ),
    );
  }
}

