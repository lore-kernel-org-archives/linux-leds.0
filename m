From: Nick Crews <ncrews@chromium.org>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Thu, 4 Apr 2019 12:41:30 -0600
Message-ID: <CAHX4x87cQLhZOEDxwBJs=UkDxwGxZOELGjHtp6aFLBWmjyQAFQ@mail.gmail.com>
References: <20190404171007.160878-1-ncrews@chromium.org> <20190404171007.160878-3-ncrews@chromium.org>
 <CABXOdTeFnohENJrZ+=_W-EgsrKWttSFYKoR=LaCwzbhEbaOxzw@mail.gmail.com> <CAE_wzQ8xS+zvSKNVs1v4B_y3NDu2qB65p_hD+j=qGHFxQWOmSg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE_wzQ8xS+zvSKNVs1v4B_y3NDu2qB65p_hD+j=qGHFxQWOmSg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dtor@google.com>
Cc: Guenter Roeck <groeck@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 4, 2019 at 11:43 AM Dmitry Torokhov <dtor@google.com> wrote:
>
> On Thu, Apr 4, 2019 at 10:36 AM Guenter Roeck <groeck@google.com> wrote:
> >
> > On Thu, Apr 4, 2019 at 10:11 AM Nick Crews <ncrews@chromium.org> wrote:
> > >
> > > We want all backlights for the system keyboard to
> > > use a common name, so the name "platform::kbd_backlight"
> > > would be better than the current "chromeos::kbd_backlight"
> > > name. Normally this wouldn't be worth changing, but the new
> > > Wilco keyboard backlight driver uses the "platform" name.
> > > We want to make it so all Chrome OS devices are consistent,
> > > so we'll change the name here too.
> > >
> >
> > Wondering - who is the "we" you are talking about ?

You're right, I should have been more precise.
I was referring to Pavel, Enric, and myself. Pavel had this opinion here:
https://lkml.org/lkml/2019/4/4/1040. I don't know what Pavel meant by "we"
in that comment, but I would guess that could mean the other LED maintainers
as well? I talked with Enric 1:1 and he didn't see the problem with changing it,
though perhaps he was only considering our use of the LED via powerd,
and not users in general. I'm guessing Pavel's and Enric's meanings though,
excuse me if I am misinterpreting.

>
> This also has a potential of breaking existing setups if somebody did
> happen to match on entire name instead of suffix. Such changes have to
> be considered very carefully; at this point I am against of doing
> this.

Would it make sense to keep the old name as is, and only make the new
Wilco name begin with "platform:"? What would you think is best?

>
> Thanks.
>
> --
> Dmitry
