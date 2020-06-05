import React from 'react';

export default class Footer extends React.Component {
  render() {
    let currentDate = new Date();
    return (
      <div>
        <p>© stormlin {currentDate.getFullYear()}</p>
        <p>Powered by <a href="https://github.com/K9A2/railgun-blog">railgun-blog</a></p>
      </div>
    )
  }
}
