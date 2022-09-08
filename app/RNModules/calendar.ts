import { NativeModules } from 'react-native';

interface ICalendar {
	addEventToCalendar: (title: string, startDate: number, endDate: number) => Promise<string>
}

const Calendar: ICalendar = NativeModules.Calendar;

export {Calendar};