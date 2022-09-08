import React, {useEffect} from 'react';
import {Alert, Button, NativeEventEmitter, SafeAreaView, View} from 'react-native';

// import {Battery} from './app/RNModules/battery';
import {Calendar} from './app/RNModules/calendar';

const App = () => {

  const onPress = async () => {
    try {
      const res = await Calendar.addEventToCalendar(
        'Важное событие',
        new Date('2022-09-08').getUTCDate(),
        new Date('2022-09-08').getUTCDate()
      );
      if (res) {
        Alert.alert(res);
      }
    } catch (e) {
      console.log('Error', e);
      Alert.alert(e.message);
    }
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
