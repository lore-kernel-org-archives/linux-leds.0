From: Milo Kim <milo.kim@ti.com>
Subject: Re: [PATCH 00/10] leds: lp5521,5523: restore device attributes for
 running LED patterns
Date: Wed, 20 Nov 2013 07:33:11 +0900
Message-ID: <528BE727.6090703@ti.com>
References: <1375948794-6286-1-git-send-email-milo.kim@ti.com> <527C7384.1040103@ti.com> <CAK5ve-KQPxc-xWs1rh6KTgGK8VdLOgHqMLT8D90+mYt8P+xaew@mail.gmail.com> <201311191135.54553@pali> <CAK5ve-+JfWRAy+jm35tTcH_jjG2bbrYaBtku=VjheY=wZ7Y1vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:48547 "EHLO comal.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751788Ab3KSWdP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Tue, 19 Nov 2013 17:33:15 -0500
In-Reply-To: <CAK5ve-+JfWRAy+jm35tTcH_jjG2bbrYaBtku=VjheY=wZ7Y1vQ@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Hi Bryan,

On 11/20/2013 04:20 AM, Bryan Wu wrote:
> On Tue, Nov 19, 2013 at 2:35 AM, Pali Roh=E1r<pali.rohar@gmail.com>  =
wrote:
>> >Hello,
>> >
>> >now I tested that patch on top of 3.12-rc5 with this led example:
>> >
>> >     # Clearing LED-state to be sure
>> >     echo "disabled" > /sys/class/i2c-adapter/i2c-2/2-0032/engine1_=
mode
>> >     echo "disabled" > /sys/class/i2c-adapter/i2c-2/2-0032/engine2_=
mode
>> >     echo 0 > /sys/class/leds/lp5523:r/brightness
>> >     echo 0 > /sys/class/leds/lp5523:g/brightness
>> >     echo 0 > /sys/class/leds/lp5523:b/brightness
>> >
>> >     # Setting yellow light pattern and running it
>> >     echo "load" > /sys/class/i2c-adapter/i2c-2/2-0032/engine1_mode
>> >     echo "000001100" > /sys/class/i2c-adapter/i2c-2/2-0032/engine1=
_leds
>> >     echo "9d804000427f0d7f7f007f0042000000" > /sys/class/i2c-adapt=
er/i2c-2/2-0032/engine1_load
>> >     echo "load" > /sys/class/i2c-adapter/i2c-2/2-0032/engine2_mode
>> >     echo "000000000" > /sys/class/i2c-adapter/i2c-2/2-0032/engine2=
_leds
>> >     echo "9d800000" > /sys/class/i2c-adapter/i2c-2/2-0032/engine2_=
load
>> >     echo "run" > /sys/class/i2c-adapter/i2c-2/2-0032/engine2_mode
>> >     echo "run" > /sys/class/i2c-adapter/i2c-2/2-0032/engine1_mode
>> >     echo 20 > /sys/class/leds/lp5523:r/led_current
>> >     echo 2 > /sys/class/leds/lp5523:g/led_current
>> >     echo 0 > /sys/class/leds/lp5523:b/led_current
>> >
>> >And now it working, led blinks :-) I also tested Maemo
>> >application for managing lp5523 led and now it working too.
>> >
> That's good. We can post this fixing patch to stable tree as well as
> latest upstream kernel.
>
> Milo, do you need to update your patch, if not I'm going to take it
> into my tree and for stable tree.

I'll send the patch-set again because LP5521 is also required to be fix=
ed.
And _remove() also needs to be updated.
I can send it by tomorrow.

Thanks,
- Milo
