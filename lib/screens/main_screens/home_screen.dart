import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';
import '../../services/API/remote_service.dart';
import '../../services/components/typewriter_text.dart';
import '../../services/firestore_cloud/HistoryService.dart';
import '../../services/stocks/stocks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final _formkey = GlobalKey<FormState>();
  TextEditingController stocksymbol = TextEditingController();
  TextEditingController stockname = TextEditingController();
  TextEditingController purchasedate = TextEditingController();
  TextEditingController selldate = TextEditingController();
  TextEditingController quantity = TextEditingController();
  DateTime dateTime = DateTime.now();
  List<Map<String,String>> _foundresults = [];
  Future<void> _selectDate(TextEditingController date) async{
    DateTime? picked = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime.now());
    if(picked != null){
      setState(() {
        date.text = picked.toString().split(' ')[0];
      });
    }
  }
  double purchaserate = 0;
  double sellrate = 0;
  final TextEditingController _searchController = TextEditingController();
  double average(double a,double b){
    return ((a+b)/2);
  }
  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      _foundresults = _filterResults(_searchController.text);
    });

    super.initState();
  }
  List<Map<String,String>> _filterResults(String enteredKeyword){
    List<Map<String,String>> results = [];
    if(enteredKeyword.isEmpty){
      results = stockList;
    }
    else{
      results = stockList
          .where((user) => user['stock']!
          .toLowerCase().contains(enteredKeyword
          .toLowerCase()))
          .toList();
    }
    return results;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // SvgPicture.asset('assets/icons/home.svg'),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.055555556),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.065359477,
                      child: Row(
                        children: [
                          SizedBox(width: width * 0.027777778,),
                          Text('Equity',
                            style: GoogleFonts.sourceCodePro(
                                fontSize: 20,
                                color: Colors.green
                            ),),
                          Text('Math',
                            style: GoogleFonts.sourceCodePro(
                                fontSize: 20,
                                color: Colors.red
                            ),),
                        ],
                      ),
        
                    ),
                    const Divider(),
                    SizedBox(height:height * 0.026143791 ,),
                    Center(
                        child: TypewriterText(text: 'Traded',homescreen: true,)
                    ),
                    Center(
                      child: Text('A Stock?',
                        style: GoogleFonts.sourceCodePro(fontSize: 30,color: Colors.white),),
                    ),
                    SizedBox(height: height * 0.026143791,),
                    Text('Enter the details of the stock',style: GoogleFonts.sourceCodePro(color: Colors.white38,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.010457516,bottom: width * 0.044444444),
                      child: TextFormField(
                        readOnly: true,
                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (context,StateSetter setState){
                                  return AlertDialog(
                                    title:TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Search For a Stock',
                                        hintStyle: GoogleFonts.sourceCodePro(
                                            fontWeight: FontWeight.bold
                                        ),

                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10)
                                        ),

                                      ),
                                      controller: _searchController,
                                      onChanged: (val){

                                        setState(() {
                                          _foundresults = _filterResults(_searchController.text);
                                        });
                                      },
                                    ),
                                    content: ListView.builder(
                                      shrinkWrap: false, // Set shrinkWrap to true
                                      itemCount: _foundresults.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: (){
                                            setState((){
                                              stocksymbol.text = '${_foundresults[index]['symbol']}.BSE';
                                              stockname.text = _foundresults[index]['stock']!;
                                              Navigator.pop(context);

                                              // Navigator.pop(context);
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8),
                                            child: Text(_foundresults[index]['stock'].toString(),
                                            style: GoogleFonts.sourceCodePro(
                                              letterSpacing: 0.01,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w400
                                            ),),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        style: GoogleFonts.sourceCodePro(
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          hintText: 'Stock Name',
                          hintStyle: GoogleFonts.sourceCodePro(
                              fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),

                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                  CupertinoIcons.graph_circle_fill,
                                color: Colors.white,
                              )
                          ),

                        ),
                        controller: stockname,
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Enter The Stock Name';
                          }
                          return null;
                        },
                      ),
                    ),
        
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.010457516,bottom: width * 0.044444444),
                            child: TextFormField(
                              onChanged: (val){},
                              style: GoogleFonts.sourceCodePro(color: Colors.white),
                              controller: quantity,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                FilteringTextInputFormatter.digitsOnly
                              ],
        
                              decoration: InputDecoration(
                                hintText: 'No. of Stock',
                                hintStyle: GoogleFonts.sourceCodePro(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8),
                                    child: Icon(
                                        CupertinoIcons.number,
                                      color: Colors.white,
                                    )
                                ),
        
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Enter The Stock Symbol';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.010457516,bottom: width * 0.044444444),
                            child: TextFormField(
                              onTap: (){
                                _selectDate(purchasedate);
                              },
                              onChanged: (val){},
                              controller: purchasedate,
                              readOnly: true,
                              style: GoogleFonts.sourceCodePro(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Purchase Date',
                                hintStyle: GoogleFonts.sourceCodePro(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
        
                                labelStyle: GoogleFonts.sourceCodePro(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                      CupertinoIcons.calendar,
                                    color: Colors.white,
                                  ),
                                ),
        
        
        
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Enter the Stock Symbol';
                                }
                                return null;
                              },
        
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.010457516,bottom: width * 0.044444444),
                            child: TextFormField(
                              onTap: (){
                                _selectDate(selldate);
                              },
                              onChanged: (val){},
                              style: GoogleFonts.sourceCodePro(color: Colors.white),
                              controller: selldate,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: 'Sell Date',
                                hintStyle: GoogleFonts.sourceCodePro(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
        
                                labelStyle: GoogleFonts.sourceCodePro(color: Colors.white),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                      CupertinoIcons.calendar,
                                    color: Colors.white,
                                  ),
                                ),
        
        
        
                              ),
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return 'Enter the Stock Symbol';
                                }
                                return null;
                              },
        
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.013071895,),
                    Center(
                      child: ElevatedLayerButton(
                        onClick: () async {
                          if(_formkey.currentState!.validate()){
                            final rates = await RemoteService().getRates(stocksymbol.text);
                            double phigh = double.parse(rates!['Time Series (Daily)'][purchasedate.text]['2. high']);
                            double plow = double.parse(rates['Time Series (Daily)'][purchasedate.text]['3. low']);
                            double shigh = double.parse(rates['Time Series (Daily)'][selldate.text]['2. high']);
                            double slow = double.parse(rates['Time Series (Daily)'][selldate.text]['3. low']);
                            purchaserate = average(phigh, plow);
                            sellrate = average(shigh, slow);
                            await Historyservice().saveTransaction(stocksymbol.text, purchasedate.text, selldate.text, double.parse(quantity.text), purchaserate, sellrate,stockname.text);

                          }
                          else{
                            if (kDebugMode) {
                              print('Error');
                            }
                          }
        
        
                        },
                        buttonHeight: height * 0.058823529,
                        buttonWidth: width * 0.694444444,
                        animationDuration: const Duration(milliseconds: 50),
                        animationCurve: Curves.easeIn,
                        topDecoration: BoxDecoration(
                            color: const Color.fromARGB(255, 130, 123, 230),
                            border: Border.all(),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        topLayerChild: Text('Update Portfolio',style: GoogleFonts.sourceCodePro(fontSize: 20,color: Colors.white),),
                        baseDecoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Colors.white
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
        
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}