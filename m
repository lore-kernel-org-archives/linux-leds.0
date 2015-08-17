From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH RESEND v6 0/2] Driver for TI tlc591xx 8/16 Channel i2c LED driver
Date: Mon, 17 Aug 2015 10:08:53 -0700
Message-ID: <CAK5ve-LKuCOuc5biqntNN6Gzn2AbanOJY_YszAT2zRVgaWRDFA@mail.gmail.com>
References: <1426630107-25057-1-git-send-email-andrew@lunn.ch>
 <55D1CF84.8040906@ti.com> <20150817132718.GF7537@lunn.ch> <55D1EBA8.9090609@ti.com>
 <20150817142147.GG7537@lunn.ch> <55D20E96.3020504@ti.com> <20150817164822.GA29494@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-yk0-f170.google.com ([209.85.160.170]:33333 "EHLO
	mail-yk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751282AbbHQRJN (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2015 13:09:13 -0400
In-Reply-To: <20150817164822.GA29494@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Matthew.Fatheree@belkin.com, "R, Vignesh" <vigneshr@ti.com>

I apologize to ignore this email, since Jacek is taking over the
maintainership of LED subsystem. Please include him in the email
thread.

Thanks,
-Bryan

On Mon, Aug 17, 2015 at 9:48 AM, Andrew Lunn <andrew@lunn.ch> wrote:
>> TLC591xx is quite simple HW, and the code doing the HW programming
>> should be identical for a pwm and for a led driver. I don't see either a
>> pwm or a led driver being somehow superior. They are very similar simple
>> drivers, implementing a different interface. Whether the interface works
>> for you should be clear from the interface itself. The code is just details.
>>
>> On the other hand, if you want something you can use to test, it's a
>> different case, but you haven't indicated any interest in that.
>
> What i want is code in the kernel to driver the LEDs on my Linksys
> WRT1900ac. You say, "the code is just details", is just plain
> wrong. Code is the Linux kernel and is the process of getting stuff
> into the kernel. I've followed the process, submitted code for review,
> fixed up comments, got it tested and ACKed by people, and merged.
>
> Where as all you have done is emailed.
>
> So i'm done.
>
>    Andrew
>
