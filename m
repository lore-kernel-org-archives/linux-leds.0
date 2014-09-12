From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCH 2/2] leds: trigger: gpio: make ledtrig-gpio useable with
 GPIO drivers requiring threaded irqs
Date: Fri, 12 Sep 2014 11:57:40 -0700
Message-ID: <CAK5ve-+jhyM_rYU_TeFojmFc1BZdEpgoYw2OBXgMv6LOGA7U8g@mail.gmail.com>
References: <1410248433-24005-1-git-send-email-LW@KARO-electronics.de>
 <1410248433-24005-3-git-send-email-LW@KARO-electronics.de>
 <CAK5ve-+BCvfHZ-JrYD_48KYzaZGE0as=eMe0+XPbgh5DfH9qRw@mail.gmail.com> <20140912090918.6e860198@ipc1.ka-ro>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140912090918.6e860198@ipc1.ka-ro>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>
List-Id: linux-leds@vger.kernel.org

On Fri, Sep 12, 2014 at 12:09 AM, Lothar Wa=C3=9Fmann <LW@karo-electron=
ics.de> wrote:
> Hi,
>
> Bryan Wu wrote:
>> On Tue, Sep 9, 2014 at 12:40 AM, Lothar Wa=C3=9Fmann <LW@karo-electr=
onics.de> wrote:
>> > When trying to use the LED GPIO trigger with e.g. the PCA953x GPIO
>> > driver, request_irq() fails with -EINVAL, because the GPIO driver
>> > requires a nested interrupt handler.
>> >
>> > Use request_any_context_irq() to be able to use any GPIO driver as=
 LED
>> > trigger.
>> >
>>
>> Hmmm, what about use request_thread_irq() and put the gpio_trig_work=
()
>> in as the thread_func.
>>
>> Felipe, can you take a look at this?
>>
>> Also in the first patch:
>> Actually in gpio_trig_irq(), it said:
>> /* just schedule_work since gpio_get_value can sleep */
>>         schedule_work(&gpio_data->work);
>>
>> Then that means we need to call gpio_get_value_can_sleep() in the
>> gpio_trig_work() instead of gpio_get_value(), right?
>>
> That's exactly what my first patch does!
>

Yeah, exactly. I'm just curious about the comment here.

-Bryan

>
> Lothar Wa=C3=9Fmann
> --
> ___________________________________________________________
>
> Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
> Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
> Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
> Handelsregistereintrag: Amtsgericht Aachen, HRB 4996
>
> www.karo-electronics.de | info@karo-electronics.de
> ___________________________________________________________
