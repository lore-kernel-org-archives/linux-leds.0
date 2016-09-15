From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V5] leds: trigger: Introduce a USB port trigger
Date: Thu, 15 Sep 2016 15:33:19 +0200
Message-ID: <CACna6rwU_55+xi3ZtZRAaxiCeBmZGSfMZcMtuRdbj-wV_vj+Lg@mail.gmail.com>
References: <20160908160904.31719-1-zajec5@gmail.com> <20160909093440.GF15637@b29397-desktop>
 <20160909110509.GB6356@kroah.com> <CACna6rxeFqDEH1tnmfS2OhS1eQQt_80Ys_3KhH8YS2OmgbbEGA@mail.gmail.com>
 <20160915125629.GH13132@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160915125629.GH13132@amd>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, Peter Chen <hzpeterchen@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Jonathan Corbet <corbet@lwn.net>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Matthias Brugger <mbrugger@suse.com>, Stephan Linz <linz@li-pro.net>, Boris Brezillon <boris.brezillon@free-electrons.com>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 15 September 2016 at 14:56, Pavel Machek <pavel@ucw.cz> wrote:
> On Fri 2016-09-09 13:31:10, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 9 September 2016 at 13:05, Greg KH <gregkh@linuxfoundation.org> wrote=
:
>> > On Fri, Sep 09, 2016 at 05:34:40PM +0800, Peter Chen wrote:
>> >> On Thu, Sep 08, 2016 at 06:08:24PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>> >> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>> >> >
>> >> > This commit adds a new trigger responsible for turning on LED when =
USB
>> >> > device gets connected to the selected USB port. This can can useful=
 for
>> >> > various home routers that have USB port(s) and a proper LED telling=
 user
>> >> > a device is connected.
>> >> >
>> >> > The trigger gets its documentation file but basically it just requi=
res
>> >> > enabling it and selecting USB ports (e.g. echo 1 > ports/usb1-1).
>> >> >
>> >> > There was a long discussion on design of this driver. Its current s=
tate
>> >> > is a result of picking them most adjustable solution as others coul=
dn't
>> >> > handle all cases.
>> >> >
>> >> > 1) It wasn't possible for the driver to register separated trigger =
for
>> >> >    each USB port. Some physical USB ports are handled by more than =
one
>> >> >    controller and so by more than one USB port. E.g. USB 2.0 physic=
al
>> >> >    port may be handled by OHCI's port and EHCI's port.
>> >> >    It's also not possible to assign more than 1 trigger to a single=
 LED
>> >> >    and implementing such feature would be tricky due to syncing tri=
ggers
>> >> >    and sysfs conflicts with old triggers.
>> >> >
>> >> > 2) Another idea was to register trigger per USB hub. This wouldn't =
allow
>> >> >    handling devices with multiple USB LEDs and controllers (hubs)
>> >> >    controlling more than 1 physical port. It's common for hubs to h=
ave
>> >> >    few ports and each may have its own LED.
>> >> >
>> >> > This final trigger is highly flexible. It allows selecting any USB =
ports
>> >> > for any LED. It was also modified (compared to the initial version)=
 to
>> >> > allow choosing ports rather than having user /guess/ proper names. =
It
>> >> > was successfully tested on SmartRG SR400ac which has 3 USB LEDs,
>> >> > 2 physical ports and 3 controllers.
>> >> >
>> >> > Another planned feature is support for LED reacting to the USB acti=
vity.
>> >> > This can be implemented with another sysfs file for setting mode. T=
he
>> >> > default mode wouldn't change so there won't be ABI breakage and suc=
h
>> >> > feature can be safely implemented later.
>> >> >
>> >>
>> >> It has such driver at: drivers/usb/common/led.c
>> >
>> > Ugh, I thought I had seen something like this before...
>> >
>> > Rafa=C5=82, can you just use this in-kernel code instead?
>>
>> I really don't think I can because of all the reasons I carefully
>> listed in the commit message.
>>
>> Have you took a look at that simple driver? It does nothing I need.
>> Its design doesn't allow implementing features I clearly listed in the
>> commit message.
>
> In any case, the new driver should probably go near the old one, at
> the very least.

I can do that. Anyone objects?

--=20
Rafa=C5=82
