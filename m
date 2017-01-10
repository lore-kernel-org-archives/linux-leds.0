From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 1/1 RFC] gpio: Pass GPIO label down to gpiod_request when
 using get_gpiod_from_child
Date: Tue, 10 Jan 2017 20:57:28 +0100
Message-ID: <276e7387-2c87-3bd4-8992-57a928e33dfc@gmail.com>
References: <20161215085321.20337-1-alexander.stein@systec-electronic.com>
 <CACRpkdb1gyXH0+O6P5scVD5_go07fbc3ydp61rG=7CypdXvJ2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdb1gyXH0+O6P5scVD5_go07fbc3ydp61rG=7CypdXvJ2A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Pavel Machek <pavel@ucw.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

Hi Linus,

On 01/09/2017 03:53 PM, Linus Walleij wrote:
> On Thu, Dec 15, 2016 at 9:53 AM, Alexander Stein
> <alexander.stein@systec-electronic.com> wrote:
> 
>> Currently all users of fwnode_get_named_gpiod() have no way to specify a
>> label for the GPIO. So GPIOs listed in debugfs are shown with label "?".
>> With this change a proper label is used.
>> Also adjust all users so they can pass a label, properly retrieved from
>> device tree properties.
>>
>> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
>> ---
>> This patchset addresses the problem described in
>> https://www.spinics.net/lists/linux-leds/msg07233.html
>>
>> I can only verify leds-gpio usage, but changes to gpio_keys_polled and
>> amba-clcd-nomadik seem pretty straight forward.
> 
> I I like this, I have been annoyed by this too. Thank you for
> looking into this.
> 
>> If this is the right thing to do, I need to know who I shall CC for
>> patch approval.
> 
> I can simply test and merge the CLCD patch myself.
> 
> Ideally I'd like Dmitry Torokhov to ACK the input patch
> and Jacek to ACK the LEDs patch and I will merge it.

For leds-gpio driver:

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski
