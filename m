From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/2] Fix LED GPIO trigger behavior
Date: Fri, 17 May 2019 18:56:17 +0200
Message-ID: <87d5d4a6-857b-b362-baaf-3a004ee51d49@gmail.com>
References: <20190516214209.139726-1-kunyi@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190516214209.139726-1-kunyi@google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Kun Yi <kunyi@google.com>, linux-leds@vger.kernel.org
Cc: pavel@ucw.cz, dmurphy@ti.com, u.kleine-koenig@pengutronix.de, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Cc Linus Walleij and leds-gpio@vger.kernel.org.

On 5/16/19 11:42 PM, Kun Yi wrote:
> *** BLURB HERE ***
> Hello there,
> 
> I recently tested ledtrig-gpio on an embedded controller and one of the
> issues I had involve not requesting the user input pin as GPIO.
> 
> In many embedded systems, a pin could be muxed as several functions, and
> requesting the pin as GPIO is necessary to let pinmux select the pin as
> a GPIO instead of, say an I2C pin. I'd like to learn whether it is appropriate
> to assume user of ledtrig-gpio really intends to use GPIOs and not some
> weird pins that are used as other functions.
> 
> Kun Yi (2):
>    ledtrig-gpio: Request user input pin as GPIO
>    ledtrig-gpio: 0 is a valid GPIO number
> 
>   drivers/leds/trigger/ledtrig-gpio.c | 35 ++++++++++++++++++++---------
>   1 file changed, 24 insertions(+), 11 deletions(-)
> 

-- 
Best regards,
Jacek Anaszewski
