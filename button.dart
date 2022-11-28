import 'package:calculator/history.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  List<String> hst = ['0'];
  late double a;
  late double b;
  int m=0;
  int set=0;
  String history='';
  String display='';
  String res='';
  String operation='';
  void gohistory(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>History(hst:hst)));

  }
  void Click(String str){
    if(str=='AC'){
      setState(() {
        display='';
        history='';
        res='';
        operation='';
        a=0;
        b=0;
        m=0;
        set=0;
        hst=['0'];
      });
    }
    else if(str=='C' || str=='<'){
      setState(() {
        m=0;
        set=0;
        display='';
        res='';
        operation='';
      });
    }
    else if(str=='1'||str=='2'||str=='3'||str=='4'||str=='5'||str=='6'||str=='7'||str=='8'||str=='9'||str=='0'){
      if(set==0)
        {
          setState(() {
            res+=str;
            display+=str;
          });
        }
      else
        {
          setState(() {
            set=0;
            res=str;
            history=display;
            display=str;
          });
        }
    }
    else if(str=='+'){
      if(set==0)
        {
          setState(() {
            a=double.parse(res);
            res='';
            display+='+';
            operation=str;
          });
        }
        else{
          setState(() {
            a=double.parse(res);
            res='';
            display+=str;
            set=0;
            operation=str;
          });
      }
    }
    else if(str=='-'){
      if(set==0)
      {
        setState(() {
          a=double.parse(res);
          res='';
          display+='-';
          operation=str;
        });
      }
      else{
        setState(() {
          a=double.parse(res);
          res='';
          display+=str;
          set=0;
          operation=str;
        });
      }
    }
    else if(str=='*'){
      if(set==0)
      {
        setState(() {
          a=double.parse(res);
          res='';
          display+='*';
          operation=str;
        });
      }
      else{
        setState(() {
          a=double.parse(res);
          res='';
          display+=str;
          set=0;
          operation=str;
        });
      }
    }
    else if(str=='/'){
      if(set==0)
      {
        setState(() {
          a=double.parse(res);
          res='';
          display+='/';
          operation=str;
        });
      }
      else{
        setState(() {
          a=double.parse(res);
          res='';
          display+=str;
          set=0;
          operation=str;
        });
      }
    }
    else if(str=='.'){
      if(set==0){
        setState(() {
          res+='.';
          display+='.';
        });
      }
      else{}
    }
    else if(str=='@'){
      if(m==0) {
        setState(() {
          res='-$res';
          display='-$display';
          m=1;
        });
      }
    }
    else if(str=='='){
      m=0;
      String temp=display;
      // print(hst);
      setState(() {
        b=double.parse(res);
        res='';
        if(operation=='+'){
          res=(a+b).toString();
          history=display;
          display=res;
          set=1;
        }
        else if(operation=='-'){
          res=(a-b).toString();
          history=display;
          display=res;
          set=1;
        }
        else if(operation=='*'){
          res=(a*b).toString();
          history=display;
          display=res;
          set=1;
        }
        else if(operation=='/'){
          res=(a/b).toString();
          history=display;
          display=res;
          set=1;
        }
        hst.add("$temp = $res");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(right: 16),child: Align(alignment: Alignment.bottomRight,child: Column(children: [Text(history,style: TextStyle(fontSize: 25,color: Colors.grey),),],),),),
            Padding(padding: EdgeInsets.only(right: 16,bottom: 8),child: Align(alignment: Alignment.bottomRight,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,children: [TextButton(onPressed: (){gohistory();}, child: Icon(Icons.history,size: 32,color: Colors.black,)) ,Text(display,style: TextStyle(fontSize: 32,color: Colors.black),),],),),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('AC');}, child: Text('AC'),style: TextButton.styleFrom(backgroundColor: Colors.amberAccent,foregroundColor: Colors.black54,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('C');}, child: Text('C'),style: TextButton.styleFrom(backgroundColor: Colors.amberAccent,foregroundColor: Colors.black54,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('<');}, child: Text('<-'),style: TextButton.styleFrom(backgroundColor: Colors.amberAccent,foregroundColor: Colors.black54,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('+');}, child: Text('+'),style: TextButton.styleFrom(backgroundColor: Colors.amber,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('9');}, child: Text('9'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('8');}, child: Text('8'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('7');}, child: Text('7'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('-');}, child: Text('-'),style: TextButton.styleFrom(backgroundColor: Colors.amber,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('6');}, child: Text('6'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('5');}, child: Text('5'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('4');}, child: Text('4'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('*');}, child: Text('*'),style: TextButton.styleFrom(backgroundColor: Colors.amber,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('3');}, child: Text('3'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('2');}, child: Text('2'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('1');}, child: Text('1'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('/');}, child: Text('/'),style: TextButton.styleFrom(backgroundColor: Colors.amber,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('@');}, child: Text('+/-'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('0');}, child: Text('0'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('.');}, child: Text('.'),style: TextButton.styleFrom(backgroundColor: Colors.grey,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
                SizedBox(height: 70,width: 70,child: TextButton(onPressed: (){Click('=');}, child: Text('='),style: TextButton.styleFrom(backgroundColor: Colors.amber,foregroundColor: Colors.white,padding: const EdgeInsets.all(16.0)),),),
              ],
            )
      ],
        )
    );

      }
}
