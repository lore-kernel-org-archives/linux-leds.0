From: Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: Re: gpio_request() vs __gpio_get()
Date: Mon, 9 Mar 2015 09:45:47 -0300
Message-ID: <CAKi4VAKiA+i-n80aYsRdxV5n7R5BNfv_DyXee==DqQzLi9P4mA@mail.gmail.com>
References: <CAKi4VAKQ1b0ouxXTxPczZQbPSWCnwnu3tgozWok=xdGDy7AsBg@mail.gmail.com>
 <CAAVeFu+87Y8H_ftg9cV2gBQdeZmP8qLW86AFKCp6X7-G2=guEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:35598 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753631AbbCIMqI (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2015 08:46:08 -0400
In-Reply-To: <CAAVeFu+87Y8H_ftg9cV2gBQdeZmP8qLW86AFKCp6X7-G2=guEA@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>

On Mon, Mar 9, 2015 at 6:21 AM, Alexandre Courbot <gnurou@gmail.com> wrote:
> Hi,
>
> On Mon, Mar 9, 2015 at 5:14 AM, Lucas De Marchi
> <lucas.de.marchi@gmail.com> wrote:
>> I was looking at drivers/leds/ in how it interacts with gpiolib. I see
>> that there's a new gpiod_* API.
>> "git grep gpio_request -- drivers/leds/" reveals quite a number of
>> users of gpio_request() and gpio_request_one().
>>
>> Am I right that these are going to be ported to the new gpiod_* API?
>> If yes, what would be the equivalent calls?  I thought it would be one
>> of the __gpiod_get() functions, but these would invariably fail if I
>> passed dev == NULL which is my case.
>
> Any new code should use the gpiod API. gpio_* are considered
> deprecated and unsafe, and users are encouraged to switch to gpiod
> (which is not always easy if they use GPIOs in unconventional ways).
>
> With gpiod, GPIO descriptors are obtained using one of the
> gpiod_get*() functions (do not call __gpiod_get directly) and must be
> assigned to the device and function using either Device Tree, ACPI, or
> platform tables. See Documentation/gpio/board.txt for how GPIOs are
> assigned, and Documentation/gpio/consumer.txt for how to use the gpiod
> API.

Ahhn. Ok. I'm converting a "userspace driver" that used to use the
sysfs interface to be a proper driver in kernel. The use case is for
boards with expansion headers like minnow, beaglebone etc.  In
userspace it would refer to a certain gpio index without any
"function" from DT/ACPI.

My doubt is how to map from this number to gpio_desc. I see there's
gpio_to_desc(), but then I'd need to use gpiod_request() (like
gpiolib-sysfs.c does) which is not exported for users outside of gpio
subsystem.

thanks

-- 
Lucas De Marchi
