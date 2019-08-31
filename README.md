![Hero](./screenshots/hero.jpeg)
A Widget for Garmin ConnectIQ (currently: VivoActive3 / Music)

## Intention
This is a simple widget used to mark / log the times you feed your baby.
I created this during my parental leave to help me remember when the baby had his last meal.

The data is directly stored on the device.
The last 10 feeds are stored.

## Use
- Tap on the yellow button at the top to add a new feed time
- Tap on the three dots at the bottom to open the log screen with the ten last feed times.
- On the second screen:
-- Scroll up and down to see all ten entries
-- Swipe left to go back

## Screenshots
![VivoActive3 Main Screen](./screenshots/vivoactive3_Main.PNG)
![VivoActive3 Log Screen](./screenshots/vivoactive3_Log.PNG)

## Disclaimer
This is my first ConnectIQ app and I tailored it completely to my wishes / needs.
It may or may not be improved in the future.
Feel free to send me any comments.

## Develop
- Install JDK8
- Install Garmin ConnectIQ SDK
- Create file `properties.mk` in project root. Follow the guide at https://github.com/danielsiwiec/garmin-connect-seed
- Run `make run` to run in simulator and `make deploy` to deploy on watch.

### Install JDK8 on macOS

```
brew tap AdoptOpenJDK/openjdk
brew cask install adoptopenjdk8
brew install jenv   # add follow the console output to setup your shell
```

Following instruction on https://github.com/jenv/jenv to setup `jenv` 

Set to use JDK8 in this project:

```
jenv local 1.8
```

## Credits
- Baby bottle (on upper right combo button): Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a>
- Application icon: Icons made by <a href="http://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a>

## Contact
[fh.development@zoho.eu](fh.development@zoho.eu)
