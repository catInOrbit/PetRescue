import 'package:petrescue/bloc/app_general/global.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
class AppGeneralBloc
{
   final Widget selectedScreen;
   Stream<Widget> _selectedScreen = Stream.empty();

   BehaviorSubject<Widget> _inputSinkStream = BehaviorSubject<Widget>();


   Stream<Widget> get images => _selectedScreen;
   Sink<Widget> get sinkIn => _inputSinkStream;

   AppGeneralBloc(this.selectedScreen)
   {
      _selectedScreen = _inputSinkStream.distinct().asBroadcastStream();
   }

   void dispose()
   {
      _inputSinkStream.close();
   }
}

class AppGeneralProvider extends InheritedWidget
{
   final AppGeneralBloc appGeneralBloc;
   @override
   bool updateShouldNotify(InheritedWidget oldWidget)
   {
      return true;
   }

   AppGeneralProvider({Key key, AppGeneralBloc imageBloc, Widget child})
       : this.appGeneralBloc = imageBloc ?? AppGeneralBloc(selectedTab),
          super(child: child, key: key);

   static AppGeneralBloc of(BuildContext context) =>
       (context.dependOnInheritedWidgetOfExactType(aspect: AppGeneralProvider)
       as AppGeneralProvider)
           .appGeneralBloc;
}

