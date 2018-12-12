From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color properties
Date: Wed, 12 Dec 2018 07:56:20 -0600
Message-ID: <CAL_JsqJPMzwU9h2RSXeCfNTO5+zs7xTOb9jYcGivj+v_2RkG2A@mail.gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com> <dfb5bd23-bcb9-7501-a608-969cb0464168@gmail.com>
 <0a0b176c-4eb4-4b0e-6c3c-b3c6c8f5fff5@gmail.com> <CAL_JsqKEpbJjExkQKSXwYma9wPPO+8E0QMTyWTPs1nkGSd49_g@mail.gmail.com>
 <20181212095929.GA13437@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181212095929.GA13437@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Dec 12, 2018 at 3:59 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > We would also probably need different DT properties for different
> > > types of devices, since e.g. for network case the network interface
> > > name would fit better for the LED name, than the phy name,
> > > and we would need to know what type of device name we're going
> > > to look for.
> > >
> > > Pavel gave following examples:
> > >
> > > eth0:green:link
> > > adsl0:green:link
> > > adsl0:red:error
> > >
> > > So we would have e.g.:
> > >
> > > associated-vl42-device = <&camera1>;
> > > associated-network-device = <&phy1>;
> > > associated-block-device = <&phy1>;
> >
> > Variable property names are kind of a pain to parse.
> >
> > Perhaps when LEDs are associated with a device, we shouldn't care
> > within the context of the LED subsystem what the name is. The
> > association is more important and if you have that exposed, then you
> > don't really need to care what the name is. You still have to deal
> > with a device with more than 1 LED, but that becomes a problem local
> > to that device.
> >
> > What I'm getting at is following a more standard binding pattern of
> > providers and consumers like we have for gpios, clocks, etc. So we'd
> > have something like this:
> >
> > ethernet {
> >   ...
> >   leds = <&green_led>, <&red_led>;
> >   led-names = "link", "err";
> > };
> >
> > We can still support defining LED names as we've done, but we don't
> > have to come up with some elaborate naming convention that covers
> > every single case.
>
> I see that it would be more consistent with how gpios work, but I'm
> afraid this does not fit LEDs properly.
>
> With power LED, you want to be able to say "this is just on". Some
> poeple like heartbeat, and have LED for that. There may be LED for
> "disk activity", meaning activity on any harddrive. And there may be
> activity LED for specific disk.
>
> Only in the last case it would be suitable to have LED reference as a
> child of an device...

Right. For all the other cases, why do you need any link with a
device? What we have today is sufficient and can continue to be
supported. A link to a device is only used if the led is associated
with a particular device.

Rob
