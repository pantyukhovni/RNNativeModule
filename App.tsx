import React, {useEffect} from 'react';
import {Alert, Button, NativeEventEmitter, SafeAreaView, View} from 'react-native';

// import {Battery} from './app/RNModules/battery';
import {Calendar} from './app/RNModules/calendar';

const App = () => {
  
  const onPress = () => {
    Calendar.addEventToCalendar('Новое событие сегодня');
  };
  
  
  return (
    <SafeAreaView>
      <View>
        <Button title="Создание события в календаре" onPress={onPress} />
      </View>
    </SafeAreaView>
  );
};

export default App;
