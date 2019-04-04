From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Thu, 4 Apr 2019 10:43:24 -0700
Message-ID: <CAE_wzQ8xS+zvSKNVs1v4B_y3NDu2qB65p_hD+j=qGHFxQWOmSg@mail.gmail.com>
References: <20190404171007.160878-1-ncrews@chromium.org> <20190404171007.160878-3-ncrews@chromium.org>
 <CABXOdTeFnohENJrZ+=_W-EgsrKWttSFYKoR=LaCwzbhEbaOxzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CABXOdTeFnohENJrZ+=_W-EgsrKWttSFYKoR=LaCwzbhEbaOxzw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <groeck@google.com>
Cc: Nick Crews <ncrews@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, alexandre.belloni@bootlin.com, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 4, 2019 at 10:36 AM Guenter Roeck <groeck@google.com> wrote:
>
> On Thu, Apr 4, 2019 at 10:11 AM Nick Crews <ncrews@chromium.org> wrote:
> >
> > We want all backlights for the system keyboard to
> > use a common name, so the name "platform::kbd_backlight"
> > would be better than the current "chromeos::kbd_backlight"
> > name. Normally this wouldn't be worth changing, but the new
> > Wilco keyboard backlight driver uses the "platform" name.
> > We want to make it so all Chrome OS devices are consistent,
> > so we'll change the name here too.
> >
>
> Wondering - who is the "we" you are talking about ?

This also has a potential of breaking existing setups if somebody did
happen to match on entire name instead of suffix. Such changes have to
be considered very carefully; at this point I am against of doing
this.

Thanks.

-- 
Dmitry
