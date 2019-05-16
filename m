From: Kun Yi <kunyi@google.com>
Subject: [PATCH 0/2] Fix LED GPIO trigger behavior
Date: Thu, 16 May 2019 14:42:07 -0700
Message-ID: <20190516214209.139726-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Kun Yi <kunyi@google.com>, jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com, u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

*** BLURB HERE ***
Hello there,

I recently tested ledtrig-gpio on an embedded controller and one of the
issues I had involve not requesting the user input pin as GPIO.

In many embedded systems, a pin could be muxed as several functions, and
requesting the pin as GPIO is necessary to let pinmux select the pin as
a GPIO instead of, say an I2C pin. I'd like to learn whether it is appropriate
to assume user of ledtrig-gpio really intends to use GPIOs and not some
weird pins that are used as other functions.

Kun Yi (2):
  ledtrig-gpio: Request user input pin as GPIO
  ledtrig-gpio: 0 is a valid GPIO number

 drivers/leds/trigger/ledtrig-gpio.c | 35 ++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 11 deletions(-)

-- 
2.21.0.1020.gf2820cf01a-goog
