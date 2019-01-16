From: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 2/2] leds: lp50xx: Add the LP50XX family of the RGB LED
 driver
Date: Wed, 16 Jan 2019 17:33:27 -0600
Message-ID: <8c7dde3e-5f3c-80a5-ec57-73ce8e39deef@ti.com>
References: <20190114211723.11186-1-dmurphy@ti.com>
 <20190114211723.11186-2-dmurphy@ti.com>
 <ce911fdf-c7c2-63e8-5c7a-b0be965ab69b@gmail.com> <20190115222223.GA17363@amd>
 <79394d17-3124-75b2-ccac-dc1046499d14@ti.com> <20190116105537.GA1803@amd>
 <86299268-3202-814a-134b-04bd2170faab@ti.com> <20190116220401.GA28024@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116220401.GA28024@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dachaac@gmail.com, robh+dt@kernel.org
List-Id: linux-leds@vger.kernel.org

Hello

On 1/16/19 4:04 PM, Pavel Machek wrote:
> Hi!
> 
> ..snip. Let me read it and reply when I have a time.
> 
>>> You know what? First, submit driver with similar functionality to
>>> existing RGB drivers, using same interface existing drivers are
>>> using. When that is accepted, we can talk about extending
>>> kernel<->user interfaces.
>>>
>>
>> I could do that but then there is no way for users to have any other color but "white" with this driver.
>> That defeats the purpose of the device itself.
> 
> No, that is not what I meant.
> 
> We do have RGB drivers in tree, they just present three separate LEDs
> -- red, green and blue. I ask you to do the same for initial
> submission.
> 

For clarification you are asking me to register a LED class per output pin?

If that is not you mean can you point me to an example because looking through the code I see the
lp5562, bd2802 and lp3944 of which none are equivalent to the LP50xx devices.  Each one
of those devices have a dedicated register per LED output which makes perfect sense to do what
you are asking.

If it is what you are asking then this was already explained and it was agreed in the email chain to provide
a Class with a "brightness" file that maps to the Master brightness register and
the "color" file that would map to the respective color control register.
These registrations would be per LED Module output and Banked output and not per LED output.

RED LED Color Control Register------|					 |------| RED LED OUTPUT
Green LED Color Control Register----|--- LED Master Brightness register--|------| Green LED OUTPUT
Blue LED Color Control Register-----|					 |------| Blue LED OUTPUT

As explained before the Master brightness register has absolute control over the output current
to the LED outputs regardless of the color control setting.

> You'll still be able to set brightness independently on the
> red/green/blue LEDs...
> 

But which one would control the overall brightness of the cluster?

Dan

>> I am not sure if you are aware of this or care but I found this recent blog on this effort:
>> https://www.phoronix.com/scan.php?page=news_item&px=Linux-RGB-LED-Interface
>> See some of the comments.
> 
> I went through the comments quickly, but see nothing really
> interesting.
> 
> Best regards,
> 
> 									Pavel
> 


-- 
------------------
Dan Murphy
