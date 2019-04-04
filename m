From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Thu, 4 Apr 2019 14:48:35 -0700
Message-ID: <CAE_wzQ8xe=x0uYcZkDRVKpUAQ_1vVdEPHU3XnEV1=_WN1-AMfw@mail.gmail.com>
References: <CAHX4x87cQLhZOEDxwBJs=UkDxwGxZOELGjHtp6aFLBWmjyQAFQ@mail.gmail.com>
 <CAE_wzQ8k4vO4yLsr2WNxYQ=-6JDmTsj6OxD0f3P=k8kJYFOD9Q@mail.gmail.com>
 <20190404185919.GB27340@amd> <CAE_wzQ-XuK7WOyPm6yXsmjp7z0=T92mMrfn1TVaavaLejcYVGA@mail.gmail.com>
 <20190404191931.GA29984@amd> <CAE_wzQ8y8i7C+_tv0CdnbUw0r21g1ggv2YUuzCog1xABivEvWA@mail.gmail.com>
 <20190404200658.GD29984@amd> <CAE_wzQ8WcMCzYqvxA_JBZKNza7ca3QE-VShmMxv5++_4F8RR=g@mail.gmail.com>
 <20190404202042.GF29984@amd> <CAE_wzQ-8XwzptH7EqNrELxjBzY2+0oHJGB3Va=vZwwK3csu_aA@mail.gmail.com>
 <20190404204207.GH29984@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404204207.GH29984@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Nick Crews <ncrews@chromium.org>, Guenter Roeck <groeck@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 4, 2019 at 1:42 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > > And what to do if internal keyboard is not platform but USB? Like
> > > > Google "Whiskers"? (I am not sure why you decided to drop my mention
> > > > of internal USB keyboards completely off your reply).
> > >
> > > I don't have answers for everything. Even if you have USB keyboard, you'll
> > > likely still have backlight connected to embedded controller. If not,
> > > then maybe you have exception userland needs to know about.
> > >
> > > Still better than making everything an exception.
> >
> > You do not need to make everything exception. You just need to look
> > beyond the name, and see how the device is connected. And then apply
> > your exceptions for "weird" devices.
>
> "Where it is connected" is not interesting to the userland. "Is it
> backlight for internal keyboard" is the right question. It may be
> connected to embedded controller or some kind of controller over
> i2c... my shell scripts should not need to know about architecture of
> every notebook out there.

Then your scripts will be failing for some setups.

>
> But I don't see why I should do additional work when its trivial for
> kernel to just name the LED in an useful way.
>
> "platform::kbd_backlight" has no disadvantages compared to
> "wilco::kbd_backlight" ... so lets just use it.

It has disadvantages because it promises more than it can deliver IMO.
If device name != "platform::kbd_backlight" it does not mean that it
is not internal keyboard. And you still have not resolved how you will
handle cases when there is more than one deice that can be considered
internal and may have a backlight.

Thanks.

-- 
Dmitry
