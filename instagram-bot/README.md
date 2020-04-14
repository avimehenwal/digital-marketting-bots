# Instagram Bot

```
chromedriver --version
ChromeDriver 81.0.4044.69 (6813546031a4bc83f717a2ef7cd4ac6ec1199132-refs/branch-heads/4044@{#776})

google-chrome-stable --version
Google Chrome 81.0.4044.92
```

## Issues

* Always update pip before installtion
  * ` pip install --upgrade pip`
* Internet Connection Status: error
  * [disable instaggram site status checking](https://github.com/InstaPy/instapy-quickstart/issues/118)
* Cookie file not found, creating cookie... Login A/B test detected! Trying another string...
  * https://github.com/timgrossmann/InstaPy/issues/5351
* [Scroll seems to works on chrome](https://github.com/robotframework/SeleniumLibrary/pull/1083)

```sh
kill -9 (pgrep firefox); python instagram-bot/quickstart.py --username abcd --password 1234

kill -9 (pgrep firefox);robot --variablefile vars.yaml --outputdir output instagram-bot/instagram.robot
```