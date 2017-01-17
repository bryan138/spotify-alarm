import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

static final int FADE_IN_TIME = 300;

float background;
int sizeUnit;
PFont hourFont;
PFont textFont;

void setup() {
  fullScreen();
  background = 0;
  sizeUnit = (width > 1920) ? 128 : 64;

  hourFont = loadFont(String.format("LemonMilk-%d.vlw", sizeUnit * 2));
  textFont = loadFont(String.format("Champagne&Limousines-%d.vlw", sizeUnit));
  textAlign(CENTER, CENTER);
}

void draw() {
  background(background);
  fill(255 - background);
  if (background < 255) {
    background += 255.0 / (FADE_IN_TIME * 30);
  }

  // Time
  textFont(hourFont);
  textSize(sizeUnit * 2);
  int hour = hour();
  if (hour > 12) hour -= 12;
  String timeString = String.format("%02d:%02d", hour, minute());
  text(timeString, width / 2, height / 2 - (sizeUnit / 2));

  // Date
  textFont(textFont);
  textSize(sizeUnit);
  String pattern = "EEEEE,  MMMMM dd";
  SimpleDateFormat format = new SimpleDateFormat(pattern, Locale.ENGLISH); 
  String dateString = format.format(new Date()).toUpperCase();
  text(dateString, width / 2, height / 2 + (sizeUnit * 2));
}