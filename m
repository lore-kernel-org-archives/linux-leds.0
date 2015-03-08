From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: gpio_request() vs __gpio_get()
Date: Sun, 8 Mar 2015 17:14:55 -0300
Message-ID: <CAKi4VAKQ1b0ouxXTxPczZQbPSWCnwnu3tgozWok=xdGDy7AsBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

I was looking at drivers/leds/ in how it interacts with gpiolib. I see
that there's a new gpiod_* API.
"git grep gpio_request -- drivers/leds/" reveals quite a number of
users of gpio_request() and gpio_request_one().

Am I right that these are going to be ported to the new gpiod_* API?
If yes, what would be the equivalent calls?  I thought it would be one
of the __gpiod_get() functions, but these would invariably fail if I
passed dev == NULL which is my case.


thanks

-- 
Lucas De Marchi
