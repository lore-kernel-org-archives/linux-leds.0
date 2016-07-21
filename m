From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: gpio-led driver
Date: Thu, 21 Jul 2016 08:40:32 +0200
Message-ID: <57906E60.6060703@samsung.com>
References: <CAEwN+MDByMJGjhc6x6TubV6XgubnZtTNM=jjNVVr8gsChhe9Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49808 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbcGUGkh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 21 Jul 2016 02:40:37 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OAN00GCHJVLMH10@mailout2.w1.samsung.com> for
 linux-leds@vger.kernel.org; Thu, 21 Jul 2016 07:40:34 +0100 (BST)
In-reply-to: <CAEwN+MDByMJGjhc6x6TubV6XgubnZtTNM=jjNVVr8gsChhe9Rg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Raul Piper <raulpblooper@gmail.com>
Cc: kernelnewbies <kernelnewbies@kernelnewbies.org>, linux-leds@vger.kernel.org

Hi Raul,

On 07/20/2016 01:17 PM, Raul Piper wrote:
> Hi,
> I wanted to know the part number for the leds-gpio.c in the
> driver/leds folder and the device tree bindings for this driver .Can
> some one point out to me where in Linux kernel it is?

What do you mean by part number? This is generic driver for LEDs
connected directly to a GPIO.

You can find DT documentation for it in the following location:

Documentation/devicetree/bindings/leds/leds-gpio.txt

-- 
Best regards,
Jacek Anaszewski
