import {defaultPageLimit} from '../constants/params';

export function getFormatDateString(longDateString) {
  let date = new Date(longDateString);
  let year = date.getFullYear();
  let month = date.getMonth();
  let day = date.getDay();
  let result = `${year}-${month + 1}-${day + 1}`;
  return result;
}

export function mayLoadPreviousPage(currentOffset, count) {
  let newOffset = currentOffset + defaultPageLimit;
  if (newOffset < count) {
    return newOffset
  } else {
    return currentOffset;
  }
}
