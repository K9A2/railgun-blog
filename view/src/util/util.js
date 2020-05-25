import {defaultPageLimit} from "../constants/params";

export function getFormatDateString(longDateString) {
  let date = new Date(longDateString);
  let year = date.getFullYear();
  let month = date.getMonth();
  let day = date.getDay();
  return `${year}-${month + 1}-${day}`;
}

export function mayLoadPreviousPage(currentOffset, count) {
  let newOffset = currentOffset + defaultPageLimit;
  if (newOffset < count) {
    return newOffset
  } else {
    return currentOffset;
  }
}
