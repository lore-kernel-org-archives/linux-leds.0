From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v6 0/5] Add DT support for netxbig LEDs
Date: Thu, 15 Oct 2015 10:11:19 +0200
Message-ID: <561F5FA7.2040000@samsung.com>
References: <1443301358-2131-1-git-send-email-simon.guinot@sequanux.org>
 <56178C49.4070704@samsung.com> <87mvvk38kl.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:39879 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750732AbbJOILY (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 15 Oct 2015 04:11:24 -0400
In-reply-to: <87mvvk38kl.fsf@free-electrons.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Simon Guinot <simon.guinot@sequanux.org>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vincent Donnefort <vdonnefort@gmail.com>, Yoann Sculo <yoann@printk.fr>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh@kernel.org>, linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org

Hi Gregory,

On 10/15/2015 09:16 AM, Gregory CLEMENT wrote:
> Hi Jacek,
>
>   On ven., oct. 09 2015, Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> On 09/26/2015 11:02 PM, Simon Guinot wrote:
>>> Hello,
>
> [..]
>>>
>>> Simon Guinot (5):
>>>     leds: netxbig: add device tree binding
>>>     ARM: Kirkwood: add LED DT entries for netxbig boards
>>>     ARM: mvebu: remove static LED setup for netxbig boards
>>>     leds: netxbig: convert to use the devm_ functions
>>>     leds: netxbig: set led_classdev max_brightness
>>>
>>>    .../devicetree/bindings/gpio/netxbig-gpio-ext.txt  |  22 ++
>>>    .../devicetree/bindings/leds/leds-netxbig.txt      |  92 ++++++
>>>    arch/arm/boot/dts/kirkwood-net5big.dts             |  60 ++++
>>>    arch/arm/boot/dts/kirkwood-netxbig.dtsi            |  80 +++++
>>>    arch/arm/mach-mvebu/Kconfig                        |   7 -
>>>    arch/arm/mach-mvebu/Makefile                       |   1 -
>>>    arch/arm/mach-mvebu/board.h                        |  21 --
>>>    arch/arm/mach-mvebu/kirkwood.c                     |   4 -
>>>    arch/arm/mach-mvebu/netxbig.c                      | 191 ------------
>>>    drivers/leds/leds-netxbig.c                        | 336 ++++++++++++++++-----
>>>    include/dt-bindings/leds/leds-netxbig.h            |  18 ++
>>>    .../linux/platform_data/leds-kirkwood-netxbig.h    |   1 +
>>>    12 files changed, 531 insertions(+), 302 deletions(-)
>>>    create mode 100644 Documentation/devicetree/bindings/gpio/netxbig-gpio-ext.txt
>>>    create mode 100644 Documentation/devicetree/bindings/leds/leds-netxbig.txt
>>>    delete mode 100644 arch/arm/mach-mvebu/board.h
>>>    delete mode 100644 arch/arm/mach-mvebu/netxbig.c
>>>    create mode 100644 include/dt-bindings/leds/leds-netxbig.h
>>>
>>
>> Since no comment regarding DT bindings has appeared for a long time,
>> I decided to merge the patch set without DT maintainer's ack, thanks.
>
> it is a good news that this series will be finally merged. However did
> you also take the patches "ARM: Kirkwood: add LED DT entries for netxbig
> boards" and "ARM: mvebu: remove static LED setup for netxbig boards" ?

Yes, I did:

https://git.kernel.org/cgit/linux/kernel/git/j.anaszewski/linux-leds.git/log/?h=for-next

They should appear in the next issue of linux-next.

-- 
Best Regards,
Jacek Anaszewski
