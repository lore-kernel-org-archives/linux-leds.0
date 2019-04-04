From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Thu, 4 Apr 2019 13:13:34 -0700
Message-ID: <CAE_wzQ8WcMCzYqvxA_JBZKNza7ca3QE-VShmMxv5++_4F8RR=g@mail.gmail.com>
References: <20190404171007.160878-1-ncrews@chromium.org> <20190404171007.160878-3-ncrews@chromium.org>
 <CABXOdTeFnohENJrZ+=_W-EgsrKWttSFYKoR=LaCwzbhEbaOxzw@mail.gmail.com>
 <CAE_wzQ8xS+zvSKNVs1v4B_y3NDu2qB65p_hD+j=qGHFxQWOmSg@mail.gmail.com>
 <CAHX4x87cQLhZOEDxwBJs=UkDxwGxZOELGjHtp6aFLBWmjyQAFQ@mail.gmail.com>
 <CAE_wzQ8k4vO4yLsr2WNxYQ=-6JDmTsj6OxD0f3P=k8kJYFOD9Q@mail.gmail.com>
 <20190404185919.GB27340@amd> <CAE_wzQ-XuK7WOyPm6yXsmjp7z0=T92mMrfn1TVaavaLejcYVGA@mail.gmail.com>
 <20190404191931.GA29984@amd> <CAE_wzQ8y8i7C+_tv0CdnbUw0r21g1ggv2YUuzCog1xABivEvWA@mail.gmail.com>
 <20190404200658.GD29984@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404200658.GD29984@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Nick Crews <ncrews@chromium.org>, Guenter Roeck <groeck@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 4, 2019 at 1:06 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > > It is *function* and maybe color that userspace is interested in, and
> > > > here we have proper standardization in form of "kbd_backlight". Device
> > > > name is, well, device name. It should uniquely identify the device led
> > > > is attached to, but otherwise is rarely interesting. If userspace is
> > > > really concerned what kind of keyboard backlight it is it should
> > > > investigate parent device(s) and see what they end up with.
> > >
> > > That does not work. Userspace wants to know if it is internal keyboard
> > > or USB keyboard, not what kind of i2c controller the LED is connected
> > > to.
> >
> > Why does userspace want to know it?
>
> For example to turn off backlight on internal keyboard when the lid is closed.

Would you not want to turn off external as well?

And what to do if internal keyboard is not platform but USB? Like
Google "Whiskers"? (I am not sure why you decided to drop my mention
of internal USB keyboards completely off your reply).

>
> > > grep for platform::mic_mute .
> > >
> > > (And platform is even pretty good match for how the LED is connected
> > > in your case).
> >
> > Until we get a secondary interface that is also "platform"...
>
> How would that happen?

It won't happen on Wilco, but you can't imagine that several blocks
get reused in the same device and they end up clashing?

Thanks.

-- 
Dmitry
