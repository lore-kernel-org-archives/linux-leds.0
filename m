From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Tue, 03 Mar 2015 08:48:01 +0100
Message-ID: <54F56731.3050900@samsung.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
 <54F02DF5.1000706@samsung.com> <54F40DDF.8070708@samsung.com>
 <20150302091530.GQ6539@valkosipuli.retiisi.org.uk>
 <CAK5ve-JYixcO6F470wKZXDN-nkTfaRgmg7FBt1Y5O+tuznruwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33588 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750819AbbCCHsG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 3 Mar 2015 02:48:06 -0500
In-reply-to: <CAK5ve-JYixcO6F470wKZXDN-nkTfaRgmg7FBt1Y5O+tuznruwg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>, Ingi Kim <ingi2.kim@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Thierry Reding <treding@nvidia.com>, p.zabel@pengutronix.de, Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, ideal.song@samsung.com

On 03/02/2015 09:07 PM, Bryan Wu wrote:
> On Mon, Mar 2, 2015 at 1:15 AM, Sakari Ailus <sakari.ailus@iki.fi> wr=
ote:
>> H Ingi,
>>
>> On Mon, Mar 02, 2015 at 04:14:39PM +0900, Ingi Kim wrote:
>>> Hi Jacek
>>>
>>> On 2015=EB=85=84 02=EC=9B=94 27=EC=9D=BC 17:42, Jacek Anaszewski wr=
ote:
>>>> Hi Ingi,
>>>>
>>>> On 02/27/2015 02:01 AM, Ingi Kim wrote:
>>>>> This patch supports KTD2692 flash LED driver
>>>>>
>>>>> Ingi Kim (3):
>>>>>     of: Add vendor prefix for Kinetic technologies
>>>>>     leds: ktd2692: add device tree bindings for ktd2692
>>>>>     leds: Add ktd2692 flash LED driver
>>>>>
>>>>>    .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
>>>>>    .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>>>>>    drivers/leds/Kconfig                               |    8 +
>>>>>    drivers/leds/Makefile                              |    1 +
>>>>>    drivers/leds/leds-ktd2692.c                        |  245 ++++=
++++++++++++++++
>>>>>    5 files changed, 274 insertions(+)
>>>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds=
-ktd2692.txt
>>>>>    create mode 100644 drivers/leds/leds-ktd2692.c
>>>>>
>>>>
>>>> In your device tree binding documentation there is torch-gpio ment=
ioned,
>>>> but you seem not to use it in the driver.
>>>>
>>>> We have already LED Flash class (/drivers/leds/led-class-flash.c) =
for
>>>> this type of devices, which handles both torch and flash modes
>>>> (flash_strobe sysfs attribute is provided for strobing the flash).
>>>>
>>>> The reference drivers using LED Flash class are still pending [1],=
 but I
>>>> think that at least leds-aat1290 driver is almost ready for mergin=
g.
>>>> It controls very similar device to yours.
>>>>
>>>> Another advantage of using LED Flash class is that it has been des=
igned
>>>> to be compatible with Video for Linux 2 subsystem, which will allo=
w for registering LED Flash class devices as a V4L2 sub-devices.
>>>>
>>>> Adding Sakari.
>>>>
>>>
>>> Ok, I'll check LED Flash class, and add torch-gpio
>>
>> Many LED flash chips include a hardware pin for torch control but fe=
w really
>> need it. If you don't, i.e. you can implement the torch using the co=
ntrol bus
>> instead, I think I'd probably drop it from the chip's DT bindings.
>>
>
> Ingi, please follow Jacek's advice to use LED Flash class interface.
> I'm reviewing those leds flash drivers and probably merge them soon.

Bryan please hold on with merging them as I am about to send new patch
set, as we've agreed that synchronized strobe feature should be removed
from the LED Flash class. There will be also some tweaking around
aat1290 DT bindings.

--=20
Best Regards,
Jacek Anaszewski
