From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: Developing Linux Kernel Driver for LED Driver
Date: Tue, 14 Jun 2016 10:37:40 +0200
Message-ID: <575FC254.8040900@samsung.com>
References: <CAEwN+MA38ozhiZN-0XfeiZt9=Wr42yVU-HyzCzhMC1OzxxB=fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:64095 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750985AbcFNIhn (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 14 Jun 2016 04:37:43 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0O8R005N86MT6Z60@mailout1.w1.samsung.com> for
 linux-leds@vger.kernel.org; Tue, 14 Jun 2016 09:37:41 +0100 (BST)
In-reply-to: <CAEwN+MA38ozhiZN-0XfeiZt9=Wr42yVU-HyzCzhMC1OzxxB=fg@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Raul Piper <raulpblooper@gmail.com>
Cc: linux-leds@vger.kernel.org

Hi Raul,

On 06/14/2016 05:22 AM, Raul Piper wrote:
> Hi,
> I am developing a Linux kernel driver(software) for a 16 channel LED
> driver(this driverhere refers to the hardware of LED ) .Below are few
> of its characteristics
>
> DC input voltage range : 10 V to 28 V
> Integrated boost converter with adaptive output voltage
> 16 channels  and independent PWM brightness control
> Up to 15 white LEDs per channel
> On-board microcontroller for total device control through 4-wire
> serial interface
> LED short-circuit faults management
>
> I have done some brute force work by creating a user space application
> to do some portion of the LED glowing, I know its not a full fledged
> work.
>
> I want to know on the below points :
> 1. How can I convert it into a GPIO driver and the standard ramework
> with which I can integrate it.

Please get acquainted with the LED subsystem documentation:
Documentation/leds/leds-class.txt.

You should also refer to the existing LED class drivers in drivers/leds
to find out how LED class devices are being registered.

> 2.The architecture of the user space application to test this driver

LED class devices expose sysfs interface at /sys/class/leds, i.e.
the LEDs can be controlled from bash.

> 3.The requirement for the Device Tree configuration for this.

Please refer to Documentation/devicetree/bindings/leds/common.txt
and driver bindings in Documentation/devicetree/bindings/leds.

> 4.The name of the LED class driver maintainer in the kernel linux, to
> whom I have to send the patch?

./scripts/get_maintainer.pl -f drivers/leds/ will give you the answer.

> 5.Any other mandatory requirement to which I have to adhere to for
> pushing the device driver to the main line.

Please read the following documents:

- Documentation/SubmittingPatches
- Documentation/SubmittingDrivers
- Documentation/SubmitChecklist

-- 
Best regards,
Jacek Anaszewski
