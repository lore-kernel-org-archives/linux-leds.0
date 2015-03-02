From: Ingi Kim <ingi2.kim@samsung.com>
Subject: Re: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Mon, 02 Mar 2015 16:14:39 +0900
Message-ID: <54F40DDF.8070708@samsung.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
 <54F02DF5.1000706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33860 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750834AbbCBHOv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 2 Mar 2015 02:14:51 -0500
In-reply-to: <54F02DF5.1000706@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, cooloney@gmail.com, rpurdie@rpsys.net, treding@nvidia.com, p.zabel@pengutronix.de, andrew@lunn.ch, gregkh@linuxfoundation.org, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>, sw0312.kim@samsung.com, ideal.song@samsung.com

Hi Jacek

On 2015=EB=85=84 02=EC=9B=94 27=EC=9D=BC 17:42, Jacek Anaszewski wrote:
> Hi Ingi,
>=20
> On 02/27/2015 02:01 AM, Ingi Kim wrote:
>> This patch supports KTD2692 flash LED driver
>>
>> Ingi Kim (3):
>>    of: Add vendor prefix for Kinetic technologies
>>    leds: ktd2692: add device tree bindings for ktd2692
>>    leds: Add ktd2692 flash LED driver
>>
>>   .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
>>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>>   drivers/leds/Kconfig                               |    8 +
>>   drivers/leds/Makefile                              |    1 +
>>   drivers/leds/leds-ktd2692.c                        |  245 ++++++++=
++++++++++++
>>   5 files changed, 274 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd=
2692.txt
>>   create mode 100644 drivers/leds/leds-ktd2692.c
>>
>=20
> In your device tree binding documentation there is torch-gpio mention=
ed,
> but you seem not to use it in the driver.
>=20
> We have already LED Flash class (/drivers/leds/led-class-flash.c) for
> this type of devices, which handles both torch and flash modes
> (flash_strobe sysfs attribute is provided for strobing the flash).
>=20
> The reference drivers using LED Flash class are still pending [1], bu=
t I
> think that at least leds-aat1290 driver is almost ready for merging.
> It controls very similar device to yours.
>=20
> Another advantage of using LED Flash class is that it has been design=
ed
> to be compatible with Video for Linux 2 subsystem, which will allow f=
or registering LED Flash class devices as a V4L2 sub-devices.
>=20
> Adding Sakari.
>=20

Ok, I'll check LED Flash class, and add torch-gpio
Thanks,

Adding Seung-woo Kim and Inha Song
