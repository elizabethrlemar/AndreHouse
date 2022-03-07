import 'package:test/test.dart';
import 'package:andre_house/login_page.dart';

void main(){

  test('First Test',(){

    final ScreenState createState()=>ScreenState;

    expect(createState.return,ScreenState);

  });

}