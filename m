From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Tue, 03 Mar 2015 11:55:58 +0900
Message-ID: <54F522BE.6080708@samsung.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
 <54F02DF5.1000706@samsung.com> <54F40DDF.8070708@samsung.com>
 <20150302091530.GQ6539@valkosipuli.retiisi.org.uk>
 <CAK5ve-JYixcO6F470wKZXDN-nkTfaRgmg7FBt1Y5O+tuznruwg@mail.gmail.com>
 <20150302220315.GU6539@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63356 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753744AbbCCC4C (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Mar 2015 21:56:02 -0500
In-reply-to: <20150302220315.GU6539@valkosipuli.retiisi.org.uk>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Sakari Ailus <sakari.ailus@iki.fi>, Bryan Wu <cooloney@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Thierry Reding <treding@nvidia.com>, p.zabel@pengutronix.de, Andrew Lunn <andrew@lunn.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, ideal.song@samsung.com

Hi

On 2015=EB=85=84 03=EC=9B=94 03=EC=9D=BC 07:03, Sakari Ailus wrote:
> Hi Bryan,
>=20
> On Mon, Mar 02, 2015 at 12:07:42PM -0800, Bryan Wu wrote:
>> On Mon, Mar 2, 2015 at 1:15 AM, Sakari Ailus <sakari.ailus@iki.fi> w=
rote:
>>> H Ingi,
>>>
>>> On Mon, Mar 02, 2015 at 04:14:39PM +0900, Ingi Kim wrote:
>>>> Hi Jacek
>>>>
>>>> On 2015=EB=85=84 02=EC=9B=94 27=EC=9D=BC 17:42, Jacek Anaszewski w=
rote:
>>>>> Hi Ingi,
>>>>>
>>>>> On 02/27/2015 02:01 AM, Ingi Kim wrote:
>>>>>> This patch supports KTD2692 flash LED driver
>>>>>>
>>>>>> Ingi Kim (3):
>>>>>>    of: Add vendor prefix for Kinetic technologies
>>>>>>    leds: ktd2692: add device tree bindings for ktd2692
>>>>>>    leds: Add ktd2692 flash LED driver
>>>>>>
>>>>>>   .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
>>>>>>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>>>>>>   drivers/leds/Kconfig                               |    8 +
>>>>>>   drivers/leds/Makefile                              |    1 +
>>>>>>   drivers/leds/leds-ktd2692.c                        |  245 ++++=
++++++++++++++++
>>>>>>   5 files changed, 274 insertions(+)
>>>>>>   create mode 100644 Documentation/devicetree/bindings/leds/leds=
-ktd2692.txt
>>>>>>   create mode 100644 drivers/leds/leds-ktd2692.c
>>>>>>
>>>>>
>>>>> In your device tree binding documentation there is torch-gpio men=
tioned,
>>>>> but you seem not to use it in the driver.
>>>>>
>>>>> We have already LED Flash class (/drivers/leds/led-class-flash.c)=
 for
>>>>> this type of devices, which handles both torch and flash modes
>>>>> (flash_strobe sysfs attribute is provided for strobing the flash)=
=2E
>>>>>
>>>>> The reference drivers using LED Flash class are still pending [1]=
, but I
>>>>> think that at least leds-aat1290 driver is almost ready for mergi=
ng.
>>>>> It controls very similar device to yours.
>>>>>
>>>>> Another advantage of using LED Flash class is that it has been de=
signed
>>>>> to be compatible with Video for Linux 2 subsystem, which will all=
ow for registering LED Flash class devices as a V4L2 sub-devices.
>>>>>
>>>>> Adding Sakari.
>>>>>
>>>>
>>>> Ok, I'll check LED Flash class, and add torch-gpio
>>>
>>> Many LED flash chips include a hardware pin for torch control but f=
ew really
>>> need it. If you don't, i.e. you can implement the torch using the c=
ontrol bus
>>> instead, I think I'd probably drop it from the chip's DT bindings.
>>>
>>
>> Ingi, please follow Jacek's advice to use LED Flash class interface.
>> I'm reviewing those leds flash drivers and probably merge them soon.
>>
>> Jacek and Sakari thanks for the review.
>>
>> Sakari, so what's the control bus your mentioned here?
>=20
> I wasn't cc'd in the original patch so I didn't know whether it was I=
2C or
> not. Doesn't appear to be.
>=20

Thanks for the review and I'll work to use LED Flash class interface
and try adding torch-gpio(flash mode enable) line (I'll rename those gp=
io lines)

Sakari,
ktd2692 flash led device is controlled through Expresswire single-wire =
interface
by using the strobe-gpio(control) pin.=20


Adding pin information of the KTD2692.

CTRL pin can control LED on/off and Movie/Flash mode current,
=46lash timeout, LVP(low voltage protection).

AUX pin(torch-gpio) allows highest priority ON/OFF flash mode control.
