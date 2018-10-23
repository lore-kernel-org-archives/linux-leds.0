From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v2 2/3] leds: upboard: Add LED support
Date: Tue, 23 Oct 2018 21:09:54 +0200
Message-ID: <226e0df2-83f9-bee5-f359-a3e040d12311@gmail.com>
References: <20180421085009.28773-1-javier@emutex.com>
 <1539969334-24577-1-git-send-email-dan@emutex.com>
 <1539969334-24577-3-git-send-email-dan@emutex.com>
 <ede59ef8-7caf-413d-6858-33a1eab5f084@gmail.com> <20181023185453.GA27397@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181023185453.GA27397@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Dan O'Donovan <dan@emutex.com>, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, Carlos Iglesias <carlos.iglesias@emutex.com>, Javier Arteaga <javier@emutex.com>
List-Id: linux-leds@vger.kernel.org

On 10/23/2018 08:54 PM, Pavel Machek wrote:
> Hi!
> 
>>> +	led->field = devm_regmap_field_alloc(dev, regmap, conf);
>>> +	if (IS_ERR(led->field))
>>> +		return PTR_ERR(led->field);
>>> +
>>> +	led->cdev.max_brightness = 1;
>>
>> s/1/LED_ON/
> 
> Actually, I prefer constant 1 here, as it makes it immediately obvious
> this supports just 0/1.
> 
> Yes, LED_ON is also 1, but I had to grep the header files for
> that... (I thought it was 255).

If we have the enum for that, let's use it.
Here's the commit message of the patch adding LED_ON - it should
be somehow familiar to you - see the ack.

commit 4e552c8cb5bc9137e67e035bab8df6dddbca7384
Author: Andi Shyti <andi.shyti@samsung.com>
Date:   Thu Jan 5 11:34:12 2017 +0900

    leds: add LED_ON brightness as boolean value

    Some devices do not handle the led brightness or simply don't
    care about it. Conceptually said devices want to just switch on
    or off the led. It is useless in this case to have a 255 range
    of brightness, while just having an LED_ON and LED_OFF improves
    the boolean meaning of the led status.

    Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
    Acked-by: Pavel Machek <pavel@ucw.cz>
    Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>


-- 
Best regards,
Jacek Anaszewski
