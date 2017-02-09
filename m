From: Paulo Costa <me@paulo.costa.nom.br>
Subject: Re: [PATCH] leds/trigger/cpu: Add LED trigger for all CPUs aggregated
Date: Thu, 9 Feb 2017 18:59:11 -0200
Message-ID: <CADbEYbnVuNyjQOzqmC2qjcO7Gg7o47a3dvuHq6gGOPZMd6DKjQ@mail.gmail.com>
References: <20170208000239.29152-1-me@paulo.costa.nom.br> <20170209142517.GA23284@xo-6d-61-c0.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:34213 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752014AbdBIVIo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Feb 2017 16:08:44 -0500
Received: by mail-wr0-f193.google.com with SMTP id 89so13167496wrr.1
        for <linux-leds@vger.kernel.org>; Thu, 09 Feb 2017 13:06:51 -0800 (PST)
In-Reply-To: <20170209142517.GA23284@xo-6d-61-c0.localdomain>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

2017-02-09 12:25 GMT-02:00 Pavel Machek <pavel@ucw.cz>:
> Hi!
>
>> Currently there is one CPU led trigger per cpu ('cpu0', 'cpu1', ...)
>>
>> This patch adds a new trigger, 'cpu', with brightness proportional to
>>  the number of active CPUs.
>>
>> If multiple brightness levels aren't supported on the LED,
>> it effectively indicates if there is any CPU active.
>>
>> This is particularly useful on tiny linux boards with more CPU cores than LED pins.
>
>> +static struct led_trigger_cpu_all all_trig;
>> +
>> +static bool ledtrig_cpu_initialized;
>
> Umm. This variable looks quite like a lock, but without barriers etc. Are you sure that is ok?
>
>> @@ -47,26 +57,44 @@ static DEFINE_PER_CPU(struct led_trigger_cpu, cpu_trig);
>>  void ledtrig_cpu(enum cpu_led_event ledevt)
>>  {
>>       struct led_trigger_cpu *trig = this_cpu_ptr(&cpu_trig);
>> +     bool is_active = trig->cpu_is_active;
>> +
>> +     /* Ignore if this is being called before initialization. */
>> +     if (!ledtrig_cpu_initialized)
>> +             return;
>>
>>       /* Locate the correct CPU LED */
>>       switch (ledevt) {
>>       case CPU_LED_IDLE_END:
>>       case CPU_LED_START:
>>               /* Will turn the LED on, max brightness */
>> -             led_trigger_event(trig->_trig, LED_FULL);
>> +             is_active = true;
>>               break;
>>
>>       case CPU_LED_IDLE_START:
>>       case CPU_LED_STOP:
>>       case CPU_LED_HALTED:
>>               /* Will turn the LED off */
>> -             led_trigger_event(trig->_trig, LED_OFF);
>> +             is_active = false;
>>               break;
>>
>>       default:
>>               /* Will leave the LED as it is */
>>               break;
>>       }
>> +
>> +     if (is_active != trig->cpu_is_active) {
>> +             // Update trigger state
>
> C style comments, please.
>
>> +             trig->cpu_is_active = is_active;
>> +             atomic_add(is_active ? 1 : -1, &all_trig.num_active);
>
> In particular, are you sure that with all the activity during startup, it can't get
> desynchronized?
>
> Hmm. is_initialized should be atomic_t, or set_bit should be used. But it will
> probably not cause problems in practice.
>
> I guess the trigger actually will self-synchronize with the actual CPU state,
> eventually. So I guess it is ok, but...

Yes, things get messy during initialization, as ledtrig_cpu() gets called
before to ledtrig_cpu_init().

This code effectively ignores any event until the initialization has executed
(hence initialized flag) and catchs up later.

I just realized that I could instead remove the initialization of
trig->cpu_is_active and all_trig.num_active, and rely on the fact that
they are created with false/null. Would that be safe?



>
>> +             led_trigger_event(all_trig._trig,
>> +                     LED_FULL * atomic_read(&all_trig.num_active) /
>> +                     num_present_cpus());
>
> DIV_ROUND_UP? :-)

Yes!
