From: Dmitry Torokhov <dtor@google.com>
Subject: Re: [PATCH v5 3/3] platform/chrome: Standardize Chrome OS keyboard
 backlight name
Date: Thu, 4 Apr 2019 13:26:35 -0700
Message-ID: <CAE_wzQ-8XwzptH7EqNrELxjBzY2+0oHJGB3Va=vZwwK3csu_aA@mail.gmail.com>
References: <CABXOdTeFnohENJrZ+=_W-EgsrKWttSFYKoR=LaCwzbhEbaOxzw@mail.gmail.com>
 <CAE_wzQ8xS+zvSKNVs1v4B_y3NDu2qB65p_hD+j=qGHFxQWOmSg@mail.gmail.com>
 <CAHX4x87cQLhZOEDxwBJs=UkDxwGxZOELGjHtp6aFLBWmjyQAFQ@mail.gmail.com>
 <CAE_wzQ8k4vO4yLsr2WNxYQ=-6JDmTsj6OxD0f3P=k8kJYFOD9Q@mail.gmail.com>
 <20190404185919.GB27340@amd> <CAE_wzQ-XuK7WOyPm6yXsmjp7z0=T92mMrfn1TVaavaLejcYVGA@mail.gmail.com>
 <20190404191931.GA29984@amd> <CAE_wzQ8y8i7C+_tv0CdnbUw0r21g1ggv2YUuzCog1xABivEvWA@mail.gmail.com>
 <20190404200658.GD29984@amd> <CAE_wzQ8WcMCzYqvxA_JBZKNza7ca3QE-VShmMxv5++_4F8RR=g@mail.gmail.com>
 <20190404202042.GF29984@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190404202042.GF29984@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Nick Crews <ncrews@chromium.org>, Guenter Roeck <groeck@google.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Benson Leung <bleung@chromium.org>, linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Duncan Laurie <dlaurie@chromium.org>, Simon Glass <sjg@google.com>
List-Id: linux-leds@vger.kernel.org

On Thu, Apr 4, 2019 at 1:20 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Thu 2019-04-04 13:13:34, Dmitry Torokhov wrote:
> > On Thu, Apr 4, 2019 at 1:06 PM Pavel Machek <pavel@ucw.cz> wrote:
> > >
> > > Hi!
> > >
> > > > > > It is *function* and maybe color that userspace is interested i=
n, and
> > > > > > here we have proper standardization in form of "kbd_backlight".=
 Device
> > > > > > name is, well, device name. It should uniquely identify the dev=
ice led
> > > > > > is attached to, but otherwise is rarely interesting. If userspa=
ce is
> > > > > > really concerned what kind of keyboard backlight it is it shoul=
d
> > > > > > investigate parent device(s) and see what they end up with.
> > > > >
> > > > > That does not work. Userspace wants to know if it is internal key=
board
> > > > > or USB keyboard, not what kind of i2c controller the LED is conne=
cted
> > > > > to.
> > > >
> > > > Why does userspace want to know it?
> > >
> > > For example to turn off backlight on internal keyboard when the lid i=
s closed.
> >
> > Would you not want to turn off external as well?
>
> Not really. If I'm using machine with lid closed, external monitor and
> USB keyboard attached, I want to control backlight of USB keyboard,
> but backlight of internal keyboard can stay off.
>
> > And what to do if internal keyboard is not platform but USB? Like
> > Google "Whiskers"? (I am not sure why you decided to drop my mention
> > of internal USB keyboards completely off your reply).
>
> I don't have answers for everything. Even if you have USB keyboard, you'l=
l
> likely still have backlight connected to embedded controller. If not,
> then maybe you have exception userland needs to know about.
>
> Still better than making everything an exception.

You do not need to make everything exception. You just need to look
beyond the name, and see how the device is connected. And then apply
your exceptions for "weird" devices.

>
> > > > > grep for platform::mic_mute .
> > > > >
> > > > > (And platform is even pretty good match for how the LED is connec=
ted
> > > > > in your case).
> > > >
> > > > Until we get a secondary interface that is also "platform"...
> > >
> > > How would that happen?
> >
> > It won't happen on Wilco, but you can't imagine that several blocks
> > get reused in the same device and they end up clashing?
>
> In the end, there will be just one internal keyboard backlight, right?

=C2=AF\_(=E3=83=84)_/=C2=AF Maybe. Maybe not. Who knows what HW designers w=
ill come up with.

Thanks.

--=20
Dmitry
