From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH 0/3] Add ktd2692 Flash LED driver
Date: Fri, 27 Feb 2015 09:42:29 +0100
Message-ID: <54F02DF5.1000706@samsung.com>
References: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41852 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753201AbbB0Ime (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 27 Feb 2015 03:42:34 -0500
In-reply-to: <1424998891-25591-1-git-send-email-ingi2.kim@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Ingi Kim <ingi2.kim@samsung.com>
Cc: robh+dt@kerner.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, cooloney@gmail.com, rpurdie@rpsys.net, treding@nvidia.com, p.zabel@pengutronix.de, andrew@lunn.ch, gregkh@linuxfoundation.org, florian.vaussard@epfl.ch, arno@natisbad.org, kuninori.morimoto.gx@renesas.com, hytszk@gmail.com, antonynpavlov@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>

Hi Ingi,

On 02/27/2015 02:01 AM, Ingi Kim wrote:
> This patch supports KTD2692 flash LED driver
>
> Ingi Kim (3):
>    of: Add vendor prefix for Kinetic technologies
>    leds: ktd2692: add device tree bindings for ktd2692
>    leds: Add ktd2692 flash LED driver
>
>   .../devicetree/bindings/leds/leds-ktd2692.txt      |   19 ++
>   .../devicetree/bindings/vendor-prefixes.txt        |    1 +
>   drivers/leds/Kconfig                               |    8 +
>   drivers/leds/Makefile                              |    1 +
>   drivers/leds/leds-ktd2692.c                        |  245 ++++++++++++++++++++
>   5 files changed, 274 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-ktd2692.txt
>   create mode 100644 drivers/leds/leds-ktd2692.c
>

In your device tree binding documentation there is torch-gpio mentioned,
but you seem not to use it in the driver.

We have already LED Flash class (/drivers/leds/led-class-flash.c) for
this type of devices, which handles both torch and flash modes
(flash_strobe sysfs attribute is provided for strobing the flash).

The reference drivers using LED Flash class are still pending [1], but I
think that at least leds-aat1290 driver is almost ready for merging.
It controls very similar device to yours.

Another advantage of using LED Flash class is that it has been designed
to be compatible with Video for Linux 2 subsystem, which will allow for 
registering LED Flash class devices as a V4L2 sub-devices.

Adding Sakari.

-- 
Best Regards,
Jacek Anaszewski

[1] http://www.spinics.net/lists/linux-media/msg86632.html
