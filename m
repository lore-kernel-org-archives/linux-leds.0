From: Raul Piper <raulpblooper@gmail.com>
Subject: Developing Linux Kernel Driver for LED Driver
Date: Tue, 14 Jun 2016 08:52:44 +0530
Message-ID: <CAEwN+MA38ozhiZN-0XfeiZt9=Wr42yVU-HyzCzhMC1OzxxB=fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36765 "EHLO
	mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423196AbcFNDWq (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 13 Jun 2016 23:22:46 -0400
Received: by mail-oi0-f67.google.com with SMTP id d132so28434790oig.3
        for <linux-leds@vger.kernel.org>; Mon, 13 Jun 2016 20:22:45 -0700 (PDT)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org

Hi,
I am developing a Linux kernel driver(software) for a 16 channel LED
driver(this driverhere refers to the hardware of LED ) .Below are few
of its characteristics

DC input voltage range : 10 V to 28 V
Integrated boost converter with adaptive output voltage
16 channels  and independent PWM brightness control
Up to 15 white LEDs per channel
On-board microcontroller for total device control through 4-wire
serial interface
LED short-circuit faults management

I have done some brute force work by creating a user space application
to do some portion of the LED glowing, I know its not a full fledged
work.

I want to know on the below points :
1. How can I convert it into a GPIO driver and the standard ramework
with which I can integrate it.
2.The architecture of the user space application to test this driver
3.The requirement for the Device Tree configuration for this.
4.The name of the LED class driver maintainer in the kernel linux, to
whom I have to send the patch?
5.Any other mandatory requirement to which I have to adhere to for
pushing the device driver to the main line.

PS : I am using TI's beagleboard for developing the driver on the kernel 4.1x.

Br,
Rp
